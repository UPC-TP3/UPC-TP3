using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_HistoriaClinica : BaseBL<BL_HistoriaClinica>
    {
        public bool fn_RegistrarHC(Dictionary<string, object> p_objValores, ref string p_vMensaje)
        {
            if (DAO_HistoriaClinica.Instancia.fn_RegistrarHC(new BE_HistoriaClinica
            {
                ID_Paciente = Convert.ToInt32(p_objValores["IDPaciente"].ToString()),
                Alergias = p_objValores["Alergias"].ToString(),
                IntervencionQ = p_objValores["Intervencion"].ToString(),
                ID_GrupoSanguineo = Convert.ToInt32(p_objValores["GrupoSanguineo"].ToString()),
                ID_Procedencia = Convert.ToInt32(p_objValores["TipoAdmision"].ToString())
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
    }
}
