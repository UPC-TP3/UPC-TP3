USE [BD_ClinicaInternacional]
GO
/****** Object:  StoredProcedure [dbo].[pa_Registro_Programacion_Examen]    Script Date: 03/06/2014 19:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pa_Registro_Programacion_Examen]
@id_programacion int,
@id_orden_examen int
As
Set Nocount On
Select p.ID_Orden_Examen_Medico as id_orden_examen, case p.estado when 'G' then 'Generado' when 'D' then 'Pagado' else '' end as estado,
h.id_consultorio, h.ID_MedicoTurno as id_horario, c.id_local, (m.nom_medico+' '+m.ape_medico) as especialista
From TB_PROGRAMACION_ATENCION_EXAMENES p Inner Join TB_MEDICO_DE_TURNO h On (p.ID_MedicoTurno= h.ID_MedicoTurno)
Inner Join TB_CONSULTORIO c On (h.id_consultorio= c.id_consultorio)
Inner Join TB_MEDICO m On (h.id_medico= m.id_medico)
Where @id_orden_examen in (p.ID_Orden_Examen_Medico, 0) and @id_programacion in (p.ID_Programacion, 0)

Go

USE [BD_ClinicaInternacional]
GO
/****** Object:  StoredProcedure [dbo].[pa_Registro_Orden_Examen]    Script Date: 03/06/2014 19:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pa_Registro_Orden_Examen]
@id_orden_examen int
As
Set Nocount On
Select o.ID_Orden_Examen_Medico as id_orden_examen, o.ID_Medico, o.ID_Orden_Interna as id_orden_interna, o.fecha, 
m.nom_medico + ' ' + m.ape_medico as medico, e.ID_Tipo_Examen as id_tpo_examen, e.nom_examen as examen, a.id_historia, p.nombres +' '+p.ApellidoPat+' '+ApellidoMat as paciente,
isnull(e.precio,0) as precio, o.ID_Catalogo_Examen as id_examen,
case a.ID_Tipo_Atencion when 'E' then 'Emergencia' when 'A' then 'Ambulatorio' when 'H' then 'Hospitalario' else '' end as tipo_atencion,
case o.estado when 'G' then 'Generada' when 'P' then 'Programada' when 'C' then 'Confirmada' else '' end as estado
From TB_ORDEN_EXAMEN_MEDICO o Inner Join TB_MEDICO m On (o.id_medico= m.id_medico)
Inner Join TB_CATALOGO_EXAMEN_MEDICO e On (o.ID_Catalogo_Examen= e.ID_Catalogo_Examen)
Inner Join TB_ORDEN_INTERNA a On (o.ID_Orden_Interna= a.ID_Orden_Interna)
Inner Join TB_HISTORIA_CLINICA h On (a.id_historia= h.id_historia)
Inner Join TB_PACIENTE p On (h.id_paciente= p.id_paciente)
Where o.ID_Orden_Examen_Medico= @id_orden_examen




Go

USE [BD_ClinicaInternacional]
GO
/****** Object:  StoredProcedure [dbo].[pa_Registro_Horario]    Script Date: 03/06/2014 19:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pa_Registro_Horario]
@id_horario int
As
Set Nocount On
Select h.*, m.nom_medico+' '+m.ape_medico as medico
From TB_MEDICO_DE_TURNO h Inner Join TB_MEDICO m On (h.id_medico= m.id_medico)
Where ID_MedicoTurno= @id_horario

Go

USE [BD_ClinicaInternacional]
GO
/****** Object:  StoredProcedure [dbo].[pa_Nuevo_Programacion_Examen]    Script Date: 03/06/2014 19:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pa_Nuevo_Programacion_Examen]
@id_orden_examen int, 
@id_horario int, 
@estado varchar(1)
As

if @estado= 'R'
	begin
		Update TB_PROGRAMACION_ATENCION_EXAMENES
		Set ID_MedicoTurno= @id_horario
	end
else
	begin
		Insert Into TB_PROGRAMACION_ATENCION_EXAMENES (ID_Orden_Examen_Medico, ID_MedicoTurno, estado)
		Values (@id_orden_examen, @id_horario, @estado)

		Update TB_ORDEN_EXAMEN_MEDICO Set estado= 'P' Where ID_Orden_Examen_Medico= @id_orden_examen
	end

Go


USE [BD_ClinicaInternacional]
GO
/****** Object:  StoredProcedure [dbo].[pa_Nuevo_Orden_Pago]    Script Date: 03/06/2014 19:26:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pa_Nuevo_Orden_Pago]
@id_orden_examen int, 
@estado varchar(1), 
@importe decimal(10,2)
As
Insert Into TB_ORDEN_SERVICIO (fecha, ID_Orden_Examen_Medico, estado, importe)
Values (GETDATE(), @id_orden_examen, @estado, @importe)

Update TB_ORDEN_EXAMEN_MEDICO Set estado= 'C' Where ID_Orden_Examen_Medico= @id_orden_examen

Update TB_PROGRAMACION_ATENCION_EXAMENES Set estado= 'D' Where ID_Orden_Examen_Medico= @id_orden_examen and estado= 'G'


Go


USE [BD_ClinicaInternacional]
GO
/****** Object:  StoredProcedure [dbo].[pa_Lista_Tipo_Examen]    Script Date: 03/06/2014 19:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pa_Lista_Tipo_Examen]
As
Select ID_Tipo_Examen as id_tpo_examen, descripcion From TB_TIPO_EXAMEN_MEDICO
Order By descripcion



Go


USE [BD_ClinicaInternacional]
GO
/****** Object:  StoredProcedure [dbo].[pa_Lista_Programacion_Examenes]    Script Date: 03/06/2014 19:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pa_Lista_Programacion_Examenes]
@id_orden_examen int,
@id_consultorio int,
@fecha varchar(8),
@paciente varchar(50),
@id_orden_interna int,
@id_historia int

As

Set @paciente= REPLACE(@paciente,' ','%')

		Select p.ID_Programacion, p.ID_Orden_Examen_Medico as id_orden_examen, p.ID_MedicoTurno as id_horario, 
		case p.estado when 'G' then 'Generada' when 'D' then 'Pagado' else '' end as estado,
		c.descripcion as consultorio, e.nom_examen as examen, a.id_historia, pa.nombres + ', '+ pa.ApellidoPat+' '+ pa.ApellidoMat as paciente,
		m.nom_medico +' '+m.ape_medico as especialista, ho.fecha, l.nombre as Local
		From TB_PROGRAMACION_ATENCION_EXAMENES p 
		Inner Join TB_MEDICO_DE_TURNO ho On (p.ID_MedicoTurno= ho.ID_MedicoTurno)
		Inner Join TB_ORDEN_EXAMEN_MEDICO o On (p.ID_Orden_Examen_Medico= o.ID_Orden_Examen_Medico) 
		Inner Join TB_CONSULTORIO c On (ho.id_consultorio= c.id_consultorio)
		Inner Join TB_CATALOGO_EXAMEN_MEDICO e On (o.ID_Catalogo_Examen= e.ID_Catalogo_Examen)
		Inner Join TB_MEDICO m On (ho.id_medico= m.id_medico)
		Inner Join TB_ORDEN_INTERNA a On (o.ID_Orden_Interna= a.ID_Orden_Interna)
		Inner Join TB_HISTORIA_CLINICA h On (a.id_historia= h.id_historia)
		Inner Join TB_PACIENTE pa On (h.id_paciente= pa.id_paciente)
		Inner Join TB_LOCAL l On (c.id_local= l.id_local)
		Where @fecha in (CONVERT(varchar(8), ho.fecha, 112), '')
		And @id_orden_examen in (p.ID_Orden_Examen_Medico, 0)		
		And @id_consultorio in (ho.id_consultorio, 0)	
		And @id_orden_interna in (o.ID_Orden_Interna, 0)
		And @id_historia in (a.ID_Historia, 0)
		And ((pa.nombres + pa.ApellidoPat + pa.ApellidoMat) like '%'+@paciente+'%' or  (pa.ApellidoPat+pa.ApellidoMat+pa.nombres) like '%'+@paciente+'%')
		Order By l.nombre, c.nro_consultorio, ho.fecha





Go



USE [BD_ClinicaInternacional]
GO
/****** Object:  StoredProcedure [dbo].[pa_Lista_Local]    Script Date: 03/06/2014 19:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pa_Lista_Local]
As
Select * From TB_LOCAL
Order By nombre




Go

USE [BD_ClinicaInternacional]
GO
/****** Object:  StoredProcedure [dbo].[pa_Lista_Horario]    Script Date: 03/06/2014 19:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pa_Lista_Horario]
@id_consultorio int
As
Set Nocount On
Select h.*, (m.nom_medico+' '+m.ape_medico) as medico, h.ID_MedicoTurno as id_horario
From TB_MEDICO_DE_TURNO h Inner Join TB_MEDICO m On (h.id_medico= m.id_medico)
Where h.id_consultorio= @id_consultorio
Order By h.fecha




Go


USE [BD_ClinicaInternacional]
GO
/****** Object:  StoredProcedure [dbo].[pa_Lista_Examen_Requisito]    Script Date: 03/06/2014 19:25:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pa_Lista_Examen_Requisito]
@id_examen int
As
Set Nocount On
Select e.ID_Catalogo_Examen as id_examen, r.descripcion as requisito
From TB_CATALOGO_EXAMEN_MEDICO e 
Inner Join TB_CATALOGO_REQUISITO er On (e.ID_Catalogo_Examen= er.ID_Catalogo_Examen) 
Inner Join TB_REQUISITO r On (er.id_requisito= r.id_requisito)
Where e.ID_Catalogo_Examen= @id_examen


Go


USE [BD_ClinicaInternacional]
GO
/****** Object:  StoredProcedure [dbo].[pa_Lista_Consultorio]    Script Date: 03/06/2014 19:25:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pa_Lista_Consultorio]
@id_local int,
@id_tpo_examen int
As
Select * From TB_CONSULTORIO
Where id_local= @id_local and @id_tpo_examen in (ID_Tipo_Examen,0)
Order By descripcion




Go


USE [BD_ClinicaInternacional]
GO
/****** Object:  StoredProcedure [dbo].[pa_Anular_Programacion_Examen]    Script Date: 03/06/2014 19:25:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pa_Anular_Programacion_Examen]
@id_orden_examen int, 
@id_horario int
As

Update TB_PROGRAMACION_ATENCION_EXAMENES
Set estado= 'X'
Where ID_Orden_Examen_Medico= @id_orden_examen and ID_MedicoTurno=@id_horario

Update TB_ORDEN_EXAMEN_MEDICO Set estado= 'P' Where ID_Orden_Examen_Medico= @id_orden_examen


UPdate TB_ORDEN_SERVICIO Set estado= 'X' Where ID_Orden_Examen_Medico= @id_orden_examen




Go


