using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Spreevent_V1.Models
{
    public class Solicitacao
    {
        private int id { get; set; }
        private Usuario solicitante { get; set; }
        private Usuario solicitado { get; set; }
        private DateTime data { get; set; }
        private string status { get; set; }
        private Tipo_Solicitacao tipo_solicitacao { get; set; }
        private Evento evento { get; set; }
    }
}