using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.DA;
using CI.SIC.BE;

namespace CI.SIC.BL
{
    public class BL_TipoDocumento : BaseBL<BL_TipoDocumento>
    {

        public List<BE_TipoDocumento> fn_ListarTipoDocumento()
        {
            List<BE_TipoDocumento> result = null;
            result = DAO_TipoDocumento.Instancia.fn_ListarTipoDocumento();
            result.Insert(0, new BE_TipoDocumento { Codigo = 0, Descripcion = "-Seleccione-" });
            return result;
        }
    }
}
