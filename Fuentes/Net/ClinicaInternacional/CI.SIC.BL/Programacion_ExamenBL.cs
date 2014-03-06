using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class Programacion_ExamenBL : BaseBL<Programacion_ExamenBL>
    {
        public List<Programacion_ExamenBE> Listado(int pId_orden_examen, int pId_consultorio, string pFecha, string pPaciente)
        {
            pFecha = pFecha.Substring(6, 4) + pFecha.Substring(3, 2) + pFecha.Substring(0, 2);

            List<Programacion_ExamenBE> result = null;
            result = Programacion_ExamenDA.Instancia.Listado(pId_orden_examen, pId_consultorio, pFecha, pPaciente);
            return result;
        }



        public bool Nuevo(Programacion_ExamenBE pProgramacion_ExamenBE)
        {
            bool result = false;
            result = Programacion_ExamenDA.Instancia.Nuevo(pProgramacion_ExamenBE);

            return result;
        }

        public Programacion_ExamenBE Registro(int pId_orden_examen)
        {
            Programacion_ExamenBE result = null;
            result = Programacion_ExamenDA.Instancia.Registro(pId_orden_examen);
            return result;
        }
    }
}
