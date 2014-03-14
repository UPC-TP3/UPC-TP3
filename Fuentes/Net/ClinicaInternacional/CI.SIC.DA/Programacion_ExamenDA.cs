using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class Programacion_ExamenDA : BaseDA<Programacion_ExamenDA>
    {
        public List<Programacion_ExamenBE> Listado(int pId_orden_examen, int pId_consultorio, string pFecha, string pPaciente, int pId_orden_interna, int pId_historia)
        {
            var lista = new List<Programacion_ExamenBE>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@id_orden_examen", pId_orden_examen);
            parameters.Add("@id_consultorio", pId_consultorio);
            parameters.Add("@fecha", pFecha);
            parameters.Add("@paciente", pPaciente);
            parameters.Add("@id_orden_interna", pId_orden_interna);
            parameters.Add("@id_historia", pId_historia);

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("pa_Lista_Programacion_Examenes", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new Programacion_ExamenBE
                    {
                        Id_programacion = reader.GetInt32(reader.GetOrdinal("Id_programacion")),
                        //Id_consultorio = reader.GetInt32(reader.GetOrdinal("Id_consultorio")),
                        Id_orden_examen = reader.GetInt32(reader.GetOrdinal("Id_orden_examen")),
                        //Id_examen = reader.GetInt32(reader.GetOrdinal("Id_examen")),
                        Fecha = reader.GetDateTime(reader.GetOrdinal("Fecha")),
                        //Hora = Convert.ToString(reader.GetOrdinal("Hora")),
                        Estado = reader.GetString(reader.GetOrdinal("Estado")),
                        Local = reader.GetString(reader.GetOrdinal("Local")),
                        Consultorio = reader.GetString(reader.GetOrdinal("Consultorio")),
                        Examen = reader.GetString(reader.GetOrdinal("Examen")),
                        Id_historia = reader.GetInt32(reader.GetOrdinal("Id_historia")),
                        Paciente = reader.GetString(reader.GetOrdinal("Paciente"))
                    });
                }
            }
            return lista;
        }

        public Programacion_ExamenBE Registro(int pId_programacion, int pId_orden_examen)
        {
            Programacion_ExamenBE lista = null;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@id_programacion", pId_programacion);
            parameters.Add("@id_orden_examen", pId_orden_examen);

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("pa_Registro_Programacion_Examen", parameters))
            {
                while (reader.Read())
                {
                    lista= (new Programacion_ExamenBE
                    {
                        Id_programacion = reader.GetInt32(reader.GetOrdinal("Id_programacion")),
                        //Id_consultorio = reader.GetInt32(reader.GetOrdinal("Id_consultorio")),
                        Id_orden_examen = reader.GetInt32(reader.GetOrdinal("Id_orden_examen")),
                        Id_consultorio = reader.GetInt32(reader.GetOrdinal("Id_consultorio")),
                        Id_horario = reader.GetInt32(reader.GetOrdinal("Id_horario")),
                        Id_local = reader.GetInt32(reader.GetOrdinal("Id_local")),
                        Especialista = reader.GetString(reader.GetOrdinal("Especialista")),
                        //Id_examen = reader.GetInt32(reader.GetOrdinal("Id_examen")),
                        //Fecha = reader.GetDateTime(reader.GetOrdinal("Fecha")),
                        //Hora = Convert.ToString(reader.GetOrdinal("Hora")),
                        Estado = reader.GetString(reader.GetOrdinal("Estado")),
                        //Local = reader.GetString(reader.GetOrdinal("Local")),
                        //Consultorio = reader.GetString(reader.GetOrdinal("Consultorio")),
                        //Examen = reader.GetString(reader.GetOrdinal("Examen")),
                        //Id_historia = reader.GetInt32(reader.GetOrdinal("Id_historia")),
                        //Paciente = reader.GetString(reader.GetOrdinal("Paciente"))
                    });
                }
            }
            return lista;
        }

        public bool Nuevo(Programacion_ExamenBE pProgramacion_ExamenBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();


                parameters.Add("@id_orden_examen", pProgramacion_ExamenBE.Id_orden_examen);
                parameters.Add("@id_horario", pProgramacion_ExamenBE.Id_horario);
                parameters.Add("@estado", pProgramacion_ExamenBE.Estado);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("pa_Nuevo_Programacion_Examen", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public bool Anular(Programacion_ExamenBE pProgramacion_ExamenBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                parameters.Add("@id_orden_examen", pProgramacion_ExamenBE.Id_orden_examen);
                parameters.Add("@id_horario", pProgramacion_ExamenBE.Id_horario);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("pa_Anular_Programacion_Examen", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public bool Modificar(Programacion_ExamenBE pProgramacion_ExamenBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                parameters.Add("@id_programacion", pProgramacion_ExamenBE.Id_programacion);
                parameters.Add("@estado", pProgramacion_ExamenBE.Estado);
                parameters.Add("@comentarios", pProgramacion_ExamenBE.Comentarios);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("pa_Modificar_Programacion_Examen", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; } 
        }

        public bool Reprogramacion(Programacion_ExamenBE pProgramacion_ExamenBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();


                parameters.Add("@id_orden_examen", pProgramacion_ExamenBE.Id_orden_examen);
                parameters.Add("@id_horario", pProgramacion_ExamenBE.Id_horario);
                parameters.Add("@estado", pProgramacion_ExamenBE.Estado);
                parameters.Add("@id_programacion", pProgramacion_ExamenBE.Id_programacion);
                parameters.Add("@comentario", pProgramacion_ExamenBE.Comentarios);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("pa_Nuevo_Programacion_Examen", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }
    }
}
