using System;
using System.Collections.Generic;
using System.Text;
using System.Reflection;
using CI.SIC.CC;
namespace CI.SIC.BE
{
    [Serializable]
    public class BE_Emergencia
    {
        public int ID_Tipo_Examen { get; set; }
        public string Descripcion { get; set; }
        public string DescripcionGeneral { get; set; }

        public int ID_Medicamento { get; set; }
        public string GE_NombreMedicamento { get; set; }

        public int ID_ATENCION { get; set; }
        public int ID_Paciente { get; set; }
        
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public string DNI_paciente { get; set; }

        public int ID_SERVICIO { get; set; }
        public int ID_EXAMEN { get; set; }
        public int cantidad { get; set; }



    }

    [Serializable]
     public class EmergenciaBEList : List<BE_Emergencia>
    {
        public void Ordenar(string propertyName, direccionOrden Direction)
        {
            EmergenciaComparer dc = new EmergenciaComparer(propertyName, Direction);
            this.Sort(dc);
        }
    }

    class EmergenciaComparer : IComparer<BE_Emergencia>
    {
        string _prop = "";
        direccionOrden _dir;

        public EmergenciaComparer(string propertyName, direccionOrden Direction)
        {
            _prop = propertyName;
            _dir = Direction;
        }

        public int Compare(BE_Emergencia x, BE_Emergencia y)
        {


            PropertyInfo propertyX = x.GetType().GetProperty(_prop);
            PropertyInfo propertyY = y.GetType().GetProperty(_prop);

            object px = propertyX.GetValue(x, null);
            object py = propertyY.GetValue(y, null);

            if (px == null && py == null)
            {
                return 0;
            }
            else if (px != null && py == null)
            {
                if (_dir == direccionOrden.Ascending)
                {
                    return 1;
                }
                else
                {
                    return -1;
                }
            }
            else if (px == null && py != null)
            {
                if (_dir == direccionOrden.Ascending)
                {
                    return -1;
                }
                else
                {
                    return 1;
                }
            }
            else if (px.GetType().GetInterface("IComparable") != null)
            {
                if (_dir == direccionOrden.Ascending)
                {
                    return ((IComparable)px).CompareTo(py);
                }
                else
                {
                    return ((IComparable)py).CompareTo(px);
                }
            }
            else
            {
                return 0;
            }
        }
    }
}
