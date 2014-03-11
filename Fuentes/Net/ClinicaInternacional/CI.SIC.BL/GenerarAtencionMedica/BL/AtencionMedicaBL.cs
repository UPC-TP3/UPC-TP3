using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE.GenerarAtencionMedica.BE;
using CI.SIC.DA.GenerarAtencionMedica.DA;

namespace CI.SIC.BL.GenerarAtencionMedica.BL
{
    public class AtencionMedicaBL
    {
        public void Crear(AtencionMedicaBE atencionmedica)
        {
            new AtencionMedicaDA().Crear(atencionmedica);
        }

        public List<ListadoAtencionBE> Listar(int id, string dni)
        {
            return new AtencionMedicaDA().Listar(id, dni);
        }

        public void Eliminar(int id)
        {
           new AtencionMedicaDA().Eliminar(id);
        }

        public void Actualizar(AtencionMedicaBE atencionmedica)
        {
            new AtencionMedicaDA().Actualizar(atencionmedica);
        }
    }
}
