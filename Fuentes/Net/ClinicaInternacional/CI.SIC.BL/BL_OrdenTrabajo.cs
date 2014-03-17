using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_OrdenTrabajo : BaseBL<BL_OrdenTrabajo>
    {

        public List<BE_OrdendeTrabajo> fn_MonitorearOT(int estado)
        {
            List<BE_OrdendeTrabajo> result = null;
            result = DAO_OrdenTrabajo.Instancia.fn_MonitorearOT(estado);
            return result;
        }

        public List<BE_OrdendeTrabajo> fn_ListaOT(string fi, string ff)
        {
            List<BE_OrdendeTrabajo> result = null;
            result = DAO_OrdenTrabajo.Instancia.fn_ListaOT(fi, ff);
            return result;
        }

        public bool fn_InsertarOT(BE_OrdendeTrabajo p_OTBE)
        {
            bool result = false;
            result = DAO_OrdenTrabajo.Instancia.fn_InsertarOT(p_OTBE);

            return result;
        }

        public bool fn_ActualizarOT(BE_OrdendeTrabajo p_OTBE)
        {
            bool result = false;
            result = DAO_OrdenTrabajo.Instancia.fn_ActualizarOT(p_OTBE);

            return result;
        }

        public bool fn_cerrarOT(BE_OrdendeTrabajo p_OTBE)
        {
            bool result = false;
            result = DAO_OrdenTrabajo.Instancia.fn_CerrarOT(p_OTBE);

            return result;
        }

        public bool fn_EliminarOT(BE_OrdendeTrabajo p_OTBE)
        {
            bool result = false;
            result = DAO_OrdenTrabajo.Instancia.fn_EliminarOT(p_OTBE);

            return result;
        }



        public BE_OrdendeTrabajo fn_BuscaOT(BE_OrdendeTrabajo p_OTBE)
        {
            BE_OrdendeTrabajo result = null;
            result = DAO_OrdenTrabajo.Instancia.fn_BuscaOT(p_OTBE);
            return result;
        }









    }
}
