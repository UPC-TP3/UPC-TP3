using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class DAO_SolicitudMantenimiento : BaseDA<DAO_SolicitudMantenimiento>
    {
        public List<BE_SolicitudMantenimiento> fn_ListaSM(string fi, string ff)
        {
            var lista = new List<BE_SolicitudMantenimiento>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@GM_FechaInicio", fi);
            parameters.Add("@GM_FechaFin", ff);
            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("SP_Listar_Solicitud_de_Mantenimiento", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new BE_SolicitudMantenimiento
                    {
                        Nrosolicitud = reader.GetInt32(reader.GetOrdinal("GM_NroSolicitud")),
                        Tiposervicio = reader.GetString(reader.GetOrdinal("GM_Tipo_Servicio")),
                        NomTiposervicio = reader.GetString(reader.GetOrdinal("Tipo_Servicio")),
                        Especificacion = reader.GetString(reader.GetOrdinal("GM_Especificacion")),                        
                        //Tipomantenimiento = reader.GetString(reader.GetOrdinal("GM_Tipo_Mantenimiento")),
                        Fechacreacion = reader.GetString(reader.GetOrdinal("GM_Fecha_Creacion")),
                        Estado = reader.GetInt32(reader.GetOrdinal("GM_Estado")),
                        NomEstado = reader.GetString(reader.GetOrdinal("Estado"))
                    });
                }
            }
            return lista;
        }
        public List<BE_SolicitudMantenimiento> fn_ListaSMxEstado(int estado)
        {
            var lista = new List<BE_SolicitudMantenimiento>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@GM_Estado", estado);
            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("SP_Listar_Solicitud_de_Mantenimiento_Estado", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new BE_SolicitudMantenimiento
                    {
                        Nrosolicitud = reader.GetInt32(reader.GetOrdinal("GM_NroSolicitud")),
                        Tiposervicio = reader.GetString(reader.GetOrdinal("GM_Tipo_Servicio")),
                        NomTiposervicio = reader.GetString(reader.GetOrdinal("Tipo_Servicio")),
                        Especificacion = reader.GetString(reader.GetOrdinal("GM_Especificacion")),                        
                        //Tipomantenimiento = reader.GetString(reader.GetOrdinal("GM_Tipo_Mantenimiento")),
                        Fechacreacion = reader.GetString(reader.GetOrdinal("GM_Fecha_Creacion")),
                        Estado = reader.GetInt32(reader.GetOrdinal("GM_Estado")),
                        NomEstado = reader.GetString(reader.GetOrdinal("Estado"))
                    });
                }
            }
            return lista;
        }
        
        public bool fn_InsertarSM(BE_SolicitudMantenimiento p_SMBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                parameters.Add("@GM_Fecha_Creacion", p_SMBE.Fechacreacion);
                parameters.Add("@GM_CodigoSolicitante", p_SMBE.EmpleadoBen);
                parameters.Add("@GM_CodigoBeneficiario", p_SMBE.EmpleadoSol);
                parameters.Add("@Codigo_CC", p_SMBE.CodigoCC);
                parameters.Add("@GM_Tipo_Servicio", p_SMBE.Tiposervicio);
                parameters.Add("@GM_Tipo_Mantenimiento", p_SMBE.Tipomantenimiento);
                parameters.Add("@GM_Numero_Equipo", p_SMBE.Activo);
                parameters.Add("@GM_FechaIncidencia", p_SMBE.Fechaincidencia);
                parameters.Add("@GM_Detalle_Servicio", p_SMBE.Detalleservicio);
                parameters.Add("@GM_Observación", p_SMBE.Observaciones);
                parameters.Add("@GM_Especificacion", p_SMBE.Especificacion);
                parameters.Add("@GM_Estado", p_SMBE.Estado);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("SP_Insertar_Solicitud_de_Mantenimiento", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public bool fn_ActualizarSM(BE_SolicitudMantenimiento p_SMBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();


                parameters.Add("@GM_NroSolicitud", p_SMBE.Nrosolicitud);
                parameters.Add("@GM_Fecha_Creacion", p_SMBE.Fechacreacion);
                parameters.Add("@GM_CodigoSolicitante", p_SMBE.EmpleadoSol);
                parameters.Add("@GM_CodigoBeneficiario", p_SMBE.EmpleadoBen);
                parameters.Add("@Codigo_CC", p_SMBE.CodigoCC);
                parameters.Add("@GM_Tipo_Servicio", p_SMBE.Tiposervicio);
                parameters.Add("@GM_Numero_Equipo", p_SMBE.Activo);
                parameters.Add("@GM_FechaIncidencia", p_SMBE.Fechaincidencia);
                parameters.Add("@GM_Detalle_Servicio", p_SMBE.Detalleservicio);
                parameters.Add("@GM_Observación", p_SMBE.Observaciones);
                parameters.Add("@GM_Estado", p_SMBE.Estado);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("SP_Modificar_Solicitud_de_Mantenimiento", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public bool fn_EliminarSM(BE_SolicitudMantenimiento p_SMBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                parameters.Add("@GM_NroSolicitud", p_SMBE.Nrosolicitud);
                parameters.Add("@GM_Observación", p_SMBE.Observaciones);
                int rpta = SqlHelper.Instance.ExecuteNonQuery("SP_Eliminar_Solicitud_de_Mantenimiento", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public BE_SolicitudMantenimiento fn_BuscaSM(BE_SolicitudMantenimiento p_SMBE)
        {
            BE_SolicitudMantenimiento sm;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@GM_NroSolicitud", p_SMBE.Nrosolicitud);
            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("SP_Buscar_Solicitud_de_Mantenimiento", parameters))
            {
                reader.Read();
                sm = new BE_SolicitudMantenimiento
                {
                    Nrosolicitud = reader.GetInt32(reader.GetOrdinal("GM_NroSolicitud")),
                    Fechacreacion = reader.GetString(reader.GetOrdinal("GM_Fecha_Creacion")),
                    EmpleadoSol = reader.GetString(reader.GetOrdinal("GM_CodigoSolicitante")),
                    EmpleadoBen = reader.GetString(reader.GetOrdinal("GM_CodigoBeneficiario")),
                    CodigoCC = reader.GetString(reader.GetOrdinal("Codigo_CC")),
                    Tiposervicio = reader.GetString(reader.GetOrdinal("GM_Tipo_Servicio")),
                    Tipomantenimiento = "",
                    Activo = int.Parse(reader.GetString(reader.GetOrdinal("GM_Numero_Equipo"))),
                    Fechaincidencia = reader.GetString(reader.GetOrdinal("GM_FechaIncidencia")),
                    Detalleservicio = reader.GetString(reader.GetOrdinal("GM_Detalle_Servicio")),
                    Observaciones = reader.GetString(reader.GetOrdinal("GM_Observación")),
                    Especificacion = reader.GetString(reader.GetOrdinal("GM_Especificacion")),
                    Estado = reader.GetInt32(reader.GetOrdinal("GM_Estado"))
                };

            }
            return sm;
        }
    }
}
