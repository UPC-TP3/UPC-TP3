using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class DAO_Empleado : BaseDA<DAO_Empleado>
    {
        public List<BE_Empleado> fn_ListaEmpleado(int ID_Especialidad, int ID_Disponibilidad)
        {
            var lista = new List<BE_Empleado>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@ID_Especialidad", ID_Especialidad);
            parameters.Add("@ID_Disponibilidad", ID_Disponibilidad);
            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("SP_Listar_Empleado", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new BE_Empleado
                    {
                        ID_Empleado = reader.GetInt32(reader.GetOrdinal("ID_Empleado")),
                        E_Nombre = reader.GetString(reader.GetOrdinal("E_Nombre")),
                        E_Apellido_Paterno = reader.GetString(reader.GetOrdinal("E_Apellido_Paterno")),
                        E_Apellido_Materno = reader.GetString(reader.GetOrdinal("E_Apellido_Materno")),
                        E_dni = reader.GetString(reader.GetOrdinal("E_dni")),
                        E_Direccion = reader.GetString(reader.GetOrdinal("E_Direccion")),
                        E_Telefono = reader.GetString(reader.GetOrdinal("E_Telefono")),
                        E_Tipo_Empleado = reader.GetString(reader.GetOrdinal("E_Tipo_Empleado")),
                        //E_Fecha_Nacimiento = reader.GetString(reader.GetOrdinal("E_Fecha_Nacimiento")),
                        E_Correo = reader.GetString(reader.GetOrdinal("E_Correo")),
                        Apellidos_Empleado = reader.GetString(reader.GetOrdinal("Apellidos_Empleado")),
                        Nombres_Empleado = reader.GetString(reader.GetOrdinal("Nombres_Empleado")),
                        Cargo_Empleado = reader.GetString(reader.GetOrdinal("Cargo_Empleado")),
                        Correo_Empleado = reader.GetString(reader.GetOrdinal("Correo_Empleado")),
                        Estado = reader.GetInt32(reader.GetOrdinal("Estado")),
                        ID_TURNOEMERGENCIA = reader.GetInt32(reader.GetOrdinal("ID_TURNOEMERGENCIA")),
                        ID_Tipo_Empleado = reader.GetInt32(reader.GetOrdinal("ID_Tipo_Empleado")),
                        //ID_Especialidad = reader.GetInt32(reader.GetOrdinal("ID_Especialidad"))
                    });
                }
            }
            return lista;

            //amigo estas??  
        }

    }
}
