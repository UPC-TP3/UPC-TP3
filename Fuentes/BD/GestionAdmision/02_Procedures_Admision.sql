USE [BD_ClinicaInternacional]

IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[usp_GetOrdenHospXCodigo]') AND xtype in (N'P', N'PC')) 
DROP PROCEDURE [dbo].[usp_GetOrdenHospXCodigo]
GO
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[usp_GetPacienteXIdPaciente]') AND xtype in (N'P', N'PC')) 
DROP PROCEDURE [dbo].[usp_GetPacienteXIdPaciente]
GO

IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[usp_GetListaCamas]') AND xtype in (N'P', N'PC')) 
DROP PROCEDURE [dbo].usp_GetListaCamas
GO

IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[usp_Insert_Ingreso_Internamiento]') AND xtype in (N'P', N'PC')) 
DROP PROCEDURE [dbo].usp_Insert_Ingreso_Internamiento
GO

-------------------------------------------------
-------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE usp_GetOrdenHospXCodigo
@pIdOrden int
AS
BEGIN
SELECT ID_Orden_Hospitalizacion
      ,GA_FechaOrden
      ,GA_Prevision
      ,GA_Motivo
      ,GA_Tratamiento
      ,GA_NroDiasHospitalizacion
      ,GA_ExamenesPreOperatorios
      ,GA_MedicoTratante
      ,GA_MedicoTurno
      ,ID_Paciente
      ,FechaHora
      ,Observaciones
      ,FechaHoraAlta
      ,ID_Motivo_Hospitalizacion
      ,GA_Procedencia
  FROM BD_ClinicaInternacional.dbo.TB_ORDEN_HOSPITALIZACION
  WHERE ID_Orden_Hospitalizacion = @pIdOrden
END

GO

-------------------------------------------------
-------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE usp_GetPacienteXIdPaciente
@pIdPaciente INT,
@pNroDoc VARCHAR(10)
AS
BEGIN

SELECT ID_Paciente
      ,GA_Nombre
      ,GA_DocumentoIdentidad
      ,GA_EstadoCivil
      ,GA_FechaNacimiento
      ,GA_Celular
      ,GA_TelefonoDomicilio
      ,GA_Pais
      ,GA_Departamento
      ,GA_Provincia
      ,GA_Distrito
      ,GA_Direccion
      ,GA_Sexo
      ,GA_Ocupacion
      ,ID_TipoDocumento
      ,dni_paciente
      ,nombres
      ,ApellidoPat
      ,ApellidoMat
      ,ISNULL(GA_Correo,'') GA_Correo
  FROM BD_ClinicaInternacional.dbo.TB_PACIENTE
  WHERE 
  ID_Paciente = @pIdPaciente --AND
  --GA_DocumentoIdentidad = @pNroDoc
  
END 

GO


-------------------------------------------------
-------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE usp_GetListaCamas
AS
BEGIN
SELECT * FROM TB_CAMA
END



-------------------------------------------------
-------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE usp_Insert_Ingreso_Internamiento
(@GA_FechaIngreso DATETIME,
@GA_HoraIngreso  DATETIME,
@GA_TipoOrden  varchar(255),
@GA_Tratamiento varchar(255),
@GA_ViaIngreso varchar(255),
@ID_Paciente int,
@GA_CartaGarantia INT)
AS
BEGIN

INSERT INTO [TB_HOJA_INGRESO_HOSPITALIZACION]
           ([GA_FechaIngreso]
           ,[GA_HoraIngreso]
           ,[GA_ViaIngreso]
           ,[GA_TipoOrden]
           ,[GA_Tratamiento]
           ,[ID_Paciente]
           ,[GA_CartaGarantia])
     VALUES
           (@GA_FechaIngreso
           ,@GA_HoraIngreso
           ,@GA_ViaIngreso
           ,@GA_TipoOrden
           ,@GA_Tratamiento
           ,@ID_Paciente
           ,@GA_CartaGarantia)


END

GO


