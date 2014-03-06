
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

