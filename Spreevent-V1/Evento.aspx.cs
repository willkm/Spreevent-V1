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
    public partial class WebForm1 : System.Web.UI.Page
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

                    List<Usuario> usu = new List<Usuario>();
                    usu.Add(user);
                    lvUser.DataSource = usu;
                    lvUser.DataBind();

                    List<Evento> eventos = ConnetionFactory.SelectEvento(id);
                    lista.DataSource = eventos;
                    lista.DataBind();

                    Usuario use = ConnetionFactory.selectUser(eventos[0].IdUser);
                    List<Usuario> usuario = new List<Usuario>();
                    usuario.Add(use);

                    rpUser.DataSource = usuario;
                    rpUser.DataBind();

                    if (usu[0].Nome == usuario[0].Nome)
                    {
                        excluir.Visible = true;
                        editarevento.Visible = true;
                    }
                    else
                    {
                        excluir.Visible = false;
                        editarevento.Visible = false;
                    }


                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }

        }

        protected void excluir_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse(Request.QueryString["id"], out id) == false)
            {
                return;
            }

            ConnetionFactory.DeleteEvento(id);

            Response.Redirect("Home.aspx");
        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            Usuario usuario = Usuario.Validar();
            usuario.FazerLogout();
            Response.Redirect("Default.aspx");
        }

        protected void editarevento_Click(object sender, EventArgs e)
        {
            Usuario user = Usuario.Validar();
            if (user != null)
            {
                int id;
                if (int.TryParse(Request.QueryString["id"], out id) == false)
                {
                    return;
                }

                Response.Redirect("EditarEvento.aspx?id=" + id);
            }
        }
    }
}