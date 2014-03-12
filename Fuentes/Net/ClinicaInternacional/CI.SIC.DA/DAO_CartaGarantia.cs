using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA
{
    public class DAO_CartaGarantia : BaseDA<DAO_CartaGarantia>
    {
        public BE_CartaGarantia GetCartaGarantiaXCodigo(int codCarta)
        {
            BE_CartaGarantia objCarta = null;
            var cn = new SqlConnection(Configuraciones.CadenaConexion);
            var cmd = new SqlCommand();
            SqlDataReader reader = null;

            try
            {
                cmd.CommandText = "usp_GetCartaXCodigo";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@pcodCarta", codCarta));
                cmd.Connection = cn;
                cn.Open();

                 reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                 while (reader.Read())
                 {
                     objCarta = new BE_CartaGarantia();
                     objCarta.ID_Carta = reader.GetInt32(reader.GetOrdinal("ID_Carta"));
                     objCarta.ID_Orden_de_Procedimiento = reader.GetInt32(reader.GetOrdinal("ID_Orden_de_Procedimiento"));
                     objCarta.CodPresupuesto = reader.GetInt32(reader.GetOrdinal("CodPresupuesto"));
                     objCarta.ID_Paciente = reader.GetInt32(reader.GetOrdinal("ID_Paciente"));
                     objCarta.CodAseguradora = reader.GetInt32(reader.GetOrdinal("CodAseguradora"));
                     objCarta.FecINiVigencia = reader.GetDateTime(reader.GetOrdinal("FecINiVigencia"));
                     objCarta.FecFinVigencia = reader.GetDateTime(reader.GetOrdinal("FecFinVigencia"));
                     objCarta.MontoCarta = reader.GetDecimal(reader.GetOrdinal("MontoCarta"));
                     objCarta.Detalle = reader.GetString(reader.GetOrdinal("Detalle"));
                     objCarta.Estado = reader.GetInt32(reader.GetOrdinal("Estado"));
                 }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                reader.Close();
                cmd.Dispose();
                cn.Close();
            }

            return objCarta;
        }
    }
}
