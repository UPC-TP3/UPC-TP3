using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CI.SIC.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA
{
    public class ServicioExamenDA : BaseDA<ServicioExamenDA>
    {
        public IList<ServicioExamenBE> Listar()
        {
            var lista = new List<ServicioExamenBE>();

            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_ListarServicioExamen";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var item = new ServicioExamenBE
                            {
                                IdAtencion = reader.GetValueInt32(reader.GetOrdinal("IdAtencion")),
                                IdServicio = reader.GetValueInt32(reader.GetOrdinal("IdServicio")),
                                IdExamen = reader.GetValueInt32(reader.GetOrdinal("IdExamen")),
                                Examen = reader.GetValueString(reader.GetOrdinal("Examen")),
                                FechaIngreso = reader.GetValueDateTime(reader.GetOrdinal("FechaIngreso")),
                                IdMedico = reader.GetValueInt32(reader.GetOrdinal("IdMedico")),
                                Medico = reader.GetValueString(reader.GetOrdinal("Medico")),
                                IdPaciente = reader.GetValueInt32(reader.GetOrdinal("IdPaciente")),
                                Paciente = reader.GetValueString(reader.GetOrdinal("Paciente"))
                            };

                            lista.Add(item);
                        }
                    }
                }
            }

            return lista;
        }

        public IList<CamaBE> ListarHistoria(int idCama)
        {
            var lista = new List<CamaBE>();

            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_ListarCamaHistoria";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    cmd.Parameters.AddRange(new[]
                        {
                            new SqlParameter("@idcama", SqlDbType.Int)
                                {
                                    Value = idCama,
                                    Direction = ParameterDirection.Input
                                }
                        });
                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var item = new CamaBE
                            {                                
                                FechaActualizacion = reader.GetValueDateTime(reader.GetOrdinal("FechaActualizacion")),
                                EnfermeroActualizador = reader.GetValueString(reader.GetOrdinal("EnfermeroActualizador")),
                                Observacion = reader.GetValueString(reader.GetOrdinal("Observacion"))
                            };

                            lista.Add(item);
                        }
                    }
                }
            }

            return lista;
        }

        public void Actualizar(IList<CamaBE> camas)
        {
            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                cn.Open();
                foreach (var cama in camas)
                {
                    using (var cmd = new SqlCommand())
                    {
                        cmd.CommandText = "usp_ActualizarEstadoCama";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = cn;
                        
                        cmd.Parameters.AddRange(new[]
                            {
                                new SqlParameter("@idcama", SqlDbType.Int)
                                    {
                                        Value = cama.ID_Cama,
                                        Direction = ParameterDirection.Input
                                    },
                                new SqlParameter("@enfermero", SqlDbType.VarChar)
                                    {
                                        Value = cama.EnfermeroActualizador,
                                        Direction = ParameterDirection.Input
                                    },
                                new SqlParameter("@estado", SqlDbType.VarChar)
                                    {
                                        Value = cama.GA_Estado,
                                        Direction = ParameterDirection.Input
                                    },
                                new SqlParameter("@fecha", SqlDbType.DateTime)
                                    {
                                        Value = cama.FechaActualizacion,
                                        Direction = ParameterDirection.Input
                                    },
                                new SqlParameter("@observacion", SqlDbType.VarChar)
                                    {
                                        Value = cama.Observacion,
                                        Direction = ParameterDirection.Input
                                    }
                            });
                        cmd.ExecuteNonQuery();
                    }

                }
            }

        }
    }
}
