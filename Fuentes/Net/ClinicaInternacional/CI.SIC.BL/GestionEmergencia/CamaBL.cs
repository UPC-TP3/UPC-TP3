using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class CamaBL : BaseBL<CamaBL>
    {
        public IList<CamaBE> Listar()
        {
            return CamaDA.Instancia.Listar();
        }

        public IList<CamaBE> ListarHistoria(int idCama)
        {
            return CamaDA.Instancia.ListarHistoria(idCama);
        }

        public void Actualizar(IList<CamaBE> camas)
        {
            CamaDA.Instancia.Actualizar(camas);
        }
    }
}
