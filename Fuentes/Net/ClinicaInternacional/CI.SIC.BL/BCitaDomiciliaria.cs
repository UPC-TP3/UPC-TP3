using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public  class BCitaDomiciliaria
    {

        readonly DB_SGHEntities _contexto = new DB_SGHEntities();

        public List<ECitaDomiciliaria> Listar(int codigoMedico, int codigoPaciente)
        {
            return _contexto.TB_CITA.Where(f => f.ID_Medico == codigoMedico && f.ID_Paciente == codigoPaciente)
                .Select(cita => new ECitaDomiciliaria
                {
                    FechaAgenda = cita.FechaHoraCita,
                   Horario_Turno = cita.TB_AGENDA_MEDICA.TB_TURNO.Horario_Turno,
                }).OrderBy(o => o.FechaAgenda).ThenBy(p => p.Horario_Turno).ToList();
        }

        public List<ECitaDomiciliaria> Listar()
        {
            return _contexto.TB_CITA.Where(f => f.AtencionLocal == false).Select(TB_CITA => new ECitaDomiciliaria
            {
                FechaAgenda = TB_CITA.FechaHoraCita,
                //HoraInicioAgenda = TB_Cita.TB_Agenda_Medica.HoraInicio,
                //HoraFinAgenda = TB_Cita.TB_Agenda_Medica.HoraFin,
                Horario_Turno = TB_CITA.TB_AGENDA_MEDICA.TB_TURNO.Horario_Turno, 
                NombrePaciente = TB_CITA.TB_PACIENTE.nombres + " " + TB_CITA.TB_PACIENTE.ApellidoPat + " " + TB_CITA.TB_PACIENTE.ApellidoMat,
                NombreMedico = TB_CITA.TB_MEDICO.nom_medico + " " + TB_CITA.TB_MEDICO.ape_medico,
                NumeroConsultorio = TB_CITA.TB_AGENDA_MEDICA.TB_CONSULTORIO.nro_consultorio,
                CodigoCita = TB_CITA.ID_Cita,
                Dni = TB_CITA.TB_PACIENTE.dni_paciente

            }).OrderBy(o => o.FechaAgenda).ThenBy(p => p.Horario_Turno).ToList();
        }

        public int Insertar(ECitaDomiciliaria cita)
        {
            var objeto = new TB_CITA
            {
                FechaHoraCita = cita.FechaAgenda.Value,
                ID_Medico = cita.CodigoMedico,
                ID_Paciente = cita.CodigoPaciente,
                ID_AgendaMedica  = cita.CodigoAgenda,
                ID_EstadoCita = 1,
                ID_Especialidad = cita.Id_Especialidad, 
                Estado = "1",
                AtencionLocal = false,
                Des_Ubicacion_Cita = cita.DireccionDomicilio,
                ReferenciaDomicilio = cita.ReferenciaDomicilio,
                Sintomas = cita.SintomasPaciente,
                Aseguradora = cita.Aseguradora 
            };
            _contexto.AddToTB_CITA(objeto);
            _contexto.SaveChanges();


            //DESACTIVAR EL ESTADO DE LA AGENDA MEDICA////////
            var objeto2 = _contexto.TB_AGENDA_MEDICA.FirstOrDefault(c => c.ID_AgendaMedica == cita.CodigoAgenda);
            if (objeto2 != null)
            {

                objeto2.Estado = false;
                _contexto.SaveChanges();
            }
            //////////////////////////////////////////////////

            return objeto.ID_Cita;
        }

        public int Actualizar(ECitaDomiciliaria cita)
        {
            var objeto = _contexto.TB_CITA.FirstOrDefault(c => c.ID_Cita == cita.CodigoCita);
            if (objeto != null)
            {
                objeto.ID_AgendaMedica = cita.CodigoAgenda;
                objeto.ID_Medico = cita.CodigoMedico;
                objeto.Des_Ubicacion_Cita = cita.DireccionDomicilio;
                objeto.ReferenciaDomicilio = cita.ReferenciaDomicilio;
                objeto.Sintomas = cita.SintomasPaciente;
                objeto.Aseguradora = cita.Aseguradora;
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

        public ECitaDomiciliaria Obtener(int codigoCita)
        {
            return _contexto.TB_CITA.Where(f => f.ID_Cita == codigoCita).Select(cita => new ECitaDomiciliaria
            {
                CodigoCita = cita.ID_Cita,
                FechaAgenda = cita.TB_AGENDA_MEDICA.Fecha,
                //HoraInicioAgenda = cita.TB_Agenda_Medica.HoraInicio,
                //HoraFinAgenda = cita.TB_Agenda_Medica.HoraFin,
                Horario_Turno = cita.TB_AGENDA_MEDICA.TB_TURNO.Horario_Turno,
                CodigoMedico = cita.ID_Medico,
                NombresMedico = cita.TB_MEDICO.nom_medico,
                ApellidosMedico = cita.TB_MEDICO.ape_medico,
                Id_Especialidad = cita.TB_AGENDA_MEDICA.TB_ESPECIALIDAD.ID_Especialidad, 
                DescripcionEspecialidad = cita.TB_AGENDA_MEDICA.TB_ESPECIALIDAD.descripcion,
                NumeroColegiatura = cita.TB_MEDICO.num_cmp, 
                CodigoPaciente = cita.ID_Paciente,
                NombrePaciente = cita.TB_PACIENTE.nombres,
                ApellidosPaciente = cita.TB_PACIENTE.ApellidoPat + " " + cita.TB_PACIENTE.ApellidoMat,
                NumeroConsultorio = cita.TB_AGENDA_MEDICA.TB_CONSULTORIO.nro_consultorio,
                CodigoAgenda = cita.ID_AgendaMedica,
                DireccionDomicilio = cita.Des_Ubicacion_Cita,
                ReferenciaDomicilio = cita.ReferenciaDomicilio,
                SintomasPaciente = cita.Sintomas,
                Aseguradora = cita.Aseguradora 
            }).FirstOrDefault();
        }

    }
}
