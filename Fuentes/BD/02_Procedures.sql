
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