using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.DA;
using CI.SIC.BE;

namespace CI.SIC.BL
{
   public  class BMedicamento
    {

        readonly DB_SGHEntities _contexto = new DB_SGHEntities();

        public List<EMedicamento> Listar()
        {
            return _contexto.TB_MEDICAMENTO.Select(lista => new EMedicamento
            {
               Id_Medicamento = lista.ID_Medicamento,
               NombreMedicamento = lista.GE_NombreMedicamento 
            }).ToList();
        }

    }
}
