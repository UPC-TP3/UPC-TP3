using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class ServicioExamenBL : BaseBL<ServicioExamenBL>
    {
        public IList<ServicioExamenBE> Listar()
        {
            return ServicioExamenDA.Instancia.Listar();
        }

        public void Actualizar(IList<CamaBE> camas)
        {
            CamaDA.Instancia.Actualizar(camas);
        }
    }
}
