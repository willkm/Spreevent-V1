using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Spreevent_V1.Models
{
    public class Restricao_Idade
    {
        private int id;
        private string restricao_idade;

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

        public string Restricao_idade
        {
            get
            {
                return restricao_idade;
            }

            set
            {
                restricao_idade = value;
            }
        }
    }
}