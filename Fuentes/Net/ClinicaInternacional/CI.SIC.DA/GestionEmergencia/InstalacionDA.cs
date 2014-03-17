using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CI.SIC.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA
{
    public class InstalacionDA : BaseDA<InstalacionDA>
    {
        public IList<InstalacionBE> Listar()
        {
            var lista = new List<InstalacionBE>();

            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_ListarInstalacion";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        var colIdInstalacion = reader.GetOrdinal("ID_CodigoInstalacion");
                        var colNombre = reader.GetOrdinal("GE_Nombre");                     

                        while (reader.Read())
                        {
                            var item = new InstalacionBE
                            {                                
                                IdInstalacion = reader.GetValueInt32(colIdInstalacion),                             
                                Nombre = reader.GetValueString(colNombre)                                
                            };
                            
                            lista.Add(item);
                        }
                    }
                }
            }
            return lista;
        }
    }
}
