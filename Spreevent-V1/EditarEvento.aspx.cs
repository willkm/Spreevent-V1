using Spreevent_V1.Models;
using Spreevent_V1.Utils;
using System;
using System.Collections.Generic;

using System.IO;

using System.Web.UI.WebControls;

namespace Spreevent_V1
{
    public partial class EditarEvento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                Usuario user = Usuario.Validar();
                if (user != null)
                {
                    int id;
                    if (int.TryParse(Request.QueryString["id"], out id) == false)
                    {
                        return;
                    }



                    List<Evento> eventos = ConnetionFactory.SelectEvento(id);
                    list.DataSource = eventos;
                    list.DataBind();
                    txtNome.Text = eventos[0].Nome;
                    txtDataIni.Text = eventos[0].DataInicio;
                    txtDataFim.Text = eventos[0].DataFim;
                    txtDescricao.Text = eventos[0].Descricao;
                    txtHoraFim.Text = eventos[0].HoraFim;
                    txtHoraIni.Text = eventos[0].HoraIn;
                    txtLocal.Text = eventos[0].Endereco;


                    //seta categorias
                    ddlCategoria.DataSource = ConnetionFactory.SelectCategorias();
                    ddlCategoria.DataValueField = "id";
                    ddlCategoria.DataTextField = "categoriaEvento";
                    ddlCategoria.DataBind();
                    ddlCategoria.Items.Insert(0, new ListItem(eventos[0].Categoria, "0"));

                    //seta restriçoes
                    ddlIdade.DataSource = ConnetionFactory.SelectRestricaoIdade();
                    ddlIdade.DataValueField = "id";
                    ddlIdade.DataTextField = "restricao_idade";
                    ddlIdade.DataBind();
                    ddlIdade.Items.Insert(0, new ListItem(eventos[0].Restricao, "0"));

                    //seta tipo 
                    ddlTipo.DataSource = ConnetionFactory.SelectTipoEvento();
                    ddlTipo.DataValueField = "id";
                    ddlTipo.DataTextField = "tipo";
                    ddlTipo.DataBind();
                    ddlTipo.Items.Insert(0, new ListItem(eventos[0].Tipo, "0"));





                }
                else
                {
                    Response.Redirect("Default.aspx");
                }

            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse(Request.QueryString["id"], out id) == false)
            {
                return;
            }
            string categoria = ddlCategoria.SelectedItem.Value;
            string tipo = ddlTipo.SelectedItem.Value;
            string restricao = ddlIdade.SelectedItem.Value;
            string nome = txtNome.Text;
            string endereco = txtLocal.Text;
            string descricao = txtDescricao.Text;

            DateTime dataIni;
            if (DateTime.TryParse(txtDataIni.Text, System.Globalization.CultureInfo.GetCultureInfo("pt-br"), System.Globalization.DateTimeStyles.None, out dataIni) == false)
            {
                erroData.Text = " Campo não contém uma data válida, pelo formato brasileiro!";
                return;
            }

            DateTime dataFim;
            if (DateTime.TryParse(txtDataFim.Text, System.Globalization.CultureInfo.GetCultureInfo("pt-br"), System.Globalization.DateTimeStyles.None, out dataFim) == false)
            {
                erroDataFim.Text = " Campo não contém uma data válida, pelo formato brasileiro!";
                return;
            }

            Validadores h = new Validadores();
            string horaInicio = "";
            if (h.IsDateTime(txtHoraIni.Text) == true)
            {
                horaInicio = txtHoraIni.Text;
                erroHoraini.Text = " ";
            }
            else
            {
                erroHoraini.Text = "Informe uma Hora correta!";
            }

            Validadores h2 = new Validadores();
            string horaFim = "";
            if (h2.IsDateTime(txtHoraFim.Text) == true)
            {
                horaFim = txtHoraFim.Text;
                erroHoraFim.Text = " ";
            }
            else
            {
                erroHoraFim.Text = "Informe uma Hora correta!";
            }



            // validando a imagem
            if (!fuimg.HasFile)
            {
                erroImg.Text = "Adicione um Arquivo válido!";

                return;
            }


            string extensao = Path.GetExtension(fuimg.PostedFile.FileName).ToLower();

            string arquivo = Path.GetFileName(fuimg.PostedFile.FileName);

            Foto_Evento foto = new Foto_Evento();
            string validado = foto.ValidaExtensao(extensao);
            if (validado == "Tipo Invalido!")
            {
                erroImg.Text = "Imagem Invalida!";
            }

            ConnetionFactory.UpEvento(nome, endereco, dataIni, dataFim, horaInicio, horaFim, descricao, arquivo, tipo, categoria, restricao, id);
            try
            {
                fuimg.SaveAs(Server.MapPath("~/Imagens/" + nome + arquivo));
            }
            catch (Exception)
            {

                throw;
            }


            Response.Redirect("home.aspx");
        }



        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }
    }
}

