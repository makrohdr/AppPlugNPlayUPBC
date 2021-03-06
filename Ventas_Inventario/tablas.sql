﻿use ControlVentas
go

---------------------------------------------------------------------------------------------------
--procesos almacenados de tabla Clientes
alter proc MostrarClientes
as
select * from Clientes
go

create proc AgregarCliente
@Telefono varchar (100),
@RedSocial varchar(100),
@Contacto varchar (100),
@Nombre varchar (100),
@Apellido varchar (100),
@Puntaje int
as
insert into Clientes values(@Telefono, @RedSocial, @Contacto, @Nombre, @Apellido, @Puntaje)

go

alter proc EditarCliente
@Telefono varchar (100),
@RedSocial varchar(100),
@Contacto varchar (100),
@Nombre varchar (100),
@Apellido varchar (100),
@Puntaje int,
@IDCliente varchar(100)
as
UPDATE Clientes SET IDTelefono=@Telefono, RedSocial=@RedSocial, Contacto=@Contacto, Nombre=@Nombre, Apellido=@Apellido, Puntaje=@puntaje
where IDTelefono=@IDCliente
go

Alter proc EliminarCliente
@Telefono varchar(100)
as
delete from Clientes where IDTelefono=@Telefono;
go

exec NombreDelProceso 'ejemplo1', 'ejemplo2'
---------------------------------------------------------------------------------------------------------------------------

go

alter proc MostrarInventario
as
select * from Inventario
go
select IDinventario from Inventario
go

create proc AgregarInventario
@nombre varchar (100),
@volumen varchar (5),
@portada varchar (5),
@categoria varchar(100),
@empresa varchar(50),
@precio float,
@cantidad int,
@puntaje int
as
insert into Inventario values(@nombre,@volumen,@portada,@categoria,@empresa,@precio,@cantidad,@puntaje)
go

alter proc EditarInventario
@nombre varchar (100),
@volumen varchar (5),
@portada varchar (5),
@categoria varchar(100),
@empresa varchar(50),
@precio float,
@cantidad int,
@puntaje int,
@id int
as
update Inventario set Nombre=@nombre, [Volumen/Edicion]=@volumen, Portada=@portada, Categoria=@categoria,
					  Empresa=@empresa, Precio=@precio, Cantidad=@cantidad, Puntaje=@puntaje
where IDinventario=@id;
go

create proc EliminarInventario
@id int
as
delete from Inventario where IDinventario=@id
go

exec AgregarInventario 'Oreigaru', '1', 'A', 'Manga', 'Kamite', '85', '1', '45'
go
-----------------------------------------------------------------------
create proc AgregarAnnetys
@Categoria varchar(100),
@Nombre varchar(100),
@Descripcion varchar(100),
@Precio int,
@Cantidad int,
@Puntaje int
as
insert into Annetys values(@Categoria,@Nombre,@Descripcion,@Precio,@Cantidad,@Puntaje)

go

create proc EditarAnnetys
@Categoria varchar(100),
@Nombre varchar(100),
@Descripcion varchar(100),
@Precio int,
@Cantidad int,
@Puntaje int,
@IDannetys int
as
UPDATE Annetys SET Categoria = @Categoria, Nombre = @Nombre, Descripcion = @Descripcion, Precio = @Precio, 
		Cantidad = @Cantidad, @Puntaje = @Puntaje
where IDAnnetys = @IDannetys;

go

create proc EliminarAnnetys
@IDannetys int
as
delete from Annetys where IDAnnetys=@IDannetys
------------------------------------------------------------------------------------------------------------------
--Crear tablas
create table Inventario(
IDinventario int identity primary key,
Nombre varchar(100),
Volumen varchar(5),
Portada varchar(5), 
Categoria varchar(100),
Empresa varchar(50),
Precio float,
Cantidad int,
Punataje int)

create table Clientes(
IDTelefono varchar(100) primary key,
RedSocial varchar(100),
Contacto varchar(100),
Nombre varchar(100),
Apellido varchar(100),
GrupoPiña char(2),
Puntaje int)

drop table ReporteVentaLibros;
drop table ReporteVentaJuegosDeMesa
drop table ReporteVentasTCG
drop table ReporteVentasAnnetys

drop table Clientes
drop table JuegosDeMesa;
drop table TCG
drop table Annetys

create table ReporteVentaLibros(
IDReporteLibros int identity(1,1) primary key,
IDlibros int foreign key (IDLibros) references inventario(IDinventario),
IDClientes varchar(100) foreign key (IDClientes) references Clientes(IDTelefono),
Fecha varchar(100), 
Nombre varchar(100),
Volumen varchar(100),
Portada varchar(100),
Editorial varchar(100),
Precio int,
Cantidad int,
Puntaje int)

create table JuegosDeMesa(
IDJuegosDeMesa int identity (1,1) primary key,
Nombre varchar(100),
Precio int,
Cantidad int,
Puntaje int);

create table ReporteVentaJuegosDeMesa(
IDReporteJuegosDeMesa int identity(1,1) primary key,
IDJuegosDeMesa int foreign key (IDJuegosDeMesa) references JuegosDeMesa(IDJuegosDeMesa),
IDClientes varchar(100) foreign key (IDClientes) references Clientes(IDTelefono),
Nombre varchar(100),
Precio int,
Cantidad int,
Puntaje int);

create table TCG(
IDTCG int identity (1,1) primary key,
Nombre Varchar(100),
Producto varchar(100),
Descripcion varchar(100),
Precio int,
Cantidad int,
Puntaje int);

create table ReporteVentasTCG(
IDReporteTCG int identity (1,1) primary key,
IDTCG int foreign key (IDTCG) references TCG(IDTCG),
IDClientes varchar(100) foreign key (IDClientes) references Clientes(IDTelefono),
Nombre Varchar(100),
Producto varchar(100),
Descripcion varchar(100),
Precio int,
Cantidad int,
Puntaje int);

create table Annetys(
IDAnnetys int identity(1,1) primary key,
CategoriaGeneral varchar(100),
CategoriaEspecifica varchar(100),
Nombre varchar(100),
Descripcion varchar(100),
Precio int,
Cantidad int,
Puntaje int)

create table ReporteVentasAnnetys(
IDReporteAnnetys int identity(1,1) primary key,
IDAnnetys int foreign key (IDAnnetys) references Annetys(IDAnnetys),
IDClientes varchar(100) foreign key (IDClientes) references Clientes(IDTelefono),
CategoriaGeneral varchar(100),
CategoriaEspecifica varchar(100),
Nombre varchar(100),
Descripcion varchar(100),
Precio int,
Cantidad int,
Puntaje int)