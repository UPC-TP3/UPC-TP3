using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CI.SIC.BE.GenerarAtencionMedica.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA.GenerarAtencionMedica.DA
{
    public class AtencionMedicaDA : BaseDA<AtencionMedicaDA>
    {
        public void Crear(AtencionMedicaBE atencionmedica)
        {
            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_GA_CrearAtencion";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    var parametrosSql = new[]
                    {
                        new SqlParameter("@GE_ATENCION", SqlDbType.Int) { Value = 0, Direction = ParameterDirection.Output },
                        new SqlParameter("@GE_FechaIngreso", SqlDbType.DateTime) { Value = atencionmedica.fechaIngreso, Direction = ParameterDirection.Input },
                        new SqlParameter("@GE_Medico", SqlDbType.Int) { Value = atencionmedica.medico, Direction = ParameterDirection.Input },
                        new SqlParameter("@GE_Paciente", SqlDbType.Int) { Value = atencionmedica.paciente, Direction = ParameterDirection.Input },
                        new SqlParameter("@GE_DescripcionObservaciones", SqlDbType.NVarChar) { Value = atencionmedica.observaciones, Direction = ParameterDirection.Input }
                    };
                    cmd.Parameters.AddRange(parametrosSql);
                    cn.Open();

                    cmd.ExecuteNonQuery();

                    atencionmedica.id = int.Parse(cmd.Parameters[0].Value.ToString());
                }
            }
        }

        public List<ListadoAtencionBE> Listar(int id, string dni)
        {
            var lstatenciones = new List<ListadoAtencionBE>();

            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_GA_ListarAtencion";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    var parametrosSql = new[]
                    {
                        new SqlParameter("@GE_DNI", SqlDbType.NVarChar) { Value = dni, Direction = ParameterDirection.Input },
                        new SqlParameter("@GE_ATENCION", SqlDbType.Int) { Value = id, Direction = ParameterDirection.Input }
                    };
                    cmd.Parameters.AddRange(parametrosSql);
                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        var colid = reader.GetOrdinal("GE_ATENCION");
                        var colfechaingreso= reader.GetOrdinal("GE_FechaIngreso");
                        var coldnipaciente = reader.GetOrdinal("DNIPaciente");
                        var colpaciente = reader.GetOrdinal("Paciente");
                        var colmedico = reader.GetOrdinal("Medico");
                        var colidPaciente = reader.GetOrdinal("idpaciente");
                        var colidMedico = reader.GetOrdinal("idmedico");
                        var colDNIMedico = reader.GetOrdinal("DNIMedico");
                        var colObservaciones = reader.GetOrdinal("GE_DescripcionObservaciones");                       

                        while (reader.Read())
                        {
                            lstatenciones.Add(new ListadoAtencionBE
                            {
                                id = reader.GetValueInt32(colid),
                                DNIPaciente = reader.GetValueString(coldnipaciente),
                                fechaIngreso = reader.GetValueDateTime(colfechaingreso),
                                Medico = reader.GetValueString(colmedico),
                                Paciente = reader.GetValueString(colpaciente),
                                idPaciente = reader.GetValueInt32(colidPaciente),
                                idMedico = reader.GetValueInt32(colidMedico),
                                DNIMedico = reader.GetValueString(colDNIMedico),
                                Observaciones = reader.GetValueString(colObservaciones)
                            });
                        }

                    }
                }
            }
            return lstatenciones;
        }

        public void Eliminar(int id)
        {
            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_GA_EliminarAtencion";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    var parametrosSql = new[]
                    {
                        new SqlParameter("@GE_ATENCION", SqlDbType.Int) { Value = id, Direction = ParameterDirection.Input}
                    };
                    cmd.Parameters.AddRange(parametrosSql);
                    cn.Open();

                    cmd.ExecuteNonQuery();                    
                }
            }
        }

        public void Actualizar(AtencionMedicaBE atencionmedica)
        {
            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_GA_ActualizarAtencion";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    var parametrosSql = new[]
                    {
                        new SqlParameter("@GE_ATENCION", SqlDbType.Int) { Value = 0, Direction = ParameterDirection.Input },
                        new SqlParameter("@GE_FechaIngreso", SqlDbType.DateTime) { Value = atencionmedica.fechaIngreso, Direction = ParameterDirection.Input },
                        new SqlParameter("@GE_Medico", SqlDbType.Int) { Value = atencionmedica.medico, Direction = ParameterDirection.Input },
                        new SqlParameter("@GE_Paciente", SqlDbType.Int) { Value = atencionmedica.paciente, Direction = ParameterDirection.Input },
                        new SqlParameter("@GE_DescripcionObservaciones", SqlDbType.NVarChar) { Value = atencionmedica.observaciones, Direction = ParameterDirection.Input }
                    };
                    cmd.Parameters.AddRange(parametrosSql);
                    cn.Open();

                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
