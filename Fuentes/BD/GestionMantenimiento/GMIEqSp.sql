

--=============================================================================================================
--================================================ STORES PROCEDURES ==========================================
--=============================================================================================================

--================================== INSERTAR SOLICITUD DE MANTENIMIENTO ======================================


CREATE PROCEDURE SP_Insertar_Solicitud_de_Mantenimiento(
@GM_Fecha_Creacion Char(8), 
@GM_CodigoSolicitante Char(8),
@GM_CodigoBeneficiario Char(8), 
@Codigo_CC Char(8), 
@GM_Tipo_Servicio Varchar(50),
@GM_Tipo_Mantenimiento varchar(100),
@GM_Numero_Equipo Char(8), 
@GM_FechaIncidencia Char(8), 
@GM_Detalle_Servicio Varchar(100), 
@GM_Observación Varchar(100),
@GM_Especificacion Varchar(200),
@GM_Estado int

)
AS

BEGIN

BEGIN TRY
INSERT INTO TB_Solicitud_Mantenimiento(
	[GM_Fecha_Creacion],
	[GM_CodigoSolicitante],
	[GM_CodigoBeneficiario],
	[Codigo_CC],
	[GM_Tipo_Servicio],
	[GM_Tipo_Mantenimiento],
	[GM_Numero_Equipo],
	[GM_FechaIncidencia],
	[GM_Detalle_Servicio],
	[GM_Observación],
	[GM_Especificacion],
	[GM_Estado])
  VALUES
  ( @GM_Fecha_Creacion, 
@GM_CodigoSolicitante,
@GM_CodigoBeneficiario, 
@Codigo_CC, 
@GM_Tipo_Servicio,
@GM_Tipo_Mantenimiento,
@GM_Numero_Equipo, 
@GM_FechaIncidencia, 
@GM_Detalle_Servicio, 
@GM_Observación,
@GM_Especificacion,
@GM_Estado)

  SELECT '0'

END TRY

BEGIN CATCH
	SELECT '1'
END CATCH

END

--======================================================================================

--SP_Insertar_Solicitud_de_Mantenimiento '20140305','EMP00001','EMP00002','CECO0001','TISE0001','EQUI0001','20140305','DETALLESERVICIO','OBSERVACION',1

--======================================================================================

--select*from TB_Solicitud_Mantenimiento
 
--======================================================================================



go

--================================== MODIFICAR SOLICITUD DE MANTENIMIENTO ======================================


CREATE PROCEDURE SP_Modificar_Solicitud_de_Mantenimiento(
@GM_NroSolicitud Int,
@GM_Fecha_Creacion Char(8), 
@GM_CodigoSolicitante Char(8),
@GM_CodigoBeneficiario Char(8), 
@Codigo_CC Char(8), 
@GM_Tipo_Servicio Varchar(50),
@GM_Numero_Equipo Char(8), 
@GM_FechaIncidencia Char(8), 
@GM_Detalle_Servicio Varchar(100), 
@GM_Observación Varchar(100),
@GM_Estado int)
AS
BEGIN

BEGIN TRY
  UPDATE TB_Solicitud_Mantenimiento 
  SET  
GM_Fecha_Creacion = @GM_Fecha_Creacion, 
GM_CodigoSolicitante = @GM_CodigoSolicitante,
GM_CodigoBeneficiario = @GM_CodigoBeneficiario,
Codigo_CC = @Codigo_CC, 
GM_Tipo_Servicio = @GM_Tipo_Servicio,
GM_Numero_Equipo = @GM_Numero_Equipo, 
GM_FechaIncidencia = @GM_FechaIncidencia, 
GM_Detalle_Servicio = @GM_Detalle_Servicio, 
GM_Observación = @GM_Observación,
GM_Estado = @GM_Estado
  WHERE 
  GM_NroSolicitud = @GM_NroSolicitud

IF @@ROWCOUNT = 0
  SELECT '1'
ELSE
  SELECT '0'

  
END TRY

BEGIN CATCH
	SELECT '1'
END CATCH
  
END


go
--SP_Modificar_Solicitud_de_Mantenimiento '2','20140304','EMP00001','EMP00002','CECO0001','TISE0001','EQUI0001','20140305','DETALLESERVICIO','OBSERVACION',1
 

--================================== ELIMINAR SOLICITUD DE MANTENIMIENTO ======================================

create PROCEDURE SP_Eliminar_Solicitud_de_Mantenimiento(
@GM_NroSolicitud int,
@GM_Observación varchar(100)
)
AS
BEGIN

BEGIN TRY

  UPDATE TB_Solicitud_Mantenimiento 
  SET 
  GM_Estado = '3',
  GM_Observación = @GM_Observación
  WHERE 
  GM_NroSolicitud = @GM_NroSolicitud

  IF @@ROWCOUNT = 0
	SELECT '1'
  ELSE
	SELECT '0'


END TRY
BEGIN CATCH
	SELECT '1'
END CATCH

END



-- SP_Eliminar_Solicitud_de_Mantenimiento '2'


-----Procedures Faltantes  Luis Muñoz

go
create procedure SP_Buscar_Solicitud_de_Mantenimiento(
 @GM_NroSolicitud char(8))
as
begin
	select
	GM_NroSolicitud
	,GM_Fecha_Creacion
	,GM_CodigoSolicitante
	,GM_CodigoBeneficiario
	,Codigo_CC
	,GM_Tipo_Servicio
	,GM_Numero_Equipo
	,GM_FechaIncidencia
	,GM_Detalle_Servicio
	,GM_Observación
	,GM_Estado
	from  dbo.TB_Solicitud_Mantenimiento
	where GM_NroSolicitud = @GM_NroSolicitud

end


go



Create procedure SP_Listar_Solicitud_de_Mantenimiento(
@GM_FechaInicio Char(8),
@GM_FechaFin Char(8)
)
as
begin

select GM_NroSolicitud 
,GM_Fecha_Creacion
,GM_Tipo_Servicio
,case GM_Tipo_Servicio when 1 then 'Equipo Médico' else 'Infraestructura' end Tipo_Servicio
,GM_Especificacion
,GM_Estado
,case GM_Estado when 1 then 'Registrado' when 2 then 'Aprobado' when 3 then 'Anulado' when 4 then 'Atendido' end Estado
from tb_solicitud_mantenimiento a
where a.GM_Fecha_Creacion between @GM_FechaInicio and @GM_FechaFin
--and GM_Estado<>3
end

CREATE procedure SP_Listar_Solicitud_de_Mantenimiento_Estado(
@GM_Estado int
)
as
begin

select GM_NroSolicitud 
,GM_Fecha_Creacion
,GM_Tipo_Servicio
,case GM_Tipo_Servicio when 1 then 'Equipo Médico' else 'Infraestructura' end Tipo_Servicio
,GM_Especificacion
,GM_Estado
,case GM_Estado when 1 then 'Registrado' when 2 then 'Aprobado' when 3 then 'Anulado' when 4 then 'Atendido' end Estado
from tb_solicitud_mantenimiento a
where GM_Estado=@GM_Estado
end


------------PROCEDURES FREDDY -------------

--===============================================================================================================
--=================================SP_Listar_Orden_de_Trabajo==================================================
--===============================================================================================================

--SP_Listar_Orden_de_Trabajo '13032014','16032014'

--SELECT*FROM TB_ORDEN_TRABAJO

GO


CREATE PROCEDURE [dbo].[SP_Listar_Orden_de_Trabajo]
(@GM_FechaInicio char(8),
@GM_FechaFin char(8))
AS

BEGIN

declare @fechainicio as char(8)
declare @fechafin as char(8) 
declare @fechacreacion as char(8)

set @fechainicio = SubString(@GM_FechaInicio,5,4) + SubString(@GM_FechaInicio,3,2) + SubString(@GM_FechaInicio,1,2)
set @fechafin = SubString(@GM_FechaFin,5,4)+ SubString(@GM_FechaFin,3,2)+ SubString(@GM_FechaFin,1,2)


Select ('Orden N°' + CAST(GM_NroOrden as varchar)) as GM_NroOrden, 
('Solicitud N° ' + CAST(GM_NroSolicitud AS VARCHAR)) AS GM_NroSolicitud, 
(SubString(GM_Fecha_Creacion,7,2) + SubString(GM_Fecha_Creacion,5,2) + SubString(GM_Fecha_Creacion,1,4)) AS GM_Fecha_Creacion,
'Registrado' AS GM_Estado
FROM TB_ORDEN_TRABAJO 
WHERE GM_Fecha_Creacion >= @fechainicio and GM_Fecha_Creacion <= @fechafin

END
GO

--===============================================================================================================
--=================================SP_Buscar_Orden_de_Trabajo==================================================
--===============================================================================================================

--SP_Buscar_Orden_de_Trabajo 4

--SELECT*FROM TB_ORDEN_TRABAJO

go


CREATE PROCEDURE [SP_Buscar_Orden_de_Trabajo]
	@GM_NroOrden int
AS

BEGIN

Select GM_NroOrden, GM_NroSolicitud, GM_Fecha_Creacion, GM_CodigoSolicitante, GM_Fecha_Inicio, GM_Fecha_Fin, GM_Estado
FROM TB_ORDEN_TRABAJO 
WHERE GM_NroOrden = @GM_NroOrden

END
go

--===============================================================================================================
--=================================SP_Insertar_Orden_de_Trabajo==================================================
--===============================================================================================================

--SP_Insertar_Orden_de_Trabajo 1,'20140320','TRA00001','20140314','20140315','DSFADFAF','ALTA','COMENTARIO DE PRUEBA','PENDIENTE'
-- 

--SELECT*FROM TB_ORDEN_TRABAJO


CREATE PROCEDURE [dbo].[SP_Insertar_Orden_de_Trabajo]
(
@GM_NroSolicitud int,
@GM_Fecha_Creacion char(8),
@GM_CodigoSolicitante char(8),
@GM_Fecha_Inicio char(8),
@GM_Fecha_Fin char(8),
@GM_Empleados_Asociados Varchar(200),
@GM_Prioridad Varchar(50),
@GM_Comentarios Varchar(100),
@GM_Estado Varchar(100))

AS

BEGIN

declare @fechainicio as char(8)
declare @fechafin as char(8) 
declare @fechaCreacion as char(8) 


--set @fechainicio = SubString(@GM_Fecha_Inicio,5,4) + SubString(@GM_Fecha_Inicio,3,2) + SubString(@GM_Fecha_Inicio,1,2)
--set @fechafin = SubString(@GM_Fecha_Fin,5,4)+ SubString(@GM_Fecha_Fin,3,2)+ SubString(@GM_Fecha_Fin,1,2)
--set @fechaCreacion = SubString(@GM_Fecha_Creacion,5,4)+ SubString(@GM_Fecha_Creacion,3,2)+ SubString(@GM_Fecha_Creacion,1,2)
BEGIN TRY
INSERT INTO TB_ORDEN_TRABAJO

  VALUES
  ( @GM_NroSolicitud, 
@fechaCreacion,
@GM_CodigoSolicitante, 
@fechainicio, 
@fechafin,
@GM_Empleados_Asociados, 
@GM_Prioridad, 
@GM_Comentarios, 
@GM_Estado)

update TB_SOLICITUD_MANTENIMIENTO set GM_Estado=4 where GM_NroSolicitud=@GM_NroSolicitud

SELECT '0'

END TRY

BEGIN CATCH
	SELECT '1'
END CATCH

END

--===============================================================================================================
--=================================SP_Actualizar_Orden_de_Trabajo=================================================
--===============================================================================================================

--SP_Actualizar_Orden_de_Trabajo 3,1,'20140320','TRA00001','20140320','20140322','DSFADFAF','ALTA','COMENTARIO DE PRUEBA','ACTIVO'

--SELECT*FROM TB_ORDEN_TRABAJO
go
CREATE PROCEDURE [dbo].[SP_Actualizar_Orden_de_Trabajo]
(@GM_NroOrden int,
@GM_NroSolicitud char(8),
@GM_Fecha_Creacion char(8),
@GM_CodigoSolicitante char(8),
@GM_Fecha_Inicio char(8),
@GM_Fecha_Fin char(8),
@GM_Empleados_Asociados varchar(200),
@GM_Prioridad varchar(50),
@GM_Comentarios varchar(100),
@GM_Estado varchar(100))

AS

BEGIN

BEGIN TRY

UPDATE TB_ORDEN_TRABAJO 
SET GM_NroSolicitud = @GM_NroSolicitud, GM_Fecha_Creacion = @GM_Fecha_Creacion, GM_CodigoSolicitante = @GM_CodigoSolicitante,
GM_Fecha_Inicio = @GM_Fecha_Inicio, GM_Fecha_Fin = @GM_Fecha_Fin, GM_Empleados_Asociados = @GM_Empleados_Asociados,
GM_Prioridad = @GM_Prioridad, GM_Comentarios = @GM_Comentarios, @GM_Estado = @GM_Estado
WHERE GM_NroOrden = @GM_NroOrden

  SELECT '0'

END TRY

BEGIN CATCH
	SELECT '1'
END CATCH

END

--===============================================================================================================
--=================================SP_Eliminar_Orden_de_Trabajo=================================================
--===============================================================================================================

--SP_Eliminar_Orden_de_Trabajo 3
go
CREATE PROCEDURE [dbo].[SP_Eliminar_Orden_de_Trabajo]
(@GM_NroOrden int)

AS

BEGIN

BEGIN TRY

DELETE FROM TB_ORDEN_TRABAJO 
WHERE GM_NroOrden = @GM_NroOrden

  SELECT '0'

END TRY

BEGIN CATCH
	SELECT '1'
END CATCH

END

Go

--------------------- PROCEDURES DARWIN ---------------------

GO

CREATE procedure [dbo].[SP_Buscar_Evaluar_Solicitud_Mantenimiento](
 @GM_NroSolicitud char(8))
as
begin
	select
	GM_NroSolicitud
	, GM_Fecha_Creacion
	, GM_Tipo_Servicio
	, case GM_Tipo_Servicio when 1 then 'Equipo Médico' else 'Infraestructura' end GM_Tipo_Servicio_Desc
	--, GM_Tipo_Mantenimiento
	, GM_Numero_Equipo
	, GM_FechaIncidencia
	, GM_Detalle_Servicio
	, GM_Observación
	--, GM_Prioridad
	, GM_Estado
	,case GM_Estado when 1 then 'Registrado' when 2 then 'Atendido' else 'Anulado' end GM_Estado_Desc
	from  dbo.TB_Solicitud_Mantenimiento
	where GM_NroSolicitud = @GM_NroSolicitud

end


GO


GO






--SP_Insertar_Solicitud_de_Mantenimiento '20140305','EMP00001','TISE0001','TIMANT001','EQUI0001','20140305','DETALLESERVICIO','OBSERVACION'

CREATE procedure [dbo].[SP_ConsultaESM_x_NroSolicitud](
@GM_NroSolicitud int
)
as
begin

select GM_NroSolicitud 
,GM_Fecha_Creacion
,GM_FechaIncidencia
,GM_Tipo_Servicio
,case GM_Tipo_Servicio when 1 then 'Equipo Médico' else 'Infraestructura' end GM_Tipo_Servicio_Desc
--,GM_Tipo_Mantenimiento
,GM_Observación
--,GM_Prioridad
,GM_Estado
,case GM_Estado when 1 then 'Registrado' when 2 then 'Atendido' else 'Anulado' end GM_Estado_Desc
from tb_solicitud_mantenimiento a
where a.GM_NroSolicitud = @GM_NroSolicitud
end

GO

GO





--SP_Insertar_Solicitud_de_Mantenimiento '20140305','EMP00001','TISE0001','TIMANT001','EQUI0001','20140305','DETALLESERVICIO','OBSERVACION'

CREATE procedure [dbo].[SP_Listar_Evaluar_Solicitud_Mantenimiento](
@GM_FechaInicio Char(8),
@GM_FechaFin Char(8)
)
as
begin

select GM_NroSolicitud 
,GM_Fecha_Creacion
,GM_FechaIncidencia
,GM_Tipo_Servicio
,case GM_Tipo_Servicio when 1 then 'Equipo Médico' else 'Infraestructura' end GM_Tipo_Servicio_Desc
--,GM_Tipo_Mantenimiento
,GM_Observación
--,GM_Prioridad
,GM_Estado
,case GM_Estado when 1 then 'Registrado' when 2 then 'Aceptado' when 3 then 'Anulado' else 'xxx' end GM_Estado_Desc
from tb_solicitud_mantenimiento a
where a.GM_FechaIncidencia between @GM_FechaInicio and @GM_FechaFin
end
GO



CREATE PROCEDURE [dbo].[SP_Modificar_Evaluar_Solicitud_Mantenimiento](
@GM_NroSolicitud int,
@GM_Observacion Varchar(100),
--@GM_Prioridad Varchar(50),
@GM_Estado Varchar(50))
AS
BEGIN

BEGIN TRY
  UPDATE TB_Solicitud_Mantenimiento 
  SET GM_Observación = @GM_Observacion,
      --GM_Prioridad = @GM_Prioridad,
      GM_Estado = @GM_Estado
  WHERE 
  GM_NroSolicitud = @GM_NroSolicitud

IF @@ROWCOUNT = 0
  SELECT '1'
ELSE
  SELECT '0'

  
END TRY

BEGIN CATCH
	SELECT '1'
END CATCH
  
END

GO



/*

SET IDENTITY_INSERT [dbo].[TB_SOLICITUD_MANTENIMIENTO] ON
INSERT [dbo].[TB_SOLICITUD_MANTENIMIENTO] ([GM_NroSolicitud], [GM_Fecha_Creacion], [GM_CodigoSolicitante], [GM_CodigoBeneficiario], [Codigo_CC], [GM_Tipo_Servicio], [GM_Tipo_Mantenimiento], [GM_Numero_Equipo], [GM_FechaIncidencia], [GM_Detalle_Servicio], [GM_Observacion], [GM_Estado]) VALUES (1, N'16032014', N'us001   ', N'us001   ', N'CC0001  ', N'1', NULL, N'5       ', N'28032014', N'aaaaaaaaaa', N'bbbbbbb 123asdf 123', 1)
INSERT [dbo].[TB_SOLICITUD_MANTENIMIENTO] ([GM_NroSolicitud], [GM_Fecha_Creacion], [GM_CodigoSolicitante], [GM_CodigoBeneficiario], [Codigo_CC], [GM_Tipo_Servicio], [GM_Tipo_Mantenimiento], [GM_Numero_Equipo], [GM_FechaIncidencia], [GM_Detalle_Servicio], [GM_Observacion], [GM_Estado]) VALUES (2, N'16032014', N'us001   ', N'us001   ', N'CC0001  ', N'2', NULL, N'6       ', N'26032014', N'detalle del servicio', N'observaciones 123123123', 1)
INSERT [dbo].[TB_SOLICITUD_MANTENIMIENTO] ([GM_NroSolicitud], [GM_Fecha_Creacion], [GM_CodigoSolicitante], [GM_CodigoBeneficiario], [Codigo_CC], [GM_Tipo_Servicio], [GM_Tipo_Mantenimiento], [GM_Numero_Equipo], [GM_FechaIncidencia], [GM_Detalle_Servicio], [GM_Observacion], [GM_Estado]) VALUES (3, N'16032014', N'us001   ', N'us001   ', N'CC0001  ', N'2', NULL, N'3       ', N'21032014', N'dsaafdas', N'se anula para postergar el mantenimiento 123', 1)
INSERT [dbo].[TB_SOLICITUD_MANTENIMIENTO] ([GM_NroSolicitud], [GM_Fecha_Creacion], [GM_CodigoSolicitante], [GM_CodigoBeneficiario], [Codigo_CC], [GM_Tipo_Servicio], [GM_Tipo_Mantenimiento], [GM_Numero_Equipo], [GM_FechaIncidencia], [GM_Detalle_Servicio], [GM_Observacion], [GM_Estado]) VALUES (4, N'16032014', N'us001   ', N'us001   ', N'CC0001  ', N'1', NULL, N'5       ', N'02032014', N'aaaaaaaaaa', N'bbbbbbb 123asdf 123', 1)
INSERT [dbo].[TB_SOLICITUD_MANTENIMIENTO] ([GM_NroSolicitud], [GM_Fecha_Creacion], [GM_CodigoSolicitante], [GM_CodigoBeneficiario], [Codigo_CC], [GM_Tipo_Servicio], [GM_Tipo_Mantenimiento], [GM_Numero_Equipo], [GM_FechaIncidencia], [GM_Detalle_Servicio], [GM_Observacion], [GM_Estado]) VALUES (5, N'16032014', N'us001   ', N'us001   ', N'CC0001  ', N'2', NULL, N'6       ', N'06032014', N'detalle del servicio', N'observaciones 123123123', 1)
INSERT [dbo].[TB_SOLICITUD_MANTENIMIENTO] ([GM_NroSolicitud], [GM_Fecha_Creacion], [GM_CodigoSolicitante], [GM_CodigoBeneficiario], [Codigo_CC], [GM_Tipo_Servicio], [GM_Tipo_Mantenimiento], [GM_Numero_Equipo], [GM_FechaIncidencia], [GM_Detalle_Servicio], [GM_Observacion], [GM_Estado]) VALUES (6, N'16032014', N'us001   ', N'us001   ', N'CC0001  ', N'2', NULL, N'3       ', N'07032014', N'dsaafdas', N'se anula para postergar el mantenimiento 123', 1)
SET IDENTITY_INSERT [dbo].[TB_SOLICITUD_MANTENIMIENTO] OFF

*/




/*
Procedures: Juan Carlos
*/
CREATE PROCEDURE SP_Monitorear_Orden_de_Trabajo
	@GM_Estado int
AS
BEGIN
	Select T0.GM_NroOrden
		,T0.GM_NroSolicitud
		,T0.GM_Fecha_Creacion
		,T0.GM_CodigoSolicitante
		,T0.GM_Empleados_Asociados
		,T0.GM_Fecha_Inicio
		,T0.GM_Fecha_Fin
		,T0.GM_Prioridad
		,T0.GM_Comentarios
		,T0.GM_Estado
		,isnull(T1.GM_Tipo_Mantenimiento,'')	NomTiposervicio
		,isnull(T1.GM_Especificacion,'') GM_Especificacion
	FROM TB_ORDEN_TRABAJO T0
	left join TB_SOLICITUD_MANTENIMIENTO T1 on T0.GM_NroSolicitud=T1.GM_NroSolicitud
		where T0.GM_Estado in (1,2,3,4)
			and (
				(@GM_Estado=0)
				or
				(@GM_Estado<>0 and T0.GM_Estado = @GM_Estado)
				)
	ORDER BY T0.GM_Estado,T0.GM_Fecha_Creacion,T0.GM_NroOrden
END
GO


CREATE PROCEDURE [dbo].[SP_Cerrar_Orden_de_Trabajo]
	@GM_NroOrden int
AS
BEGIN

BEGIN TRY
	UPDATE TB_ORDEN_TRABAJO 
	SET GM_Estado = '4'
	WHERE GM_NroOrden = @GM_NroOrden

	SELECT '0'
END TRY

BEGIN CATCH
	SELECT '1'
END CATCH

END
GO

/*
Procedures: Jose Luis
*/
CREATE PROCEDURE [dbo].[SP_Listar_Empleado]
	--Parametros
	@ID_Especialidad int,
	@ID_Disponibilidad int
AS
BEGIN
	Select [ID_Empleado]
      ,[E_Nombre]
      ,[E_Apellido_Paterno]
      ,[E_Apellido_Materno]
      ,[E_dni]
      ,[E_Direccion]
      ,[E_Telefono]
      ,[E_Tipo_Empleado]
      ,[E_Fecha_Nacimiento]
      ,[E_Correo]
      ,[Apellidos_Empleado]
      ,[Nombres_Empleado]
      ,[Cargo_Empleado]
      ,[Correo_Empleado]
      ,[Estado]
      ,[ID_TURNOEMERGENCIA]
      ,[ID_Tipo_Empleado]
      --,[ID_Especialidad]
	FROM TB_EMPLEADO
	--WHERE [ID_Especialidad]=@ID_Especialidad
		--and Estado = @ID_Disponibilidad
END
