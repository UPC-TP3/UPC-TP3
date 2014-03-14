using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using System.Data;

namespace CI.SIC.DA
{
    public class DAO_TipoDocumento :BaseDA<DAO_TipoDocumento>
    {

        /// <summary>
        /// Obtener listado de tipos de documentos 
        /// </summary>
        /// <returns>Lista genérica de tipos de documentos</returns>
        public List<BE_TipoDocumento> fn_ListarTipoDocumento()
        {
            var lista = new List<BE_TipoDocumento>();
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            using (IDataReader reader = SqlHelper.Instance.ExecuteReader("usp_ListarTipoDocumento", parameters))
            {
                while (reader.Read())
                {
                    lista.Add(new BE_TipoDocumento
                    {
                        Codigo = reader.GetInt32(reader.GetOrdinal("ID_TipoDocumento")),
                        Descripcion = reader.GetString(reader.GetOrdinal("Nombre"))
                    });
                }
            }
            return lista;
        }
    }
}
