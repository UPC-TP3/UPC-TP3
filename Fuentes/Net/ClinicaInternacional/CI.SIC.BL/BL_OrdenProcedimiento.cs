using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_OrdenProcedimiento : BaseBL<BL_OrdenProcedimiento>
    {
     
        #region Gestion Adminsion ANDREE

        public BE_OrdenProcedimiento fn_ObtenerOrdenProcedimiento(int pID_Orden_de_Procedimiento)
        {
            try
            {
                return DAO_OrdenProcedimiento.Instancia.fn_ObtenerOrdenProcedimiento(pID_Orden_de_Procedimiento);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool fb_ActualizarOrdenProcedimiento(BE_OrdenProcedimiento poBE_OrdenProcedimiento)
        {
            try
            {
                return DAO_OrdenProcedimiento.Instancia.fb_ActualizarOrdenProcedimiento(poBE_OrdenProcedimiento);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool fb_InsertarOrdenProcedimiento(BE_OrdenProcedimiento poBE_OrdenProcedimiento)
        {
            try
            {
                return DAO_OrdenProcedimiento.Instancia.fb_InsertarOrdenProcedimiento(poBE_OrdenProcedimiento);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<BE_Medico> fn_ListarMedioPorEspecialidad(int pintID_Especialidad)
        {
            List<BE_Medico> result = null;
            result = DAO_OrdenProcedimiento.Instancia.fn_ListarMedioPorEspecialidad(pintID_Especialidad);
            result.Insert(0, new BE_Medico { ID_Medico = 0, nom_medico = "-Seleccione-" });
            return result;
        }

        #endregion

    }
}
