using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class Catalogo_ExamenBL : BaseBL<Catalogo_ExamenBL>
    {
        public List<Examen_RequisitoBE> ListadoRequisitos(int pId_examen)
        {
            List<Examen_RequisitoBE> result = null;
            result = Catalogo_ExamenDA.Instancia.ListadoRequisitos(pId_examen);
            //result.Insert(0, new HabitacionBE { Codigo = PrimerElemento.SeleccioneValue, Descripcion = PrimerElemento.SeleccioneText });
            return result;
        }   
    }
}
