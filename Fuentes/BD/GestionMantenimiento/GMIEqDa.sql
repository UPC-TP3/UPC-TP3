--SELECT * FROM TB_EMPLEADO
--SELECT * FROM TB_TIPO_EMPLEADO
--SELECT * FROM TB_TURNO_EMERGENCIA

insert into TB_TIPO_EMPLEADO (E_Descripcion) values ('Tecnico')
insert into TB_TURNO_EMERGENCIA (GE_Horario_INI,GE_Horario_FIN) values ('01/01/2014','01/01/2014')
insert into TB_EMPLEADO
([E_Nombre],[E_Apellido_Paterno],[E_Apellido_Materno],[E_dni],[E_Direccion],[E_Telefono],[E_Tipo_Empleado]
,[E_Fecha_Nacimiento],[E_Correo],[Apellidos_Empleado],[Nombres_Empleado],[Cargo_Empleado],[Correo_Empleado]
,[Estado],[ID_TURNOEMERGENCIA],[ID_Tipo_Empleado]/*,[ID_Especialidad]*/)
values
('Juan','Perez','Lopez','12345678','Av uno','1234567','Tecnico'
,'01/01/1980','123@clinicainternacional.com','Perez Lopez','Juan','Tecnico','123@clinicainternacional.com'
,1,1,1/*,[ID_Especialidad]*/)
insert into TB_EMPLEADO
([E_Nombre],[E_Apellido_Paterno],[E_Apellido_Materno],[E_dni],[E_Direccion],[E_Telefono],[E_Tipo_Empleado]
,[E_Fecha_Nacimiento],[E_Correo],[Apellidos_Empleado],[Nombres_Empleado],[Cargo_Empleado],[Correo_Empleado]
,[Estado],[ID_TURNOEMERGENCIA],[ID_Tipo_Empleado]/*,[ID_Especialidad]*/)
values
('Marcos','Suarez','Linares','12345678','Av uno','1234567','Tecnico'
,'01/01/1980','123@clinicainternacional.com','Perez Lopez','Juan','Tecnico','123@clinicainternacional.com'
,1,1,1/*,[ID_Especialidad]*/)
insert into TB_EMPLEADO
([E_Nombre],[E_Apellido_Paterno],[E_Apellido_Materno],[E_dni],[E_Direccion],[E_Telefono],[E_Tipo_Empleado]
,[E_Fecha_Nacimiento],[E_Correo],[Apellidos_Empleado],[Nombres_Empleado],[Cargo_Empleado],[Correo_Empleado]
,[Estado],[ID_TURNOEMERGENCIA],[ID_Tipo_Empleado]/*,[ID_Especialidad]*/)
values
('Carlos','Martinez','Prado','12345678','Av uno','1234567','Tecnico'
,'01/01/1980','123@clinicainternacional.com','Perez Lopez','Juan','Tecnico','123@clinicainternacional.com'
,2,1,1/*,[ID_Especialidad]*/)