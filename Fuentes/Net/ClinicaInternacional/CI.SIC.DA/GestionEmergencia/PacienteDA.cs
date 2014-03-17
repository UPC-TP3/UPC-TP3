using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CI.SIC.BE.GenerarAtencionMedica.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;


namespace CI.SIC.DA.GenerarAtencionMedica.DA
{
    public class PacienteDA
    {
        public PacienteBE Buscar(string dni)
        {
            PacienteBE paciente = null;

            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_GA_BuscarPaciente";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    var parametrosSql = new[]
                    {
                        new SqlParameter("@GE_DNI", SqlDbType.NVarChar) { Value = dni, Direction = ParameterDirection.Input }
                    };
                    cmd.Parameters.AddRange(parametrosSql);
                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        var colid = reader.GetOrdinal("GE_Paciente");
                        var colnombre = reader.GetOrdinal("GE_Nombre");
                        var colapepaterno = reader.GetOrdinal("GE_ApellidoPaterno");
                        var colapematerno = reader.GetOrdinal("GE_ApellidoMaterno");
                        var colfechanacimiento = reader.GetOrdinal("GE_FechaNacimiento");
                        var coldni = reader.GetOrdinal("GE_DNI");

                        while (reader.Read())
                        {
                            paciente = new PacienteBE
                            {
                                id = reader.GetValueInt32(colid),
                                nombre = reader.GetValueString(colnombre),
                                apellidoPaterno = reader.GetValueString(colapepaterno),
                                apellidoMaterno = reader.GetValueString(colapematerno),
                                fechaNacimiento = reader.GetValueDateTime(colfechanacimiento),
                                dni = reader.GetValueString(coldni)
                            };
                        }
                    }
                }
            }

            return paciente;
        }

        public void Crear(PacienteBE paciente)
        {
            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_GA_CrearPaciente";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    var parametrosSql = new[]
                    {
                        new SqlParameter("@GE_Paciente ", SqlDbType.Int) { Value = 0, Direction = ParameterDirection.Output },
                        new SqlParameter("@GE_Nombre", SqlDbType.NVarChar) { Value = paciente.nombre, Direction = ParameterDirection.Input },
                        new SqlParameter("@GE_ApellidoPaterno", SqlDbType.NVarChar) { Value = paciente.apellidoPaterno, Direction = ParameterDirection.Input },
                        new SqlParameter("@GE_ApellidoMaterno", SqlDbType.NVarChar) { Value = paciente.apellidoMaterno, Direction = ParameterDirection.Input },
                        new SqlParameter("@GE_FechaNacimiento", SqlDbType.DateTime) { Value = paciente.fechaNacimiento, Direction = ParameterDirection.Input },
                        new SqlParameter("@GE_DNI", SqlDbType.NVarChar) { Value = paciente.dni, Direction = ParameterDirection.Input }
                    };
                    cmd.Parameters.AddRange(parametrosSql);
                    cn.Open();

                    cmd.ExecuteNonQuery();

                    paciente.id = int.Parse(cmd.Parameters[0].Value.ToString());
                }
            }
        }

        public IList<PacienteBE> Listar()
        {
            var lista = new List<PacienteBE>();

            using (var cn = new SqlConnection(Configuraciones.CadenaConexion))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.CommandText = "usp_ListarPaciente";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = cn;
                    cn.Open();

                    using (var reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            var item = new PacienteBE
                            {
                                id = reader.GetValueInt32(reader.GetOrdinal("IdPaciente")),
                                nombre = reader.GetValueString(reader.GetOrdinal("Paciente"))                                
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
