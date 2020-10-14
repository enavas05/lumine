use lumine;

DROP PROCEDURE if EXISTS select_metadatos;
DELIMITER //
CREATE PROCEDURE  select_metadatos (IN m_id INT)
BEGIN 
SELECT * FROM metadatos 
where id = m_id;
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS insert_metadatos;
DELIMITER //
CREATE PROCEDURE insert_metadatos(IN m_id INT, 
IN m_autor VARCHAR(60), 
IN m_editor VARCHAR(60), 
IN m_ilustrador VARCHAR(60), 
IN m_publicador VARCHAR(60), 
IN m_iso VARCHAR(60), 
IN m_otros VARCHAR(60)) 
BEGIN
INSERT INTO metadatos (id, autor, editor, ilustrador, publicador, iso, otros) 
VALUES (m_id, m_autor, m_editor, m_ilustrador, m_publicador, m_iso, m_otros);
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS update_metadatos;
DELIMITER //
CREATE PROCEDURE update_metadatos(IN m_id INT, 
IN m_autor VARCHAR(60), 
IN m_editor VARCHAR(60), 
IN m_ilustrador VARCHAR(60), 
IN m_publicador VARCHAR(60), 
IN m_iso VARCHAR(60), 
IN m_otros VARCHAR(60)) 
BEGIN
UPDATE metadatos 
SET autor = m_autor, editor = m_editor, ilustrador = m_ilustrador, 
publicador = m_publicador, iso = m_iso, otros = m_otros
WHERE id =  m_id;
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS delete_metadatos;
DELIMITER //
CREATE PROCEDURE  delete_metadatos(IN m_id INT)
BEGIN
DELETE FROM metadatos
WHERE id = m_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS select_ova;
DELIMITER //
CREATE PROCEDURE  select_ova (IN o_id INT)
BEGIN 
SELECT * FROM ova
where id = m_id;
select 0 as mensaje; 
END //

DROP PROCEDURE IF EXISTS insert_ova;
DELIMITER //
CREATE PROCEDURE insert_ova(IN o_id INT, 
IN o_titulo VARCHAR(100), 
IN o_descripcion VARCHAR (255),
IN o_idCategoria int,
IN o_idArchivo int,
IN o_idEstado int,
IN o_idTipo int,
IN o_idUsuario int,
IN o_idMetadatos int)
BEGIN
INSERT INTO ova (id, titulo, descripcion, idCategoria, idArchivo, idEstado, idTipo, idUsuario, idMetadatos) 
VALUES (o_id, o_titulo, o_descripcion, o_idCategoria, o_idArchivo, o_idEstado, o_idTipo, o_idUsuario, o_idMetadatos);
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS update_ova;
DELIMITER //
CREATE PROCEDURE update_ova(IN o_id INT, 
IN o_titulo VARCHAR(100), 
IN o_descripcion VARCHAR (255),
IN o_idCategoria int,
IN o_idArchivo int,
IN o_idEstado int,
IN o_idTipo int,
IN o_idUsuario int,
IN o_idMetadatos int)
BEGIN
UPDATE ova
SET titulo = o_titulo, descripcion = o_descripcion, idCategoria = o_idCategoria, idArchivo = o_idArchivo, 
idEstado = o_idEstado, idTipo = o_idTipo, idUsuario = o_idUsuario, idMetadatos = o_idMetadatos 
WHERE id = o_id;
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS delete_ova;
DELIMITER //
CREATE PROCEDURE  delete_ova(IN o_id INT)
BEGIN
DELETE FROM ova
WHERE id = o_id;
select 0 as mensaje; 
END //

DROP PROCEDURE IF EXISTS select_puntuacion;
DELIMITER //
CREATE PROCEDURE  select_puntuacion(IN p_id INT)
BEGIN 
SELECT * FROM puntuacion
WHERE id = p_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS insert_puntuacion;
DELIMITER //
CREATE PROCEDURE insert_puntuacion(IN p_id INT,
IN p_valor int,
IN p_idUsuario int,
IN p_idOva int,
IN p_fecha DATETIME)
BEGIN 
INSERT INTO puntuacion(id, valor, idUsuario, idOva, fecha_creacion)
VALUES (p_id, p_valor, p_idUsuario, p_idOva, p_fecha);
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS update_puntuacion;
DELIMITER //
CREATE PROCEDURE update_puntuacion(IN p_id INT,
IN p_valor int,
IN p_idUsuario int,
IN p_idOva int,
IN p_fecha DATETIME)
BEGIN 
UPDATE puntuacion
SET valor = p_valor, idUsuario = p_idUsuario,
idOva = p_idOva, fecha_creacion = p_fecha
WHERE id = p_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS delete_puntuacion;
DELIMITER //
CREATE PROCEDURE delete_puntuacion(IN p_id INT)
BEGIN
DELETE from puntuacion
where id = p_id;
select 0 as mensaje; 
END //

DROP PROCEDURE IF EXISTS select_comentarios;
DELIMITER //
CREATE PROCEDURE  select_comentarios(IN c_id INT)
BEGIN 
SELECT * FROM comentarios
WHERE id = c_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS insert_comentarios;
DELIMITER //
CREATE PROCEDURE insert_comentarios(IN c_id INT,
IN c_titulo VARCHAR (60),
IN c_contenido TEXT,
IN c_idUsuario int,
IN c_idOva int,
IN c_fecha DATETIME)
BEGIN 
INSERT INTO comentarios(id, titulo, contenido, idUsuario, idOva, fecha_creacion)
VALUES (c_id, c_titulo, c_contenido, c_idUsuario, c_idOva, c_fecha);
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS update_comentarios;
DELIMITER //
CREATE PROCEDURE update_comentarios(IN c_id INT,
IN c_titulo VARCHAR (60),
IN c_contenido TEXT,
IN c_idUsuario int,
IN c_idOva int,
IN c_fecha DATETIME)
BEGIN 
UPDATE comentarios
SET titulo = c_titulo, contenido = c_contenido, idUsuario = c_idUsuario,
idOva = c_idOva, fecha_creacion = c_fecha 
WHERE id = c_id;
END //

DROP PROCEDURE if EXISTS delete_comentarios;
DELIMITER //
CREATE PROCEDURE delete_comentarios(IN c_id INT)
BEGIN
DELETE from comentarios
where id = c_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS select_permisos;
DELIMITER //
CREATE PROCEDURE select_permisos (IN p_id INT)
BEGIN 
SELECT * FROM permisos 
where id = p_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS insert_permisos;
DELIMITER //
CREATE PROCEDURE insert_permisos (IN p_id INT,
IN p_codigo char(8),
IN p_tipo SMALLINT,
IN p_idGrupo int)
BEGIN 
INSERT INTO permisos(id, codigo, tipo, idGrupo) 
VALUES (p_id, p_codigo, p_tipo, p_idGrupo);
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS update_permisos;
DELIMITER //
CREATE PROCEDURE update_permisos (IN p_id INT,
IN p_codigo char(8),
IN p_tipo SMALLINT,
IN p_idGrupo int)
BEGIN 
UPDATE permisos
SET codigo = p_codigo, tipo = p_tipo, idGrupo = p_idGrupo
WHERE id = p_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS delete_permisos;
DELIMITER //
CREATE PROCEDURE delete_permisos(IN p_id INT)
BEGIN
DELETE from permisos
where id = p_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS select_tipo_ova;
DELIMITER //
CREATE PROCEDURE select_tipo_ova(IN t_id INT)
BEGIN
Select * from tipo_ova
where id = t_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS insert_tipo_ova;
DELIMITER //
CREATE PROCEDURE insert_tipo_ova (IN t_id INT,
IN t_descripcion varchar(255),
IN t_tipo enum('scorm', 'html5', 'otros'))
BEGIN 
INSERT INTO tipo_ova(id, descripcion, tipo) 
VALUES (t_id, t_descripcion, t_tipo);
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS update_tipo_ova;
DELIMITER //
CREATE PROCEDURE update_tipo_ova (IN t_id INT,
IN t_descripcion varchar(255),
IN t_tipo enum('scorm', 'html5', 'otros'))
BEGIN 
UPDATE tipo_ova 
SET descripcion = t_descripcion, tipo = t_tipo
WHERE id = t_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS delete_tipo_ova;
DELIMITER //
CREATE PROCEDURE delete_tipo_ova(IN t_id INT)
BEGIN
DELETE from tipo_ova
where id = t_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS select_archivo;
CREATE PROCEDURE  select_archivo(IN a_id INT)
SELECT * FROM archivo
where id = a_id;

DROP PROCEDURE IF EXISTS insert_archivo;
DELIMITER //
CREATE PROCEDURE insert_archivo(IN a_id INT, 
IN a_nombre VARCHAR(60), 
IN a_tamaño INT(11), 
IN a_fecha_creacion date, 
IN a_editable tinyint(1), 
IN a_visible tinyint(1), 
IN a_url VARCHAR(255),
IN a_idUsuario int(11))  
BEGIN
INSERT INTO archivo (id, nombre, tamaño, fecha_creacion, editable, visible, url, idUsuario)
VALUES (a_id, a_nombre, a_tamaño, a_fecha_creacion, a_editable, a_visible, a_url, a_idUsuario);
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS update_archivo;
DELIMITER //
CREATE PROCEDURE update_archivo(IN _id INT, 
IN a_nombre VARCHAR(60), 
IN a_tamaño INT (11), 
IN a_fecha_creacion date, 
IN a_editable tinyint(1), 
IN a_visible tinyint(1), 
IN a_url VARCHAR(255),
IN a_idUsuario int (11)) 
BEGIN
UPDATE archivo
SET id=a_id, nombre = a_nombre, tamaño= a_tamaño, 
fecha_creacion=a_fecha_creacion,editable = a_editable, 
visible=a_visible, url= a_url, idUsuario=a_idUsuario
WHERE id =  a_id;
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS delete_archivo;
DELIMITER //
CREATE PROCEDURE  delete_archivo(IN a_id INT)
BEGIN
DELETE FROM archivo
WHERE id = a_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS select_estado;
CREATE PROCEDURE  select_estado(IN e_id INT)
SELECT * FROM estado
where id = e_id;


DROP PROCEDURE IF EXISTS insert_estado;
DELIMITER //
CREATE PROCEDURE insert_estado(IN e_id INT, 
IN e_estado enum('enviado','en revisión','publicado','rechazado'),
IN e_descripcion varchar (255),
IN e_fecha_creacion date)
BEGIN
INSERT INTO estado_ova (id,estado,descripcion,fecha_creacion)
VALUES (e_id,e_estado,e_descripcion,e_fecha_creacion);
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS update_estado;
DELIMITER //
CREATE PROCEDURE update_estado(IN e_id INT, 
IN e_estado enum ('enviado','en revisión','publicado','rechazado'),
IN e_descripcion varchar (255),
IN e_fecha_creacion date)
BEGIN
UPDATE estado 
SET id=e_id, estado=e_estado, descripcion=e_descripcion, fecha_creacion=e_fecha_creacion
WHERE id =  e_id;
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS delete_estado;
DELIMITER //
CREATE PROCEDURE  delete_estado(IN e_id INT)
BEGIN
DELETE FROM estado
WHERE id = e_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS select_usuario;
CREATE PROCEDURE  select_usuario(IN u_id INT)
SELECT * FROM usuario
where id = u_id;

DROP PROCEDURE IF EXISTS insert_usuario;
DELIMITER //
CREATE PROCEDURE insert_usuario(IN u_id INT, 
IN u_usuario varchar(100),
IN u_nombre VARCHAR(60), 
IN u_estado enum("Bloqueado", "Activo", "Inactivo", "Nuevo"),
IN u_email VARCHAR(60), 
IN u_contraseña varchar(250),
IN u_idRol int (11),
IN u_idGrupo int (11),
IN u_fecha_vencimiento DATE,
IN u_primer_acceso DATETIME,
IN u_ultimo_acceso DATETIME,
IN u_creado_por varchar (15),
IN u_fecha_creacion date,
IN u_modificado_por VARCHAR (15),
IN u_fecha_modificacion DATETIME)
BEGIN
INSERT INTO usuario (id,usuario,nombre,estado,email,contraseña,idRol,idGrupo,fecha_vencimiento,primer_acceso,ultimo_acceso,creado_por,fecha_creacion,modificado_por,fecha_modificacion)
VALUES (u_id,u_usuario,u_nombre,u_estado,u_email,u_contraseña,u_idRol,u_idGrupo,u_fecha_vencimiento,u_primer_acceso,u_ultimo_acceso,u_creado_por,u_fecha_creacion,u_modificado_por,u_fecha_modificacion);
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS update_usuario;
DELIMITER //
CREATE PROCEDURE update_usuario(IN u_id INT, 
IN u_usuario VARCHAR (100),
IN u_nombre VARCHAR(60), 
IN u_estado enum("Bloqueado", "Activo", "Inactivo", "Nuevo"),
IN u_email VARCHAR(60),  
IN u_contraseña varchar(250),
IN u_idRol int (11),
IN u_idGrupo int (11),
IN u_fecha_vencimiento date,
IN u_primer_acceso DATETIME,
IN u_ultimo_acceso DATETIME,
IN u_creado_por varchar (15),
IN u_fecha_creacion date,
IN u_modificado_por VARCHAR (15),
IN u_fecha_modificacion DATETIME)
BEGIN
UPDATE usuario
SET id=u_id, u_usuario=usuario, nombre = u_nombre, u_estado=estado,
email=u_email, contraseña=u_contraseña, idRol=u_idRol, idGrupo=u_idGrupo, 
fecha_vencimiento=u_fecha_vencimiento, primer_acceso=u_primer_acceso,ultimo_acceso = u_ultimo_acceso,
creado_por=u_creado_por, fecha_creacion=u_fecha_creacion, modificado_por=u_modificado_por, fecha_modificacion = u_fecha_modificacion
WHERE id =  u_id;
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS delete_usuario;
DELIMITER //
CREATE PROCEDURE  delete_usuario(IN u_id INT)
BEGIN
DELETE FROM usuario
WHERE id = u_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS select_categoria;
CREATE PROCEDURE  select_categoria(IN ca_id INT)
SELECT * FROM categoria
where id = ca_id;

DROP PROCEDURE IF EXISTS insert_categoria;
DELIMITER //
CREATE PROCEDURE insert_categoria(IN ca_id INT, 
IN ca_nombre VARCHAR (60),
IN ca_descripcion VARCHAR (255),
IN ca_visible TINYINT (1)) 
BEGIN
INSERT INTO categoria(id, nombre, descripcion, visible)
VALUES (ca_id,ca_nombre,ca_descripcion,ca_visible);
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS update_categoria;
DELIMITER //
CREATE PROCEDURE update_categoria(IN ca_id INT, 
IN ca_nombre VARCHAR (60),
IN ca_descripcion VARCHAR (255),
IN ca_visible TINYINT (1))  
BEGIN
UPDATE categoria
SET id=ca_id, nombre = ca_nombre, descripcion =ca_descripcion, visible =ca_visible
WHERE id =  ca_id;
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS delete_categoria;
DELIMITER //
CREATE PROCEDURE  delete_categoria(IN ca_id INT)
BEGIN
DELETE FROM categoria
WHERE id = ca_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS select_grupo;
CREATE PROCEDURE  select_grupo(IN g_id INT)
SELECT * FROM grupo
where id = g_id;

DROP PROCEDURE IF EXISTS insert_grupo;
DELIMITER //
CREATE PROCEDURE insert_grupo(IN g_id INT, 
IN g_nombre VARCHAR(60), 
IN g_descripcion VARCHAR(255), 
IN g_creado_por VARCHAR(15),
IN g_fecha_creacion date,
IN g_modificado_por VARCHAR(15),
IN g_fecha_modificacion date)
BEGIN
INSERT INTO grupo(id,nombre,descripcion,creado_por,fecha_creacion,modificado_por,fecha_modificacion)
VALUES (g_id,g_nombre,g_descripcion,g_creado_por,g_fecha_creacion,g_modificado_por,g_fecha_modificacion);
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS update_grupo;
DELIMITER //
CREATE PROCEDURE update_grupo(IN g_id INT, 
IN g_nombre VARCHAR(60), 
IN g_descripcion VARCHAR (255), 
IN g_creado_por VARCHAR(15),
IN g_fecha_creacion date,
IN g_modificado_por VARCHAR(15),
IN g_fecha_modificacion date) 
BEGIN
UPDATE grupo
SET id=g_id, nombre=g_nombre, descripcion=g_descripcion, creado_por=g_creado_por,
fecha_creacion=g_fecha_creacion, modificado_por=g_modificado_por, fecha_modificacion=g_modificado_por
WHERE id = g_id;
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS delete_grupo;
DELIMITER //
CREATE PROCEDURE  delete_grupo(IN g_id INT)
BEGIN
DELETE FROM grupo
WHERE id = g_id;
select 0 as mensaje; 
END //

DROP PROCEDURE if EXISTS select_rol;
CREATE PROCEDURE  select_rol(IN r_id INT)
SELECT * FROM rol
where id = r_id;

DROP PROCEDURE IF EXISTS insert_rol;
DELIMITER //
CREATE PROCEDURE insert_rol(IN r_id INT, 
IN r_rol VARCHAR(60), 
IN r_descripcion VARCHAR (255),
IN r_creado_por VARCHAR (15), 
IN r_fecha_creacion date,
IN r_modificado_por VARCHAR (15),
IN r_fecha_modificacion DATE)
BEGIN
INSERT INTO roles(id, rol, descripcion,creado_por, fecha_creacion, modificado_por, fecha_modificacion)
VALUES (r_id,r_rol,r_descripcion, r_creado_por, r_fecha_creacion, r_modificado_por, r_fecha_modificacion);
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS update_rol;
DELIMITER //
CREATE PROCEDURE update_rol(IN r_id INT, 
IN r_nombre VARCHAR(60), 
IN r_descripcion VARCHAR (255), 
IN r_creado_por VARCHAR (15), 
IN r_fecha_creacion date,
IN r_modificado_por VARCHAR (15),
IN r_fecha_modificacion DATE)
BEGIN
UPDATE rol
SET id=r_id, nombre=r_nombre, descripcion=r_descripcion, creado_por=r_creado_por,
fecha_creacion=r_fecha_creacion, modificado_por= r_modificado_por, fecha_modificacion=r_fecha_modificacion
WHERE id = r_id;
SELECT 0 AS mensaje; 
END //

DROP PROCEDURE IF EXISTS delete_rol;
DELIMITER //
CREATE PROCEDURE  delete_rol(IN r_id INT)
BEGIN
DELETE FROM rol
WHERE id = r_id;
select 0 as mensaje; 
END //