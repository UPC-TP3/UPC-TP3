
insert into TB_Especialidad (Descripcion) values ('(Todos)')
insert into TB_Especialidad (Descripcion) values ('Pediatría')
insert into TB_Especialidad (Descripcion) values ('Dermatología')
insert into TB_Especialidad (Descripcion) values ('Urología')
insert into TB_Especialidad (Descripcion) values ('Medicina General')


insert into TB_Local values ('Local 1','Direccion 1')
insert into TB_Local values ('Local 2','Direccion 2')
insert into TB_Local values ('Local 3','Direccion 3')
insert into TB_Local values ('Local 4','Direccion 4')
insert into TB_Local values ('Local 5','Direccion 5')

insert into TB_Consultorio values (NULL,'100',1,NULL,1)
insert into TB_Consultorio values (NULL,'101',1,NULL,1)
insert into TB_Consultorio values (NULL,'102',1,NULL,1)
insert into TB_Consultorio values (NULL,'200',1,NULL,2)
insert into TB_Consultorio values (NULL,'201',1,NULL,2)
insert into TB_Consultorio values (NULL,'202',1,NULL,2)
insert into TB_Consultorio values (NULL,'Domicilio',1,NULL,2)


insert TB_Estado_Cita  values ('Pendiente')
insert TB_Estado_Cita  values ('Atendido')

insert TB_Medico values('Cesar','Cueto Garcia','45656',NULL,'3482639','AV. LIMA 456','998599270','3482639',NULL,NULL,'CMP001')
insert TB_Medico values('Manuel','Cespedez Reaño','78965',NULL,NULL,'JR. LAMPA 456',NULL,NULL,NULL,NULL,'CMP123') 
insert TB_Medico values('Carlos','Fasabi Mendoza','13352',NULL,NULL,'AV. IQUITOS 963',NULL,NULL,NULL,NULL,'CMP963') 
insert TB_Medico values('Jhon','Lucana Sanchez','96456',NULL,NULL,'AV. LOS DELFINES 963',NULL,NULL,NULL,NULL,'CMP456')
insert TB_Medico values('Carlos','Vargas Hubierna','45656',NULL,'3482639','AV. LIMA 456','998599270','3482639',NULL,NULL,'CMP852')
insert TB_Medico values('Alicia','Vigil Pinedo','78965',NULL,NULL,'JR. LAMPA 456',NULL,NULL,NULL,NULL,'CMP159') 
insert TB_Medico values('Juan','Novoa Fasanando','13352',NULL,NULL,'AV. IQUITOS 963',NULL,NULL,NULL,NULL,'CMP753') 
insert TB_Medico values('Diego','Quispe Garcia','96456',NULL,NULL,'AV. LOS DELFINES 963',NULL,NULL,NULL,NULL,'CMP147') 


insert TB_MEDICOESPECIALIDAD values(1,2)
insert TB_MEDICOESPECIALIDAD values(2,3)
insert TB_MEDICOESPECIALIDAD values(3,4)
insert TB_MEDICOESPECIALIDAD values(4,5)
insert TB_MEDICOESPECIALIDAD values(5,2)
insert TB_MEDICOESPECIALIDAD values(6,3)
insert TB_MEDICOESPECIALIDAD values(7,4)
insert TB_MEDICOESPECIALIDAD values(8,5)


INSERT TB_TIPO_DOCUMENTO VALUES ('DOCUMENTO DE IDENTIDAD')
INSERT TB_TIPO_DOCUMENTO VALUES ('CARNET DE EXTRANGERIA')

insert TB_Paciente values('10048380','10/12/1980','998599270','3482639',NULL,NULL,NULL,NULL,'SEPARADORA INDUSTRIAL 188',1,'INGENIERO DE SISTEMA',1,'PEDRO','LOZANO','HUAMAN',NULL,'ccueto@ddperu.com.pe',NULL)
insert TB_Paciente values('54613266',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,'JOHANA','CUETO','ESPINOZA',NULL,NULL,NULL)
insert TB_Paciente values('15341333',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,'MANUEL','MENDOZA','QUISPE',NULL,NULL,NULL)
insert TB_Paciente values('45613999',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,'JOAQUIN','MELO','REAÑO',NULL,NULL,NULL)
insert TB_Paciente values('91346612',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,'LUIS','VALENCIA','PALACIOS',NULL,NULL,NULL)
insert TB_Paciente values('34579466',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1,'DAVID','DEXTRE','RENGIFO',NULL,NULL,NULL)


insert TB_Turno values ('Mañana','08:00 - 08:30')
insert TB_Turno values ('Mañana','08:30 - 09:00')
insert TB_Turno values ('Mañana','09:00 - 09:30')
insert TB_Turno values ('Mañana','09:30 - 10:00')
insert TB_Turno values ('Mañana','10:00 - 10:30')
insert TB_Turno values ('Mañana','10:30 - 11:00')
insert TB_Turno values ('Mañana','11:00 - 11:30')
insert TB_Turno values ('Mañana','11:30 - 12:00')
insert TB_Turno values ('Tarde','12:00 - 12:30')
insert TB_Turno values ('Tarde','12:30 - 13:00')
insert TB_Turno values ('Tarde','13:00 - 13:30')
insert TB_Turno values ('Tarde','13:30 - 14:00')
insert TB_Turno values ('Tarde','14:00 - 14:30')
insert TB_Turno values ('Tarde','14:30 - 15:00')
insert TB_Turno values ('Tarde','15:00 - 15:30')
insert TB_Turno values ('Tarde','15:30 - 16:00')
insert TB_Turno values ('Tarde','16:00 - 16:30')
insert TB_Turno values ('Tarde','16:30 - 17:00')
insert TB_Turno values ('Tarde','17:00 - 17:30')
insert TB_Turno values ('Tarde','17:30 - 18:00')


insert TB_MEDICAMENTO values('Panadol',NULL,NULL,NULL,NULL,NULL,NULL)
insert TB_MEDICAMENTO values('Penisilina',NULL,NULL,NULL,NULL,NULL,NULL)
insert TB_MEDICAMENTO values('Vitaminas',NULL,NULL,NULL,NULL,NULL,NULL)
insert TB_MEDICAMENTO values('Kitadol',NULL,NULL,NULL,NULL,NULL,NULL)
insert TB_MEDICAMENTO values('Ranitidina',NULL,NULL,NULL,NULL,NULL,NULL)



