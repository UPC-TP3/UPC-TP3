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
            return _contexto.TB_Paciente.Select(paciente => new EPaciente 
            {
                CodigoPaciente = paciente.CodigoPaciente,
                Nombres = paciente.Nombres,
                ApellidoPat = paciente.ApellidoPat,
                ApellidoMat = paciente.ApellidoMat,
                Direccion = paciente.Direccion,
                Telefono = paciente.Telefono,
                TelefonoCasa = paciente.TelefonoCasa
            }).ToList();
        }

        public int Insertar(EPaciente paciente)
        {
            _contexto.AddToTB_Paciente(new TB_Paciente
            {
                Nombres = paciente.Nombres,
                ApellidoPat = paciente.ApellidoPat,
                ApellidoMat = paciente.ApellidoMat,
                Direccion = paciente.Direccion,
                FechaNacimiento = paciente.FechaNacimiento,
                Telefono = paciente.Telefono,
                TelefonoCasa = paciente.TelefonoCasa
            });
            _contexto.SaveChanges();
            return paciente.CodigoPaciente;
        }

        public EPaciente Obtener(int codigoPaciente)
        {
            return _contexto.TB_Paciente.Where(f => f.CodigoPaciente == codigoPaciente).Select(paciente => new EPaciente
            {
                CodigoPaciente = paciente.CodigoPaciente,
                Nombres = paciente.Nombres,
                ApellidoPat = paciente.ApellidoPat,
                ApellidoMat = paciente.ApellidoMat,
                Direccion = paciente.Direccion,
                Telefono = paciente.Telefono,
                TelefonoCasa = paciente.TelefonoCasa
            }).FirstOrDefault();
        }

    }
}
