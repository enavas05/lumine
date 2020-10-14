CREATE DATABASE lumine;

use lumine;

CREATE TABLE grupo(
	id int auto_increment primary key not null,
	nombre varchar(60) not null,
	descripcion varchar(255) not null,
	creado_por varchar (15),
	fecha_creacion date,
	modificado_por varchar (15),
	fecha_modificacion date
);

CREATE TABLE roles(
	id int auto_increment primary key not null,
	rol varchar(60) not null,
	descripcion varchar(255),
	creado_por varchar (15),
	fecha_creacion date,
	modificado_por varchar (15),
	fecha_modificacion date
);

CREATE TABLE permisos(
	idRol int not null,
	idGrupo int not null,
	codigo char(8) not null,
	permiso_insercion text(1) not null,
	permiso_eliminacion text(1) not null,
	permiso_actualziacion text(1) not null,
	permiso_consultar text(1) not null,
	creado_por varchar (15),
	fecha_creacion date,
	modificado_por varchar (15),
	fecha_modificacion date,
	constraint fk_idRol_p foreign key(idRol) references roles(id),
	constraint fk_idGrupo_p foreign key(idGrupo) references grupo(id)
);


CREATE TABLE usuario(
	id int auto_increment primary key not null,
	usuario varchar(100) not null,
	nombre text(100) not null,
	estado enum("Bloqueado", "Activo", "Inactivo", "Nuevo") not null,
	email varchar(60) not null,
	contraseña varchar(250) not null,
	idRol int not null,
	idGrupo int not null,
	fecha_vencimiento date,
	primer_acceso datetime,
	ultimo_acceso datetime,
	creado_por varchar (15),
	fecha_creacion date,
	modificado_por VARCHAR (15),
	fecha_modificacion date,
	constraint fk_idRol foreign key(idRol) references roles(id),
	constraint fk_idGrupo foreign key(idGrupo) references grupo(id)
);


CREATE TABLE parametros(
	id int AUTO_INCREMENT primary key not null,
	parametro VARCHAR (50),
	valor varchar (100),
	idUsuario int,
	fecha_creacion DATE,
	fecha_modificacion DATE,
	constraint fk_idUsuario_p foreign key(idUsuario) references usuario(id)
);


CREATE TABLE contraseña(
	id int AUTO_INCREMENT primary key not null,
	idUsuario int not null,
	contraseña_usuario VARCHAR (255),
	creado_por varchar (15),
	fecha_creacion date,
	modificado_por VARCHAR (15),
	fecha_modificacion date,
	constraint fk_idUsuario_c foreign key(idUsuario) references usuario(id)
);

CREATE TABLE preguntas(
	id int auto_increment primary key not null,
	pregunta varchar (255),
	creado_por varchar (15),
	fecha_creacion date,
	modificado_por VARCHAR (15),
	fecha_modificacion date
);

CREATE TABLE preguntas_usuarios(
	idPregunta int not null,
	idUsuario int not null,
	creado_por varchar (15),
	fecha_creacion date,
	modificado_por VARCHAR (15),
	fecha_modificacion date,
	respuesta VARCHAR (255),	
	constraint fk_idPregunta foreign key(idPregunta) references preguntas(id),
	constraint fk_idUsuario foreign key(idUsuario) references usuario(id)
);



CREATE TABLE metadatos(
	id int auto_increment primary key not null,
	autor varchar(60) not null,
	editor varchar(60) not null,
	ilustrador varchar(60) not null,
	publicador varchar(60) not null,
	iso varchar(12) not null,
	otros varchar(60) not null
);


CREATE TABLE estado_ova(
	id int auto_increment primary key not null,
	estado enum('enviado', 'en revisión', 'publicado', 'rechazado') not null,
	descripcion varchar(255),
	fecha_creacion date
);

create table tipo_ova(
	id int not null auto_increment primary key,
	descripcion varchar(255),
	tipo enum('scorm', 'html5', 'otros')
);	

CREATE TABLE categoria(
	id int auto_increment primary key not null,
	nombre varchar(60) not null,
	descripcion varchar(255),
	visible boolean default TRUE
);


create table archivo(
	id int auto_increment primary key not null,
	nombre varchar(60) not null,
	tamaño int(11) not null,
	fecha_creacion date,
	editable boolean default true,archivo
	visible boolean default true,
	url varchar(255) not null,
	idUsuario int not null,
	foreign key(idUsuario) references usuario(id)
);


CREATE TABLE ova(
	id int auto_increment primary key not null,
	titulo varchar(100) not null,
	descripcion varchar(255) not null,
	idCategoria int,
	idarchivo int,
	idEstado int,
	idTipo int,
	idUsuario int,
	idMetadatos int,
	foreign key(idCategoria) references categoria(id),
	foreign key (idArchivo) references archivo(id),
	foreign key(idEstado) references estado_ova(id),
	foreign key(idTipo) references tipo_ova(id),
	foreign key(idUsuario) references usuario(id),
	foreign key(idMetadatos) references metadatos(id)
);

CREATE TABLE comentarios(
	id int auto_increment primary key not null,
	titulo varchar(60),
	contenido text,
	idUsuario int,
	idOva int,
	fecha_creacion datetime,
	constraint fk_usuario_comentario foreign key(idUsuario) references usuario(id),
	constraint fk_ova_comentario foreign key(idOva) references ova(id)
);

CREATE TABLE puntuacion(
	id int auto_increment primary key not null,
	valor int,
	idUsuario int,
	idOva int,
	fecha_creacion datetime,
	constraint fk_usuario_puntuacion foreign key(idUsuario) references usuario(id),
	constraint fk_ova_puntuacion foreign key(idOva) references ova(id)
);

