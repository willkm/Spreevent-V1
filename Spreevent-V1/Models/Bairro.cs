using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Spreevent_V1.Models
{
    public class Bairro
    {
        private int id { get; }
        private string nome { get; }
        private Cidade cidade { get; }
    }
}