using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Spreevent_V1
{
	/// <summary>
	/// Summary description for Foto
	/// </summary>
	public class Foto : IHttpHandler
	{

		public void ProcessRequest(HttpContext context)
		{
			context.Response.TrySkipIisCustomErrors = true;

			int id;
			if (!int.TryParse(context.Request.QueryString["id"], out id))
			{
				context.Response.StatusCode = 400;
				context.Response.ContentType = "text/plain";
				context.Response.Write("Id inválido");
				return;
			}

			//validar o cookie para ver se o usuário está logado
			//if (!logado || !temPermissao)
			//{
			//    context.Response.StatusCode = 403;
			//    context.Response.ContentType = "text/plain";
			//    context.Response.Write("Sem permissão para ver a foto!");
			//    return;
			//}

			string caminho = context.Server.MapPath("~/App_Data/" + id + ".jpg");

			if (!System.IO.File.Exists(caminho))
			{
				context.Response.StatusCode = 404;
				context.Response.ContentType = "text/plain";
				context.Response.Write("Foto inexistente");
				return;
			}

			//context.Response.Cache.SetNoStore();
			context.Response.Cache.SetExpires(DateTime.Now.AddSeconds(60));
			context.Response.Cache.SetMaxAge(new TimeSpan(0, 1, 0));

			context.Response.ContentType = "image/jpeg";
			context.Response.WriteFile(caminho);
		}

		public bool IsReusable
		{
			get
			{
				return true;
			}
		}
	}
}