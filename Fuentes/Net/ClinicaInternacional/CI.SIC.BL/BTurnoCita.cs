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
            return _contexto.TB_Turno_Citas.Select(lista => new ETurnoCita
            {
                IdTurno = lista.IdTurno,
                HoraInicio = lista.HoraInicio,
                HoraFinal = lista.HoraFinal  
            }).ToList();
        }

    }
}
