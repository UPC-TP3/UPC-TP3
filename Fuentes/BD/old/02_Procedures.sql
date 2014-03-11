
USE TP3_Emergencias
GO

/********************************************************/
IF OBJECT_ID('usp_ListarEvaluacion', 'P') IS NOT NULL
	DROP PROC usp_ListarEvaluacion
GO
CREATE PROC usp_ListarEvaluacion
as
Select [GE_CodigoEvaluacion]
      ,[GE_CodigoInstalacion]
      ,[GE_Disponibilidad]
      ,[GE_Resultado]
      ,[GE_Observaciones]
      ,[GE_NombreEnfermeroAuxiliar]
      ,[GE_FechaEvaluacion] from [CL_ES_GE_Evaluacion] order by [GE_CodigoEvaluacion]
GO

/********************************************************/
IF OBJECT_ID('usp_ObtenerEvaluacion', 'P') IS NOT NULL
	DROP PROC usp_ObtenerEvaluacion
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
      ,[GE_FechaEvaluacion] from [CL_ES_GE_Evaluacion]
where  [GE_CodigoEvaluacion]=@evaluacion     
GO

/********************************************************/
IF OBJECT_ID('usp_ObtenerEvaluacionDetalle', 'P') IS NOT NULL
	DROP PROC usp_ObtenerEvaluacionDetalle
GO
CREATE PROC usp_ObtenerEvaluacionDetalle
@evaluacion int
as
Select d.GE_CodigoEvaluacionDetalle
      ,d.GE_CodigoVerificacion
      ,d.GE_Conformidad
      ,d.GE_CodigoEvaluacion
      ,v.GE_Item      
from [CL_ES_GE_EvaluacionDetalle] d left join [CL_ES_GE_Lista_Verificacion] v
on d.GE_CodigoVerificacion=v.GE_CodigoVerificacion      
where  [GE_CodigoEvaluacion]=@evaluacion     
GO

/********************************************************/
IF OBJECT_ID('usp_ListarInstalacion', 'P') IS NOT NULL
	DROP PROC usp_ListarInstalacion
GO
CREATE PROC usp_ListarInstalacion
as
Select [GE_CodigoInstalacion]
      ,[GE_Nombre]
from [CL_ES_GE_Instalacion] order by [GE_Nombre] 
GO


/********************************************************/
IF OBJECT_ID('usp_ListarVerificacion', 'P') IS NOT NULL
	DROP PROC usp_ListarVerificacion
GO
CREATE PROC usp_ListarVerificacion
@instalacion int
as
Select [GE_CodigoVerificacion]
      ,[GE_Item]
      ,[GE_CodigoInstalacion]
from [CL_ES_GE_Lista_Verificacion] 
where [GE_CodigoInstalacion]=@instalacion
order by [GE_Item] 
GO

/********************************************************/
IF OBJECT_ID('usp_GrabarEvaluacion', 'P') IS NOT NULL
	DROP PROC usp_GrabarEvaluacion
GO
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
		INSERT INTO CL_ES_GE_Evaluacion (GE_CodigoInstalacion,GE_Disponibilidad,GE_Resultado,GE_Observaciones,
		GE_NombreEnfermeroAuxiliar,GE_FechaEvaluacion) 
		VALUES (@instalacion,@disponibilidad,@resultado,@observaciones,@nombreenfermeroauxiliar,@fecha)
		SELECT convert(int,@@IDENTITY) GE_CodigoEvaluacion
	END
ELSE
	BEGIN
		UPDATE CL_ES_GE_Evaluacion SET GE_CodigoInstalacion=@instalacion,
		GE_Disponibilidad=@disponibilidad,GE_Resultado=@resultado,GE_Observaciones=@observaciones,
		GE_NombreEnfermeroAuxiliar=@nombreenfermeroauxiliar,GE_FechaEvaluacion=@fecha
		WHERE GE_CodigoEvaluacion=@evaluacion
		SELECT @evaluacion GE_CodigoEvaluacion
	END
GO

/********************************************************/
IF OBJECT_ID('usp_GrabarEvaluacionDetalle', 'P') IS NOT NULL
	DROP PROC usp_GrabarEvaluacionDetalle
GO
CREATE PROC usp_GrabarEvaluacionDetalle
@evaluaciondetalle int,
@verificacion int,
@conformidad bit,
@evaluacion int
as
IF (@evaluaciondetalle=0) 
	BEGIN		
		INSERT INTO CL_ES_GE_EvaluacionDetalle (GE_CodigoVerificacion,GE_Conformidad,GE_CodigoEvaluacion) 
		VALUES (@verificacion,@conformidad,@evaluacion)
		SELECT @@IDENTITY
	END
ELSE
	BEGIN
		UPDATE CL_ES_GE_EvaluacionDetalle SET GE_CodigoVerificacion=@verificacion,
		GE_Conformidad=@conformidad,GE_CodigoEvaluacion=@evaluacion
		WHERE GE_CodigoEvaluacionDetalle=@evaluaciondetalle
		SELECT @evaluaciondetalle
	END
GO

