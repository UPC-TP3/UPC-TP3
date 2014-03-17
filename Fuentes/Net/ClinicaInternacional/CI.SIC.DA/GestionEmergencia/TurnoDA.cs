using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CI.SIC.BE.GenerarAtencionMedica.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA.GenerarAtencionMedica.DA
{
    public class TurnoDA
    {
        public List<MedicoBE> ListarMedicosPorTurno(string turno)
        {
            var lstpaciente = new List<MedicoBE>();

            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_GA_ListarMedicosPorTurno";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    var parametrosSql = new[]
                    {
                        new SqlParameter("@GE_TipoTurno", SqlDbType.NVarChar) { Value = turno, Direction = ParameterDirection.Input }
                    };
                    cmd.Parameters.AddRange(parametrosSql);
                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        var colid = reader.GetOrdinal("GE_Medico");
                        var colnombre = reader.GetOrdinal("GE_Nombre");
                        var colapepaterno = reader.GetOrdinal("GE_ApellidoPaterno");
                        //var colapematerno = reader.GetOrdinal("GE_ApellidoMaterno");
                        var coldni = reader.GetOrdinal("GE_DNI");

                        while (reader.Read())
                        {
                            lstpaciente.Add(new MedicoBE
                            {
                                id = reader.GetValueInt32(colid),
                                nombre = reader.GetValueString(colnombre),
                                apellidoPaterno = reader.GetValueString(colapepaterno),
                                //apellidoMaterno = reader.GetValueString(colapematerno),
                                dni = reader.GetValueString(coldni)
                            });
                        }

                    }
                }
            }
            return lstpaciente;
        }
    }
}
