Use BD_ClinicaInternacional
Go

if (select COUNT(*) from TB_TIPO_DOCUMENTO)=0
	Insert Into TB_TIPO_DOCUMENTO (Nombre) values ('DNI')

Insert Into TB_LOCAL (nombre, direccion) Values ('Sede 1','Av. Guardia Civil 120');
Insert Into TB_LOCAL (nombre, direccion) Values ('Sede 2','Av. España 200');
Insert Into TB_LOCAL (nombre, direccion) Values ('Sede 3','Av. Polo 345');

Insert Into TB_ESPECIALIDAD (descripcion) values ('Hematología')
Insert Into TB_ESPECIALIDAD (descripcion) values ('Ginecólogo')
Insert Into TB_ESPECIALIDAD (descripcion) values ('Especialidad3')
Insert Into TB_ESPECIALIDAD (descripcion) values ('Especialidad4')


Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('Juan','Bazán','55443', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('Carlos','Ponce','11223', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('María','Santander','54321', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('David','Paredes','12345', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('David','Puente','12345', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('María','Rivas','34567', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('Nicolás','Barrientos','65432', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('Luana','Velasco','89786', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('Ninoska','Rojas','65456', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('David','Chura','67546', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('Leandro','Alegria','54365', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('Armando','Soto','16378', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('Paolo','Armaro','51327', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('Claudio','Castro','89765', '')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, Direccion) Values ('Elena','Gerónimo','45637', '')



/*
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('Juan','Bazán','55443','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('Carlos','Ponce','11223','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('María','Santander','54321','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('David','Paredes','12345','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('David','Puente','12345','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('María','Rivas','34567','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('Nicolás','Barrientos','65432','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('Luana','Velasco','89786','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('Ninoska','Rojas','65456','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('David','Chura','67546','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('Leandro','Alegria','54365','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('Armando','Soto','16378','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('Paolo','Armaro','51327','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('Claudio','Castro','89765','','','','','')
Insert Into TB_MEDICO (nom_medico, ape_medico, num_cmp, GA_Nombre, GA_Direccion, GA_Correo, GA_Celular, GA_TelefonoDomicilio) Values ('Elena','Gerónimo','45637','','','','','')
*/

Insert Into TB_MEDICOESPECIALIDAD (ID_Medico, ID_Especialidad) Values (1,1)
Insert Into TB_MEDICOESPECIALIDAD (ID_Medico, ID_Especialidad) Values (2,2)
Insert Into TB_MEDICOESPECIALIDAD (ID_Medico, ID_Especialidad) Values (3,3)
Insert Into TB_MEDICOESPECIALIDAD (ID_Medico, ID_Especialidad) Values (4,1)


Insert Into TB_TIPO_EXAMEN_MEDICO (descripcion) Values ('Resonancia Magnética')
Insert Into TB_TIPO_EXAMEN_MEDICO (descripcion) Values ('Tomografía')
Insert Into TB_TIPO_EXAMEN_MEDICO (descripcion) Values ('Radiología')
Insert Into TB_TIPO_EXAMEN_MEDICO (descripcion) Values ('Ecografía')
Insert Into TB_TIPO_EXAMEN_MEDICO (descripcion) Values ('Mamografía')
Insert Into TB_TIPO_EXAMEN_MEDICO (descripcion) Values ('Densitometría ósea')
Insert Into TB_TIPO_EXAMEN_MEDICO (descripcion) Values ('Electro encefalografía')



Insert Into TB_CONSULTORIO (descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values ('Consultorio 1', '1-A',1,1,2)
Insert Into TB_CONSULTORIO (descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values ('Consultorio 2', '2-A',1,2,2)
Insert Into TB_CONSULTORIO (descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values ('Consultorio 3', '3-A',1,3,2)
Insert Into TB_CONSULTORIO (descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values ('Consultorio 4', '4-A',1,4,2)
Insert Into TB_CONSULTORIO (descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values ('Consultorio 5', '1-B',2,1,1)
Insert Into TB_CONSULTORIO (descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values ('Consultorio 6', '2-B',2,2,1)
Insert Into TB_CONSULTORIO (descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values ('Consultorio 7', '3-B',2,3,3)
Insert Into TB_CONSULTORIO (descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values ('Consultorio 8', '4-B',2,4,3)
Insert Into TB_CONSULTORIO (descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values ('Consultorio 9', '1-C',3,1,1)
Insert Into TB_CONSULTORIO (descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values ('Consultorio 10', '2-C',3,2,1)
Insert Into TB_CONSULTORIO (descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values ('Consultorio 11', '3-C',3,3,1)
Insert Into TB_CONSULTORIO (descripcion, nro_consultorio, ID_Local, ID_Tipo_Examen, Piso) Values ('Consultorio 12', '4-C',3,4,1)



Insert Into TB_REQUISITO (descripcion) Values ('En ayunas')
Insert Into TB_REQUISITO (descripcion) Values ('Sin marcapasos')
Insert Into TB_REQUISITO (descripcion) Values ('No alérgico a los contrates')
Insert Into TB_REQUISITO (descripcion) Values ('Requisito a')
Insert Into TB_REQUISITO (descripcion) Values ('Requisito b')
Insert Into TB_REQUISITO (descripcion) Values ('Requisito c')
Insert Into TB_REQUISITO (descripcion) Values ('Requisito d')
Insert Into TB_REQUISITO (descripcion) Values ('Requisito e')
Insert Into TB_REQUISITO (descripcion) Values ('Requisito f')



Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('RM - pierna',300.00,1)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('TM - pecho',200.00,2)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('RX - pulmon',70.00,3)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('EC - riñones',40.00,4)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('MA - pecho',60.00,5)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('DO - clavícula',120.00,6)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('EE - cabeza',100.00,7)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('RM - brazo',300.00,1)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('TM - espalda',200.00,2)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('RX - brazo',70.00,3)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('EC - xyz',40.00,4)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('MA - 123',60.00,5)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('DO - xyz',120.00,6)
Insert Into TB_CATALOGO_EXAMEN_MEDICO (nom_examen, precio, ID_Tipo_Examen) Values ('EE - xyz',100.00,7)


Insert Into TB_CATALOGO_REQUISITO (ID_Catalogo_Examen, ID_Requisito) Values (1,1)
Insert Into TB_CATALOGO_REQUISITO (ID_Catalogo_Examen, ID_Requisito) Values (1,2)
Insert Into TB_CATALOGO_REQUISITO (ID_Catalogo_Examen, ID_Requisito) Values (2,3)
Insert Into TB_CATALOGO_REQUISITO (ID_Catalogo_Examen, ID_Requisito) Values (3,4)
Insert Into TB_CATALOGO_REQUISITO (ID_Catalogo_Examen, ID_Requisito) Values (3,5)
Insert Into TB_CATALOGO_REQUISITO (ID_Catalogo_Examen, ID_Requisito) Values (4,1)



  declare @ID_Consultorio as int
  declare @fecha datetime
  declare @rgto int
  declare CURSORITO cursor for
  select ID_Consultorio From TB_CONSULTORIO
    open CURSORITO

  fetch next from CURSORITO
  into @ID_Consultorio
    while @@fetch_status = 0
    begin
		set @rgto= 0
		while @rgto <= 10
		begin
			set @fecha= GETDATE() + @rgto
			--lect convert(varchar(8), GETDATE(), 112) + ' 09:00'
		    --select convert(datetime, '20140306 09:00')
			Insert Into TB_MEDICO_DE_TURNO (ID_Consultorio, ID_Medico, fecha)
			Values (@ID_Consultorio, @ID_Consultorio, convert(datetime, convert(varchar(8), @fecha, 112) + ' 09:00'))
			Insert Into TB_MEDICO_DE_TURNO (ID_Consultorio, ID_Medico, fecha)
			Values (@ID_Consultorio, @ID_Consultorio, convert(datetime, convert(varchar(8), @fecha, 112) + ' 10:00'))
			Insert Into TB_MEDICO_DE_TURNO (ID_Consultorio, ID_Medico, fecha)
			Values (@ID_Consultorio, @ID_Consultorio, convert(datetime, convert(varchar(8), @fecha, 112) + ' 11:00'))
			Insert Into TB_MEDICO_DE_TURNO (ID_Consultorio, ID_Medico, fecha)
			Values (@ID_Consultorio, @ID_Consultorio, convert(datetime, convert(varchar(8), @fecha, 112) + ' 12:00'))
			Insert Into TB_MEDICO_DE_TURNO (ID_Consultorio, ID_Medico, fecha)
			Values (@ID_Consultorio, @ID_Consultorio, convert(datetime, convert(varchar(8), @fecha, 112) + ' 13:00'))
			Insert Into TB_MEDICO_DE_TURNO (ID_Consultorio, ID_Medico, fecha)
			Values (@ID_Consultorio, @ID_Consultorio, convert(datetime, convert(varchar(8), @fecha, 112) + ' 14:00'))
			Insert Into TB_MEDICO_DE_TURNO (ID_Consultorio, ID_Medico, fecha)
			Values (@ID_Consultorio, @ID_Consultorio, convert(datetime, convert(varchar(8), @fecha, 112) + ' 15:00'))
			Insert Into TB_MEDICO_DE_TURNO (ID_Consultorio, ID_Medico, fecha)
			Values (@ID_Consultorio, @ID_Consultorio, convert(datetime, convert(varchar(8), @fecha, 112) + ' 16:00'))
			Insert Into TB_MEDICO_DE_TURNO (ID_Consultorio, ID_Medico, fecha)
			Values (@ID_Consultorio, @ID_Consultorio, convert(datetime, convert(varchar(8), @fecha, 112) + ' 17:00'))
			Insert Into TB_MEDICO_DE_TURNO (ID_Consultorio, ID_Medico, fecha)
			Values (@ID_Consultorio, @ID_Consultorio, convert(datetime, convert(varchar(8), @fecha, 112) + ' 18:00'))
					
			set @rgto= @rgto +1
		end

    fetch next from CURSORITO
    into @ID_Consultorio
    end

    close CURSORITO
    deallocate CURSORITO





Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, ID_TipoDocumento) Values ('34567890', 'César',	'Quispe', 'Sánchez',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, ID_TipoDocumento) Values ('32454678', 'Pawl',	'Sánchez','Paz',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, ID_TipoDocumento) Values ('12324577', 'Imelda',	'Paz','Chapoñán',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, ID_TipoDocumento) Values ('85769345', 'Alex',	'Chapoñán','Vivanco',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, ID_TipoDocumento) Values ('35465097', 'Claudia',	'Vivanco','Guerra',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, ID_TipoDocumento) Values ('23486978', 'Alberto',	'Guerra','Colonio',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, ID_TipoDocumento) Values ('09876345', 'Carla',	'Colonio','Hijar',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, ID_TipoDocumento) Values ('87837456', 'Julissa',	'Hijar','Cruz',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, ID_TipoDocumento) Values ('23435678', 'José',	'Cruz','Quispe',1)



/*
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, GA_Nombre, GA_DocumentoIdentidad, GA_EstadoCivil, GA_FechaNacimiento,GA_TelefonoDomicilio, GA_Pais, GA_Departamento, GA_Provincia, GA_Distrito, GA_Direccion, GA_Sexo, ID_TipoDocumento) Values ('34567890', 'César',	'Quispe', 'Sánchez','','','','','','','','','','','',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, GA_Nombre, GA_DocumentoIdentidad, GA_EstadoCivil, GA_FechaNacimiento,GA_TelefonoDomicilio, GA_Pais, GA_Departamento, GA_Provincia, GA_Distrito, GA_Direccion, GA_Sexo, ID_TipoDocumento) Values ('32454678', 'Pawl',	'Sánchez','Paz','','','','','','','','','','','',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, GA_Nombre, GA_DocumentoIdentidad, GA_EstadoCivil, GA_FechaNacimiento,GA_TelefonoDomicilio, GA_Pais, GA_Departamento, GA_Provincia, GA_Distrito, GA_Direccion, GA_Sexo, ID_TipoDocumento) Values ('12324577', 'Imelda',	'Paz','Chapoñán','','','','','','','','','','','',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, GA_Nombre, GA_DocumentoIdentidad, GA_EstadoCivil, GA_FechaNacimiento,GA_TelefonoDomicilio, GA_Pais, GA_Departamento, GA_Provincia, GA_Distrito, GA_Direccion, GA_Sexo, ID_TipoDocumento) Values ('85769345', 'Alex',	'Chapoñán','Vivanco','','','','','','','','','','','',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, GA_Nombre, GA_DocumentoIdentidad, GA_EstadoCivil, GA_FechaNacimiento,GA_TelefonoDomicilio, GA_Pais, GA_Departamento, GA_Provincia, GA_Distrito, GA_Direccion, GA_Sexo, ID_TipoDocumento) Values ('35465097', 'Claudia',	'Vivanco','Guerra','','','','','','','','','','','',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, GA_Nombre, GA_DocumentoIdentidad, GA_EstadoCivil, GA_FechaNacimiento,GA_TelefonoDomicilio, GA_Pais, GA_Departamento, GA_Provincia, GA_Distrito, GA_Direccion, GA_Sexo, ID_TipoDocumento) Values ('23486978', 'Alberto',	'Guerra','Colonio','','','','','','','','','','','',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, GA_Nombre, GA_DocumentoIdentidad, GA_EstadoCivil, GA_FechaNacimiento,GA_TelefonoDomicilio, GA_Pais, GA_Departamento, GA_Provincia, GA_Distrito, GA_Direccion, GA_Sexo, ID_TipoDocumento) Values ('09876345', 'Carla',	'Colonio','Hijar','','','','','','','','','','','',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, GA_Nombre, GA_DocumentoIdentidad, GA_EstadoCivil, GA_FechaNacimiento,GA_TelefonoDomicilio, GA_Pais, GA_Departamento, GA_Provincia, GA_Distrito, GA_Direccion, GA_Sexo, ID_TipoDocumento) Values ('87837456', 'Julissa',	'Hijar','Cruz','','','','','','','','','','','',1)
Insert Into TB_PACIENTE (dni_paciente, nombres, ApellidoPat, ApellidoMat, GA_Nombre, GA_DocumentoIdentidad, GA_EstadoCivil, GA_FechaNacimiento,GA_TelefonoDomicilio, GA_Pais, GA_Departamento, GA_Provincia, GA_Distrito, GA_Direccion, GA_Sexo, ID_TipoDocumento) Values ('23435678', 'José',	'Cruz','Quispe','','','','','','','','','','','',1)
*/


Insert Into TB_HISTORIA_CLINICA (ID_Paciente, FechaRegistro, Antecedentes, ID_GrupoSanguineo) values (1, GETDATE(), '', 1)
Insert Into TB_HISTORIA_CLINICA (ID_Paciente, FechaRegistro, Antecedentes, ID_GrupoSanguineo) values (2, GETDATE(), '', 1)
Insert Into TB_HISTORIA_CLINICA (ID_Paciente, FechaRegistro, Antecedentes, ID_GrupoSanguineo) values (3, GETDATE(), '', 1)
Insert Into TB_HISTORIA_CLINICA (ID_Paciente, FechaRegistro, Antecedentes, ID_GrupoSanguineo) values (4, GETDATE(), '', 1)
Insert Into TB_HISTORIA_CLINICA (ID_Paciente, FechaRegistro, Antecedentes, ID_GrupoSanguineo) values (5, GETDATE(), '', 1)
Insert Into TB_HISTORIA_CLINICA (ID_Paciente, FechaRegistro, Antecedentes, ID_GrupoSanguineo) values (6, GETDATE(), '', 1)
Insert Into TB_HISTORIA_CLINICA (ID_Paciente, FechaRegistro, Antecedentes, ID_GrupoSanguineo) values (7, GETDATE(), '', 1)
Insert Into TB_HISTORIA_CLINICA (ID_Paciente, FechaRegistro, Antecedentes, ID_GrupoSanguineo) values (8, GETDATE(), '', 1)
Insert Into TB_HISTORIA_CLINICA (ID_Paciente, FechaRegistro, Antecedentes, ID_GrupoSanguineo) values (9, GETDATE(), '', 1)





Insert Into TB_ORDEN_INTERNA (ID_Tipo_Atencion, ID_Paciente, ID_Historia) Values ('A',1,1)
Insert Into TB_ORDEN_INTERNA (ID_Tipo_Atencion, ID_Paciente, ID_Historia) Values ('A',2,2)
Insert Into TB_ORDEN_INTERNA (ID_Tipo_Atencion, ID_Paciente, ID_Historia) Values ('E',3,3)
Insert Into TB_ORDEN_INTERNA (ID_Tipo_Atencion, ID_Paciente, ID_Historia) Values ('H',4,4)
Insert Into TB_ORDEN_INTERNA (ID_Tipo_Atencion, ID_Paciente, ID_Historia) Values ('H',5,5)
Insert Into TB_ORDEN_INTERNA (ID_Tipo_Atencion, ID_Paciente, ID_Historia) Values ('A',6,6)
Insert Into TB_ORDEN_INTERNA (ID_Tipo_Atencion, ID_Paciente, ID_Historia) Values ('H',7,7)
Insert Into TB_ORDEN_INTERNA (ID_Tipo_Atencion, ID_Paciente, ID_Historia) Values ('A',8,8)
Insert Into TB_ORDEN_INTERNA (ID_Tipo_Atencion, ID_Paciente, ID_Historia) Values ('H',9,9)


Insert Into TB_ORDEN_EXAMEN_MEDICO (ID_Medico, ID_Orden_Interna, fecha, ID_Catalogo_Examen, estado) Values (1,9, GETDATE(), 5, 'G')
Insert Into TB_ORDEN_EXAMEN_MEDICO (ID_Medico, ID_Orden_Interna, fecha, ID_Catalogo_Examen, estado) Values (2,8, GETDATE(), 4, 'G')
Insert Into TB_ORDEN_EXAMEN_MEDICO (ID_Medico, ID_Orden_Interna, fecha, ID_Catalogo_Examen, estado) Values (3,7, GETDATE(), 3, 'G')
Insert Into TB_ORDEN_EXAMEN_MEDICO (ID_Medico, ID_Orden_Interna, fecha, ID_Catalogo_Examen, estado) Values (4,6, GETDATE(), 2, 'G')
Insert Into TB_ORDEN_EXAMEN_MEDICO (ID_Medico, ID_Orden_Interna, fecha, ID_Catalogo_Examen, estado) Values (5,5, GETDATE(), 1, 'G')
Insert Into TB_ORDEN_EXAMEN_MEDICO (ID_Medico, ID_Orden_Interna, fecha, ID_Catalogo_Examen, estado) Values (6,4, GETDATE(), 1, 'G')
Insert Into TB_ORDEN_EXAMEN_MEDICO (ID_Medico, ID_Orden_Interna, fecha, ID_Catalogo_Examen, estado) Values (7,3, GETDATE(), 2, 'G')
Insert Into TB_ORDEN_EXAMEN_MEDICO (ID_Medico, ID_Orden_Interna, fecha, ID_Catalogo_Examen, estado) Values (8,2, GETDATE(), 1, 'G')
Insert Into TB_ORDEN_EXAMEN_MEDICO (ID_Medico, ID_Orden_Interna, fecha, ID_Catalogo_Examen, estado) Values (9,1, GETDATE(), 3, 'G')






