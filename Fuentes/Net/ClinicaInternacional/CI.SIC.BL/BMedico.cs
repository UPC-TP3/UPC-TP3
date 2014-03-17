using System.Collections.Generic;
using System.Linq;
using CI.SIC.DA;
using CI.SIC.BE;

namespace CI.SIC.BL
{
    public class BMedico
    {
        readonly DB_SGHEntities _contexto = new DB_SGHEntities();

        public int Insertar(EMedico medico)
        {
            _contexto.AddToTB_Medico(new TB_Medico
            {
                Nombres = medico.Nombres,
                Apellidos = medico.Apellidos,
                CodigoEspecialidad = medico.CodigoEspecialidad
            });
            _contexto.SaveChanges();
            return medico.CodigoMedico;
        }

        public List<EMedico> Listar()
        {
            return _contexto.TB_Medico.Select(m => new EMedico 
            
            {
                CodigoMedico = m.CodigoMedico,
                Nombres = m.Nombres,
                Apellidos = m.Apellidos,
                DescripcionEspecialidad = m.TB_Especialidad.Descripcion
            }).ToList();
        }

        public EMedico Obtener(int codigoMedico)
        {
            return _contexto.TB_Medico.Where(f => f.CodigoMedico == codigoMedico).Select(m => new EMedico
            {
                CodigoMedico = m.CodigoMedico,
                Nombres = m.Nombres,
                Apellidos = m.Apellidos,
                DescripcionEspecialidad = m.TB_Especialidad.Descripcion,
                NumeroColegiatura = m.NumeroColegiatura 
            }).FirstOrDefault();
        }
    }
}
