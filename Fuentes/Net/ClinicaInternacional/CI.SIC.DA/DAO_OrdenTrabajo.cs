using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class DAO_OrdenTrabajo : BaseDA<DAO_OrdenTrabajo>
    {

        public List<BE_OrdendeTrabajo> fn_MonitorearOT(int estado)
        {
            var lista = new List<BE_OrdendeTrabajo>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@GM_Estado", estado);
            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("SP_Monitorear_Orden_de_Trabajo", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new BE_OrdendeTrabajo
                    {
                        GM_NroOrden = reader.GetInt32(reader.GetOrdinal("GM_NroOrden")),
                        GM_NroSolicitud = reader.GetInt32(reader.GetOrdinal("GM_NroSolicitud")),
                        GM_Fecha_Creacion = reader.GetString(reader.GetOrdinal("GM_Fecha_Creacion")),
                        GM_CodigoSolicitante = reader.GetString(reader.GetOrdinal("GM_CodigoSolicitante")),
                        GM_Fecha_Inicio = reader.GetString(reader.GetOrdinal("GM_Fecha_Inicio")),
                        GM_Fecha_Fin = reader.GetString(reader.GetOrdinal("GM_Fecha_Fin")),
                        GM_Empleados_Asociados = reader.GetString(reader.GetOrdinal("GM_Empleados_Asociados")),
                        GM_Prioridad = reader.GetString(reader.GetOrdinal("GM_Prioridad")),
                        GM_Comentarios = reader.GetString(reader.GetOrdinal("GM_Comentarios")),
                        GM_Estado = reader.GetString(reader.GetOrdinal("GM_Estado")).ToString(),
                        GM_Especificacion = reader.GetString(reader.GetOrdinal("GM_Especificacion")).ToString(),
                        //GM_NroOrdenOT = reader.GetInt32(reader.GetOrdinal("GM_NroSolicitud")),
                        //GM_Fecha_CreacionOT = reader.GetString(reader.GetOrdinal("GM_Fecha_Creacion")),
                        //GM_CodigoSolicitanteOT = reader.GetString(reader.GetOrdinal("GM_CodigoSolicitante")),
                        //GM_Fecha_InicioOT = reader.GetString(reader.GetOrdinal("GM_Fecha_Inicio")),
                        //GM_Fecha_FinOT = reader.GetString(reader.GetOrdinal("GM_Fecha_Fin")),
                        //GM_EstadoOT = reader.GetString(reader.GetOrdinal("GM_Estado")),
                    });
                }
            }
            return lista;
        }

        public List<BE_OrdendeTrabajo> fn_ListaOT(string fi, string ff)
        {
            var lista = new List<BE_OrdendeTrabajo>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@GM_FechaInicio", fi);
            parameters.Add("@GM_FechaFin", ff);
            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("SP_Listar_Orden_de_Trabajo", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new BE_OrdendeTrabajo
                    {
                        GM_NroOrden1 = reader.GetString(reader.GetOrdinal("GM_NroOrden")),
                        GM_NroSolicitud1 = reader.GetString(reader.GetOrdinal("GM_NroSolicitud")),
                        GM_Fecha_Creacion = reader.GetString(reader.GetOrdinal("GM_Fecha_Creacion")),
                        GM_Estado = reader.GetString(reader.GetOrdinal("GM_Estado")),
                    });
                }
            }
            return lista;
        }


        public bool fn_InsertarOT(BE_OrdendeTrabajo p_OTBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();
                parameters.Add("@GM_NroSolicitud", p_OTBE.GM_NroSolicitud);
                parameters.Add("@GM_Fecha_Creacion", p_OTBE.GM_Fecha_Creacion);
                parameters.Add("@GM_CodigoSolicitante", p_OTBE.GM_CodigoSolicitante);
                parameters.Add("@GM_Fecha_Inicio", p_OTBE.GM_Fecha_Inicio);
                parameters.Add("@GM_Fecha_Fin", p_OTBE.GM_Fecha_Fin);
                parameters.Add("@GM_Empleados_Asociados", p_OTBE.GM_Empleados_Asociados);
                parameters.Add("@GM_Prioridad", p_OTBE.GM_Prioridad);
                parameters.Add("@GM_Comentarios", p_OTBE.GM_Comentarios);
                parameters.Add("@GM_Estado", "1"/*p_OTBE.GM_Estado*/);

               
                int rpta = SqlHelper.Instance.ExecuteNonQuery("SP_Insertar_Orden_de_Trabajo", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }



        public bool fn_ActualizarOT(BE_OrdendeTrabajo p_OTBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();
                parameters.Add("@GM_NroOrden", p_OTBE.GM_NroOrden);
                parameters.Add("@GM_NroSolicitud", p_OTBE.GM_NroSolicitud);
                parameters.Add("@GM_Fecha_Creacion", p_OTBE.GM_Fecha_Creacion);
                parameters.Add("@GM_CodigoSolicitante", p_OTBE.GM_CodigoSolicitante);
                parameters.Add("@GM_Fecha_Inicio", p_OTBE.GM_Fecha_Inicio);
                parameters.Add("@GM_Fecha_Fin", p_OTBE.GM_Fecha_Fin);
                parameters.Add("@GM_Empleados_Asociados", p_OTBE.GM_Empleados_Asociados);
                parameters.Add("@GM_Prioridad", p_OTBE.GM_Prioridad);
                parameters.Add("@GM_Comentarios", p_OTBE.GM_Comentarios);
                parameters.Add("@GM_Estado", p_OTBE.GM_Estado);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("SP_Actualizar_Orden_de_Trabajo", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public bool fn_CerrarOT(BE_OrdendeTrabajo p_OTBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();
                parameters.Add("@GM_NroOrden", p_OTBE.GM_NroOrden);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("SP_Cerrar_Orden_de_Trabajo", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }


        public bool fn_EliminarOT(BE_OrdendeTrabajo p_OTBE)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                parameters.Add("@GM_NroOrden", p_OTBE.GM_NroOrden);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("SP_Eliminar_Orden_de_Trabajo", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }



        public BE_OrdendeTrabajo fn_BuscaOT(BE_OrdendeTrabajo p_OTBE)
        {
            BE_OrdendeTrabajo OT;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@GM_NroOrden", p_OTBE.GM_NroOrden);
            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("SP_Buscar_Orden_de_Trabajo", parameters))
            {
                reader.Read();
                OT = new BE_OrdendeTrabajo
                {


                    GM_NroOrden = reader.GetInt32(reader.GetOrdinal("GM_NroSolicitud")),
                    //GM_NroOrdenOT = reader.GetString(reader.GetOrdinal("GM_NroSolicitud")),
                    GM_Fecha_Creacion = reader.GetString(reader.GetOrdinal("GM_Fecha_Creacion")),
                    GM_CodigoSolicitante = reader.GetString(reader.GetOrdinal("GM_CodigoSolicitante")),
                    GM_Fecha_Inicio = reader.GetString(reader.GetOrdinal("GM_Fecha_Inicio")),
                    GM_Fecha_Fin = reader.GetString(reader.GetOrdinal("GM_Fecha_Fin")),
                    GM_Estado = reader.GetString(reader.GetOrdinal("GM_Fecha_Fin")),

                };

            }
            return OT;
        }



    }
}
