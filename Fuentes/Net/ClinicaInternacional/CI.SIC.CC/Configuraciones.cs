﻿using System.Configuration;

namespace CI.SIC.CC
{
    public class Configuraciones
    {
        public static string CadenaConexion
        {
            get { return ConfigurationManager.ConnectionStrings["CEC_DB"].ConnectionString; }
        }
    }
}
