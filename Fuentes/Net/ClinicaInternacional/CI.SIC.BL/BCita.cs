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

        public List<ECita> Listar(int codigoMedico, string dniPaciente)
        {
            return _contexto.TB_CITA.Where(f => f.ID_Medico == codigoMedico && f.TB_PACIENTE.dni_paciente == dniPaciente)
                .Select(Cita => new ECita
                {
                    FechaAgenda = Cita.TB_AGENDA_MEDICA.Fecha,
                    //HoraInicioAgenda = TB_Cita.TB_Agenda_Medica.HoraInicio,
                    //HoraFinAgenda = TB_Cita.TB_Agenda_Medica.HoraFin,
                    Horario_Turno = Cita.TB_AGENDA_MEDICA.TB_TURNO.Horario_Turno,
                    NombrePaciente = Cita.TB_PACIENTE.nombres + " " + Cita.TB_PACIENTE.ApellidoPat + " " + Cita.TB_PACIENTE.ApellidoMat,
                    NombreMedico = Cita.TB_MEDICO.nom_medico + " " + Cita.TB_MEDICO.ape_medico,
                    NumeroConsultorio = Cita.TB_AGENDA_MEDICA.TB_CONSULTORIO.nro_consultorio,
                    CodigoCita = Cita.ID_Cita,
                    Dni = Cita.TB_PACIENTE.dni_paciente,
                    DesEstado = Cita.TB_ESTADO_CITA.DesEstado 
                }).OrderBy(o => o.FechaAgenda).ThenBy(p => p.Horario_Turno).ToList();
        }

        public List<ECita> Listar()
        {
            return _contexto.TB_CITA.Where(f => f.AtencionLocal == true).Select(Cita => new  ECita    
            {
                FechaAgenda = Cita.TB_AGENDA_MEDICA.Fecha,
                //HoraInicioAgenda = TB_Cita.TB_Agenda_Medica.HoraInicio,
                //HoraFinAgenda = TB_Cita.TB_Agenda_Medica.HoraFin,
                Horario_Turno = Cita.TB_AGENDA_MEDICA.TB_TURNO.Horario_Turno, 
                NombrePaciente = Cita.TB_PACIENTE.nombres + " " + Cita.TB_PACIENTE.ApellidoPat + " " + Cita.TB_PACIENTE.ApellidoMat,
                NombreMedico = Cita.TB_MEDICO.nom_medico + " " + Cita.TB_MEDICO.ape_medico,
                NumeroConsultorio = Cita.TB_AGENDA_MEDICA.TB_CONSULTORIO.nro_consultorio, 
                CodigoCita = Cita.ID_Cita,
                Dni = Cita.TB_PACIENTE.dni_paciente, 
                DesEstado = Cita.TB_ESTADO_CITA.DesEstado 
            }).OrderBy(o => o.FechaAgenda).ThenBy(p => p.Horario_Turno).ToList();
        }

        public int Insertar(ECita cita)
        {
            var objeto = new TB_CITA 
            {
               FechaHoraCita = cita.FechaAgenda.Value, 
                ID_Medico = cita.CodigoMedico,
                ID_Paciente = cita.CodigoPaciente,
                ID_AgendaMedica = cita.CodigoAgenda,
                ID_Especialidad = cita.Id_Especialidad, 
                ID_EstadoCita = 1,
                Estado = "1",
                AtencionLocal = true, 
            };
            _contexto.AddToTB_CITA(objeto);
            _contexto.SaveChanges();
            return objeto.ID_Cita;
        }

        public int Actualizar(ECita cita)
        {
            var objeto = _contexto.TB_CITA.FirstOrDefault(c => c.ID_Cita == cita.CodigoCita);
            if (objeto != null)
            {
                objeto.ID_AgendaMedica = cita.CodigoAgenda;
                objeto.ID_Medico = cita.CodigoMedico;
                _contexto.SaveChanges();
            }
            return cita.CodigoCita;
        }

        public void Eliminar(int codigoCita)
        {
            var cita = _contexto.TB_CITA.FirstOrDefault(c => c.ID_Cita == codigoCita);
            if (cita != null)
            {
                _contexto.DeleteObject(cita);
                _contexto.SaveChanges();
            }
        }

        public ECita Obtener(int codigoCita)
        {
            return _contexto.TB_CITA.Where(f => f.ID_Cita == codigoCita).Select(cita => new ECita
            {
                CodigoCita = cita.ID_Cita,
                FechaAgenda = cita.TB_AGENDA_MEDICA.Fecha,
                //HoraInicioAgenda = cita.TB_Agenda_Medica.HoraInicio,
                //HoraFinAgenda = cita.TB_Agenda_Medica.HoraFin,
                Horario_Turno = cita.TB_AGENDA_MEDICA.TB_TURNO.Horario_Turno, 
                CodigoMedico = cita.ID_Medico,
                NombresMedico = cita.TB_MEDICO.nom_medico,
                ApellidosMedico = cita.TB_MEDICO.ape_medico,
                DescripcionEspecialidad = cita.TB_AGENDA_MEDICA.TB_ESPECIALIDAD.descripcion,
                CodigoPaciente = cita.ID_Paciente,
                NombrePaciente = cita.TB_PACIENTE.nombres,
                ApellidosPaciente = cita.TB_PACIENTE.ApellidoPat + " " + cita.TB_PACIENTE.ApellidoMat,
                NumeroConsultorio = cita.TB_AGENDA_MEDICA.TB_CONSULTORIO.nro_consultorio,
                CodigoAgenda = cita.ID_AgendaMedica, 
                Id_Consultorio = cita.TB_AGENDA_MEDICA.TB_CONSULTORIO.ID_Consultorio,
                Id_EstadoCita = cita.TB_ESTADO_CITA.ID_EstadoCita,
                Dni = cita.TB_PACIENTE.dni_paciente, 
                
            }).FirstOrDefault();
        }

    }
}
