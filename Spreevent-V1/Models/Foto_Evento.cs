using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Spreevent_V1.Models
{
    public class Foto_Evento
    {
        private int id { get; set; }
       

       public string ValidaExtensao(String extensao)
        {
            string tipo = "";
            switch (extensao)
            {
                case ".png":
                    {
                        tipo = "image/png";
                    }break;
                case ".jpg":
                    {
                        tipo = "image/jpeg";
                    }break;
                case ".jpeg":
                    {
                        tipo = "image/jpeg";
                    }break;
                default:
                    {
                        tipo = "Tipo Invalido!";
                    }break;
            }
            return tipo;
        }
    }
}