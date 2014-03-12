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
    public class DAO_Paciente : BaseDA<DAO_Paciente>
    {
        public BE_Paciente GetPacienteXIdPaciente(int IdPaciente, string NroDocumento)
        {

            BE_Paciente objPaciente = null;
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
                    objPaciente = new BE_Paciente();
                    objPaciente.ID_Paciente = reader.GetInt32(reader.GetOrdinal("ID_Paciente"));
                    objPaciente.dni_paciente = reader.GetString(reader.GetOrdinal("dni_paciente"));
                    objPaciente.FechaNacimiento = reader.GetDateTime(reader.GetOrdinal("FechaNacimiento"));
                    objPaciente.Celular = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("Celular"))) ? "" : reader.GetString(reader.GetOrdinal("Celular"));
                    objPaciente.TelefonoDomicilio = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("TelefonoDomicilio"))) ? "" : reader.GetString(reader.GetOrdinal("TelefonoDomicilio"));
                    objPaciente.Direccion = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("Direccion"))) ? "" : reader.GetString(reader.GetOrdinal("Direccion"));
                    objPaciente.ID_Sexo = reader.GetInt32(reader.GetOrdinal("ID_Sexo"));
                    objPaciente.ID_TipoDocumento = reader.GetInt32(reader.GetOrdinal("ID_TipoDocumento"));
                    objPaciente.Nombres = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("nombres"))) ? "" : reader.GetString(reader.GetOrdinal("nombres"));
                    objPaciente.ApellidoPat = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("ApellidoPat"))) ? "" : reader.GetString(reader.GetOrdinal("ApellidoPat"));
                    objPaciente.ApellidoMat = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("ApellidoMat"))) ? "" : reader.GetString(reader.GetOrdinal("ApellidoMat"));
                    objPaciente.ID_EstadoCivil = reader.GetInt32(reader.GetOrdinal("ID_EstadoCivil"));
                    objPaciente.correo = string.IsNullOrEmpty(reader.GetString(reader.GetOrdinal("Correo"))) ? "" : reader.GetString(reader.GetOrdinal("Correo"));

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
