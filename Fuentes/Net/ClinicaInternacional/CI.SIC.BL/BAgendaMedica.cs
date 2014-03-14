using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.DA;

namespace CI.SIC.BL
{
    public class BAgendaMedica
    {
        readonly DB_SGHEntities _contexto = new DB_SGHEntities();

        public int Insertar(EAgendaMedica agendaMedica)
        {
            _contexto.AddToTB_Agenda_Medica(new TB_Agenda_Medica
            {
                Fecha = agendaMedica.Fecha,
                HoraInicio = agendaMedica.HoraInicio,
                HoraFin = agendaMedica.HoraFin,
                Estado = agendaMedica.Estado,
                CodigoMedico = agendaMedica.CodigoMedico,
                NumeroConsultorio = agendaMedica.NumeroConsultorio, 
                IdTurno = agendaMedica.IdTurno 
            });
            _contexto.SaveChanges();
            return agendaMedica.CodigoMedico;
        }

        public int Actualizar(EAgendaMedica agendaMedica)
        {
            var registro = _contexto.TB_Agenda_Medica.FirstOrDefault(f => f.CodigoAgenda == agendaMedica.CodigoAgenda);
            if (registro != null)
            {
                registro.Fecha = agendaMedica.Fecha;
                registro.HoraInicio = agendaMedica.HoraInicio;
                registro.HoraFin = agendaMedica.HoraFin;
                registro.Estado = agendaMedica.Estado;
                registro.CodigoMedico = agendaMedica.CodigoMedico;
                registro.NumeroConsultorio = agendaMedica.NumeroConsultorio;
                registro.IdTurno = agendaMedica.IdTurno; 
                _contexto.SaveChanges();
            }                        
            return agendaMedica.CodigoMedico;
        }

        public void Eliminar(int codigoAgenda)
        {
            var registro = _contexto.TB_Agenda_Medica.FirstOrDefault(f => f.CodigoAgenda == codigoAgenda);
            if (registro != null)
            {
                _contexto.DeleteObject(registro);
                _contexto.SaveChanges();
            }            
        }

        public List<EAgendaMedica> Listar(int codigoMedico)
        {
            return _contexto.TB_Agenda_Medica.Where(f => f.CodigoMedico == codigoMedico).Select(am => new EAgendaMedica
                {
                    CodigoAgenda = am.CodigoAgenda,
                    Fecha = am.Fecha,
                    HoraInicio = am.HoraInicio,
                    HoraFin = am.HoraFin,
                    NumeroConsultorio = am.NumeroConsultorio,
                    Estado = am.Estado,
                    EstadoDisplay = am.Estado ? "Activo" : "Inactivo"
                }).ToList();
        }

        public List<EAgendaMedica> Filtrar(DateTime fecha, int codigoEspecialidad)
        {
           // return _contexto.TB_Agenda_Medica.Where(f => f.TB_Medico.CodigoEspecialidad == codigoEspecialidad).Select(am => new EAgendaMedica

           // string fec = string.Format("{0:yyyyMMdd HH:mm:ss}", Convert.ToDateTime(fecha));

            return _contexto.TB_Agenda_Medica.Where(f => f.Fecha == fecha && f.TB_Medico.CodigoEspecialidad == codigoEspecialidad).Select(am => new EAgendaMedica
            {
                CodigoAgenda = am.CodigoAgenda,
                Fecha = am.Fecha,
                HoraInicio = am.HoraInicio,
                HoraFin = am.HoraFin,
                NumeroConsultorio = am.NumeroConsultorio,
                Estado = am.Estado,
                EstadoDisplay = am.Estado ? "Activo" : "Inactivo",
                CodigoMedico = am.CodigoMedico,
                NombresMedico = am.TB_Medico.Nombres,
                ApellidosMedico = am.TB_Medico.Apellidos,
                DescripcionEspecialidad = am.TB_Medico.TB_Especialidad.Descripcion
                 
            }).ToList();
        }

        //public List<EAgendaMedica> Listar(bool estado)
        //{
        //    return _contexto.TB_Agenda_Medica.Where(f => f.Estado == estado && f.TB_Cita.Count == 0).Select(am => new EAgendaMedica 
        //    {
        //        CodigoAgenda = am.CodigoAgenda,
        //        Fecha = am.Fecha,
        //        HoraInicio = am.HoraInicio,
        //        HoraFin = am.HoraFin,
        //        Estado = am.Estado,
        //        EstadoDisplay = am.Estado ? "Activo" : "Inactivo",
        //        CodigoMedico = am.CodigoMedico,
        //        NombresMedico = am.TB_Medico.Nombres,
        //        ApellidosMedico = am.TB_Medico.Apellidos,
        //        DescripcionEspecialidad = am.TB_Medico.TB_Especialidad.Descripcion
        //    }).ToList();
        //}

        public List<EAgendaMedica> Listar(bool estado)
        {
            return _contexto.TB_Agenda_Medica.Where(f => f.Estado == estado).Select(am => new EAgendaMedica
            {
                CodigoAgenda = am.CodigoAgenda,
                Fecha = am.Fecha,
                HoraInicio = am.HoraInicio,
                HoraFin = am.HoraFin,
                Estado = am.Estado,
                EstadoDisplay = am.Estado ? "Activo" : "Inactivo",
                CodigoMedico = am.CodigoMedico,
                NombresMedico = am.TB_Medico.Nombres,
                ApellidosMedico = am.TB_Medico.Apellidos,
                DescripcionEspecialidad = am.TB_Medico.TB_Especialidad.Descripcion,
                NumeroConsultorio = am.NumeroConsultorio 
            }).ToList();
        }

     


        public EAgendaMedica Obtener(int codigoAgenda)
        {
            return _contexto.TB_Agenda_Medica.Where(f => f.CodigoAgenda == codigoAgenda).Select(am => new EAgendaMedica
                {
                    CodigoAgenda = am.CodigoAgenda,
                    Fecha = am.Fecha,
                    HoraInicio = am.HoraInicio,
                    HoraFin = am.HoraFin,
                    Estado = am.Estado,
                    CodigoMedico = am.CodigoMedico,
                    NombresMedico = am.TB_Medico.Nombres,
                    ApellidosMedico = am.TB_Medico.Apellidos,
                    DescripcionEspecialidad = am.TB_Medico.TB_Especialidad.Descripcion,
                    NumeroConsultorio = am.NumeroConsultorio,
                    NumeroColegiatura  = am.TB_Medico.NumeroColegiatura,
                    IdTurno = am.IdTurno 
                }).FirstOrDefault();
        }
    }
}
