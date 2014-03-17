USE [BD_ClinicaInternacional]
GO

/****** Object:  StoredProcedure [dbo].[usp_GA_ListarMedicosPorTurno]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[usp_GA_ListarMedicosPorTurno]
@GE_TipoTurno nvarchar(5)
as 
SELECT     
TB_Medico.ID_Medico GE_Medico, 
TB_Medico.nom_medico GE_Nombre, 
TB_Medico.ape_medico GE_ApellidoPaterno, 
TB_Medico.num_cmp GE_DNI
FROM 
TB_Medico
GO
/****** Object:  StoredProcedure [dbo].[usp_GA_ListarAtencion]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[usp_GA_ListarAtencion]
@GE_DNI nvarchar(8),
@GE_ATENCION int
as
SELECT     TB_ATENCION_EMERGENCIA.ID_ATENCION, 
TB_ATENCION_EMERGENCIA.GE_FechaIngreso, 
TB_ATENCION_EMERGENCIA.ID_Cama, 
TB_PACIENTE.dni_paciente as DNIPaciente, 
TB_PACIENTE.ID_Paciente AS idpaciente, 
TB_PACIENTE.nombres +  ' ' +
TB_PACIENTE.ApellidoPat + ' ' +
TB_PACIENTE.ApellidoMat AS Paciente, 
TB_Medico.ID_Medico AS idmedico, 
TB_Medico.ape_medico + ' ' + 
TB_Medico.nom_medico  as Medico,
TB_Medico.num_cmp AS DNIMedico,
TB_ATENCION_EMERGENCIA.GE_DescripcionObservaciones,
TB_ATENCION_EMERGENCIA.ID_Cama IDCama
FROM  TB_ATENCION_EMERGENCIA INNER JOIN
TB_Medico ON TB_ATENCION_EMERGENCIA.ID_Medico = TB_Medico.ID_Medico INNER JOIN
TB_PACIENTE ON TB_ATENCION_EMERGENCIA.ID_Paciente = TB_PACIENTE.ID_Paciente
WHERE 
(@GE_DNI = ''  OR  TB_PACIENTE.dni_paciente = @GE_DNI )  
AND
(@GE_ATENCION = 0  OR  TB_ATENCION_EMERGENCIA.ID_ATENCION = @GE_ATENCION)
GO
/****** Object:  StoredProcedure [dbo].[usp_GA_EliminarAtencion]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GA_EliminarAtencion]
@GE_ATENCION int
as
DELETE FROM TB_ATENCION_EMERGENCIA WHERE ID_ATENCION = @GE_ATENCION
GO
/****** Object:  StoredProcedure [dbo].[usp_GA_CrearAtencion]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GA_CrearAtencion]
@GE_ATENCION int out,
@GE_FechaIngreso datetime,
@GE_Medico int,
@GE_Paciente int,
@GE_DescripcionObservaciones nvarchar(max),
@idcama int
AS
INSERT INTO [dbo].[TB_ATENCION_EMERGENCIA]
           ([GE_FechaIngreso]
           ,[ID_Medico]
           ,[ID_Paciente]
           ,[GE_DescripcionObservaciones], [ID_Cama])
     VALUES
           (@GE_FechaIngreso
           ,@GE_Medico
           ,@GE_Paciente
           ,@GE_DescripcionObservaciones,@idcama)
set @GE_ATENCION = scope_identity()
GO
/****** Object:  StoredProcedure [dbo].[usp_GA_ActualizarAtencion]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GA_ActualizarAtencion]
@GE_ATENCION int,
@GE_FechaIngreso datetime,
@GE_Medico int,
@GE_Paciente int,
@GE_DescripcionObservaciones nvarchar(max),
@idcama int
AS
DECLARE @idcamaant int
select @idcamaant=ID_Cama from TB_ATENCION_EMERGENCIA WHERE ID_ATENCION = @GE_ATENCION
update TB_CAMA SET ESTADO='1' WHERE ID_CAMA=@idcamaant
UPDATE [TB_ATENCION_EMERGENCIA]
SET [GE_FechaIngreso] = @GE_FechaIngreso,[ID_Medico] = @GE_Medico ,[ID_Paciente] = @GE_Paciente,
[GE_DescripcionObservaciones] = @GE_DescripcionObservaciones,
[Id_Cama]=@idcama
WHERE  ID_ATENCION = @GE_ATENCION
update TB_CAMA SET ESTADO='2' WHERE ID_CAMA=@idcama
GO
/****** Object:  StoredProcedure [dbo].[usp_retrieve_atencionmedica]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[usp_retrieve_atencionmedica](  
@PacienteDNI varchar(10),  
@NroAtencion varchar(10)  
)  
AS   
BEGIN  
SELECT a.*,b.*   
FROM tb_atencion_emergencia a, tb_paciente b   
WHERE a.id_paciente=b.id_paciente
and (@PacienteDNI='' or b.DNI_paciente=@PacienteDNI)  
and (a.id_atencion=@NroAtencion or @NroAtencion='')  
and GE_Estado<>'I'  
END  
go
/****** Object:  StoredProcedure [dbo].[usp_retrieveCO_Paciente]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_retrieveCO_Paciente]  
as  
select * from TB_Paciente  
go
/****** Object:  StoredProcedure [dbo].[usp_retrieve_medicina]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_retrieve_medicina]  
as  
select ID_Medicamento,GE_NombreMedicamento from TB_MEDICAMENTO
GO
/****** Object:  StoredProcedure [dbo].[usp_Retrieve_Examenes]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Retrieve_Examenes]  
as  
select ID_Tipo_Examen,descripcion from TB_TIPO_EXAMEN_MEDICO
GO
/****** Object:  StoredProcedure [dbo].[sp_insertServicioEmergencia]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_insertServicioEmergencia] 
@CodigoServicio as int,  
@NroAtencion  as int,  
@CodigoPaciente as int 
as  
insert into TB_SERVICIOS_DE_EMERGENCIA   
values(@NroAtencion,@CodigoPaciente) 
GO
/****** Object:  StoredProcedure [dbo].[sp_insertServicioEmergencia]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_insertDetalleOrdenExamen]  
@NroAtencion as int,  
@IdExamen  as int,  
@Status as int,  
@Fecha as date  
as  
insert into TB_DETALLE_SERVICIOS_EXAMENES
values(@NroAtencion,@IdExamen,@Status,@Fecha)  
GO
/****** Object:  StoredProcedure [dbo].[usp_selectServicioExamenes]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_insertDetalleOrdenMedicamentos]  
@CodigoServicio  as int,  
@NroAtencion as int,  
@CodigoMedicamento  as int,  
@Cantidad  as int, 
@Status as int,  
@Fecha as date
as  
insert into TB_DETALLE_SERVICIOS_MEDICAMENTOS
values(@NroAtencion,@CodigoMedicamento,@Cantidad,@Status,@Fecha) 
GO
/****** Object:  StoredProcedure [dbo].[usp_selectServicioExamenes]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_selectServicioExamenes] 
@CodigoServicio int
as  
select * from TB_DETALLE_SERVICIOS_EXAMENES
WHERE ID_SERVICIO = @CodigoServicio
GO
/****** Object:  StoredProcedure [dbo].[usp_selectServicioMedicamentos]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_selectServicioMedicamentos] 
@CodigoServicio int 
as  
select * from TB_DETALLE_SERVICIOS_MEDICAMENTOS
WHERE ID_SERVICIO = @CodigoServicio
GO
/****** Object:  StoredProcedure [dbo].[usp_GrabarEvaluacionDetalle]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GrabarEvaluacionDetalle]
@evaluaciondetalle int,
@verificacion int,
@conformidad bit,
@evaluacion int
as
IF (@evaluaciondetalle=0) 
	BEGIN		
		INSERT INTO TB_EvaluacionDetalle (GE_CodigoVerificacion,GE_Conformidad,GE_CodigoEvaluacion) 
		VALUES (@verificacion,@conformidad,@evaluacion)
		SELECT @@IDENTITY
	END
ELSE
	BEGIN
		UPDATE TB_EvaluacionDetalle SET GE_CodigoVerificacion=@verificacion,
		GE_Conformidad=@conformidad,GE_CodigoEvaluacion=@evaluacion
		WHERE GE_CodigoEvaluacionDetalle=@evaluaciondetalle
		SELECT @evaluaciondetalle
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarInstalacion]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ListarInstalacion]
as
Select [ID_CodigoInstalacion]
      ,[GE_Nombre]
from [TB_Ambiente] order by [GE_Nombre]
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarEstadoCama]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ActualizarEstadoCama]
@idcama int,
@enfermero varchar(255),
@estado varchar(255),
@fecha datetime,
@observacion varchar(max)
as
UPDATE TB_CAMA SET 
FechaActualizacion=@fecha,
EnfermeroActualizador=@enfermero,
Observacion=@observacion,
Estado=@estado where ID_Cama=@idcama
INSERT INTO TB_CAMA_HISTORIA (ID_Cama,FechaActualizacion,EnfermeroActualizador,Observacion) 
VALUES (@idcama,@fecha,@enfermero,@observacion)
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCamaHistoria]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ListarCamaHistoria]
@idcama int
as
Select 
FechaActualizacion,
EnfermeroActualizador,
Observacion from TB_CAMA_HISTORIA WHERE ID_Cama=@idcama
order by IdCamaHistoria desc
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCama]    Script Date: 03/13/2014 07:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ListarCama]
as
Select ID_Cama,
NroCama,
TipoCama,
Ubicacion,
FechaActualizacion,
EnfermeroActualizador,
Observacion,
Estado from TB_CAMA
GO


CREATE PROC [dbo].[usp_ListarEvaluacion]
as
select [GE_CodigoEvaluacion]
      ,[GE_CodigoInstalacion]
      ,[GE_Disponibilidad]
      ,[GE_Resultado]
      ,[GE_Observaciones]
      ,[GE_NombreEnfermeroAuxiliar]
      ,[GE_FechaEvaluacion] from TB_Evaluacion
GO


CREATE PROC usp_ObtenerEvaluacion  
@evaluacion int  
as  
Select [GE_CodigoEvaluacion]  
      ,[GE_CodigoInstalacion]  
      ,[GE_Disponibilidad]  
      ,[GE_Resultado]  
      ,[GE_Observaciones]  
      ,[GE_NombreEnfermeroAuxiliar]  
      ,[GE_FechaEvaluacion] from TB_Evaluacion
where  [GE_CodigoEvaluacion]=@evaluacion       
go

CREATE PROC usp_ObtenerEvaluacionDetalle  
@evaluacion int  
as  
Select d.GE_CodigoEvaluacionDetalle  
      ,d.GE_CodigoVerificacion  
      ,d.GE_Conformidad  
      ,d.GE_CodigoEvaluacion  
      ,v.GE_Item        
from [TB_EvaluacionDetalle] d left join [TB_LISTA_VERIFICACION] v  
on d.GE_CodigoVerificacion=v.GE_CodigoVerificacion        
where  [GE_CodigoEvaluacion]=@evaluacion       
go


CREATE PROC usp_GrabarEvaluacion  
@evaluacion int,  
@instalacion int,  
@disponibilidad int,  
@resultado int,  
@observaciones varchar(100),  
@nombreenfermeroauxiliar varchar(100),  
@fecha datetime  
as  
IF (@evaluacion=0)   
 BEGIN    
  INSERT INTO TB_Evaluacion (GE_CodigoInstalacion,GE_Disponibilidad,GE_Resultado,GE_Observaciones,  
  GE_NombreEnfermeroAuxiliar,GE_FechaEvaluacion)   
  VALUES (@instalacion,@disponibilidad,@resultado,@observaciones,@nombreenfermeroauxiliar,@fecha)  
  SELECT convert(int,@@IDENTITY) GE_CodigoEvaluacion  
 END  
ELSE  
 BEGIN  
  UPDATE TB_Evaluacion SET GE_CodigoInstalacion=@instalacion,  
  GE_Disponibilidad=@disponibilidad,GE_Resultado=@resultado,GE_Observaciones=@observaciones,  
  GE_NombreEnfermeroAuxiliar=@nombreenfermeroauxiliar,GE_FechaEvaluacion=@fecha  
  WHERE GE_CodigoEvaluacion=@evaluacion  
  SELECT @evaluacion GE_CodigoEvaluacion  
 END  
GO


CREATE PROC usp_ListarVerificacion  
@instalacion int  
as  
Select [GE_CodigoVerificacion]  
      ,[GE_Item]  
      ,[GE_CodigoInstalacion]  
from [TB_LISTA_VERIFICACION]   
where [GE_CodigoInstalacion]=@instalacion  
order by [GE_Item]   
GO

CREATE PROC [dbo].[usp_GA_BuscarPaciente]  
@GE_DNI nvarchar(8)  
as   
SELECT TOP 1 
	ID_Paciente GE_Paciente,
	nombres GE_Nombre,
	ApellidoPat GE_ApellidoPaterno,
	ApellidoMat GE_ApellidoMaterno,
	FechaNacimiento GE_FechaNacimiento,
	dni_paciente GE_DNI
 FROM TB_PACIENTE WHERE dni_paciente = @GE_DNI  
GO


create PROC [dbo].[usp_GA_CrearPaciente]  
@GE_Paciente int out,   
@GE_Nombre nvarchar(20),   
@GE_ApellidoPaterno nvarchar(50),   
@GE_ApellidoMaterno nvarchar(50),   
@GE_FechaNacimiento datetime,  
@GE_DNI nvarchar(8)  
AS  
INSERT INTO [TB_Paciente]  
           ([nombres]  
           ,[ApellidoPat]  
           ,[ApellidoMat]  
           ,[FechaNacimiento]  
           ,[dni_paciente],[DocumentoIdentidad],[ID_TipoDocumento])  
     VALUES  
           (@GE_Nombre  
           ,@GE_ApellidoPaterno  
           ,@GE_ApellidoMaterno  
           ,@GE_FechaNacimiento  
           ,@GE_DNI,@GE_DNI,1)  
  
set @GE_Paciente = scope_identity()
GO

create PROC usp_ListarServicioExamen
as
SELECT a.ID_ATENCION IdAtencion, d.id_servicio IdServicio,
 d.id_examen IdExamen,e.descripcion Examen,a.GE_FechaIngreso FechaIngreso,
 a.ID_Medico IdMedico,
  m.nom_medico +' ' +m.ape_medico Medico,
  a.ID_Paciente IdPaciente, p.nombres +' '+ p.ApellidoPat Paciente
 FROM TB_DETALLE_SERVICIOS_EXAMENES d 
 inner join TB_TIPO_EXAMEN_MEDICO e
	on d.ID_EXAMEN= E.ID_Tipo_Examen
 inner join TB_Atencion_Emergencia a
	on d.id_atencion = a.ID_ATENCION
inner join TB_MEDICO m
	on a.ID_Medico=m.ID_Medico
inner join TB_PACIENTE p
	on a.ID_Paciente = p.ID_Paciente	
where d.status=0
go	


create proc usp_ListarPaciente
as
select ID_Paciente IdPaciente, nombres + ' '+ ApellidoPat Paciente
 from TB_PACIENTE 
go

create proc usp_ListarTipoExamen
as
select ID_Tipo_Examen id,descripcion nombre from TB_TIPO_EXAMEN_MEDICO
go

create proc usp_GrabarOrdenExamen
@idatencion int,
@idmedico int,
@estado varchar(1),
@fecha datetime,
@idpaciente int,
@detalle varchar(200),
@idexamen int
as
insert into TB_ORDEN_EXAMEN_MEDICO (
      [ID_ATENCION]
      ,[ID_Medico]      
      ,[estado]      
      ,[GE_FechaSolicitud]
      ,[ID_Paciente]
      ,[GE_DetalleTecnico]
      ,[ID_Tipo_Examen])       
values (@idatencion,@idmedico,@estado,@fecha,@idpaciente,@detalle,@idexamen)
update TB_DETALLE_SERVICIOS_EXAMENES set TB_DETALLE_SERVICIOS_EXAMENES.status=1 where id_atencion=@idatencion
go

create proc usp_ListarServicioMedicamento
@idatencion
as
select [ID_SERVICIO]
      ,[ID_ATENCION]
      ,[ID_MEDICAMENTO]
      ,[CANTIDAD]
      ,[STATUS]
      ,[FECHA] from TB_DETALLE_SERVICIOS_MEDICAMENTOS
where id_atencion=@idatencion
go