using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Spreevent_V1.Models
{
    public class Endereco
    {

        private int id { get; }
        private string nome { get; }
        private string cep { get; }
        private int numero { get; }
        private Bairro bairro { get; }

    }
}