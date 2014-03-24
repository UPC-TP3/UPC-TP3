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
        public int fn_ActualizarPaciente(BE_Paciente p_objPacienteBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                parameters.Add("@ID_Paciente", p_objPacienteBE.ID_Paciente);
                parameters.Add("@DNI", p_objPacienteBE.dni_paciente);
                parameters.Add("@Nombres", p_objPacienteBE.Nombres);
                parameters.Add("@ApellidoP", p_objPacienteBE.ApellidoPat);
                parameters.Add("@ApellidoM", p_objPacienteBE.ApellidoMat);
                parameters.Add("@FechaNac", p_objPacienteBE.FechaNacimiento);
                parameters.Add("@Celular", p_objPacienteBE.Celular);
                parameters.Add("@Telefono", p_objPacienteBE.TelefonoDomicilio);
                parameters.Add("@Direccion", p_objPacienteBE.Direccion);
                parameters.Add("@Sexo", p_objPacienteBE.ID_Sexo);

                if (p_objPacienteBE.ID_TipoDocumento == 0)
                {
                    parameters.Add("@IdTipoDoc", DBNull.Value);
                }
                else
                {
                    parameters.Add("@IdTipoDoc", p_objPacienteBE.ID_TipoDocumento);
                }

                if (p_objPacienteBE.ID_Pais == 0)
                {
                    parameters.Add("@ID_Pais", DBNull.Value);
                }
                else
                {
                    parameters.Add("@ID_Pais", p_objPacienteBE.ID_Pais);
                }

                if (p_objPacienteBE.ID_Departamento == 0)
                {
                    parameters.Add("@ID_Departamento", DBNull.Value);
                }
                else
                {
                    parameters.Add("@ID_Departamento", p_objPacienteBE.ID_Departamento);
                }

                if (p_objPacienteBE.ID_Provincia == 0)
                {
                    parameters.Add("@ID_Provincia", DBNull.Value);
                }
                else
                {
                    parameters.Add("@ID_Provincia", p_objPacienteBE.ID_Provincia);
                }

                if (p_objPacienteBE.ID_Distrito == 0)
                {
                    parameters.Add("@ID_Distrito", DBNull.Value);
                }
                else
                {
                    parameters.Add("@ID_Distrito", p_objPacienteBE.ID_Distrito);
                }

                parameters.Add("@Observacion", p_objPacienteBE.Observacion);
                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_ActualizarPaciente", parameters);
                return rpta;
            }
            catch { throw; }
        }



        public List<BE_Paciente> fn_ListarPaciente(BE_Paciente opBE_Paciente)
        {
            var lista = new List<BE_Paciente>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@ID_Paciente", opBE_Paciente.ID_Paciente);
            parameters.Add("@dni_paciente", opBE_Paciente.dni_paciente);
            parameters.Add("@ID_TipoDocumento", opBE_Paciente.ID_TipoDocumento);

            parameters.Add("@Observacion", opBE_Paciente.Observacion);
            parameters.Add("@nombres", opBE_Paciente.Nombres);
            parameters.Add("@ApellidoPat", opBE_Paciente.ApellidoPat);
            parameters.Add("@ApellidoMat", opBE_Paciente.ApellidoMat);

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("usp_SelectAll_Paciente", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new BE_Paciente
                    {

                        //Nombres = reader.GetString(reader.GetOrdinal("nombres"))
                        ID_Paciente = reader.GetInt32(reader.GetOrdinal("ID_Paciente")),
                        dni_paciente = reader.GetString(reader.GetOrdinal("dni_paciente")),
                        //EstadoCivil = reader.GetString(reader.GetOrdinal("EstadoCivil")),                
                        FechaNacimiento = reader.GetDateTime(reader.GetOrdinal("FechaNacimiento")),
                        Celular = reader.GetString(reader.GetOrdinal("Celular")),
                        TelefonoDomicilio = reader.GetString(reader.GetOrdinal("TelefonoDomicilio")),
                        ID_Pais = reader.GetInt32(reader.GetOrdinal("ID_Pais")),
                        ID_Departamento = reader.GetInt32(reader.GetOrdinal("ID_Departamento")),
                        ID_Provincia = reader.GetInt32(reader.GetOrdinal("ID_Provincia")),
                        ID_Distrito = reader.GetInt32(reader.GetOrdinal("ID_Distrito")),
                        Direccion = reader.GetString(reader.GetOrdinal("Direccion")),
                        ID_Sexo = reader.GetInt32(reader.GetOrdinal("ID_Sexo")),
                        Ocupacion = reader.GetString(reader.GetOrdinal("Ocupacion")),
                        ID_TipoDocumento = reader.GetInt32(reader.GetOrdinal("ID_TipoDocumento")),
                        Nombres = reader.GetString(reader.GetOrdinal("ApellidoPat")) + " " + reader.GetString(reader.GetOrdinal("ApellidoMat")) + " ," + reader.GetString(reader.GetOrdinal("nombres")),
                        ApellidoPat = reader.GetString(reader.GetOrdinal("ApellidoPat")),
                        ApellidoMat = reader.GetString(reader.GetOrdinal("ApellidoMat")),
                        ID_EstadoCivil = reader.GetInt32(reader.GetOrdinal("ID_EstadoCivil")),
                        correo = reader.GetString(reader.GetOrdinal("correo")),
                        NombreTipoDocumento = reader.GetString(reader.GetOrdinal("NombreTipoDocumento")),
                        Anonimo = reader.GetString(reader.GetOrdinal("dni_paciente")) == "" ? "SI" : "NO"
                    });
                }
            }
            return lista;
        }


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

        
        #region Gestión Admisión

        /// <summary>
        /// Función que verifica la existencia del Paciente en la BD
        /// </summary>
        /// <param name="p_vDNI">DNI del paciente</param>
        /// <returns>Objeto Paciente</returns>
        public BE_Paciente fn_VerificarPaciente(string p_vDNI)
        {
            /*
            Nombre: fn_VerificarPaciente
            Creado Por: Lsalvatierra
            Fecha Creación: 10/03/2014
            */
            var objUsuario = (BE_Paciente)null;
            try
            {
                Dictionary<string, object> parameter = new Dictionary<string, object>();
                parameter.Add("@DNI", p_vDNI);
                using (IDataReader oReader = SqlHelper.Instance.ExecuteReader("usp_VerificarPaciente", parameter))
                {
                    if (oReader.Read())
                    {
                        objUsuario = new BE_Paciente
                        {
                            ID_Paciente = oReader.GetInt32(oReader.GetOrdinal("ID_Paciente")),
                            dni_paciente = oReader.GetString(oReader.GetOrdinal("dni_paciente")),
                            Nombres = oReader.GetString(oReader.GetOrdinal("nombres")),
                            ApellidoPat = oReader.GetString(oReader.GetOrdinal("ApellidoPat")),
                            ApellidoMat = oReader.GetString(oReader.GetOrdinal("ApellidoMat")),
                            ID_TipoDocumento = oReader.GetInt32(oReader.GetOrdinal("ID_TipoDocumento")),
                            Direccion = oReader.GetString(oReader.GetOrdinal("Direccion")),
                            ID_Sexo = oReader.GetInt32(oReader.GetOrdinal("ID_Sexo")),
                            FechaNacimiento = oReader.GetDateTime(oReader.GetOrdinal("FechaNacimiento"))

                        };

                    }
                    oReader.Close();
                }
                return objUsuario;
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Registrar Paciente
        /// </summary>
        /// <param name="p_objPacienteBE">Objeto paciente</param>
        /// <returns>Respuesta 0->False   1->True</returns>
        public int fn_RegistrarPaciente(BE_Paciente p_objPacienteBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();
                parameters.Add("@DNI", p_objPacienteBE.dni_paciente);
                parameters.Add("@Nombres", p_objPacienteBE.Nombres);
                parameters.Add("@ApellidoP", p_objPacienteBE.ApellidoPat);
                parameters.Add("@ApellidoM", p_objPacienteBE.ApellidoMat);
                parameters.Add("@FechaNac", p_objPacienteBE.FechaNacimiento);
                parameters.Add("@Celular", p_objPacienteBE.Celular);
                parameters.Add("@Telefono", p_objPacienteBE.TelefonoDomicilio);
                parameters.Add("@Direccion", p_objPacienteBE.Direccion);

                if (p_objPacienteBE.ID_Sexo == 0)
                {
                    parameters.Add("@Sexo", DBNull.Value);
                }
                else
                {
                    parameters.Add("@Sexo", p_objPacienteBE.ID_Sexo);
                }

                if (p_objPacienteBE.ID_TipoDocumento == 0)
                {
                    parameters.Add("@IdTipoDoc", DBNull.Value);
                }
                else
                {
                    parameters.Add("@IdTipoDoc", p_objPacienteBE.ID_TipoDocumento);
                }

                if (p_objPacienteBE.ID_Pais == 0)
                {
                    parameters.Add("@ID_Pais", DBNull.Value);
                }
                else
                {
                    parameters.Add("@ID_Pais", p_objPacienteBE.ID_Pais);
                }

                if (p_objPacienteBE.ID_Departamento == 0)
                {
                    parameters.Add("@ID_Departamento", DBNull.Value);
                }
                else
                {
                    parameters.Add("@ID_Departamento", p_objPacienteBE.ID_Departamento);
                }

                if (p_objPacienteBE.ID_Provincia == 0)
                {
                    parameters.Add("@ID_Provincia", DBNull.Value);
                }
                else
                {
                    parameters.Add("@ID_Provincia", p_objPacienteBE.ID_Provincia);
                }

                if (p_objPacienteBE.ID_Distrito == 0)
                {
                    parameters.Add("@ID_Distrito", DBNull.Value);
                }
                else
                {
                    parameters.Add("@ID_Distrito", p_objPacienteBE.ID_Distrito);
                }

                parameters.Add("@Observacion", p_objPacienteBE.Observacion);
                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_RegistrarPaciente", parameters);
                return rpta;
            }
            catch { throw; }
        }

        #endregion



        #region Gestión Admisión Luis

        /// <summary>
        /// Función que verifica la existencia del Paciente en la BD
        /// </summary>
        /// <param name="p_vDNI">DNI del paciente</param>
        /// <returns>Objeto Paciente</returns>
        public BE_Paciente fn_VerificarPaciente_2(string p_vDNI, Int32 p_nTipoDocumento)
        {
            /*
            Nombre: fn_VerificarPaciente
            Creado Por: Lsalvatierra
            Fecha Creación: 10/03/2014
            */
            var objUsuario = (BE_Paciente)null;
            try
            {
                Dictionary<string, object> parameter = new Dictionary<string, object>();
                parameter.Add("@DNI", p_vDNI);
                parameter.Add("@ID_TipoDocumento", p_nTipoDocumento);
                using (IDataReader oReader = SqlHelper.Instance.ExecuteReader("usp_VerificarPaciente_HC", parameter))
                {
                    if (oReader.Read())
                    {
                        objUsuario = new BE_Paciente
                        {
                            ID_Paciente = oReader.GetInt32(oReader.GetOrdinal("ID_Paciente")),
                            dni_paciente = oReader.GetString(oReader.GetOrdinal("dni_paciente")),
                            Nombres = oReader.GetString(oReader.GetOrdinal("nombres")),
                            ApellidoPat = oReader.GetString(oReader.GetOrdinal("ApellidoPat")),
                            ApellidoMat = oReader.GetString(oReader.GetOrdinal("ApellidoMat")),
                            ID_TipoDocumento = oReader.GetInt32(oReader.GetOrdinal("ID_TipoDocumento")),
                            Direccion = oReader.GetString(oReader.GetOrdinal("Direccion")),
                            ID_Sexo = oReader.GetInt32(oReader.GetOrdinal("ID_Sexo")),
                            FechaNacimiento = oReader.GetDateTime(oReader.GetOrdinal("FechaNacimiento")),
                            Celular = oReader.GetString(oReader.GetOrdinal("Celular")),
                            TelefonoDomicilio = oReader.GetString(oReader.GetOrdinal("TelefonoDomicilio")),
                            ID_Pais = oReader.GetInt32(oReader.GetOrdinal("ID_Pais")),
                            ID_Departamento = oReader.GetInt32(oReader.GetOrdinal("ID_Departamento")),
                            ID_Provincia = oReader.GetInt32(oReader.GetOrdinal("ID_Provincia")),
                            ID_Distrito = oReader.GetInt32(oReader.GetOrdinal("ID_Distrito")),
                            ID_EstadoCivil = oReader.GetInt32(oReader.GetOrdinal("ID_EstadoCivil")),
                            Ocupacion = oReader.GetString(oReader.GetOrdinal("Ocupacion")),
                            correo = oReader.GetString(oReader.GetOrdinal("Correo")),
                            TipoDocumento = oReader.GetString(oReader.GetOrdinal("TipoDocumento")),
                            DescSexo = oReader.GetString(oReader.GetOrdinal("DescSexo"))
                        };

                    }
                    oReader.Close();
                }
                return objUsuario;
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Registrar Paciente
        /// </summary>
        /// <param name="p_objPacienteBE">Objeto paciente</param>
        /// <returns>Respuesta 0->False   1->True</returns>
        public int fn_RegistrarPaciente_2(BE_Paciente p_objPacienteBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();
                parameters.Add("@DNI", p_objPacienteBE.dni_paciente);
                parameters.Add("@Nombres", p_objPacienteBE.Nombres);
                parameters.Add("@ApellidoP", p_objPacienteBE.ApellidoPat);
                parameters.Add("@ApellidoM", p_objPacienteBE.ApellidoMat);
                parameters.Add("@FechaNac", p_objPacienteBE.FechaNacimiento);
                parameters.Add("@Celular", p_objPacienteBE.Celular);
                parameters.Add("@Telefono", p_objPacienteBE.TelefonoDomicilio);
                parameters.Add("@Direccion", p_objPacienteBE.Direccion);
                parameters.Add("@Sexo", p_objPacienteBE.ID_Sexo);
                parameters.Add("@IdTipoDoc", p_objPacienteBE.ID_TipoDocumento);
                parameters.Add("@ID_Pais", p_objPacienteBE.ID_Pais);
                parameters.Add("@ID_Departamento", p_objPacienteBE.ID_Departamento);
                parameters.Add("@ID_Provincia", p_objPacienteBE.ID_Provincia);
                parameters.Add("@ID_Distrito", p_objPacienteBE.ID_Distrito);
                parameters.Add("@ID_EstadoCivil", p_objPacienteBE.ID_EstadoCivil);
                parameters.Add("@Ocupacion", p_objPacienteBE.Ocupacion);
                parameters.Add("@Correo", p_objPacienteBE.correo);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_RegistrarPaciente_2", parameters);
                return rpta;
            }
            catch { throw; }
        }


        /// <summary>
        /// Actualizar Paciente
        /// </summary>
        /// <param name="p_objPacienteBE">Objeto paciente</param>
        /// <returns>Respuesta 0->False   1->True</returns>
        public int fn_ActualizarPaciente_2(BE_Paciente p_objPacienteBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();
                parameters.Add("@ID_Paciente", p_objPacienteBE.ID_Paciente);
                parameters.Add("@DNI", p_objPacienteBE.dni_paciente);
                parameters.Add("@Nombres", p_objPacienteBE.Nombres);
                parameters.Add("@ApellidoP", p_objPacienteBE.ApellidoPat);
                parameters.Add("@ApellidoM", p_objPacienteBE.ApellidoMat);
                parameters.Add("@FechaNac", p_objPacienteBE.FechaNacimiento);
                parameters.Add("@Celular", p_objPacienteBE.Celular);
                parameters.Add("@Telefono", p_objPacienteBE.TelefonoDomicilio);
                parameters.Add("@Direccion", p_objPacienteBE.Direccion);
                parameters.Add("@Sexo", p_objPacienteBE.ID_Sexo);
                parameters.Add("@IdTipoDoc", p_objPacienteBE.ID_TipoDocumento);
                parameters.Add("@ID_Pais", p_objPacienteBE.ID_Pais);
                parameters.Add("@ID_Departamento", p_objPacienteBE.ID_Departamento);
                parameters.Add("@ID_Provincia", p_objPacienteBE.ID_Provincia);
                parameters.Add("@ID_Distrito", p_objPacienteBE.ID_Distrito);
                parameters.Add("@ID_EstadoCivil", p_objPacienteBE.ID_EstadoCivil);
                parameters.Add("@Ocupacion", p_objPacienteBE.Ocupacion);
                parameters.Add("@Correo", p_objPacienteBE.correo);
                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_ActualizarPaciente_2", parameters);
                return rpta;
            }
            catch { throw; }
        }



        #endregion

        #region Gestion Adminsion ANDREE

        public BE_Paciente fn_ConsultarPaciente(int pintID_Paciente, String pstrDocumentoIdentidad, int intID_TipoDocumento)
        {
            BE_Paciente obj = null;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@ID_Paciente", pintID_Paciente);
            parameters.Add("@dni_paciente", pstrDocumentoIdentidad);
            parameters.Add("@ID_TipoDocumento", intID_TipoDocumento);

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("usp_Select_Paciente", parameters))
            {
                if (reader.Read())
                {
                    obj = new BE_Paciente
                    {

                        //Nombres = reader.GetString(reader.GetOrdinal("nombres"))
                        ID_Paciente = reader.GetInt32(reader.GetOrdinal("ID_Paciente")),
                        dni_paciente = reader.GetString(reader.GetOrdinal("dni_paciente")),                
                        //EstadoCivil = reader.GetString(reader.GetOrdinal("EstadoCivil")),                
                        FechaNacimiento = reader.GetDateTime(reader.GetOrdinal("FechaNacimiento")),
                        Celular = reader.GetString(reader.GetOrdinal("Celular")),
                        TelefonoDomicilio = reader.GetString(reader.GetOrdinal("TelefonoDomicilio")),
                        ID_Pais = reader.GetInt32(reader.GetOrdinal("ID_Pais")),
                        ID_Departamento = reader.GetInt32(reader.GetOrdinal("ID_Departamento")),
                        ID_Provincia = reader.GetInt32(reader.GetOrdinal("ID_Provincia")),
                        ID_Distrito = reader.GetInt32(reader.GetOrdinal("ID_Distrito")),
                        Direccion = reader.GetString(reader.GetOrdinal("Direccion")),
                        ID_Sexo = reader.GetInt32(reader.GetOrdinal("ID_Sexo")),
                        Ocupacion = reader.GetString(reader.GetOrdinal("Ocupacion")),
                        ID_TipoDocumento = reader.GetInt32(reader.GetOrdinal("ID_TipoDocumento")),
                        Nombres = reader.GetString(reader.GetOrdinal("nombres")),
                        ApellidoPat = reader.GetString(reader.GetOrdinal("ApellidoPat")),
                        ApellidoMat = reader.GetString(reader.GetOrdinal("ApellidoMat")),
                        ID_EstadoCivil = reader.GetInt32(reader.GetOrdinal("ID_EstadoCivil")),
                        correo = reader.GetString(reader.GetOrdinal("correo")),
                        SexoDescripcion = reader.GetString(reader.GetOrdinal("SexoDescripcion")),
                        TipoDocumentoNombre = reader.GetString(reader.GetOrdinal("TipoDocumentoNombre")),
                        Observacion = reader.GetString(reader.GetOrdinal("Observacion"))
                    };
                }
            }
            return obj;
        }


        public bool fb_ActualizarEstadoCita(int pintID_Cita, int intID_EstadoCita)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();


                parameters.Add("@ID_Cita", pintID_Cita);
                parameters.Add("@ID_EstadoCita", intID_EstadoCita);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_Update_CambiarEstadoCita", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public BE_Cita fn_ObtenerCitaActiva(int pID_Cita)
        {
            return fn_ObtenerCitaActiva(0, DateTime.Now, pID_Cita);
        }

        public BE_Cita fn_ObtenerCitaActiva(int pID_Paciente, DateTime pFechaHoraCita)
        {
            return fn_ObtenerCitaActiva(pID_Paciente, pFechaHoraCita, -1);
        }

        private BE_Cita fn_ObtenerCitaActiva(int pID_Paciente, DateTime pFechaHoraCita, int pID_Cita)
        {
            BE_Cita obj = null;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@ID_Paciente", pID_Paciente);
            parameters.Add("@FechaHoraCita", pFechaHoraCita);
            parameters.Add("@ID_Cita", pID_Cita);

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("usp_Select_ValidarCita", parameters))
            {
                if (reader.Read())
                {
                    obj = new BE_Cita
                    {
                        ID_Cita = reader.GetInt32(reader.GetOrdinal("ID_Cita")),
                        FechaHoraCita = reader.GetDateTime(reader.GetOrdinal("FechaHoraCita")),
                        Aseguradora = reader.GetString(reader.GetOrdinal("Aseguradora")),
                        //Cobertura = reader.GetFloat(reader.GetOrdinal("Cobertura")),
                        Estado = reader.GetString(reader.GetOrdinal("Estado")),
                        OrdenAtencion = reader.GetString(reader.GetOrdinal("OrdenAtencion")),
                        ID_Paciente = reader.GetInt32(reader.GetOrdinal("ID_Paciente")),
                        ID_Historia = reader.GetInt32(reader.GetOrdinal("ID_Historia")),
                        ID_Especialidad = reader.GetInt32(reader.GetOrdinal("ID_Especialidad")),
                        ID_Medico = reader.GetInt32(reader.GetOrdinal("ID_Medico")),
                        ID_AgendaMedica = reader.GetInt32(reader.GetOrdinal("ID_AgendaMedica")),
                        ID_EstadoCita = reader.GetInt32(reader.GetOrdinal("ID_EstadoCita")),
                        ID_Cita_Reprogramada = reader.GetInt32(reader.GetOrdinal("ID_Cita_Reprogramada")),
                        Des_Ubicacion_Cita = reader.GetString(reader.GetOrdinal("Des_Ubicacion_Cita"))

                    };
                }
            }
            return obj;
        }



        #endregion

    }
}
