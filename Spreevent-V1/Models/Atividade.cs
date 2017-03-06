using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Spreevent_V1.Models
{
    public class Atividade
    {
        private int id { get; set; }
        private string texto { get; set; }
        private DateTime data { get; set; }
        private Tipo_Atividade tipo_atividade { get; set; }
        private Usuario usuario { get; set; }
        private Evento evento { get; set; }
    }
}