using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CI.SIC.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA
{
    public class CamaDA : BaseDA<CamaDA>
    {
        public IList<CamaBE> Listar()
        {
            var lista = new List<CamaBE>();

            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_ListarCama";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var item = new CamaBE
                            {
                                ID_Cama = reader.GetValueInt32(reader.GetOrdinal("ID_Cama")),
                                GA_NroCama = reader.GetValueString(reader.GetOrdinal("NroCama")),
                                GA_TipoCama = reader.GetValueString(reader.GetOrdinal("TipoCama")),
                                GA_Ubicacion = reader.GetValueString(reader.GetOrdinal("Ubicacion")),
                                GA_Estado = reader.GetValueString(reader.GetOrdinal("Estado")),
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
