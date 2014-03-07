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
    public class PacienteDAO : BaseDA<PacienteDAO>
    {
        public PacienteBE GetPacienteXIdPaciente(int IdPaciente, string NroDocumento)
        {

            PacienteBE objPaciente = null;
            var cn = new SqlConnection(Configuraciones.CadenaConexion);
            var cmd = new SqlCommand();
            SqlDataReader reader = null;
            try
            {
                cmd.CommandText = "usp_GetPacienteXIdPaciente";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@pIdPaciente", IdPaciente));
                cmd.Parameters.Add(new SqlParameter("@pNroDoc", NroDocumento));
                cmd.Connection = cn;
                cn.Open();

                reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (reader.Read())
                {
                    objPaciente = new PacienteBE();
                    objPaciente.ID_Paciente = string.IsNullOrEmpty(reader.GetInt32(reader.GetOrdinal("ID_Paciente")).ToString()) ? 0 : reader.GetInt32(reader.GetOrdinal("ID_Paciente"));
                    objPaciente.GA_DocumentoIdentidad = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("GA_DocumentoIdentidad"))) ? "" : reader.GetString(reader.GetOrdinal("GA_DocumentoIdentidad"));
                    objPaciente.GA_EstadoCivil = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("GA_EstadoCivil"))) ? "" : reader.GetString(reader.GetOrdinal("GA_EstadoCivil"));
                    objPaciente.GA_FechaNacimiento = reader.GetDateTime(reader.GetOrdinal("GA_FechaNacimiento"));
                    objPaciente.GA_Celular = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("GA_Celular"))) ? "" : reader.GetString(reader.GetOrdinal("GA_Celular"));
                    objPaciente.GA_TelefonoDomicilio = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("GA_TelefonoDomicilio"))) ? "" : reader.GetString(reader.GetOrdinal("GA_TelefonoDomicilio"));
                    objPaciente.GA_Direccion = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("GA_Direccion"))) ? "" : reader.GetString(reader.GetOrdinal("GA_Direccion"));
                    objPaciente.GA_Sexo = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("GA_Sexo"))) ? "" : reader.GetString(reader.GetOrdinal("GA_Sexo"));
                    objPaciente.ID_TipoDocumento = string.IsNullOrEmpty(reader.GetInt32(reader.GetOrdinal("ID_TipoDocumento")).ToString()) ? 0 : reader.GetInt32(reader.GetOrdinal("ID_TipoDocumento"));
                    objPaciente.GA_Nombre = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("GA_Nombre"))) ? "" : reader.GetString(reader.GetOrdinal("GA_Nombre"));
                    objPaciente.ApellidoPat = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("ApellidoPat"))) ? "" : reader.GetString(reader.GetOrdinal("ApellidoPat"));
                    objPaciente.ApellidoMat = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("ApellidoMat"))) ? "" : reader.GetString(reader.GetOrdinal("ApellidoMat"));
                    objPaciente.correo = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("GA_Correo"))) ? "" : reader.GetString(reader.GetOrdinal("GA_Correo"));

                }
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                reader.Close();
                cmd.Dispose();
                cn.Close();
            }

            return objPaciente;
        }

    }
}
