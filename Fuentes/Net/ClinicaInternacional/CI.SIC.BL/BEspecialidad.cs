using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.DA;
using CI.SIC.BE;

namespace CI.SIC.BL
{
    public class BEspecialidad
    {

        readonly DB_SGHEntities _contexto = new DB_SGHEntities();

        public List<EEspecialidad> Listar()
        {
            return _contexto.TB_Especialidad.Select(lista => new EEspecialidad
            {
                CodigoEspecialidad = lista.CodigoEspecialidad,
                Descripcion = lista.Descripcion
            }).ToList();
        }
    }
}
