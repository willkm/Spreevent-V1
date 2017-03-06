using Spreevent_V1.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spreevent_V1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Carrega os dados da tabela apenas da primeira vez que a página abrir
            // (ao recarregar a página por causa de cliques em botões, ou outros
            // eventos, os dados não serão recarregados, e serão utilizados os dados
            // anteriormente carregados)
            if (IsPostBack == false)
            {
				Usuario usuario = Usuario.Validar();

				if (usuario != null)
				{
					List<Usuario> usu = new List<Usuario>();
					usu.Add(usuario);
					lvUser.DataSource = usu;
					lvUser.DataBind();

					List<Categoria_Evento> categorias = ConnetionFactory.SelectCategorias();
					ddlcateg.DataSource = categorias;
					ddlcateg.DataTextField = "categoriaEvento";
					ddlcateg.DataValueField = "id";
					ddlcateg.DataBind();
					ddlcateg.Items.Insert(0, new ListItem("Todos", "0"));

					List<Evento> eventos = ConnetionFactory.SelectEventos();
					listRepeater.DataSource = eventos;
					listRepeater.DataBind();

					
				}
				else
				{
					Response.Redirect("Default.aspx");
				}
				
            }
        }

        protected void btnCateg_Click(object sender, EventArgs e)
        {
            string categoria = ddlcateg.SelectedItem.Value;

            List<Evento> eventos = ConnetionFactory.SelectCategoriaComId(categoria);

            listRepeater.DataSource = eventos;
            listRepeater.DataBind();
        }

        protected void btnPesq_Click(object sender, EventArgs e)
        {
            string nome = txtpesq.Text.Trim() ;
 
            listRepeater.DataSource = ConnetionFactory.SelectCategoriaComNome(nome);
            listRepeater.DataBind();

        }

		protected void btnSair_Click(object sender, EventArgs e)
		{
			Usuario usuario = Usuario.Validar();
			usuario.FazerLogout();
			Response.Redirect("Default.aspx");
		}
	}
}