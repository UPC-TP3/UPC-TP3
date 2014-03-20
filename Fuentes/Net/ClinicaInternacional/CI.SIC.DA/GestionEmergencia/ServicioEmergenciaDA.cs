using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CI.SIC.BE;
using CI.SIC.CC;
using System.Data;
using System.Data.SqlClient;
namespace CI.SIC.DA.GestionEmergencia
{
    public class ServicioEmergenciaDA
    {
        SqlCommand SqlCommand;
        SqlParameter SqlPara;

    

        #region "Metodos"
        public EmergenciaBEList  GeallTipoExamenMedico()
        {
            EmergenciaBEList oEmergenciaBEList = new EmergenciaBEList();
            SqlDataReader SqlReader = null;
            try
            {
                using (SqlConnection Conex = new SqlConnection(Configuraciones.CadenaConexion))
                {
                    /*Propiedades del SqlCommand*/
                    SqlCommand = new SqlCommand();
                    SqlCommand.CommandText = "sgsnet_sps_tipo_examen_medico";
                    SqlCommand.Connection = Conex;
                    SqlCommand.CommandType = CommandType.StoredProcedure;


                    /*Abrir la Conexion del SqlReader*/
                    Conex.Open();

                    SqlReader = SqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (SqlReader.HasRows) // Si Contiene Filas
                    {
                        while (SqlReader.Read())
                        {
                            BE_Emergencia oDesarmeUnidadesBE = CrearEntidadTipoExamen(SqlReader);
                            oEmergenciaBEList.Add(oDesarmeUnidadesBE);
                        }
                    }

                    /*Cerrando las Conexion SqlReader*/
                    SqlReader.Close();

                }

            }
            catch (Exception ex)
            {
                if (SqlReader != null && !SqlReader.IsClosed) SqlReader.Close();
                throw ex;
            }

            return oEmergenciaBEList;
        }

        public EmergenciaBEList GeallMedicamento()
        {
            EmergenciaBEList oEmergenciaBEList = new EmergenciaBEList();
            SqlDataReader SqlReader = null;
            try
            {
                using (SqlConnection Conex = new SqlConnection(Configuraciones.CadenaConexion))
                {
                    /*Propiedades del SqlCommand*/
                    SqlCommand = new SqlCommand();
                    SqlCommand.CommandText = "sgsnet_sps_medicamento";
                    SqlCommand.Connection = Conex;
                    SqlCommand.CommandType = CommandType.StoredProcedure;


                    /*Abrir la Conexion del SqlReader*/
                    Conex.Open();

                    SqlReader = SqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (SqlReader.HasRows) // Si Contiene Filas
                    {
                        while (SqlReader.Read())
                        {
                            BE_Emergencia oDesarmeUnidadesBE = CrearEntidadMedicamento(SqlReader);
                            oEmergenciaBEList.Add(oDesarmeUnidadesBE);
                        }
                    }

                    /*Cerrando las Conexion SqlReader*/
                    SqlReader.Close();

                }

            }
            catch (Exception ex)
            {
                if (SqlReader != null && !SqlReader.IsClosed) SqlReader.Close();
                throw ex;
            }

            return oEmergenciaBEList;
        }

        public BE_Emergencia GeallMedicamentoById(int IdMedicamento)
        {
            BE_Emergencia oBE_Emergencia = null;
            SqlDataReader SqlReader = null;
            try
            {
                using (SqlConnection Conex = new SqlConnection(Configuraciones.CadenaConexion))
                {
                    /*Propiedades del SqlCommand*/
                    SqlCommand = new SqlCommand();
                    SqlCommand.CommandText = "sgsnet_sps_medicamento_by_id";
                    SqlCommand.Connection = Conex;
                    SqlCommand.CommandType = CommandType.StoredProcedure;

                    SqlPara = new SqlParameter("@vi_ID_Medicamento", SqlDbType.Int);
                    SqlPara.Direction = ParameterDirection.Input;
                    SqlPara.Value = IdMedicamento;
                    SqlCommand.Parameters.Add(SqlPara);

                    /*Abrir la Conexion del SqlReader*/
                    Conex.Open();

                    SqlReader = SqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (SqlReader.HasRows) // Si Contiene Filas
                    {
                        while (SqlReader.Read())
                        {
                             oBE_Emergencia = new BE_Emergencia();
                             oBE_Emergencia = CrearEntidadMedicamento(SqlReader);
                        }
                    }

                    /*Cerrando las Conexion SqlReader*/
                    SqlReader.Close();

                }

            }
            catch (Exception ex)
            {
                if (SqlReader != null && !SqlReader.IsClosed) SqlReader.Close();
                throw ex;
            }

            return oBE_Emergencia;
        }


        public BE_Emergencia GeallTipoExamenById(int IdTipoExamen)
        {
            BE_Emergencia oBE_Emergencia = null;
            SqlDataReader SqlReader = null;
            try
            {
                using (SqlConnection Conex = new SqlConnection(Configuraciones.CadenaConexion))
                {
                    /*Propiedades del SqlCommand*/
                    SqlCommand = new SqlCommand();
                    SqlCommand.CommandText = "sgsnet_sps_tipo_examen_medico_by_id";
                    SqlCommand.Connection = Conex;
                    SqlCommand.CommandType = CommandType.StoredProcedure;

                    SqlPara = new SqlParameter("@vi_id_tipo_examen", SqlDbType.Int);
                    SqlPara.Direction = ParameterDirection.Input;
                    SqlPara.Value = IdTipoExamen;
                    SqlCommand.Parameters.Add(SqlPara);

                    /*Abrir la Conexion del SqlReader*/
                    Conex.Open();

                    SqlReader = SqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (SqlReader.HasRows) // Si Contiene Filas
                    {
                        while (SqlReader.Read())
                        {
                            oBE_Emergencia = new BE_Emergencia();
                            oBE_Emergencia = CrearEntidadTipoExamen(SqlReader);
                        }
                    }

                    /*Cerrando las Conexion SqlReader*/
                    SqlReader.Close();

                }

            }
            catch (Exception ex)
            {
                if (SqlReader != null && !SqlReader.IsClosed) SqlReader.Close();
                throw ex;
            }

            return oBE_Emergencia;
        }


        public BE_Emergencia GeallDatosEmergenciaId(String  strTipo,String strDocumento)
        {
            BE_Emergencia oBE_Emergencia = null;
            SqlDataReader SqlReader = null;
            try
            {
                using (SqlConnection Conex = new SqlConnection(Configuraciones.CadenaConexion))
                {
                    /*Propiedades del SqlCommand*/
                    SqlCommand = new SqlCommand();
                    SqlCommand.CommandText = "sgsnet_sps_emergencia_by_id";
                    SqlCommand.Connection = Conex;
                    SqlCommand.CommandType = CommandType.StoredProcedure;

                    /*Agregar Parametros al SqlCommand */

                    SqlPara = new SqlParameter("@vi_tipo", SqlDbType.Char ,1);
                    SqlPara.Direction = ParameterDirection.Input;
                    SqlPara.Value = strTipo;
                    SqlCommand.Parameters.Add(SqlPara);

                    SqlPara = new SqlParameter("@vi_numero_documento", SqlDbType.VarChar ,11);
                    SqlPara.Direction = ParameterDirection.Input;
                    SqlPara.Value = strDocumento;
                    SqlCommand.Parameters.Add(SqlPara);


                    /*Abrir la Conexion del SqlReader*/
                    Conex.Open();

                    SqlReader = SqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (SqlReader.HasRows) // Si Contiene Filas
                    {
                        while (SqlReader.Read())
                        {
                            oBE_Emergencia = new BE_Emergencia();
                            oBE_Emergencia = CrearEntidadEmergenciaById(SqlReader);
                        }
                    }

                    /*Cerrando las Conexion SqlReader*/
                    SqlReader.Close();
                }

            }
            catch (Exception ex)
            {
                if (SqlReader != null && !SqlReader.IsClosed) SqlReader.Close();
                throw ex;
            }

            return oBE_Emergencia;

        }


        public EmergenciaBEList GeallServiciosExamenesbyId(Int32 IdAtencion)
        {
            EmergenciaBEList oEmergenciaBEList = new EmergenciaBEList();
            SqlDataReader SqlReader = null;
            try
            {
                using (SqlConnection Conex = new SqlConnection(Configuraciones.CadenaConexion))
                {
                    /*Propiedades del SqlCommand*/
                    SqlCommand = new SqlCommand();
                    SqlCommand.CommandText = "sgsnet_sps_servicios_examenes_by_id";
                    SqlCommand.Connection = Conex;
                    SqlCommand.CommandType = CommandType.StoredProcedure;

                    SqlPara = new SqlParameter("@vi_id_atencion", SqlDbType.Int);
                    SqlPara.Direction = ParameterDirection.Input;
                    SqlPara.Value = IdAtencion;
                    SqlCommand.Parameters.Add(SqlPara);

                    /*Abrir la Conexion del SqlReader*/
                    Conex.Open();

                    SqlReader = SqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (SqlReader.HasRows) // Si Contiene Filas
                    {
                        while (SqlReader.Read())
                        {
                            BE_Emergencia oDesarmeUnidadesBE = CrearEntidadServiciosExamenesById(SqlReader);
                            oEmergenciaBEList.Add(oDesarmeUnidadesBE);
                        }
                    }

                    /*Cerrando las Conexion SqlReader*/
                    SqlReader.Close();

                }

            }
            catch (Exception ex)
            {
                if (SqlReader != null && !SqlReader.IsClosed) SqlReader.Close();
                throw ex;
            }

            return oEmergenciaBEList;
        }

        public EmergenciaBEList GeallServiciosMedicamentosbyId(Int32 IdAtencion)
        {
            EmergenciaBEList oEmergenciaBEList = new EmergenciaBEList();
            SqlDataReader SqlReader = null;
            try
            {
                using (SqlConnection Conex = new SqlConnection(Configuraciones.CadenaConexion))
                {
                    /*Propiedades del SqlCommand*/
                    SqlCommand = new SqlCommand();
                    SqlCommand.CommandText = "sgsnet_sps_servicios_medicamentos_by_id";
                    SqlCommand.Connection = Conex;
                    SqlCommand.CommandType = CommandType.StoredProcedure;

                    SqlPara = new SqlParameter("@vi_id_atencion", SqlDbType.Int);
                    SqlPara.Direction = ParameterDirection.Input;
                    SqlPara.Value = IdAtencion;
                    SqlCommand.Parameters.Add(SqlPara);

                    /*Abrir la Conexion del SqlReader*/
                    Conex.Open();

                    SqlReader = SqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (SqlReader.HasRows) // Si Contiene Filas
                    {
                        while (SqlReader.Read())
                        {
                            BE_Emergencia oDesarmeUnidadesBE = CrearEntidadServiciosMedicamentoById(SqlReader);
                            oEmergenciaBEList.Add(oDesarmeUnidadesBE);
                        }
                    }

                    /*Cerrando las Conexion SqlReader*/
                    SqlReader.Close();

                }

            }
            catch (Exception ex)
            {
                if (SqlReader != null && !SqlReader.IsClosed) SqlReader.Close();
                throw ex;
            }

            return oEmergenciaBEList;
        }


        #endregion



        #region "Transacciones"

        public Int32 InsertarServiciosEmergencia(int idAtencion,int idpaciente)
            {
                Int32 retorno = 0;
                SqlTransaction SqlTran = null;
                using (SqlConnection Conex = new SqlConnection(Configuraciones.CadenaConexion))
                {
                    try
                    {
                        /* Abrir la Conexion*/
                        if (Conex.State != ConnectionState.Open)
                            Conex.Open();

                        /* Comenzamos la Transaccion*/
                        SqlTran = Conex.BeginTransaction();

                        /*Propiedades del SqlCommand*/
                        SqlCommand = new SqlCommand();
                        SqlCommand.CommandText = "sp_insertServicioEmergencia";
                        SqlCommand.Connection = Conex;
                        SqlCommand.CommandType = CommandType.StoredProcedure;

                        /*Agregar Parametros al SqlCommand */
                        SqlPara = new SqlParameter("@NroAtencion", SqlDbType.Int);
                        SqlPara.Direction = ParameterDirection.Input;
                        SqlPara.Value = idAtencion;
                        SqlCommand.Parameters.Add(SqlPara);

                        SqlPara = new SqlParameter("@CodigoPaciente", SqlDbType.Int);
                        SqlPara.Direction = ParameterDirection.Input;
                        SqlPara.Value = idpaciente;
                        SqlCommand.Parameters.Add(SqlPara);

                    

                        /* Asignamos Transaccion al Command */
                        SqlCommand.Transaction = SqlTran;
                        /* Ejecutamos */
                        retorno = Int32.Parse(SqlCommand.ExecuteScalar().ToString());
                        /* Si todo salio bien hacemos commit los cambios */
                        SqlTran.Commit();


                    }
                    catch (Exception ex)
                    {
                        if (SqlTran != null)
                        {
                            // Si algo fallo deshacemos todo
                            SqlTran.Rollback();
                        }
                        throw ex;
                    }
                    finally
                    {
                        // Cerramos la Conexion
                        if (Conex.State != ConnectionState.Closed)
                            Conex.Close();
                        // Destruimos la conexion
                        Conex.Dispose();
                    }
                }
                return retorno;
        }


        public Int32 InsertarExamen(int idAtencion, int idexamen)
        {
            Int32 retorno = 0;
            SqlTransaction SqlTran = null;
            using (SqlConnection Conex = new SqlConnection(Configuraciones.CadenaConexion))
            {
                try
                {
                    /* Abrir la Conexion*/
                    if (Conex.State != ConnectionState.Open)
                        Conex.Open();

                    /* Comenzamos la Transaccion*/
                    SqlTran = Conex.BeginTransaction();

                    /*Propiedades del SqlCommand*/
                    SqlCommand = new SqlCommand();
                    SqlCommand.CommandText = "sp_insertDetalleOrdenExamen";
                    SqlCommand.Connection = Conex;
                    SqlCommand.CommandType = CommandType.StoredProcedure;

                    /*Agregar Parametros al SqlCommand */
                    SqlPara = new SqlParameter("@NroAtencion", SqlDbType.Int);
                    SqlPara.Direction = ParameterDirection.Input;
                    SqlPara.Value = idAtencion;
                    SqlCommand.Parameters.Add(SqlPara);

                    SqlPara = new SqlParameter("@IdExamen", SqlDbType.Int);
                    SqlPara.Direction = ParameterDirection.Input;
                    SqlPara.Value = idexamen;
                    SqlCommand.Parameters.Add(SqlPara);



                    /* Asignamos Transaccion al Command */
                    SqlCommand.Transaction = SqlTran;
                    /* Ejecutamos */
                    retorno = Int32.Parse(SqlCommand.ExecuteScalar().ToString());
                    /* Si todo salio bien hacemos commit los cambios */
                    SqlTran.Commit();


                }
                catch (Exception ex)
                {
                    if (SqlTran != null)
                    {
                        // Si algo fallo deshacemos todo
                        SqlTran.Rollback();
                    }
                    throw ex;
                }
                finally
                {
                    // Cerramos la Conexion
                    if (Conex.State != ConnectionState.Closed)
                        Conex.Close();
                    // Destruimos la conexion
                    Conex.Dispose();
                }
            }
            return retorno;
        }


        public Int32 InsertarMedicamento(int idAtencion, int idmedicamento, int cantidad)
        {
            Int32 retorno = 0;
            SqlTransaction SqlTran = null;
            using (SqlConnection Conex = new SqlConnection(Configuraciones.CadenaConexion))
            {
                try
                {
                    /* Abrir la Conexion*/
                    if (Conex.State != ConnectionState.Open)
                        Conex.Open();

                    /* Comenzamos la Transaccion*/
                    SqlTran = Conex.BeginTransaction();

                    /*Propiedades del SqlCommand*/
                    SqlCommand = new SqlCommand();
                    SqlCommand.CommandText = "sp_insertDetalleOrdenMedicamentos";
                    SqlCommand.Connection = Conex;
                    SqlCommand.CommandType = CommandType.StoredProcedure;

                    /*Agregar Parametros al SqlCommand */
                    SqlPara = new SqlParameter("@NroAtencion", SqlDbType.Int);
                    SqlPara.Direction = ParameterDirection.Input;
                    SqlPara.Value = idAtencion;
                    SqlCommand.Parameters.Add(SqlPara);

                    SqlPara = new SqlParameter("@CodigoMedicamento", SqlDbType.Int);
                    SqlPara.Direction = ParameterDirection.Input;
                    SqlPara.Value = idmedicamento;
                    SqlCommand.Parameters.Add(SqlPara);

                    SqlPara = new SqlParameter("@Cantidad", SqlDbType.Int);
                    SqlPara.Direction = ParameterDirection.Input;
                    SqlPara.Value = cantidad;
                    SqlCommand.Parameters.Add(SqlPara);



                    /* Asignamos Transaccion al Command */
                    SqlCommand.Transaction = SqlTran;
                    /* Ejecutamos */
                    retorno = Int32.Parse(SqlCommand.ExecuteScalar().ToString());
                    /* Si todo salio bien hacemos commit los cambios */
                    SqlTran.Commit();


                }
                catch (Exception ex)
                {
                    if (SqlTran != null)
                    {
                        // Si algo fallo deshacemos todo
                        SqlTran.Rollback();
                    }
                    throw ex;
                }
                finally
                {
                    // Cerramos la Conexion
                    if (Conex.State != ConnectionState.Closed)
                        Conex.Close();
                    // Destruimos la conexion
                    Conex.Dispose();
                }
            }
            return retorno;
        }
        #endregion


        #region "Constructores"


        private BE_Emergencia CrearEntidadTipoExamen(SqlDataReader SqlReader)
        {
            BE_Emergencia oBE_Emergencia = new BE_Emergencia();
            int indice;

            indice = SqlReader.GetOrdinal("ID_Tipo_Examen");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.ID_Tipo_Examen = SqlReader.GetInt32(indice);

            indice = SqlReader.GetOrdinal("Descripcion");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.Descripcion = SqlReader.GetString(indice);

            indice = SqlReader.GetOrdinal("DescripcionGeneral");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.DescripcionGeneral = SqlReader.GetString(indice);

            return oBE_Emergencia;
        }

        private BE_Emergencia CrearEntidadMedicamento(SqlDataReader SqlReader)
        {
            BE_Emergencia oBE_Emergencia = new BE_Emergencia();
            int indice;

            indice = SqlReader.GetOrdinal("ID_Medicamento");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.ID_Medicamento = SqlReader.GetInt32(indice);

            indice = SqlReader.GetOrdinal("GE_NombreMedicamento");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.GE_NombreMedicamento = SqlReader.GetString(indice);

            indice = SqlReader.GetOrdinal("Descripcion");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.Descripcion = SqlReader.GetString(indice);

            return oBE_Emergencia;
        }

        private BE_Emergencia CrearEntidadEmergenciaById(SqlDataReader SqlReader)
        {
            BE_Emergencia oBE_Emergencia = new BE_Emergencia();
            int indice;

            indice = SqlReader.GetOrdinal("ID_ATENCION");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.ID_ATENCION = SqlReader.GetInt32(indice);
            indice = SqlReader.GetOrdinal("ID_Paciente");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.ID_Paciente = SqlReader.GetInt32(indice);
            
            indice = SqlReader.GetOrdinal("nombres");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.nombres = SqlReader.GetString(indice);
            indice = SqlReader.GetOrdinal("apellidos");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.apellidos = SqlReader.GetString(indice);
            indice = SqlReader.GetOrdinal("DNI_paciente");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.DNI_paciente = SqlReader.GetString(indice);


            return oBE_Emergencia;
        }


        private BE_Emergencia CrearEntidadServiciosExamenesById(SqlDataReader SqlReader)
        {
            BE_Emergencia oBE_Emergencia = new BE_Emergencia();
            int indice;

            indice = SqlReader.GetOrdinal("ID_SERVICIO");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.ID_SERVICIO = SqlReader.GetInt32(indice);
            indice = SqlReader.GetOrdinal("ID_ATENCION");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.ID_ATENCION = SqlReader.GetInt32(indice);
            indice = SqlReader.GetOrdinal("ID_EXAMEN");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.ID_EXAMEN = SqlReader.GetInt32(indice);

            indice = SqlReader.GetOrdinal("descripcion");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.Descripcion = SqlReader.GetString(indice);
            indice = SqlReader.GetOrdinal("DescripcionGeneral");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.DescripcionGeneral = SqlReader.GetString(indice);
        

            return oBE_Emergencia;
        }

        private BE_Emergencia CrearEntidadServiciosMedicamentoById(SqlDataReader SqlReader)
        {
            BE_Emergencia oBE_Emergencia = new BE_Emergencia();
            int indice;

            indice = SqlReader.GetOrdinal("ID_SERVICIO");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.ID_SERVICIO = SqlReader.GetInt32(indice);
            indice = SqlReader.GetOrdinal("ID_ATENCION");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.ID_ATENCION = SqlReader.GetInt32(indice);
            indice = SqlReader.GetOrdinal("ID_MEDICAMENTO");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.ID_Medicamento = SqlReader.GetInt32(indice);

            indice = SqlReader.GetOrdinal("GE_NombreMedicamento");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.GE_NombreMedicamento = SqlReader.GetString(indice);
            indice = SqlReader.GetOrdinal("Descripcion");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.Descripcion = SqlReader.GetString(indice);
            indice = SqlReader.GetOrdinal("CANTIDAD");
            if (!SqlReader.IsDBNull(indice)) oBE_Emergencia.cantidad = SqlReader.GetInt32(indice);


            return oBE_Emergencia;
        }


        #endregion
    }
}
