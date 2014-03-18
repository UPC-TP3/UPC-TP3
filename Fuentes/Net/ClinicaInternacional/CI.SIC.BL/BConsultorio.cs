using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.DA;
using CI.SIC.BE;

namespace CI.SIC.BL
{
    public class BConsultorio
    {
        readonly DB_SGHEntities _contexto = new DB_SGHEntities();

        public List<EConsultorio> Listar()
        {
            return _contexto.TB_CONSULTORIO.Where(f => f.ID_Local == 1).Select(lista => new EConsultorio
            {
                Id_consultorio = lista.ID_Consultorio,
                Nro_consultorio = lista.nro_consultorio,
                Piso = lista.Piso 
            }).ToList();
        }

    }
}
