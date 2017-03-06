using Spreevent_V1.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spreevent_V1
{
    public partial class Cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCriar_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text;
            string senha = txtSenha.Text;
            string confirmarsenha = txtConfirmar.Text;
            string nome = txtNome.Text;
            string sobrenome = txtSobrenome.Text;
            string email = txtEmail.Text;
            DateTime datanasc;
            string sexo = rbtSexo.SelectedValue;


            if (senha != confirmarsenha)
            {
                lblErro.Text = "Senhas diferentes!";
                return;
            }

            if (DateTime.TryParse(txtDataNasc.Text, System.Globalization.CultureInfo.GetCultureInfo("pt-br"), System.Globalization.DateTimeStyles.None, out datanasc) == false)
            {
                erroData.Text = " Campo não contém uma data válida, pelo formato brasileiro!";
                return;
            }

            // validando a imagem
            if (!fuimg.HasFile)
            {
                erroImg.Text = "Adicione um Arquivo válido!";

                return;
            }


            string extensao = Path.GetExtension(fuimg.PostedFile.FileName).ToLower();

            string arquivo = Path.GetFileName(fuimg.PostedFile.FileName);

            Foto_Perfil foto = new Foto_Perfil();
            string validado = foto.ValidaExtensao(extensao);
            if (validado == "Tipo Invalido!")
            {
                erroImg.Text = "Imagem Invalida!";
            }

           // ConnetionFactory.CreateUser(usuario,senha,nome,sobrenome,email,sexo,datanasc,arquivo);

            Usuario.Criar(usuario,nome,sobrenome,senha,datanasc,sexo,email,arquivo);


           fuimg.SaveAs(Server.MapPath("~/Imagens/" + arquivo));
            Response.Redirect("home.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}