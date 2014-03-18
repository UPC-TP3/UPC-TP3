using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.DA;
using CI.SIC.BE;

namespace CI.SIC.BL
{
    public class BTurnoCita
    {

        readonly DB_SGHEntities _contexto = new DB_SGHEntities();

        public List<ETurnoCita> Listar()
        {
            return _contexto.TB_TURNO.Select(lista => new ETurnoCita
            {
                Id_Turno = lista.ID_TURNO,
                Des_Turno = lista.Des_Turno,
                Horario_Turno = lista.Horario_Turno   
            }).ToList();
        }

    }
}
