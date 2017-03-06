using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Spreevent_V1.Utils
{
    public class Validadores
    {
        public bool IsDateTime(string strHora)
        {
            try
            {
                Convert.ToDateTime(strHora);
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}