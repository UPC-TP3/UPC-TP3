USE [BD_ClinicaInternacional]
GO
-- ELIMINAR STORE PROCEDURES DE GESTION DE ADMISION 
DECLARE @SPs Nvarchar(MAX)
SET @SPs = ''  
SELECT @SPs = @SPs + [name] + ',' FROM sys.objects  
WHERE type = 'P' AND name LIKE 'usp_%'  

IF ISNULL(@SPs,'') <> ''
 BEGIN
set @SPs=SUBSTRING(@SPs, 1, LEN(@SPs) - 1)
exec ('drop proc ' + @SPs )
END

-- CREAR LOS STORES PROCEDURES DE GESTION DE ADMISION
GO
CREATE PROCEDURE [dbo].[usp_Select_TipoDocumento]
AS
BEGIN
SELECT 
ID_TipoDocumento,
Nombre
  FROM TB_TIPO_DOCUMENTO
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Select_Paciente]    Script Date: 03/13/2014 15:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Select_Paciente]
@ID_Paciente INT,
@dni_paciente VARCHAR(11),
@ID_TipoDocumento int
AS
BEGIN
SELECT ID_Paciente  
      ,dni_paciente        
      ,isnull(FechaNacimiento,'01/01/1900') as FechaNacimiento  
      ,isnull(Celular,'') as Celular  
      ,isnull(TelefonoDomicilio,'') as TelefonoDomicilio   
      ,ID_Pais  
      ,ID_Departamento  
      ,ID_Provincia  
      ,ID_Distrito  
      ,isnull(Direccion,'') as Direccion  
      ,ID_Sexo  
      ,(SELECT MAS_DesCorta FROM TB_MAESTRO_TABLAS WHERE MAS_CodTabla='20' AND MAS_CodCampo=ID_Sexo) AS SexoDescripcion
      ,isnull(Ocupacion,'') as Ocupacion  
      ,ID_TipoDocumento
      ,(SELECT Nombre FROM TB_TIPO_DOCUMENTO t WHERE t.ID_TipoDocumento=p.ID_TipoDocumento) AS TipoDocumentoNombre
      ,isnull(nombres,'') as nombres  
      ,isnull(ApellidoPat,'') as ApellidoPat  
      ,isnull(ApellidoMat,'') as ApellidoMat  
      ,ID_EstadoCivil  
      ,isnull(Correo,'') as Correo  
  FROM TB_PACIENTE   p
  WHERE (ID_Paciente = @ID_Paciente OR @ID_Paciente=0) AND
        (dni_paciente LIKE '%' + @dni_paciente + '%') AND
        (@ID_TipoDocumento = 0 OR ID_TipoDocumento=@ID_TipoDocumento)
  END
GO
/****** Object:  StoredProcedure [dbo].[usp_Update_CambiarEstadoCita]    Script Date: 03/13/2014 15:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_Update_CambiarEstadoCita]
(@ID_Cita int,
@ID_EstadoCita int)
AS
BEGIN 
 UPDATE TB_CITA
 SET ID_EstadoCita = @ID_EstadoCita
 WHERE ID_Cita = @ID_Cita
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Select_ValidarCita]    Script Date: 03/13/2014 15:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Select_ValidarCita]
@ID_Paciente int,  
@FechaHoraCita datetime,
@ID_Cita int = -1
AS  
BEGIN  
  
SELECT ID_Cita  
      ,FechaHoraCita  
      ,ISNULL(Aseguradora,'') AS Aseguradora  
      ,Cobertura  
      ,ISNULL(Estado,'') AS Estado  
      ,ISNULL(OrdenAtencion,'') AS OrdenAtencion  
      ,ISNULL(ID_Paciente,0) AS ID_Paciente  
      ,ISNULL(ID_Historia,0) AS ID_Historia  
      ,ISNULL(ID_Especialidad,0) AS ID_Especialidad  
      ,ISNULL(ID_Medico,0) AS ID_Medico  
      ,ISNULL(ID_AgendaMedica,0) AS ID_AgendaMedica  
      ,ISNULL(ID_EstadoCita,0) AS ID_EstadoCita  
      ,ISNULL(ID_Cita_Reprogramada,0) as ID_Cita_Reprogramada  
      ,ISNULL(Des_Ubicacion_Cita,'') AS Des_Ubicacion_Cita  
  FROM TB_CITA  
  WHERE (@ID_CITA <> -1 AND ID_Cita=@ID_CITA) OR
		(ID_Paciente = @ID_Paciente AND FechaHoraCita > = @FechaHoraCita  )
END  
GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_Comprobante_Pago]    Script Date: 03/13/2014 15:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_Insert_Comprobante_Pago]
(@FechaComprobante datetime,
@TipoComprobante varchar(255),
@FormaDePago varchar(255),
@MontoComprobante float,
@ConceptoDePago varchar(255),
@ID_Cita int)
AS
BEGIN

insert into TB_COMPROBANTE_DE_PAGO
(FechaComprobante,
TipoComprobante,
FormaDePago,
MontoComprobante,
ConceptoDePago,
ID_Cita)
values
(
@FechaComprobante,
@TipoComprobante,
@FormaDePago,
@MontoComprobante,
@ConceptoDePago,
@ID_Cita)

END
GO

CREATE PROC usp_RegistrarPaciente
/*
Nombre: usp_RegistrarPaciente
Creado Por: Lsalvatierra
Proposito: Registrar Paciente a Emergencia.
Fecha: 10/03/2014
*/
@DNI		VARCHAR(11),
@Nombres	VARCHAR(50),
@ApellidoP	VARCHAR(80),
@ApellidoM	VARCHAR(80),
@FechaNac	DATETIME,
@Celular	VARCHAR(10),
@Telefono	VARCHAR(10),
@Direccion	VARCHAR(150),
@Sexo		INT,
@IdTipoDoc	INT,
@ID_Pais		INT,
@ID_Departamento	INT,
@ID_Provincia		INT,
@ID_Distrito	INT,
@Observacion	VARCHAR(150)
AS
BEGIN
	INSERT INTO			dbo.TB_PACIENTE	(ID_TipoDocumento,dni_paciente,FechaNacimiento,Celular,
						TelefonoDomicilio,Direccion,ID_Sexo,nombres,ApellidoPat,ApellidoMat,ID_Pais,ID_Departamento,ID_Provincia,ID_Distrito,Observacion) 
	VALUES				(@IdTipoDoc,@DNI,@FechaNac,@Celular,@Telefono,@Direccion,@Sexo,@Nombres,
						@ApellidoP,@ApellidoM,@ID_Pais,@ID_Departamento,@ID_Provincia,@ID_Distrito,@Observacion)
END
GO


CREATE PROC usp_RegistrarPaciente_2
/*
Nombre: usp_RegistrarPaciente
Creado Por: Lsalvatierra
Proposito: Registrar Paciente a Emergencia.
Fecha: 10/03/2014
*/
@DNI		VARCHAR(11),
@Nombres	VARCHAR(50),
@ApellidoP	VARCHAR(80),
@ApellidoM	VARCHAR(80),
@FechaNac	DATETIME,
@Celular	VARCHAR(10),
@Telefono	VARCHAR(10),
@Direccion	VARCHAR(150),
@Sexo		INT,
@IdTipoDoc	INT,
@ID_Pais		INT,
@ID_Departamento	INT,
@ID_Provincia		INT,
@ID_Distrito	INT,
@ID_EstadoCivil	INT,
@Ocupacion	VARCHAR(255),
@Correo	VARCHAR(100)
AS
	INSERT INTO			dbo.TB_PACIENTE	(ID_TipoDocumento,dni_paciente,FechaNacimiento,Celular,
						TelefonoDomicilio,Direccion,ID_Sexo,nombres,ApellidoPat,ApellidoMat,ID_Pais,
						ID_Departamento,ID_Provincia,ID_Distrito,ID_EstadoCivil,Ocupacion,Correo) 
	VALUES				(@IdTipoDoc,@DNI,@FechaNac,@Celular,@Telefono,@Direccion,@Sexo,@Nombres,
						@ApellidoP,@ApellidoM,@ID_Pais,@ID_Departamento,@ID_Provincia,@ID_Distrito,
						@ID_EstadoCivil,@Ocupacion,@Correo)
GO

CREATE PROC usp_ActualizarPaciente_2
/*
Nombre: usp_RegistrarPaciente
Creado Por: Lsalvatierra
Proposito: Registrar Paciente a Emergencia.
Fecha: 10/03/2014
*/
@ID_Paciente	INT,
@DNI		VARCHAR(11),
@Nombres	VARCHAR(50),
@ApellidoP	VARCHAR(80),
@ApellidoM	VARCHAR(80),
@FechaNac	DATETIME,
@Celular	VARCHAR(10),
@Telefono	VARCHAR(10),
@Direccion	VARCHAR(150),
@Sexo		INT,
@IdTipoDoc	INT,
@ID_Pais		INT,
@ID_Departamento	INT,
@ID_Provincia		INT,
@ID_Distrito	INT,
@ID_EstadoCivil	INT,
@Ocupacion	VARCHAR(255),
@Correo	VARCHAR(100)
AS
	UPDATE	dbo.TB_PACIENTE
	SET		ID_TipoDocumento=@IdTipoDoc,dni_paciente=@DNI,FechaNacimiento=@FechaNac,Celular=@Celular,
			TelefonoDomicilio=@Telefono,Direccion=@Direccion,ID_Sexo=@Sexo,nombres=@Nombres,ApellidoPat=@ApellidoP,
			ApellidoMat=@ApellidoM,ID_Pais=@ID_Pais,ID_Departamento=@ID_Departamento,ID_Provincia=@ID_Provincia,
			ID_Distrito=@ID_Distrito,ID_EstadoCivil=@ID_EstadoCivil,Ocupacion=@Ocupacion,Correo=@Correo
	WHERE	ID_Paciente= @ID_Paciente
GO


CREATE  PROC usp_ListarTipoDocumento
/*
Nombre: ListarTipoDocumento
Creado Por: Lsalvatierra
Proposito: Listar Tipo de Documentos.
Fecha: 10/03/2014
*/
AS

	SELECT		ID_TipoDocumento, 
				Nombre 
	FROM		dbo.TB_TIPO_DOCUMENTO
GO



CREATE PROC usp_VerificarPaciente 
/*
Nombre: usp_VerificarPaciente
Creado Por: Lsalvatierra
Proposito: Verificar Existencia del paciente.
Fecha: 10/03/2014
*/
@DNI				VARCHAR(11),
@ID_TipoDocumento	INT
AS
	SELECT ID_Paciente,ID_TipoDocumento,dbo.fn_DescTipoDocumento(ID_TipoDocumento) as TipoDocumento,dbo.fn_DescSexo(ID_Sexo) as DescSexo, dni_paciente,FechaNacimiento,Celular,TelefonoDomicilio,Direccion,ID_Sexo,nombres,ApellidoPat,ApellidoMat,ID_Pais,
			ID_Departamento,ID_Provincia,ID_Distrito,ID_EstadoCivil,Ocupacion,Correo FROM dbo.TB_PACIENTE WHERE dni_paciente = @DNI
	AND ID_TipoDocumento = @ID_TipoDocumento
	
go


CREATE PROC usp_ListarUbiGeo 
@MAS_CodTabla	VARCHAR(10),
@MAS_Valor		VARCHAR(10)
AS
	SELECT MAS_CodCampo, MAS_DesCorta FROM dbo.TB_MAESTRO_TABLAS
	WHERE MAS_CodTabla = @MAS_CodTabla 
	AND MAS_Valor = @MAS_Valor 
GO



CREATE PROC usp_RegistrarHistoriaClinica
/*
Nombre: usp_RegistrarPaciente
Creado Por: Lsalvatierra
Proposito: Registrar Paciente a Emergencia.
Fecha: 10/03/2014
*/
@IntervecionQ	VARCHAR(250),
@Alergias	VARCHAR(400),
@ID_Paciente	INT,
@ID_GrupoSanguineo	INT,
@ID_Procedencia		INT
AS
	DECLARE @ID_Historia	INT;
	
	INSERT INTO			dbo.TB_HISTORIA_CLINICA
						(IntervecionQ,Alergias,ID_Paciente,ID_GrupoSanguineo,FechaRegistro,Antecedentes) 
	VALUES				(@IntervecionQ,@Alergias,@ID_Paciente,@ID_GrupoSanguineo,GETDATE(),'')

	SELECT @ID_Historia = IDENT_CURRENT ('dbo.TB_HISTORIA_CLINICA');
	
	INSERT INTO			dbo.TB_DET_HISTORIA_CLINICA
						(ID_Historia,ID_Procedencia,FechaAtencion) 
	VALUES				(@ID_Historia,@ID_Procedencia,GETDATE())
GO


CREATE PROC usp_DetalleHistoriClinica 
@ID_Paciente	INT
AS
	SELECT ID_DetHistoria,a.ID_Historia,dbo.fn_DescProcedencia(ID_Procedencia) AS Procedencia,ISNULL(Diagnostico,'') AS Diagnostico, ISNULL(Tratamiento,'') AS Tratamiento, a.FechaAtencion
	FROM dbo.TB_DET_HISTORIA_CLINICA a, dbo.TB_HISTORIA_CLINICA b 
	WHERE A.ID_Historia = B.ID_Historia AND ID_Paciente = @ID_Paciente
GO


CREATE FUNCTION fn_DescProcedencia 
(
    @ID_Procedencia INT
)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @Nom_Procedencia VARCHAR(MAX)

    SELECT	@Nom_Procedencia = MAS_DesCorta
	  FROM	dbo.TB_MAESTRO_TABLAS
   WHERE	MAS_CodTabla = 'TB_TIPADM'
   AND		MAS_CodCampo = @ID_Procedencia
    RETURN @Nom_Procedencia
END
GO
CREATE FUNCTION fn_DescSexo 
(
    @ID_Procedencia INT
)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @Nom_Procedencia VARCHAR(MAX)

    SELECT	@Nom_Procedencia = MAS_DesCorta
	  FROM	dbo.TB_MAESTRO_TABLAS
   WHERE	MAS_CodTabla = 'TB_SEXO'
   AND		MAS_CodCampo = @ID_Procedencia
    RETURN @Nom_Procedencia
END
GO

CREATE FUNCTION fn_DescTipoDocumento 
(
    @ID_TipoDocumento INT
)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @Descripcion VARCHAR(MAX)

	
    SELECT	@Descripcion = a.Nombre
	  FROM	dbo.TB_TIPO_DOCUMENTO a
   WHERE	a.ID_TipoDocumento = @ID_TipoDocumento
    RETURN @Descripcion
END
GO

CREATE PROCEDURE usp_GetCartaXCodigo
@pcodCarta INT
AS
BEGIN

SELECT [ID_Carta]
      ,[ID_Orden_de_Procedimiento]
      ,[CodPresupuesto]
      ,[ID_Paciente]
      ,[CodAseguradora]
      ,[FecINiVigencia]
      ,[FecFinVigencia]
      ,[MontoCarta]
      ,[Detalle]
      ,[Estado]
  FROM [dbo].[TB_CARTA_GARANTIA] WHERE ID_Carta = @pcodCarta

END

GO

CREATE PROCEDURE usp_GetMedicos
AS
BEGIN
SELECT [ID_Medico]
      ,[nom_medico]
      ,[ape_medico]
	  ,NomCompleto = [nom_medico] + ' ' + [ape_medico] 
      ,[num_cmp]
      ,[email]
      ,[telefono]
      ,[Direccion]
      ,[Celular]
      ,[TelefonoDomicilio]
      ,[FechaCertificacion]
      ,[CentroEstudios]
      ,[CodigoColegiatura]
  FROM [dbo].[TB_MEDICO]
END

GO

CREATE PROCEDURE usp_GetEspecialidades
AS
BEGIN
SELECT [ID_Especialidad]
      ,[descripcion]
  FROM [dbo].[TB_ESPECIALIDAD]
END

GO

CREATE PROCEDURE usp_GetSedes
AS
BEGIN
SELECT [ID_Local]
      ,[nombre]
      ,[direccion]
  FROM [dbo].[TB_LOCAL]

END

GO

CREATE PROCEDURE usp_GetMotivosHospitaliza
AS
BEGIN
SELECT [ID_Motivo_Hospitalizacion]
      ,[DescripcionInternamiento]
      ,[Estado]
  FROM [dbo].[TB_MOTIVO_HOSPITALIZACION] WHERE  ESTADO <> '0'

END

GO

CREATE PROCEDURE usp_GetDataMaestroXCodigo
@CodTabla VARCHAR(10)
AS
BEGIN
SELECT [MAS_CodTabla]
      ,[MAS_CodCampo]
      ,[MAS_DesCorta]
      ,[MAS_DesLarga]
      ,[MAS_Valor]
      ,[MAS_Estado]
  FROM [dbo].[TB_MAESTRO_TABLAS]
  WHERE RTRIM([MAS_CodTabla]) = RTRIM(@CodTabla) AND MAS_CodCampo <> '00'

END

GO

CREATE PROCEDURE usp_GetOrdenHospXCodigo
@pIdOrden int
AS
BEGIN
SELECT O.[ID_Orden_Hospitalizacion]
      ,O.[FechaOrden]
      ,O.[Prevision]
      ,O.[ID_Estado]
      ,ISNULL(O.[Tratamiento], '') [Tratamiento]
      ,O.[NroDiasHospitalizacion]
      ,ISNULL(O.[ExamenesPreOperatorios], '') [ExamenesPreOperatorios]
      ,O.[ID_MedicoTratante]
	  ,(SELECT M.nom_medico + ' ' + M.ape_medico FROM TB_MEDICO  M WHERE  M.ID_Medico = O.ID_MedicoTratante) MedTratante
      ,O.[ID_MedicoTurno]
	  ,(SELECT M.nom_medico + ' ' + M.ape_medico FROM TB_MEDICO  M WHERE  M.ID_Medico = O.ID_MedicoTurno) MedTurno
      ,O.[ID_Paciente]
      ,ISNULL(O.[FechaHora], '') FechaHora
      ,ISNULL(O.[Observaciones], '') Observaciones
      ,ISNULL(O.[FechaHoraAlta], '') [FechaHoraAlta]
      ,O.[ID_Motivo_Hospitalizacion]
      ,O.[ID_Consulta]
      ,O.[ID_Local]
  FROM [dbo].[TB_ORDEN_HOSPITALIZACION] O 
 --INNER JOIN [TB_MEDICO] M ON O.ID_MedicoTratante = M.ID_Medico
  WHERE [ID_Orden_Hospitalizacion] = @pIdOrden
  AND RTRIM(O.ID_Estado) IN ('1','3')
END

GO

CREATE PROCEDURE usp_GetPacienteXIdPaciente
@pIdPaciente INT,
@pNroDoc VARCHAR(11)
AS
BEGIN

SELECT [ID_Paciente]
      ,[dni_paciente]
      ,[FechaNacimiento]
      ,ISNULL([Celular],'')[Celular]
      ,ISNULL([TelefonoDomicilio],'')[TelefonoDomicilio]
      ,[ID_Pais]
      ,[ID_Departamento]
      ,[ID_Provincia]
      ,[ID_Distrito]
      ,ISNULL([Direccion],'')[Direccion]
      ,[ID_Sexo]
      ,ISNULL([Ocupacion],'')[Ocupacion]
      ,[ID_TipoDocumento]
      ,[nombres]
      ,[ApellidoPat]
      ,[ApellidoMat]
      ,[ID_EstadoCivil]
      ,ISNULL([Correo],'')[Correo]
  FROM [dbo].[TB_PACIENTE]
  WHERE 
  ID_Paciente = @pIdPaciente --AND
  --GA_DocumentoIdentidad = @pNroDoc
  
END 

GO


CREATE PROCEDURE usp_GetListaCamas
AS
BEGIN
SELECT [ID_Cama],[NroCama],DesCama = 'Nº: '+NroCama + ' - Ubi.:'+[Ubicacion], [TipoCama],[Ubicacion],[Estado],[ID_Hoja_Ingreso_Hospitalizacion] FROM TB_CAMA WHERE ESTADO ='1'

END

GO

CREATE PROCEDURE usp_Insert_Ingreso_Internamiento
@FechaIngreso datetime,
@FechaAlta datetime,
@ID_Procedencia int,
@TipoOrden int,
@Tratamiento varchar(255),
@ID_Paciente int,
@ID_Orden_Hospitalizacion int,
@ID_Local int,
@ID_Carta int,
@ID_Cama int,
@ID_Especialidad int


AS
BEGIN

INSERT INTO [dbo].[TB_HOJA_INGRESO_HOSPITALIZACION]
           ([FechaIngreso]
           ,[FechaAlta]
           ,[ID_Procedencia]
           ,[TipoOrden]
           ,[Tratamiento]
           ,[ID_Paciente]
           ,[ID_Orden_Hospitalizacion]
           ,[ID_Local]
           ,[ID_Carta]
           ,[ID_Cama]
           ,[ID_Especialidad])
     VALUES
           (@FechaIngreso
           ,@FechaAlta 
           ,@ID_Procedencia
           ,@TipoOrden 
           ,@Tratamiento 
           ,@ID_Paciente
           ,@ID_Orden_Hospitalizacion 
           ,@ID_Local
           ,@ID_Carta
           ,@ID_Cama
           ,@ID_Especialidad)


UPDATE TB_ORDEN_HOSPITALIZACION SET ID_Estado='3' WHERE ID_Orden_Hospitalizacion = @ID_Orden_Hospitalizacion 
END

GO
CREATE PROCEDURE usp_Select_MedicoPorEspecialidad
@ID_Especialidad int
AS
BEGIN
SELECT M.ID_Medico,
       M.ape_medico + ', ' + M.nom_medico AS nom_medico
  FROM TB_MEDICO M INNER JOIN TB_MEDICOESPECIALIDAD ME
  ON M.ID_Medico=ME.ID_Medico
  WHERE ID_Especialidad = @ID_Especialidad
  END
  
 GO
CREATE PROCEDURE [dbo].[usp_Get_Orden_Procedimiento]
 @ID_Orden_de_Procedimiento int
AS
BEGIN

SELECT 
ID_Orden_de_Procedimiento
,NombreOrdenProcedimiento
,FechaOrdenProcedimiento
,CartaGarantia
,ID_Paciente
,ID_Medico
,Estado
,Aseguradora FROM TB_ORDEN_DE_PROCEDIMIENTO
WHERE ID_Orden_de_Procedimiento=@ID_Orden_de_Procedimiento

END

GO
CREATE PROCEDURE usp_Update_Orden_Procedimiento
 @ID_Orden_de_Procedimiento int
,@NombreOrdenProcedimiento varchar(255)
,@FechaOrdenProcedimiento datetime
,@CartaGarantia varchar(255)
,@ID_Paciente int
,@ID_Medico int
,@Estado varchar(255)
,@Aseguradora varchar(150)

AS
BEGIN

UPDATE TB_ORDEN_DE_PROCEDIMIENTO
SET
 NombreOrdenProcedimiento=@NombreOrdenProcedimiento
,FechaOrdenProcedimiento=@FechaOrdenProcedimiento
,CartaGarantia=@CartaGarantia
,ID_Paciente=@ID_Paciente
,ID_Medico=@ID_Medico
,Estado=@Estado
,Aseguradora=@Aseguradora
WHERE ID_Orden_de_Procedimiento=@ID_Orden_de_Procedimiento

END

GO
CREATE PROCEDURE usp_Insert_Orden_Procedimiento
 @ID_Orden_de_Procedimiento int
,@NombreOrdenProcedimiento varchar(255)
,@FechaOrdenProcedimiento datetime
,@CartaGarantia varchar(255)
,@ID_Paciente int
,@ID_Medico int
,@Estado varchar(255)
,@Aseguradora varchar(150)

AS
BEGIN

INSERT INTO TB_ORDEN_DE_PROCEDIMIENTO
(NombreOrdenProcedimiento
,FechaOrdenProcedimiento
,CartaGarantia
,ID_Paciente
,ID_Medico
,Estado
,Aseguradora)
     VALUES
(@NombreOrdenProcedimiento
,@FechaOrdenProcedimiento
,@CartaGarantia
,@ID_Paciente
,@ID_Medico
,@Estado
,@Aseguradora)


END


GO






CREATE PROCEDURE usp_GetOrdenesHospitalizacion
@pfecIni datetime,
@pfecFin datetime
AS
BEGIN
SELECT O.ID_Orden_Hospitalizacion
      ,O.FechaOrden
      ,O.Prevision
      ,O.Tratamiento
      ,O.NroDiasHospitalizacion
      ,O.ExamenesPreOperatorios
      ,O.ID_MedicoTratante
      ,(SELECT M.nom_medico + ' ' + M.ape_medico FROM TB_MEDICO  M WHERE  M.ID_Medico = O.ID_MedicoTratante) MedTratante
      ,O.ID_MedicoTurno
       ,(SELECT M.nom_medico + ' ' + M.ape_medico FROM TB_MEDICO  M WHERE  M.ID_Medico = O.ID_MedicoTurno) MedTurno
      ,O.ID_Paciente
      ,(SELECT P.nombres + ' ' + P.ApellidoPat FROM TB_PACIENTE  P WHERE  P.ID_Paciente = O.ID_Paciente) Paciente
      ,O.FechaHora
      ,O.Observaciones
      ,O.ID_Motivo_Hospitalizacion
      ,MO.DescripcionInternamiento
      ,O.ID_Consulta
      ,O.ID_Local
      ,O.ID_Estado
  FROM TB_ORDEN_HOSPITALIZACION O  INNER JOIN
  TB_MOTIVO_HOSPITALIZACION MO ON MO.ID_Motivo_Hospitalizacion = O.ID_Motivo_Hospitalizacion
  WHERE O.FechaOrden between @pfecIni AND @pfecFin
END

GO

CREATE PROCEDURE usp_InsertOrdenHospital
@Prevision varchar(255),
@NroDiasHospitalizacion int,
@ExamenesPreOperatorios varchar(255),
@ID_MedicoTratante int,
@ID_MedicoTurno int,
@ID_Paciente int,
@FechaHora datetime,
@ID_Motivo_Hospitalizacion int,
@ID_Consulta int,
@ID_Local int

AS
BEGIN
INSERT INTO [dbo].[TB_ORDEN_HOSPITALIZACION]
           ([FechaOrden]
           ,[Prevision]
           ,[Tratamiento]
           ,[NroDiasHospitalizacion]
           ,[ExamenesPreOperatorios]
           ,[ID_MedicoTratante]
           ,[ID_MedicoTurno]
           ,[ID_Paciente]
           ,[FechaHora]
           ,[Observaciones]
           ,[ID_Motivo_Hospitalizacion]
           ,[ID_Consulta]
           ,[ID_Local]
           ,[ID_Estado])
     VALUES
           (GETDATE()
           ,@Prevision
           ,''
           ,@NroDiasHospitalizacion
           ,@ExamenesPreOperatorios
           ,@ID_MedicoTratante
           ,@ID_MedicoTurno
           ,@ID_Paciente
           ,@FechaHora
           ,''
           ,@ID_Motivo_Hospitalizacion
           ,@ID_Consulta
           ,@ID_Local
           ,1)
           
END

GO


CREATE PROCEDURE [dbo].[usp_SelectAll_Paciente]
@ID_Paciente INT,
@dni_paciente VARCHAR(11),
@ID_TipoDocumento int,
@Observacion VARCHAR(500),
@nombres VARCHAR(50),
@ApellidoPat VARCHAR(100),
@ApellidoMat VARCHAR(100)
AS
BEGIN
SELECT ID_Paciente
      ,ISNULL(P.dni_paciente,'') as dni_paciente      
      ,ISNULL(TD.Nombre,'') AS NombreTipoDocumento 
      ,isnull(P.FechaNacimiento,'01/01/1900') as FechaNacimiento
      ,isnull(P.Celular,'') as Celular
      ,isnull(P.TelefonoDomicilio,'') as TelefonoDomicilio	
      ,isnull(P.ID_Pais,0) as ID_Pais
      ,isnull(P.ID_Departamento,0) as ID_Departamento
      ,isnull(P.ID_Provincia,0) as ID_Provincia
      ,isnull(P.ID_Distrito,0) as ID_Distrito
      ,isnull(Direccion,'') as Direccion
      ,isnull(ID_Sexo,0) as ID_Sexo
      ,isnull(P.Ocupacion,'') as Ocupacion
      ,isnull(P.ID_TipoDocumento,0) as ID_TipoDocumento
      ,isnull(P.nombres,'') as nombres
      ,isnull(P.ApellidoPat,'') as ApellidoPat
      ,isnull(P.ApellidoMat,'') as ApellidoMat
      ,isnull(P.ID_EstadoCivil,0) as ID_EstadoCivil
      ,isnull(P.Correo,'') as Correo
      ,isnull(P.Observacion,'') as Observacion
  FROM TB_PACIENTE P left join TB_TIPO_DOCUMENTO TD
       ON P.ID_TipoDocumento = TD.ID_TipoDocumento
  WHERE (@ID_Paciente=0 OR P.ID_Paciente = @ID_Paciente) AND        
        (@ID_TipoDocumento = 0 OR P.ID_TipoDocumento=@ID_TipoDocumento) AND
        (ISNULL(P.dni_paciente,'') LIKE '%' + @dni_paciente + '%') AND
        (ISNULL(P.Observacion,'') LIKE '%' + @Observacion + '%') AND
        (ISNULL(P.ApellidoPat,'') LIKE '%' + @ApellidoPat + '%') AND
        (ISNULL(P.ApellidoMat,'') LIKE '%' + @ApellidoMat + '%') AND
        (ISNULL(P.Nombres,'') LIKE '%' + @Nombres + '%') 
        
  END
GO


CREATE PROC usp_ActualizarPaciente
/*
Nombre: usp_ActualizarPaciente
Creado Por: Agaldos
Proposito: Actualizar Paciente a Emergencia.
Fecha: 20/03/2014
*/
@ID_Paciente int,
@DNI		VARCHAR(11),
@Nombres	VARCHAR(50),
@ApellidoP	VARCHAR(80),
@ApellidoM	VARCHAR(80),
@FechaNac	DATETIME,
@Celular	VARCHAR(10),
@Telefono	VARCHAR(10),
@Direccion	VARCHAR(150),
@Sexo		INT,
@IdTipoDoc	INT,
@ID_Pais		INT,
@ID_Departamento	INT,
@ID_Provincia		INT,
@ID_Distrito	INT,
@Observacion	VARCHAR(150)
AS
BEGIN
	UPDATE dbo.TB_PACIENTE	
	SET
	ID_TipoDocumento=@IdTipoDoc,
	dni_paciente=@DNI,
	FechaNacimiento=@FechaNac,
	Celular=@Celular,
	TelefonoDomicilio=@Telefono,
	Direccion=@Direccion,
	ID_Sexo=@Sexo,
	nombres=@Nombres,
	ApellidoPat=@ApellidoP,
	ApellidoMat=@ApellidoM,
	ID_Pais=@ID_Pais,
	ID_Departamento=@ID_Departamento,
	ID_Provincia=@ID_Provincia,
	ID_Distrito=@ID_Distrito,
	Observacion=@Observacion
	WHERE ID_Paciente =  @ID_Paciente					
END
GO