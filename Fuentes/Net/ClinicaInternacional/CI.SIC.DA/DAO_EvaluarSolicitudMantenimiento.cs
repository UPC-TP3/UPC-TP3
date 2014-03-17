using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class DAO_EvaluarSolicitudMantenimiento : BaseDA<DAO_EvaluarSolicitudMantenimiento>
    {

        public List<BE_EvaluarSolicitudMantenimiento> fn_ListaESM(string fi, string ff)
        {
            var lista = new List<BE_EvaluarSolicitudMantenimiento>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@GM_FechaInicio", fi);
            parameters.Add("@GM_FechaFin", ff);
            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("[SP_Listar_Evaluar_Solicitud_Mantenimiento]", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new BE_EvaluarSolicitudMantenimiento
                    {
                        Nrosolicitud = reader.GetInt32(reader.GetOrdinal("GM_NroSolicitud")),
                        Fechacreacion = reader.GetString(reader.GetOrdinal("GM_Fecha_Creacion")),
                        FechaIncidencia = reader.GetString(reader.GetOrdinal("GM_FechaIncidencia")),
                        Tiposervicio = reader.GetString(reader.GetOrdinal("GM_Tipo_Servicio")),
                        Tiposerviciodesc = reader.GetString(reader.GetOrdinal("GM_Tipo_Servicio_Desc")),
                        //Tipomantenimiento = reader.GetString(reader.GetOrdinal("GM_Tipo_Mantenimiento")),
                        Observaciones = reader.GetString(reader.GetOrdinal("GM_Observación")),
                        //Prioridad = reader.GetString(reader.GetOrdinal("GM_Prioridad")),
                        Estado = reader.GetInt32(reader.GetOrdinal("GM_Estado")),
                        Estadodesc = reader.GetString(reader.GetOrdinal("GM_Estado_Desc"))
                    });
                }
            }
            return lista;
        }
        
        public bool fn_ActualizarESM(BE_EvaluarSolicitudMantenimiento p_SMBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                parameters.Add("@GM_NroSolicitud", p_SMBE.Nrosolicitud);
                parameters.Add("@GM_Observacion", p_SMBE.Observaciones);
                //parameters.Add("@GM_Prioridad", p_SMBE.Prioridad);
                parameters.Add("@GM_Estado", p_SMBE.Estado);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("SP_Modificar_Evaluar_Solicitud_Mantenimiento", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public BE_EvaluarSolicitudMantenimiento fn_BuscaESM(BE_EvaluarSolicitudMantenimiento p_SMBE)
        {
            BE_EvaluarSolicitudMantenimiento sm;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@GM_NroSolicitud", p_SMBE.Nrosolicitud);
            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("SP_Buscar_Evaluar_Solicitud_Mantenimiento", parameters))
            {
                reader.Read();
                sm = new BE_EvaluarSolicitudMantenimiento{
                    Nrosolicitud = reader.GetInt32(reader.GetOrdinal("GM_NroSolicitud")),
                    Fechacreacion = reader.GetString(reader.GetOrdinal("GM_Fecha_Creacion")),
                    Tiposervicio = reader.GetString(reader.GetOrdinal("GM_Tipo_Servicio")),
                    Tiposerviciodesc = reader.GetString(reader.GetOrdinal("GM_Tipo_Servicio_Desc")),
                    //Tipomantenimiento = reader.GetString(reader.GetOrdinal("GM_Tipo_Mantenimiento")),
                    Numeroequipo = reader.GetString(reader.GetOrdinal("GM_Numero_Equipo")).Trim(),
                    FechaIncidencia = reader.GetString(reader.GetOrdinal("GM_FechaIncidencia")),
                    Detalleservicio = reader.GetString(reader.GetOrdinal("GM_Detalle_Servicio")),
                    Observaciones = reader.GetString(reader.GetOrdinal("GM_Observación")),
                    //Prioridad = reader.GetString(reader.GetOrdinal("GM_Prioridad")),
                    Estado = reader.GetInt32(reader.GetOrdinal("GM_Estado")),
                    Estadodesc = reader.GetString(reader.GetOrdinal("GM_Estado_Desc"))
                };
                
            }
            return sm;
        }

        public List<BE_EvaluarSolicitudMantenimiento> fn_ConsultaESM_x_NroSolicitud(int nrosolicitud)
        {
            var lista = new List<BE_EvaluarSolicitudMantenimiento>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@GM_NroSolicitud", nrosolicitud);

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("[SP_ConsultaESM_x_NroSolicitud]", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new BE_EvaluarSolicitudMantenimiento
                    {
                        Nrosolicitud = reader.GetInt32(reader.GetOrdinal("GM_NroSolicitud")),
                        Fechacreacion = reader.GetString(reader.GetOrdinal("GM_Fecha_Creacion")),
                        FechaIncidencia = reader.GetString(reader.GetOrdinal("GM_FechaIncidencia")),
                        Tiposervicio = reader.GetString(reader.GetOrdinal("GM_Tipo_Servicio")),
                        Tiposerviciodesc = reader.GetString(reader.GetOrdinal("GM_Tipo_Servicio_Desc")),
                        //Tipomantenimiento = reader.GetString(reader.GetOrdinal("GM_Tipo_Mantenimiento")),
                        Observaciones = reader.GetString(reader.GetOrdinal("GM_Observación")),
                        //Prioridad = reader.GetString(reader.GetOrdinal("GM_Prioridad")),
                        Estado = reader.GetInt32(reader.GetOrdinal("GM_Estado")),
                        Estadodesc = reader.GetString(reader.GetOrdinal("GM_Estado_Desc"))
                    });
                }
            }
            return lista;
        }
    }
}
