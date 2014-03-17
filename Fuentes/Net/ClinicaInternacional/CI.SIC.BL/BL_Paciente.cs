using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_Paciente : BaseBL<BL_Paciente>
    {
        public BE_Paciente GetPacienteXIdPaciente(int IdPaciente, string NroDocumento)
        {
            try
            {
                return DAO_Paciente.Instancia.GetPacienteXIdPaciente(IdPaciente, NroDocumento);
            }
            catch (Exception ex)
            {                
                throw;
            }
        }


        #region Gestión de Admisión


        public BE_Paciente fn_VerificarPaciente(string p_vDNI)
        {
            return DAO_Paciente.Instancia.fn_VerificarPaciente(p_vDNI);
        }


        /// <summary>
        /// Registrar Paciente
        /// </summary>
        /// <param name="p_objPacienteBE">Objeto Paciente</param>
        /// <param name="p_vMensaje">Respuesta del proceso</param>
        /// <returns>true, False</returns>
        public bool fn_RegistrarPaciente(Dictionary<string, object> p_objValores, ref string p_vMensaje)
        {
            DateTime dt = Convert.ToDateTime(p_objValores["FechaNac"].ToString());
            if (DAO_Paciente.Instancia.fn_RegistrarPaciente(new BE_Paciente
            {
                
                dni_paciente = p_objValores["DNI"].ToString(),
                ApellidoPat = p_objValores["ApellidoP"].ToString(),
                ApellidoMat = p_objValores["ApellidoM"].ToString(),
                Nombres = p_objValores["Nombre"].ToString(),
                TelefonoDomicilio = p_objValores["Telefono"].ToString(),
                Celular = p_objValores["Celular"].ToString(),
                Direccion = p_objValores["Direccion"].ToString(),
                ID_Sexo = Convert.ToInt32(p_objValores["Sexo"].ToString()),
                ID_TipoDocumento = Convert.ToInt32(p_objValores["TipoDoc"].ToString()),
                FechaNacimiento = dt
            }) > 0)
            {
                p_vMensaje = "El registro se creó correctamente.";
                return true;
            }
            else
            {
                p_vMensaje = "Error : NO se puedo crear el registro.";
                return false;
            }
        }


        #endregion


        #region Gestion Adminsion ANDREE
        public BE_Paciente fn_ConsultarPaciente(int pintID_Paciente, String pstrDocumentoIdentidad, int intID_TipoDocumento)
        {
            try
            {
                return DAO_Paciente.Instancia.fn_ConsultarPaciente(pintID_Paciente, pstrDocumentoIdentidad, intID_TipoDocumento);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public BE_Cita fn_ObtenerCitaActiva(int pID_Paciente, DateTime pFechaHoraCita)
        {
            try
            {
                return DAO_Paciente.Instancia.fn_ObtenerCitaActiva(pID_Paciente, pFechaHoraCita);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool fb_ActualizarEstadoCita(int pintID_Cita, int intID_EstadoCita)
        {
            try
            {
                return DAO_Paciente.Instancia.fb_ActualizarEstadoCita(pintID_Cita, intID_EstadoCita);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        #endregion

    }
}
