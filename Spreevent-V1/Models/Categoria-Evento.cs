using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Spreevent_V1.Models
{
    public class Categoria_Evento
    {
        private int id;
        private string categoriaEvento;
      

 

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

        public string CategoriaEvento
        {
            get
            {
                return categoriaEvento;
            }

            set
            {
                categoriaEvento = value;
            }
        }

    }
}