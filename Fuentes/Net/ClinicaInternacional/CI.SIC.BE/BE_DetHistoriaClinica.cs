using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CI.SIC.BE
{
    [Serializable]
    public class BE_DetHistoriaClinica
    {
    public int ID_DetHistoria { get; set; }
	public int ID_Historia { get; set; }
	public int ID_Procedencia { get; set; }
	public int ID_Consulta { get; set; }
	public int CodMedicoAtencion { get; set; }
	public DateTime ResulExamenes { get; set; }
	public DateTime FechaAtencion { get; set; }
	public string Diagnostico { get; set; }
	public string Tratamiento { get; set; }
    public string Observaciones { get; set; }
    public string Procedencia { get; set; }


    }
}
