using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_SolicitudMantenimiento : BaseBL<BL_SolicitudMantenimiento>
    {
        public List<BE_SolicitudMantenimiento> fn_ListaSM(string fi, string ff)
        {
            List<BE_SolicitudMantenimiento> result = null;
            result = DAO_SolicitudMantenimiento.Instancia.fn_ListaSM(fi, ff);
            return result;
        }
        public List<BE_SolicitudMantenimiento> fn_ListaSMxEstado(int estado)
        {
            List<BE_SolicitudMantenimiento> result = null;
            result = DAO_SolicitudMantenimiento.Instancia.fn_ListaSMxEstado(estado);
            return result;
        }
        public bool fn_InsertarSM(BE_SolicitudMantenimiento p_SMBE)
        {
            bool result = false;
            result = DAO_SolicitudMantenimiento.Instancia.fn_InsertarSM(p_SMBE);

            return result;
        }

        public bool fn_ActualizarSM(BE_SolicitudMantenimiento p_SMBE)
        {
            bool result = false;
            result = DAO_SolicitudMantenimiento.Instancia.fn_ActualizarSM(p_SMBE);

            return result;
        }

        public bool fn_EliminarSM(BE_SolicitudMantenimiento p_SMBE)
        {
            bool result = false;
            result = DAO_SolicitudMantenimiento.Instancia.fn_EliminarSM(p_SMBE);

            return result;
        }

        public BE_SolicitudMantenimiento fn_BuscaSM(BE_SolicitudMantenimiento p_SMBE)
        {
            BE_SolicitudMantenimiento result = null;
            result = DAO_SolicitudMantenimiento.Instancia.fn_BuscaSM(p_SMBE);
            return result;
        }
    }
}
