using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;
namespace CI.SIC.BL
{
    public class BCita
    {

        readonly DB_SGHEntities _contexto = new DB_SGHEntities();

        public List<ECita> Listar(int codigoMedico, int codigoPaciente)
        {
            return _contexto.TB_Cita.Where(f => f.CodigoMedico == codigoMedico && f.CodigoPaciente == codigoPaciente)
                .Select(cita => new ECita
                {
                    FechaAgenda = cita.FechaCita,
                    HoraInicioAgenda =  cita.TB_Agenda_Medica.HoraInicio,
                }).OrderBy(o => o.FechaAgenda).ThenBy(p => p.HoraInicioAgenda).ToList();
        }

        public List<ECita> Listar()
        {
            return _contexto.TB_Cita.Where(f => f.AtencionLocal == true).Select(TB_Cita => new  ECita    
            {
                FechaAgenda = TB_Cita.FechaCita,
                HoraInicioAgenda = TB_Cita.TB_Agenda_Medica.HoraInicio,
                HoraFinAgenda = TB_Cita.TB_Agenda_Medica.HoraFin,
                NombrePaciente = TB_Cita.TB_Paciente.Nombres + " " + TB_Cita.TB_Paciente.ApellidoPat + " " + TB_Cita.TB_Paciente.ApellidoMat,
                NombreMedico = TB_Cita.TB_Medico.Nombres + " " + TB_Cita.TB_Medico.Apellidos,
                NumeroConsultorio = TB_Cita.TB_Agenda_Medica.NumeroConsultorio, 
                CodigoCita = TB_Cita.CodigoCita,
                Dni = TB_Cita.TB_Paciente.Dni 
                
            }).OrderBy(o => o.FechaAgenda).ThenBy(p => p.HoraInicioAgenda).ToList();
        }

        public int Insertar(ECita cita)
        {
            var objeto = new TB_Cita 
            {
                FechaCita = cita.FechaAgenda, 
                CodigoMedico = cita.CodigoMedico,
                CodigoPaciente = cita.CodigoPaciente,
                CodigoAgenda = cita.CodigoAgenda,
                IdEstado = 1,
                AtencionLocal = true, 
            };
            _contexto.AddToTB_Cita(objeto);
            _contexto.SaveChanges();
            return objeto.CodigoCita;
        }

        public int Actualizar(ECita cita)
        {
            var objeto = _contexto.TB_Cita.FirstOrDefault(c => c.CodigoCita == cita.CodigoCita);
            if (objeto != null)
            {
                objeto.CodigoAgenda = cita.CodigoAgenda;
                objeto.CodigoMedico = cita.CodigoMedico;
                _contexto.SaveChanges();
            }
            return cita.CodigoCita;
        }

        public void Eliminar(int codigoCita)
        {
            var cita = _contexto.TB_Cita.FirstOrDefault(c => c.CodigoCita == codigoCita);
            if (cita != null)
            {
                _contexto.DeleteObject(cita);
                _contexto.SaveChanges();
            }
        }

        public ECita Obtener(int codigoCita)
        {
            return _contexto.TB_Cita.Where(f => f.CodigoCita == codigoCita).Select(cita => new ECita
            {
                CodigoCita = cita.CodigoCita,
                FechaAgenda = cita.TB_Agenda_Medica.Fecha,
                HoraInicioAgenda = cita.TB_Agenda_Medica.HoraInicio,
                HoraFinAgenda = cita.TB_Agenda_Medica.HoraFin,
                CodigoMedico = cita.CodigoMedico,
                NombresMedico = cita.TB_Medico.Nombres,
                ApellidosMedico = cita.TB_Medico.Apellidos,
                DescripcionEspecialidad = cita.TB_Medico.TB_Especialidad.Descripcion,
                CodigoPaciente = cita.CodigoPaciente,
                NombrePaciente = cita.TB_Paciente.Nombres,
                ApellidosPaciente = cita.TB_Paciente.ApellidoPat + " " + cita.TB_Paciente.ApellidoMat,
                NumeroConsultorio = cita.TB_Agenda_Medica.NumeroConsultorio,
                CodigoAgenda = cita.CodigoAgenda 
            }).FirstOrDefault();
        }

    }
}
