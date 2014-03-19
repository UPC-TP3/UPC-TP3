using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.CC;
using CI.SIC.DA.Util;

namespace CI.SIC.DA
{
    public class DAO_OrdenProcedimiento : BaseDA<DAO_OrdenProcedimiento>
    {
    
        
        #region Gestion Adminsion ANDREE

        public bool fb_InsertarOrdenProcedimiento(BE_OrdenProcedimiento pBE_OrdenProcedimiento)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                parameters.Add("@ID_Orden_de_Procedimiento", pBE_OrdenProcedimiento.ID_Orden_de_Procedimiento);
                parameters.Add("@NombreOrdenProcedimiento", pBE_OrdenProcedimiento.NombreOrdenProcedimiento);
                parameters.Add("@FechaOrdenProcedimiento", pBE_OrdenProcedimiento.FechaOrdenProcedimiento);
                parameters.Add("@CartaGarantia", pBE_OrdenProcedimiento.CartaGarantia);
                parameters.Add("@ID_Paciente", pBE_OrdenProcedimiento.ID_Paciente);
                parameters.Add("@ID_Medico", pBE_OrdenProcedimiento.ID_Medico);
                parameters.Add("@Estado", pBE_OrdenProcedimiento.Estado);
                parameters.Add("@Aseguradora", pBE_OrdenProcedimiento.Aseguradora);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_Insert_Orden_Procedimiento", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public bool fb_ActualizarOrdenProcedimiento(BE_OrdenProcedimiento pBE_OrdenProcedimiento)
        {
            try
            {
                Dictionary<string, object> parameters = new Dictionary<string, object>();

                parameters.Add("@ID_Orden_de_Procedimiento", pBE_OrdenProcedimiento.ID_Orden_de_Procedimiento);
                parameters.Add("@NombreOrdenProcedimiento", pBE_OrdenProcedimiento.NombreOrdenProcedimiento);
                parameters.Add("@FechaOrdenProcedimiento", pBE_OrdenProcedimiento.FechaOrdenProcedimiento);
                parameters.Add("@CartaGarantia", pBE_OrdenProcedimiento.CartaGarantia);
                parameters.Add("@ID_Paciente", pBE_OrdenProcedimiento.ID_Paciente);
                parameters.Add("@ID_Medico", pBE_OrdenProcedimiento.ID_Medico);
                parameters.Add("@Estado", pBE_OrdenProcedimiento.Estado);
                parameters.Add("@Aseguradora", pBE_OrdenProcedimiento.Aseguradora);

                int rpta = SqlHelper.Instance.ExecuteNonQuery("usp_Update_Orden_Procedimiento", parameters);
                return (rpta > 0) ? true : false;
            }
            catch { throw; }
        }

        public BE_OrdenProcedimiento fn_ObtenerOrdenProcedimiento(int pID_Orden_de_Procedimiento)
        {
            BE_OrdenProcedimiento obj = null;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@ID_Orden_de_Procedimiento", pID_Orden_de_Procedimiento);
           
            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("usp_Get_Orden_Procedimiento", parameters))
            {
                if (reader.Read())
                {
                    obj = new BE_OrdenProcedimiento
                    {
                        ID_Orden_de_Procedimiento = reader.GetInt32(reader.GetOrdinal("ID_Orden_de_Procedimiento")),
                        FechaOrdenProcedimiento = reader.GetDateTime(reader.GetOrdinal("FechaOrdenProcedimiento")),
                        NombreOrdenProcedimiento = reader.GetString(reader.GetOrdinal("NombreOrdenProcedimiento")),
                        CartaGarantia = reader.GetString(reader.GetOrdinal("CartaGarantia")),
                        ID_Paciente = reader.GetInt32(reader.GetOrdinal("ID_Paciente")),
                        ID_Medico = reader.GetInt32(reader.GetOrdinal("ID_Medico")),
                        Estado = reader.GetString(reader.GetOrdinal("Estado")),
                        Aseguradora = reader.GetString(reader.GetOrdinal("Aseguradora")),
                    };
                }
            }
            return obj;
        }


        public List<BE_Medico> fn_ListarMedioPorEspecialidad(int pintID_Especialidad)
        {
            var lista = new List<BE_Medico>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@ID_Especialidad", pintID_Especialidad);

            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("usp_Select_MedicoPorEspecialidad", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new BE_Medico
                    {
                        ID_Medico = reader.GetInt32(reader.GetOrdinal("ID_Medico")),
                        nom_medico = reader.GetString(reader.GetOrdinal("nom_medico"))
                    });
                }
            }
            return lista;
        }


        #endregion

    }
}
