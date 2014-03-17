using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_EvaluarSolicitudMantenimiento : BaseBL<BL_EvaluarSolicitudMantenimiento>
    {
        public List<BE_EvaluarSolicitudMantenimiento> fn_ListaESM(string fi, string ff)
        {
            List<BE_EvaluarSolicitudMantenimiento> result = null;
            result = DAO_EvaluarSolicitudMantenimiento.Instancia.fn_ListaESM(fi,ff);
            return result;
        }

        public List<BE_EvaluarSolicitudMantenimiento> fn_ConsultaESM_x_NroSolicitud(int nrosolicitud)
        {
            List<BE_EvaluarSolicitudMantenimiento> result = null;
            result = DAO_EvaluarSolicitudMantenimiento.Instancia.fn_ConsultaESM_x_NroSolicitud(nrosolicitud);
            return result;
        }

        public bool fn_ActualizarESM(BE_EvaluarSolicitudMantenimiento p_SMBE) 
        {
            bool result = false;
            result = DAO_EvaluarSolicitudMantenimiento.Instancia.fn_ActualizarESM(p_SMBE);

            return result;
        }

        public BE_EvaluarSolicitudMantenimiento fn_BuscaESM(BE_EvaluarSolicitudMantenimiento p_SMBE) 
        {
            BE_EvaluarSolicitudMantenimiento result = null;
            result = DAO_EvaluarSolicitudMantenimiento.Instancia.fn_BuscaESM(p_SMBE);
            return result;
        }
    }
}
