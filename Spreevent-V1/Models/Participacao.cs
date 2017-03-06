using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Spreevent_V1.Models
{
    public class Participacao
    {
        private int id { get; set; }
        private Usuario usuario { get; set; }
        private Evento evento { get; set; }
    }
}