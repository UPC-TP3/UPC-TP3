using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.DA;
using CI.SIC.BE;

namespace CI.SIC.BL
{
   public  class BPaciente
    {

        readonly DB_SGHEntities _contexto = new DB_SGHEntities();

        public List<EPaciente> Listar()
        {
            return _contexto.TB_PACIENTE.Select(paciente => new EPaciente 
            {
                CodigoPaciente = paciente.ID_Paciente,
                Nombres = paciente.nombres,
                ApellidoPat = paciente.ApellidoPat,
                ApellidoMat = paciente.ApellidoMat,
                Direccion = paciente.Direccion,
                Telefono = paciente.Celular,
                TelefonoCasa = paciente.TelefonoDomicilio,
                Dni = paciente.dni_paciente 
            }).ToList();
        }

        public List<EPaciente> Filtrar(string dni, string apellido)
        {


            return _contexto.TB_PACIENTE.Where(f => f.dni_paciente == dni || f.ApellidoPat == apellido).Select(paciente => new EPaciente
                {
                    CodigoPaciente = paciente.ID_Paciente,
                    Nombres = paciente.nombres,
                    ApellidoPat = paciente.ApellidoPat,
                    ApellidoMat = paciente.ApellidoMat,
                    Direccion = paciente.Direccion,
                    Telefono = paciente.Celular,
                    TelefonoCasa = paciente.TelefonoDomicilio,
                    Dni = paciente.dni_paciente
                }).ToList();
            
         
            
            
        }

        public int Insertar(EPaciente paciente)
        {
            _contexto.AddToTB_PACIENTE(new TB_PACIENTE
            {
                nombres = paciente.Nombres,
                ApellidoPat = paciente.ApellidoPat,
                ApellidoMat = paciente.ApellidoMat,
                Direccion = paciente.Direccion,
                FechaNacimiento = paciente.FechaNacimiento,
                Celular = paciente.Telefono,
                TelefonoDomicilio = paciente.TelefonoCasa
            });
            _contexto.SaveChanges();
            return paciente.CodigoPaciente;
        }

        public EPaciente Obtener(int codigoPaciente)
        {
            return _contexto.TB_PACIENTE.Where(f => f.ID_Paciente == codigoPaciente).Select(paciente => new EPaciente
            {
                CodigoPaciente = paciente.ID_Paciente,
                Nombres = paciente.nombres,
                ApellidoPat = paciente.ApellidoPat,
                ApellidoMat = paciente.ApellidoMat,
                Direccion = paciente.Direccion,
                Telefono = paciente.Celular,
                TelefonoCasa = paciente.TelefonoDomicilio,
                Dni = paciente.dni_paciente 
            }).FirstOrDefault();
        }

    }
}
