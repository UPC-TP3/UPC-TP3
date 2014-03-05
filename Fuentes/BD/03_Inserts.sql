
USE TP3_Emergencias
GO

/********************************************************/
insert into CL_ES_GE_Instalacion (GE_Nombre) values ('Instalación 1')
insert into CL_ES_GE_Instalacion (GE_Nombre) values ('Instalación 2')
insert into CL_ES_GE_Instalacion (GE_Nombre) values ('Instalación 3')
insert into CL_ES_GE_Instalacion (GE_Nombre) values ('Instalación 4')
insert into CL_ES_GE_Instalacion (GE_Nombre) values ('Instalación 5')
/********************************************************/
insert into CL_ES_GE_Lista_Verificacion (GE_Item,GE_CodigoInstalacion) values ('Cama',1)
insert into CL_ES_GE_Lista_Verificacion (GE_Item,GE_CodigoInstalacion) values ('Válvula de oxígeno',1)
insert into CL_ES_GE_Lista_Verificacion (GE_Item,GE_CodigoInstalacion) values ('Tv',2)
insert into CL_ES_GE_Lista_Verificacion (GE_Item,GE_CodigoInstalacion) values ('Silla',2)
insert into CL_ES_GE_Lista_Verificacion (GE_Item,GE_CodigoInstalacion) values ('Mesa',3)
insert into CL_ES_GE_Lista_Verificacion (GE_Item,GE_CodigoInstalacion) values ('PC',3)
insert into CL_ES_GE_Lista_Verificacion (GE_Item,GE_CodigoInstalacion) values ('Almohada',4)
insert into CL_ES_GE_Lista_Verificacion (GE_Item,GE_CodigoInstalacion) values ('Cuadro',4)
insert into CL_ES_GE_Lista_Verificacion (GE_Item,GE_CodigoInstalacion) values ('Libro',5)
insert into CL_ES_GE_Lista_Verificacion (GE_Item,GE_CodigoInstalacion) values ('Maceta',5)
/********************************************************/
insert into CL_ES_GE_Evaluacion (GE_CodigoInstalacion,GE_Disponibilidad,GE_Resultado,GE_Observaciones,GE_NombreEnfermeroAuxiliar,GE_FechaEvaluacion) 
values (1,1,1,'Obs 1','JUAN',GetDate())
insert into CL_ES_GE_Evaluacion (GE_CodigoInstalacion,GE_Disponibilidad,GE_Resultado,GE_Observaciones,GE_NombreEnfermeroAuxiliar,GE_FechaEvaluacion) 
values (1,1,1,'Obs 2','JOSE',GetDate())
insert into CL_ES_GE_Evaluacion (GE_CodigoInstalacion,GE_Disponibilidad,GE_Resultado,GE_Observaciones,GE_NombreEnfermeroAuxiliar,GE_FechaEvaluacion) 
values (2,1,1,'Obs 3','CARLOS',GetDate())
insert into CL_ES_GE_Evaluacion (GE_CodigoInstalacion,GE_Disponibilidad,GE_Resultado,GE_Observaciones,GE_NombreEnfermeroAuxiliar,GE_FechaEvaluacion) 
values (2,1,1,'Obs 4','PEDRO',GetDate())
insert into CL_ES_GE_Evaluacion (GE_CodigoInstalacion,GE_Disponibilidad,GE_Resultado,GE_Observaciones,GE_NombreEnfermeroAuxiliar,GE_FechaEvaluacion) 
values (3,1,1,'Obs 5','MARCO',GetDate())
/********************************************************/
insert into CL_ES_GE_EvaluacionDetalle (GE_CodigoVerificacion,GE_Conformidad,GE_CodigoEvaluacion) VALUES
(1,1,1)
insert into CL_ES_GE_EvaluacionDetalle (GE_CodigoVerificacion,GE_Conformidad,GE_CodigoEvaluacion) VALUES
(2,1,1)
insert into CL_ES_GE_EvaluacionDetalle (GE_CodigoVerificacion,GE_Conformidad,GE_CodigoEvaluacion) VALUES
(3,1,2)
insert into CL_ES_GE_EvaluacionDetalle (GE_CodigoVerificacion,GE_Conformidad,GE_CodigoEvaluacion) VALUES
(4,1,2)
