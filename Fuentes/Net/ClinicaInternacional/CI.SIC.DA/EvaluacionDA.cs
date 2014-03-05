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
    public class EvaluacionDA : BaseDA<EvaluacionDA>
    {
        public IList<EvaluacionBE> Listar()
        {
            var lista = new List<EvaluacionBE>();

            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_ListarEvaluacion";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        var colIdEvaluacion = reader.GetOrdinal("GE_CodigoEvaluacion");
                        var colIdInstalacion = reader.GetOrdinal("GE_CodigoInstalacion");
                        var colDisponibilidad = reader.GetOrdinal("GE_Disponibilidad");
                        var colResultado = reader.GetOrdinal("GE_Resultado");
                        var colObservaciones = reader.GetOrdinal("GE_Observaciones");
                        var colNombreEnfermeroAuxiliar = reader.GetOrdinal("GE_NombreEnfermeroAuxiliar");
                        var colFechaEvaluacion = reader.GetOrdinal("GE_FechaEvaluacion");               

                        while (reader.Read())
                        {
                            var item = new EvaluacionBE
                            {                                
                                IdEvaluacion = reader.GetValueInt32(colIdEvaluacion),
                                IdInstalacion = reader.GetValueInt32(colIdInstalacion),
                                Disponibilidad = reader.GetValueInt32(colDisponibilidad),
                                Resultado = reader.GetValueInt32(colResultado),
                                Observaciones = reader.GetValueString(colObservaciones),
                                NombreEnfermeroAuxiliar = reader.GetValueString(colNombreEnfermeroAuxiliar),
                                Fecha = reader.GetValueDateTime(colFechaEvaluacion)
                            };

                            switch (item.Disponibilidad)
                            {
                                case 1:
                                    item.NombreDisponibilidad = Estado.Disponible.ToString();
                                    break;
                                case 2:
                                    item.NombreDisponibilidad = Estado.NoDisponible.ToString();
                                    break;
                            }
                            switch (item.Resultado)
                            {
                                case 1:
                                    item.NombreResultado = Resultado.Aprobado.ToString();
                                    break;
                                case 2:
                                    item.NombreResultado = Resultado.Desaprobado.ToString();
                                    break;
                            }

                            lista.Add(item);
                        }
                    }
                }
            }

            return lista;
        }
    }
}
