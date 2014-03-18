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
            _contexto.AddToTB_MEDICO(new TB_MEDICO
            {
               nom_medico = medico.Nombres,
               ape_medico = medico.Apellidos,
               ID_Medico  = medico.CodigoEspecialidad
            });
            _contexto.SaveChanges();
            return medico.CodigoMedico;
        }

        public List<EMedico> Listar()
        {
            return _contexto.TB_MEDICO.Select(m => new EMedico 
            
            {
                CodigoMedico =  m.ID_Medico,
                Nombres = m.nom_medico,
                Apellidos = m.ape_medico,
                NumeroColegiatura = m.CodigoColegiatura, 
                ApeNom = m.nom_medico + " " + m.ape_medico 
            }).ToList();
        }

        public EMedico Obtener(int codigoMedico)
        {
            return _contexto.TB_MEDICOESPECIALIDAD.Where(f => f.ID_Medico == codigoMedico).Select(m => new EMedico
            {
                CodigoMedico = m.ID_Medico,
                Nombres = m.TB_MEDICO.nom_medico,
                Apellidos = m.TB_MEDICO.ape_medico,
                DescripcionEspecialidad = m.TB_ESPECIALIDAD.descripcion,
                NumeroColegiatura = m.TB_MEDICO.CodigoColegiatura,
                Id_Especialidad = m.ID_Especialidad 
            }).FirstOrDefault();
        }
    }
}
