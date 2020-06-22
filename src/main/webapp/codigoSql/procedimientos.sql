DELIMITER $$
CREATE PROCEDURE `InsertarProfesor` (
IN `codigo` VARCHAR(20), 
IN `nombre` VARCHAR(200), 
IN `apellido` VARCHAR(200), 
IN `direccion` VARCHAR(200), 
IN `ciudad` VARCHAR(40), 
IN `edad` INT(11), 
IN `telefonoCasa` INT(11), 
IN `telefonoMovil` INT(11), 
IN `correo` VARCHAR(40), 
IN `contraseña` VARCHAR(40))  
BEGIN
insert into profesor
(usuario, 
nombre, 
apellido,
direccion, 
ciudad, 
edad,
telefonoCasa,
telefonoMovil,
correo,
contraseña,
estado
)
values(codigo, nombre, apellido, direccion, ciudad, edad,telefonoCasa,telefonoMovil,correo,contraseña,0);
END$$

DELIMITER $$
CREATE PROCEDURE `ModificarProfesor` 
(IN usu VARCHAR(20), 
IN nom VARCHAR(200), 
IN ape VARCHAR(200), 
IN direc VARCHAR(200), 
IN ciu VARCHAR(40), 
IN eda VARCHAR(40), 
IN teCasa INT(11), 
IN teMovil VARCHAR(200), 
IN cor VARCHAR(40), 
IN contra VARCHAR(40)
)  BEGIN
update profesor
set nombre =nom,
apellido = ape,
direccion = direc,
ciudad = ciu,
edad = eda,
telefonoCasa = teCasa,
telefonoMovil = teMovil,
correo = cor,
contraseña = contra
where usuario = usu;
END$$

DELIMITER $$
CREATE  PROCEDURE `ConsultarProfesor` ()  BEGIN
select * from profesor
where estado = 0;
END$$

DELIMITER $$
CREATE  PROCEDURE `EliminarProfesor` (IN usu VARCHAR(20))  BEGIN
update profesor
set estado = 1
where usuario = usu;
END$$

DELIMITER $$
CREATE  PROCEDURE `LoginProfesor` (IN usu VARCHAR(20))  BEGIN
select usuario,contraseña from profesor
where usuario = usu
LIMIT 1;
END$$




DELIMITER $$
CREATE  PROCEDURE `InsertarAlumno` (
IN usu VARCHAR(20), 
IN nomh VARCHAR(20), 
IN apeh VARCHAR(200),
IN dnh VARCHAR(20), 
IN direh VARCHAR(200), 
IN grad varchar(80) ,
IN sexh varchar(20) ,
IN depa varchar(200) ,
IN dis varchar(200),
IN ob text,
IN edadh int(11),
IN nomp varchar(200) ,
IN apep varchar(200) ,
IN dnp varchar(20),
IN direp varchar(200),
IN estaCi varchar(80) ,
IN sexp varchar(20) ,
IN tele int(11),
IN pass varchar(60)
)  
BEGIN
    INSERT
INTO
    alumno(
        usuario,
        nombreh,
        apellidoh,
        dnih,
        direccionh,
        grado,
        sexoh,
        departamento,
        distrito,
        obser,
        edad,
        nombrep,
        apellidop,
        dnip,
        direccionp,
        estadoCi,
        sexop,
        telefono,
        contra,
        estado
    )
VALUES(
usu , 
nomh, 
apeh,
dnh, 
direh, 
grad  ,
sexh  ,
depa  ,
dis ,
ob ,
edadh ,
nomp  ,
apep  ,
dnp ,
direp ,
estaCi  ,
sexp,
tele,
pass,
0
) ;
END$$

DELIMITER $$
CREATE  PROCEDURE `ModificarAlumnno` (
IN usu VARCHAR(20), 
IN nomh VARCHAR(20), 
IN apeh VARCHAR(200),
IN dnh VARCHAR(20), 
IN direh VARCHAR(200), 
IN grad varchar(80) ,
IN sexh varchar(20) ,
IN depa varchar(200) ,
IN dis varchar(200),
IN ob text,
IN edadh int(11),
IN nomp varchar(200) ,
IN apep varchar(200) ,
IN dnp varchar(20),
IN direp varchar(200),
IN estaCi varchar(80) ,
IN sexp varchar(20) ,
IN tele int(11),
IN pass varchar(60)
)  BEGIN

UPDATE alumno
SET nombreh = nomh,
apellidoh=apeh,
dnih=dnh,
direccionh=direh,
grado=grad,
sexoh=sexh,
departamento=depa,
distrito=dis,
obser=ob,
edad=edadh,
nombrep=nomp,
apellidop=apep,
dnip=dnp,
direccionp=direp,
estadoCi=estaCi,
sexop=sexp,
telefono=tele,
contra=pass
WHERE usuario = usu ;
END$$

DELIMITER $$
CREATE  PROCEDURE `ConsultarAlumno` ()  BEGIN
select * from alumno
where estado = 0;
END$$

DELIMITER $$
CREATE  PROCEDURE `EliminarAlumno` (IN usu VARCHAR(20))  BEGIN
update alumno
set estado = 1
where usuario = usu;
END$$

DELIMITER $$
CREATE PROCEDURE `InsertarNota` (
IN usu VARCHAR(20), 
IN nom VARCHAR(200), 
IN ape VARCHAR(200), 
IN nor int(11),
IN npra int(11),
IN ntra int(11),
IN ncua int(11),
IN bi int(11),
IN pro double,
IN prom double
) BEGIN
insert into 
nota(
usuarioA, 
nombre, 
apellido, 
noral, 
nprac, 
ntrab,
ncuad,
exbi,
proce,
prome,
estado
)
values(
usu,
nom, 
ape, 
nor, 
npra, 
ntra,
ncua,
bi,
pro,
prom,
0);
END$$



DELIMITER $$
CREATE  PROCEDURE `ModificarNota` (
IN usu VARCHAR(20), 
IN nom VARCHAR(200), 
IN ape VARCHAR(200), 
IN nor int(11),
IN npra int(11),
IN ntra int(11),
IN ncua int(11),
IN bi int(11),
IN pro double,
IN prom double
)  BEGIN

UPDATE nota
SET  
nombre=nom, 
apellido=ape, 
noral=nor, 
nprac=npra, 
ntrab=ntra,
ncuad=ncua,
exbi=bi,
proce=pro,
prome=prom
WHERE usuarioA = usu ;
END$$

DELIMITER $$
CREATE  PROCEDURE `ConsultarNotas` ()  BEGIN
select * from nota
where estado = 0;
END$$

DELIMITER $$
CREATE  PROCEDURE `EliminarNota` (IN usu VARCHAR(20))  BEGIN
update nota
set estado = 1
where usuarioA = usu;
END$$

DELIMITER $$
CREATE  PROCEDURE `LoginPadre` (IN usu VARCHAR(20))  BEGIN
select usuario,contra from alumno
where usuario = usu
LIMIT 1;
END$$






