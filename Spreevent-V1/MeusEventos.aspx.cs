using Spreevent_V1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spreevent_V1
{
    public partial class MeusEventos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                Usuario usuario = Usuario.Validar();
                int idUser = usuario.Id;
                if (usuario != null)
                {
                    List<Usuario> usu = new List<Usuario>();
                    usu.Add(usuario);
                    lvUser.DataSource = usu;
                    lvUser.DataBind();

                    listRepeater.DataSource = ConnetionFactory.SelectMeuEvento(idUser);
                    listRepeater.DataBind();
                }
            }
        }

        protected void btnPesq_Click(object sender, EventArgs e)
        {

        }

        protected void btnSair_Click(object sender, EventArgs e)
        {

        }
    }
}