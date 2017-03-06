using Sistema.Utils;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Spreevent_V1.Models
{
    public class Usuario
    {
        public const int TamanhoMaximoDoLogin = 32;
        public const int TamanhoMaximoDoNome = 32;
        public const int TamanhoMaximoDoPassword = 20;

		private int id;
		private string login;
		private string nome;
		private string token;
		private string sobrenome;
        private DateTime data_nascimento;
        private string sexo;
        private string email;
        private string caminho;

        public Usuario()
        {

        }

        public Usuario(int id, string nome, string sobrenome, string sexo, string email, DateTime data_nascimento, string caminho, string login, string token)
        {
            Id = id;
            Login = login;
            Nome = nome;
            Token = token;
            this.caminho = caminho;
            this.data_nascimento = data_nascimento;
            this.sobrenome = sobrenome;
            this.sexo = sexo;
            this.email = email;
        }

        public Usuario(int id, string login, string nome, string token)
        {
            Id = id;
            Login = login;
            Nome = nome;
            Token = token;
        }

        private static Usuario PegarDoCliente()
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies["user"];
            if (cookie == null)
            {
                return null;
            }

            string[] values = cookie.Value.Split('|');
            if (values.Length != 2)
            {
                return null;
            }

            // O objeto Usuario que vem do cliente tem apenas o Id e o Token
            return new Usuario(int.Parse(values[0]), "", "", values[1]);
        }

        private string EnviarParaCliente()
        {
            string value = Id + "|" + Token;

            HttpCookie cookie = new HttpCookie("user", value);

            cookie.Expires = DateTime.UtcNow.AddYears(1);

            HttpContext.Current.Response.SetCookie(cookie);

            return "user=" + value + ";";
        }

        private void RemoverDoCliente()
        {
            HttpCookie cookie = new HttpCookie("user", "");

            cookie.Expires = DateTime.UtcNow.AddYears(-1);

            HttpContext.Current.Response.SetCookie(cookie);
        }

        public static void Criar(string login, string nome, string sobrenome, string senha, DateTime data_nacimento, string sexo, string email, string arquivo)
        {
            if (string.IsNullOrWhiteSpace(login) || login.Length > TamanhoMaximoDoLogin)
            {
                throw new Exception("Login inválido");
            }

            if (string.IsNullOrWhiteSpace(nome) || nome.Length > TamanhoMaximoDoNome)
            {
                throw new Exception("Nome inválido");
            }

            if (string.IsNullOrEmpty(senha) || senha.Length > TamanhoMaximoDoPassword)
            {
                throw new Exception("Senha inválido");
            }

            using (SqlConnection conn = ConnetionFactory.ConexaoSQL())
            {

               

                // Para outros SQL Server
                // using (SqlCommand command = new SqlCommand("INSERT INTO tbUsuario (Login, Nome, Password, Token) OUTPUT tbUser.Id VALUES (@login, @nome, @password, '')", conn)) {

                // Para o Azure
                using (SqlCommand command = new SqlCommand(@"INSERT INTO usuario (nome, sobrenome, sexo, email, caminho, senha, login, token, data_nascimento)
                    VALUES (@nome, @sobrenome, @sexo, @email, @Caminho1, @senha, @login, @token, @dataNascimento);", conn))
                {

                    
                    command.Parameters.AddWithValue("@nome", nome);
                    command.Parameters.AddWithValue("@sobrenome", sobrenome);
                    command.Parameters.AddWithValue("@sexo", sexo);
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@caminho1", arquivo);
                    command.Parameters.AddWithValue("@senha", PasswordHash.CreateHash(senha));
                    command.Parameters.AddWithValue("@login", login);
                    command.Parameters.AddWithValue("@token", " ");
                    command.Parameters.AddWithValue("@dataNascimento", data_nacimento);


                    command.ExecuteNonQuery();

                    // Como esse usuário acabou de ser criado, ele não está logado, por isso não tem token
                   
                }
            }
        }

        public static Usuario Validar()
        {
            Usuario usuario = PegarDoCliente();

            if (usuario == null)
            {
                return null;
            }

            using (SqlConnection conn = ConnetionFactory.ConexaoSQL())
            {

                

                using (SqlCommand command = new SqlCommand("SELECT Login, Nome, Token, caminho FROM usuario WHERE Id = @id", conn))
                {

                    command.Parameters.AddWithValue("@id", usuario.Id);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        if (reader.Read() == false ||
                            string.IsNullOrWhiteSpace(usuario.Token) ||
                            string.Equals(usuario.Token, reader.GetString(2), StringComparison.Ordinal) == false)
                        {

                            return null;
                        }

                        usuario.Login = reader.GetString(0);
                        usuario.Nome = reader.GetString(1);
						usuario.caminho = "/Imagens/" + reader.GetString(3);
                    }
                }
            }

            return usuario;
        }

        public static Usuario ValidarException()
        {
            Usuario usuario = Validar();

            if (usuario == null)
            {
                throw new Exception("Usuário inválido ou não conectado");
            }

            return usuario;
        }

        public static string FazerLogin(string login, string senha)
        {
            int id;
            string hash;

            using (SqlConnection conn = ConnetionFactory.ConexaoSQL())
            {

                

                using (SqlCommand command = new SqlCommand("SELECT Id, senha FROM usuario WHERE Login = @login", conn))
                {

                    command.Parameters.AddWithValue("@login", login);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read() == false)
                        {
                            return null;
                        }

                        id = reader.GetInt32(0);
                        hash = reader.GetString(1);
                    }
                }

                if (PasswordHash.ValidatePassword(senha, hash))
                {
                    using (SqlCommand command = new SqlCommand("UPDATE usuario SET Token = @token WHERE Id = @id", conn))
                    {

                        string token = Guid.NewGuid().ToString("N");
                        command.Parameters.AddWithValue("@token", token);
                        command.Parameters.AddWithValue("@id", id);

                        command.ExecuteNonQuery();

                        // Tanto o nome quanto o login não interessam para enviar para o cliente
                        Usuario usuario = new Usuario(id, "", "", token);

                        return usuario.EnviarParaCliente();
                    }
                }
            }

            return null;
        }

        public void FazerLogout()
        {
            using (SqlConnection conn = ConnetionFactory.ConexaoSQL())
            {

               

                using (SqlCommand command = new SqlCommand("UPDATE usuario SET Token = '' WHERE Id = @id", conn))
                {

                    command.Parameters.AddWithValue("@id", Id);

                    command.ExecuteNonQuery();

                    RemoverDoCliente();
                }
            }
        }


		public int Id
		{
			get
			{
				return id;
			}

			set
			{
				id = value;
			}
		}

		public string Login
		{
			get
			{
				return login;
			}

			set
			{
				login = value;
			}
		}

		public string Nome
		{
			get
			{
				return nome;
			}

			set
			{
				nome = value;
			}
		}

		public string Token
		{
			get
			{
				return token;
			}

			set
			{
				token = value;
			}
		}

		public string Sobrenome
		{
			get
			{
				return sobrenome;
			}

			set
			{
				sobrenome = value;
			}
		}

		public DateTime Data_nascimento
		{
			get
			{
				return data_nascimento;
			}

			set
			{
				data_nascimento = value;
			}
		}

		public string Sexo
		{
			get
			{
				return sexo;
			}

			set
			{
				sexo = value;
			}
		}

		public string Email
		{
			get
			{
				return email;
			}

			set
			{
				email = value;
			}
		}

		public string Caminho
		{
			get
			{
				return caminho;
			}

			set
			{
				caminho = value;
			}
		}
	}
}