using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Spreevent_V1.Models
{
    public static class ConnetionFactory
    {
        public static SqlConnection ConexaoSQL()
        {
            try
            {
                SqlConnection conn = new SqlConnection("Server=tcp:spreevent.database.windows.net,1433;Database=spreevent;Uid=awtatec@spreevent;Pwd=4Wt4t3cn0l0g14;Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;");

                conn.Open();

                return conn;
            }
            catch (SqlException)
            {

                throw;
            }


        }

        public static List<Evento> SelectEventos()
        {

            List<Evento> eventos = new List<Evento>();
            using (SqlConnection conn = ConexaoSQL())
            {
                try
                {

                    using (SqlCommand cmd = new SqlCommand("SELECT dbo.evento.id_evento, dbo.evento.nome_evento, dbo.evento.descricao, dbo.evento.caminho FROM dbo.evento where dbo.evento.caminho is not null", conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read() == true)
                            {
                                Evento ev = new Evento();
                                ev.Id = reader.GetInt32(0);
                                ev.Nome = reader.GetString(1);
                                ev.Descricao = reader.GetString(2);
                                ev.Caminho = "/Imagens/" + ev.Nome + reader.GetString(3);
                                eventos.Add(ev);
                            }
                        }


                    }

                    conn.Close();

                }

                catch (SqlException)
                {

                    throw;
                }
                finally
                {
                    conn.Close();
                }
            }
            return eventos;
        }

        public static List<Evento> SelectEvento(int id)
        {
            List<Evento> eventos = new List<Evento>();
            using (SqlConnection conexao = ConexaoSQL())
            {
                using (SqlCommand comando = new SqlCommand(@"SELECT dbo.evento.id_evento, dbo.evento.nome_evento, dbo.evento.data_inicio, dbo.evento.data_fim, dbo.evento.descricao, dbo.evento.confirmacoes, dbo.evento.id_usuario, dbo.evento.hora_inicio,dbo.evento.hora_fim,
                dbo.evento.endereco, dbo.evento.caminho, dbo.categoria_evento.categoria_evento, dbo.restricao_idade.restricao_idade, dbo.tipo_evento.tipo_evento FROM dbo.evento
                INNER JOIN dbo.tipo_evento ON dbo.tipo_evento.id_tipo_evento = dbo.evento.id_tipo_evento
                INNER JOIN dbo.categoria_evento ON dbo.categoria_evento.id_categoria_evento = dbo.evento.id_categoria_evento
                INNER JOIN dbo.restricao_idade ON dbo.restricao_idade.id_restricao_idade = dbo.evento.id_restricao_idade where id_evento=@id", conexao))
                {
                    comando.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = comando.ExecuteReader())
                    {



                        while (reader.Read() == true)
                        {
                            Evento ev = new Evento();
                            ev.Nome = reader.GetString(1);
                            ev.Descricao = reader.GetString(4);
                            ev.Caminho = "/Imagens/" + ev.Nome + reader.GetString(10);
                            ev.DataInicio = reader.GetDateTime(2).ToString("dd/MM/yyyy");
                            ev.DataFim = reader.GetDateTime(3).ToString("dd/MM/yyyy");
                            ev.HoraIn = reader.GetTimeSpan(7).ToString();
                            ev.HoraFim = reader.GetTimeSpan(8).ToString();
                            ev.Endereco = reader.GetString(9);
                            ev.Categoria = reader.GetString(11);
                            ev.Restricao = reader.GetString(12);
                            ev.Tipo = reader.GetString(13);
                            ev.IdUser = reader.GetInt32(6);

                            eventos.Add(ev);

                        }
                    }
                }
            }
            return eventos;
        }


        public static List<Categoria_Evento> SelectCategorias()
        {
            List<Categoria_Evento> categorias = new List<Categoria_Evento>();
            using (SqlConnection conn = ConexaoSQL())
            {
                try
                {



                    using (SqlCommand cmd = new SqlCommand("SELECT dbo.categoria_evento.id_categoria_evento, dbo.categoria_evento.categoria_evento FROM dbo.categoria_evento ORDER BY categoria_evento ASC;", conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read() == true)
                            {
                                Categoria_Evento categoria = new Categoria_Evento();
                                categoria.Id = reader.GetInt32(0);
                                categoria.CategoriaEvento = reader.GetString(1);
                                categorias.Add(categoria);
                            }
                        }

                    }

                    conn.Close();
                }

                catch (SqlException)
                {

                    throw;
                }
                finally
                {
                    conn.Close();
                }
            }
            return categorias;
        }

        public static List<Evento> SelectCategoriaComId(string categoria)
        {
            using (SqlConnection conn = ConexaoSQL())
            {
                try
                {

                    if (categoria == "0")
                    {
                        List<Evento> eventos = new List<Evento>();

                        // Cria e abre a conexão com o banco de dados


                        // Cria um comando para selecionar registros da tabela
                        using (SqlCommand cmd = new SqlCommand("SELECT dbo.evento.id_evento, dbo.evento.nome_evento, dbo.evento.descricao, dbo.evento.caminho FROM dbo.evento where dbo.evento.caminho is not null", conn))
                        {

                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                // Obtém os registros, um por vez
                                while (reader.Read() == true)
                                {
                                    Evento ev = new Evento();
                                    ev.Id = reader.GetInt32(0);
                                    ev.Nome = reader.GetString(1);
                                    ev.Descricao = reader.GetString(2);
                                    ev.Caminho = "/Imagens/" + ev.Nome + reader.GetString(3);

                                    eventos.Add(ev);
                                }
                            }
                        }

                        conn.Close();

                        return eventos;
                    }
                    else
                    {
                        List<Evento> eventos = new List<Evento>();

                        // Cria e abre a conexão com o banco de dados


                        // Cria um comando para selecionar registros da tabela
                        using (SqlCommand cmd = new SqlCommand("SELECT dbo.evento.id_evento, dbo.evento.nome_evento, dbo.evento.descricao, dbo.evento.caminho FROM dbo.evento where dbo.evento.caminho is not null and id_categoria_evento=@Categoria;", conn))
                        {
                            cmd.Parameters.AddWithValue("@Categoria", categoria);

                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                while (reader.Read() == true)
                                {
                                    Evento ev = new Evento();
                                    ev.Id = reader.GetInt32(0);
                                    ev.Nome = reader.GetString(1);
                                    ev.Descricao = reader.GetString(2);
                                    ev.Caminho = "/Imagens/" + ev.Nome + reader.GetString(3);
                                    eventos.Add(ev);
                                }
                            }

                        }
                        conn.Close();

                        return eventos;
                    }



                }
                catch (SqlException)
                {

                    throw;
                }
                finally
                {
                    conn.Close();
                }
            }

        }

        public static List<Evento> SelectCategoriaComNome(string nome)
        {
            List<Evento> eventos = new List<Evento>();
            using (SqlConnection conn = ConexaoSQL())
            {
                // Cria um comando para selecionar registros da tabela
                using (SqlCommand cmd = new SqlCommand("SELECT dbo.evento.id_evento, dbo.evento.nome_evento, dbo.evento.descricao, dbo.evento.caminho FROM dbo.evento where dbo.evento.caminho is not null and nome_evento like @nome1;", conn))
                {

                    cmd.Parameters.AddWithValue("@nome1", "%" + nome + "%");
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Obtém os registros, um por vez
                        while (reader.Read() == true)
                        {
                            Evento ev = new Evento();
                            ev.Id = reader.GetInt32(0);
                            ev.Nome = reader.GetString(1);
                            ev.Descricao = reader.GetString(2);
                            ev.Caminho = "/Imagens/" + ev.Nome + reader.GetString(3);

                            eventos.Add(ev);
                        }
                    }
                }
            }
            return eventos;
        }


        public static List<TipoEvento> SelectTipoEvento()
        {
            List<TipoEvento> tipos = new List<TipoEvento>();
            using (SqlConnection conn = ConexaoSQL())
            {
                try
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT id_tipo_evento, tipo_evento FROM tipo_evento ORDER BY tipo_evento ASC;", conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            // Obtém os registros, um por vez
                            while (reader.Read() == true)
                            {
                                TipoEvento tipo = new TipoEvento();
                                tipo.Id = reader.GetInt32(0);
                                tipo.Tipo = reader.GetString(1);
                                tipos.Add(tipo);

                            }
                        }
                    }
                    return tipos;
                }
                catch (SqlException)
                {

                    throw;
                }

            }
        }

        public static Usuario selectUser(int idUser)
        {
            Usuario user = new Usuario();
            using (SqlConnection conn = ConexaoSQL())
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Id, Nome FROM usuario where Id = @ID;", conn))
                {
                    cmd.Parameters.AddWithValue("@ID", idUser);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Obtém os registros, um por vez
                        while (reader.Read() == true)
                        {

                            user.Id = reader.GetInt32(0);
                            user.Nome = reader.GetString(1);



                        }
                    }
                }

            }
            return user;
        }

        public static List<Restricao_Idade> SelectRestricaoIdade()
        {
            List<Restricao_Idade> restricoes = new List<Restricao_Idade>();

            using (SqlConnection conn = ConexaoSQL())
            {
                try
                {

                    using (SqlCommand cmd = new SqlCommand("SELECT id_restricao_idade, restricao_idade FROM restricao_idade ORDER BY restricao_idade ASC;", conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            // Obtém os registros, um por vez
                            while (reader.Read() == true)
                            {

                                Restricao_Idade restricao = new Restricao_Idade();
                                restricao.Id = reader.GetInt32(0);
                                restricao.Restricao_idade = reader.GetString(1);

                                restricoes.Add(restricao);

                            }
                        }
                    }
                    return restricoes;
                }
                catch (SqlException)
                {

                    throw;
                }
            }
        }

        public static void InsertEvento(string nome, string endereco, DateTime dataIni, DateTime dataFim, string horaInicio,
            string horaFim, string descricao, string arquivo, string tipo, string categoria, string restricao, int idUser)
        {
            try
            {
                using (SqlConnection conn = ConexaoSQL())
                {
                    using (SqlCommand comando = new SqlCommand(@"INSERT INTO evento (nome_evento, data_inicio, data_fim, descricao, id_tipo_evento, id_categoria_evento, id_restricao_idade, hora_inicio, hora_fim, endereco, caminho, id_usuario)
                    VALUES (@Nome,@DataInicio, @DataFim, @Descricao, @IdTipo, @IdCateg, @IdResticao, @horaInicio, @horaFim, @Endereco, @Caminho1, @idUsuario)", conn))
                    {
                        comando.Parameters.AddWithValue("@Nome", nome);
                        comando.Parameters.AddWithValue("@DataInicio", dataIni);
                        comando.Parameters.AddWithValue("@DataFim", dataFim);
                        comando.Parameters.AddWithValue("@Descricao", descricao);
                        comando.Parameters.AddWithValue("@IdTipo", tipo);
                        comando.Parameters.AddWithValue("@IdCateg", categoria);
                        comando.Parameters.AddWithValue("@IdResticao", restricao);
                        comando.Parameters.AddWithValue("@horaInicio", horaInicio);
                        comando.Parameters.AddWithValue("@horaFim", horaFim);
                        comando.Parameters.AddWithValue("@Endereco", endereco);
                        comando.Parameters.AddWithValue("@Caminho1", arquivo);
                        comando.Parameters.AddWithValue("@idUsuario", idUser);


                        comando.ExecuteNonQuery();
                    }

                }
            }
            catch (SqlException)
            {

                throw;
            }
        }

        public static void DeleteEvento(int id)
        {
            try
            {
                using (SqlConnection con = ConnetionFactory.ConexaoSQL())
                {
                    using (SqlCommand comando = new SqlCommand("DELETE FROM evento where id_evento = @id", con))
                    {
                        comando.Parameters.AddWithValue("@id", id);
                        comando.ExecuteNonQuery();
                    }
                }
            }
            catch (SqlException)
            {

                throw;
            }
        }

        public static void CreateUser(string usuario, string senha, string nome, string sobrenome, string email, string sexo, DateTime datanasc, string arquivo)
        {
            try
            {
                using (SqlConnection con = ConexaoSQL())
                {
                    using (SqlCommand comando = new SqlCommand(@"INSERT INTO usuario (Id, nome, sobrenome, data_nascimento, sexo, email, senha, caminho)
                    VALUES (@usuario,@nome, @sobrenome, @data_nascimento, @sexo, @email, @senha, @Caminho1)", con))
                    {
                        comando.Parameters.AddWithValue("@usuario", usuario);
                        comando.Parameters.AddWithValue("@nome", nome);
                        comando.Parameters.AddWithValue("@sobrenome", sobrenome);
                        comando.Parameters.AddWithValue("@data_nascimento", datanasc);
                        comando.Parameters.AddWithValue("@sexo", sexo);
                        comando.Parameters.AddWithValue("@email", email);
                        comando.Parameters.AddWithValue("@senha", senha);
                        comando.Parameters.AddWithValue("@Caminho1", arquivo);


                        comando.ExecuteNonQuery();
                    }


                }
            }
            catch (SqlException)
            {

                throw;
            }
        }

        public static void UpEvento(string nome, string endereco, DateTime dataIni, DateTime dataFim, string horaInicio,
        string horaFim, string descricao, string arquivo, string tipo, string categoria, string restricao, int id)
        {
            try
            {
                using (SqlConnection conn = ConexaoSQL())
                {
                    using (SqlCommand comando = new SqlCommand(@"UPDATE evento SET nome_evento=@Nome, data_inicio=@DataInicio, data_fim=@DataFim, descricao=@Descricao, id_tipo_evento=@IdTipo, id_categoria_evento=@IdCateg, id_restricao_idade=@IdResticao, hora_inicio=@horaInicio, hora_fim=@horaFim, endereco=@Endereco, caminho=@Caminho1 WHERE id_evento=@id", conn))
                    {
                        comando.Parameters.AddWithValue("@Nome", nome);
                        comando.Parameters.AddWithValue("@DataInicio", dataIni);
                        comando.Parameters.AddWithValue("@DataFim", dataFim);
                        comando.Parameters.AddWithValue("@Descricao", descricao);
                        comando.Parameters.AddWithValue("@IdTipo", tipo);
                        comando.Parameters.AddWithValue("@IdCateg", categoria);
                        comando.Parameters.AddWithValue("@IdResticao", restricao);
                        comando.Parameters.AddWithValue("@horaInicio", horaInicio);
                        comando.Parameters.AddWithValue("@horaFim", horaFim);
                        comando.Parameters.AddWithValue("@Endereco", endereco);
                        comando.Parameters.AddWithValue("@Caminho1", arquivo);

                        comando.Parameters.AddWithValue("@id", id);


                        comando.ExecuteNonQuery();
                    }

                }
            }
            catch (SqlException)
            {

                throw;
            }
        }


        public static List<Evento> SelectMeuEvento(int idUser)
        {
            List<Evento> eventos = new List<Evento>();

            using (SqlConnection conn = ConexaoSQL())
            {
                using (SqlCommand cmd = new SqlCommand("SELECT id_evento, nome_evento, descricao, caminho  FROM evento where id_usuario = @ID;", conn))
                {
                    cmd.Parameters.AddWithValue("@ID", idUser);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Obtém os registros, um por vez
                        while (reader.Read() == true)
                        {
                            Evento ev = new Evento();
                            ev.Id = reader.GetInt32(0);
                            ev.Nome = reader.GetString(1);
                            ev.Descricao = reader.GetString(2);
                            ev.Caminho = "/Imagens/" + ev.Nome + reader.GetString(3);
                            eventos.Add(ev);
                        }
                    }
                }

            }
            return eventos;
        }

    }
}

