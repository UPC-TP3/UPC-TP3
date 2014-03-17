using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

        public EvaluacionBE Obtener(int id)
        {
            var item = new EvaluacionBE();
            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_ObtenerEvaluacion";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    var parametrosSql = new[]
                    {
                        new SqlParameter("@evaluacion", SqlDbType.Int) { Value = id, Direction = ParameterDirection.Input }
                    };
                    cmd.Parameters.AddRange(parametrosSql);
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
                            item = new EvaluacionBE
                                {
                                    IdEvaluacion = reader.GetValueInt32(colIdEvaluacion),
                                    IdInstalacion = reader.GetValueInt32(colIdInstalacion),
                                    Disponibilidad = reader.GetValueInt32(colDisponibilidad),
                                    Resultado = reader.GetValueInt32(colResultado),
                                    Observaciones = reader.GetValueString(colObservaciones),
                                    NombreEnfermeroAuxiliar = reader.GetValueString(colNombreEnfermeroAuxiliar),
                                    Fecha = reader.GetValueDateTime(colFechaEvaluacion),
                                    Detalle = new EvaluacionDetalleDA().Listar(id)
                                };
                        }
                    }
                }
            }
            return item;
        }

        public int Grabar(EvaluacionBE evaluacion)
        {
            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_GrabarEvaluacion";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    var parametrosSql = new[]
                    {
                        new SqlParameter("@evaluacion", SqlDbType.Int) { Value = evaluacion.IdEvaluacion, Direction = ParameterDirection.Input },
                        new SqlParameter("@instalacion", SqlDbType.Int) { Value = evaluacion.IdInstalacion, Direction = ParameterDirection.Input },
                        new SqlParameter("@disponibilidad", SqlDbType.Int) { Value = evaluacion.Disponibilidad, Direction = ParameterDirection.Input },
                        new SqlParameter("@resultado", SqlDbType.Int) { Value = evaluacion.Resultado, Direction = ParameterDirection.Input },
                        new SqlParameter("@observaciones", SqlDbType.VarChar) { Value = evaluacion.Observaciones, Direction = ParameterDirection.Input },
                        new SqlParameter("@nombreenfermeroauxiliar", SqlDbType.VarChar) { Value = evaluacion.NombreEnfermeroAuxiliar, Direction = ParameterDirection.Input },                        
                        new SqlParameter("@fecha", SqlDbType.DateTime) { Value = evaluacion.Fecha, Direction = ParameterDirection.Input }
                    };
                    cmd.Parameters.AddRange(parametrosSql);
                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            evaluacion.IdEvaluacion = reader.GetValueInt32(reader.GetOrdinal("GE_CodigoEvaluacion"));
                        }
                    }
                    if (evaluacion.IdEvaluacion > 0)
                    {
                        foreach (var detalle in evaluacion.Detalle)
                        {
                            detalle.IdEvaluacion = evaluacion.IdEvaluacion;
                            new EvaluacionDetalleDA().Grabar(detalle);
                        }
                    }
                }
            }
            return evaluacion.IdEvaluacion;
        }
    }
}
