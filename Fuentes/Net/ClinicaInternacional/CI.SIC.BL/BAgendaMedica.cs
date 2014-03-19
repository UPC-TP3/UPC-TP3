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
            _contexto.AddToTB_AGENDA_MEDICA(new TB_AGENDA_MEDICA
            {
                Fecha = agendaMedica.Fecha,
                //HoraInicio = agendaMedica.HoraInicio,
                //HoraFin = agendaMedica.HoraFin,
                Estado = agendaMedica.Estado,
                ID_Medico = agendaMedica.CodigoMedico,
               // NumeroConsultorio = agendaMedica.NumeroConsultorio, 
                ID_TURNO = agendaMedica.Id_Turno, 
               ID_Consultorio = agendaMedica.Id_consultorio,
               ID_Especialidad = agendaMedica.Id_Especialidad 
            });
            _contexto.SaveChanges();
            return agendaMedica.CodigoMedico;
        }

        public int Actualizar(EAgendaMedica agendaMedica)
        {
            var registro = _contexto.TB_AGENDA_MEDICA.FirstOrDefault(f => f.ID_AgendaMedica == agendaMedica.CodigoAgenda);
            if (registro != null)
            {
                registro.Fecha = agendaMedica.Fecha;
                //registro.HoraInicio = agendaMedica.HoraInicio;
                //registro.HoraFin = agendaMedica.HoraFin;
                registro.Estado = agendaMedica.Estado;
                //registro.ID_Medico = agendaMedica.CodigoMedico;
                //registro.ID_Especialidad = agendaMedica.Id_Especialidad; 
               // registro.NumeroConsultorio = agendaMedica.NumeroConsultorio;
                registro.ID_TURNO = agendaMedica.Id_Turno;
                registro.ID_Consultorio = agendaMedica.Id_consultorio; 
                _contexto.SaveChanges();
            }                        
            return agendaMedica.CodigoMedico;
        }

        public void Eliminar(int codigoAgenda)
        {
            var registro = _contexto.TB_AGENDA_MEDICA.FirstOrDefault(f => f.ID_AgendaMedica == codigoAgenda);
            if (registro != null)
            {
                _contexto.DeleteObject(registro);
                _contexto.SaveChanges();
            }            
        }

        public List<EAgendaMedica> Listar(int codigoMedico)
        {
            return _contexto.TB_AGENDA_MEDICA.Where(f => f.ID_Medico == codigoMedico).Select(am => new EAgendaMedica
                {
                    CodigoAgenda = am.ID_AgendaMedica,
                    Fecha = am.Fecha,
                    //HoraInicio = am.HoraInicio,
                    //HoraFin = am.HoraFin,
                    Horario_Turno  = am.TB_TURNO.Horario_Turno, 
                    NumeroConsultorio = am.TB_CONSULTORIO.nro_consultorio,
                    Estado = am.Estado,
                    EstadoDisplay = am.Estado ? "Activo" : "Inactivo"
                }).ToList();
        }

        public List<EAgendaMedica> Filtrar(DateTime fecha, int codigoEspecialidad)
        {
           // return _contexto.TB_Agenda_Medica.Where(f => f.TB_Medico.CodigoEspecialidad == codigoEspecialidad).Select(am => new EAgendaMedica

           // string fec = string.Format("{0:yyyyMMdd HH:mm:ss}", Convert.ToDateTime(fecha));

            return _contexto.TB_AGENDA_MEDICA.Where(f => f.Fecha == fecha && f.ID_Especialidad == codigoEspecialidad && f.Estado == true).Select(am => new EAgendaMedica
            {
                CodigoAgenda = am.ID_AgendaMedica,
                Fecha = am.Fecha,
                //HoraInicio = am.HoraInicio,
                //HoraFin = am.HoraFin,
                Horario_Turno = am.TB_TURNO.Horario_Turno,  
                NumeroConsultorio = am.TB_CONSULTORIO.nro_consultorio,
                Estado = am.Estado,
                EstadoDisplay = am.Estado ? "Activo" : "Inactivo",
                CodigoMedico = am.ID_Medico,
                NombresMedico = am.TB_MEDICO.nom_medico,
                ApellidosMedico = am.TB_MEDICO.ape_medico,
                DescripcionEspecialidad = am.TB_ESPECIALIDAD.descripcion 
                 
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
            return _contexto.TB_AGENDA_MEDICA.Where(f => f.Estado == estado).Select(am => new EAgendaMedica
            {
                CodigoAgenda = am.ID_AgendaMedica,
                Fecha = am.Fecha,
                //HoraInicio = am.HoraInicio,
                //HoraFin = am.HoraFin,
                Horario_Turno = am.TB_TURNO.Horario_Turno, 
                Estado = am.Estado,
                EstadoDisplay = am.Estado ? "Activo" : "Inactivo",
                CodigoMedico = am.ID_Medico,
                NombresMedico = am.TB_MEDICO.nom_medico,
                ApellidosMedico = am.TB_MEDICO.ape_medico,
                DescripcionEspecialidad = am.TB_ESPECIALIDAD.descripcion, 
                NumeroConsultorio = am.TB_CONSULTORIO.nro_consultorio   
            }).ToList();
        }

     
     


        public EAgendaMedica Obtener(int codigoAgenda)
        {
            return _contexto.TB_AGENDA_MEDICA.Where(f => f.ID_AgendaMedica  == codigoAgenda).Select(am => new EAgendaMedica
                {
                    CodigoAgenda = am.ID_AgendaMedica,
                    Fecha = am.Fecha,
                    //HoraInicio = am.HoraInicio,
                    //HoraFin = am.HoraFin,
                    Estado = am.Estado,
                    CodigoMedico = am.ID_Medico,
                    NombresMedico = am.TB_MEDICO.nom_medico,
                    ApellidosMedico = am.TB_MEDICO.ape_medico,
                    Id_Especialidad = am.TB_ESPECIALIDAD.ID_Especialidad, 
                    DescripcionEspecialidad = am.TB_ESPECIALIDAD.descripcion,
                    NumeroConsultorio = am.TB_CONSULTORIO.nro_consultorio,
                    NumeroColegiatura  = am.TB_MEDICO.num_cmp,
                    Id_Turno = am.TB_TURNO.ID_TURNO,
                    Horario_Turno = am.TB_TURNO.Horario_Turno, 
                    Id_consultorio = am.TB_CONSULTORIO.ID_Consultorio 
                }).FirstOrDefault();
        }
    }
}
