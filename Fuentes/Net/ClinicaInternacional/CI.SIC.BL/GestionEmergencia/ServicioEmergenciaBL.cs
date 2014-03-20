using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA.GestionEmergencia;
namespace CI.SIC.BL.GestionEmergencia
{
    public class ServicioEmergenciaBL
    {

        #region "Metodos"

        public EmergenciaBEList GeallTipoExamenMedico()
        {
            ServicioEmergenciaDA oServicioEmergenciaDA = new ServicioEmergenciaDA();
            try
            {
                return oServicioEmergenciaDA.GeallTipoExamenMedico();
            }
            catch
            {

            }
            return null;
        }

        public EmergenciaBEList GeallMedicamento()
        {
            ServicioEmergenciaDA oServicioEmergenciaDA = new ServicioEmergenciaDA();
            try
            {
                return oServicioEmergenciaDA.GeallMedicamento();
            }
            catch
            {

            }
            return null;
        }

        public BE_Emergencia GeallMedicamentoById(int IdMedicamento)
        {
            ServicioEmergenciaDA oServicioEmergenciaDA = new ServicioEmergenciaDA();
            try
            {
                return oServicioEmergenciaDA.GeallMedicamentoById(IdMedicamento);
            }
            catch
            {

            }
            return null;
        }



        public BE_Emergencia GeallTipoExamenById(int IdTipoExamen)
        {
            ServicioEmergenciaDA oServicioEmergenciaDA = new ServicioEmergenciaDA();
            try
            {
                return oServicioEmergenciaDA.GeallTipoExamenById(IdTipoExamen);
            }
            catch
            {

            }
            return null;
        }

        public BE_Emergencia GeallDatosEmergenciaId(String strTipo, String strDocumento)
        {
            ServicioEmergenciaDA oServicioEmergenciaDA = new ServicioEmergenciaDA();
            try
            {
                return oServicioEmergenciaDA.GeallDatosEmergenciaId(strTipo, strDocumento);
            }
            catch
            {

            }
            return null;
        }

        public EmergenciaBEList GeallServiciosExamenesbyId(Int32 IdAtencion)
        {
            ServicioEmergenciaDA oServicioEmergenciaDA = new ServicioEmergenciaDA();
            try
            {
                return oServicioEmergenciaDA.GeallServiciosExamenesbyId(IdAtencion);
            }
            catch
            {

            }
            return null;
        }

        public EmergenciaBEList GeallServiciosMedicamentosbyId(Int32 IdAtencion)
        {
            ServicioEmergenciaDA oServicioEmergenciaDA = new ServicioEmergenciaDA();
            try
            {
                return oServicioEmergenciaDA.GeallServiciosMedicamentosbyId(IdAtencion);
            }
            catch
            {

            }
            return null;
        }

        #endregion

        public Int32 InsertarServiciosEmergencia(int idAtencion, int idpaciente)
        {
            ServicioEmergenciaDA oServicioEmergenciaDA = new ServicioEmergenciaDA();
            Int32 retorno = -1;
            try
            {
                return oServicioEmergenciaDA.InsertarServiciosEmergencia(idAtencion, idpaciente);
            }
            catch (Exception ex)
            {
                retorno = -1;
         
            }
            return retorno;
        }


        public Int32 InsertarExamen(int idAtencion, int idexamen)
        {
            ServicioEmergenciaDA oServicioEmergenciaDA = new ServicioEmergenciaDA();
            Int32 retorno = -1;
            try
            {
                return oServicioEmergenciaDA.InsertarExamen(idAtencion, idexamen);
            }
            catch (Exception ex)
            {
                retorno = -1;

            }
            return retorno;
        }


        public Int32 InsertarMedicamento(int idAtencion, int idmedicamento, int cantidad)
        {
            ServicioEmergenciaDA oServicioEmergenciaDA = new ServicioEmergenciaDA();
            Int32 retorno = -1;
            try
            {
                return oServicioEmergenciaDA.InsertarMedicamento(idAtencion, idmedicamento, cantidad);
            }
            catch (Exception ex)
            {
                retorno = -1;

            }
            return retorno;
        }
    
    }
}
