using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BL_Empleado : BaseBL<BL_Empleado>
    {
        //Identifica cuales van a ser tus filtros o parametros para la busqueda
        public List<BE_Empleado> fn_ListaEmpleado(int ID_Especialidad)
        {
            List<BE_Empleado> result = null;
            result = DAO_Empleado.Instancia.fn_ListaEmpleado(ID_Especialidad, ID_Especialidad);
            return result;
        }
    }
}
