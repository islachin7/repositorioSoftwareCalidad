create database colegio CHARSET utf8 COLLATE utf8_general_ci;

use colegio;

create table anio(
idanio int(11) primary key,
estado int(11)
);

create table seccion(
seccion varchar(100) primary key,
estado int(11),
idanio int(11),
CONSTRAINT anio_f1 FOREIGN KEY (idanio) REFERENCES anio(idanio) ON DELETE RESTRICT ON UPDATE CASCADE
);

create table grado(
grado varchar(100) primary key,
estado int(11),
idanio int(11),
CONSTRAINT anio_f2 FOREIGN KEY (idanio) REFERENCES anio(idanio) ON DELETE RESTRICT ON UPDATE CASCADE
);

create table curso(
codCurso varchar(100) primary key,
nombre varchar(200),
estado int(11),
idanio int(11),
CONSTRAINT anio_f3 FOREIGN KEY (idanio) REFERENCES anio(idanio) ON DELETE RESTRICT ON UPDATE CASCADE
);


create table profesor(
usuario varchar(100) NOT NULL PRIMARY KEY,
nombre varchar(200) ,
apellido varchar(200),
dni VARCHAR(20),
direccion varchar(200),
ciudad varchar(40),
edad int(11),
telefonoCasa int(20),
telefonoMovil int(20),
correo varchar(100),
contraseña varchar(20),
estado int(11),
idanio int(11),
CONSTRAINT anio_f4 FOREIGN KEY (idanio) REFERENCES anio(idanio) ON DELETE RESTRICT ON UPDATE CASCADE
);

create table aula(
gradog varchar(80),
secciong varchar(20),
usuarioP varchar(100),
cantMax int(11),
estado int(11),
idanio int(11),
CONSTRAINT anio_f5 FOREIGN KEY (idanio) REFERENCES anio(idanio) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT profe_foreana2 FOREIGN KEY (usuarioP) REFERENCES profesor(usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT secc_foreana2 FOREIGN KEY (secciong) REFERENCES seccion(seccion) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT grado_foreana2 FOREIGN KEY (gradog) REFERENCES grado(grado) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (gradog, secciong)
);


create table asignacion(
cursod varchar(100),
profesord varchar(20),
grad varchar(80),
seccio varchar(20),
estado int(11),
idanio int(11),
CONSTRAINT anio_f6 FOREIGN KEY (idanio) REFERENCES anio(idanio) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT curso_foreana1 FOREIGN KEY (cursod) REFERENCES curso(codCurso) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT profesor_foreana1 FOREIGN KEY (profesord) REFERENCES profesor(usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT aula_fo3 FOREIGN KEY (grad) REFERENCES aula(gradog) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT aula_fo4 FOREIGN KEY (seccio) REFERENCES aula(secciong) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (cursod,grad, seccio)
);



CREATE TABLE alumno (
usuario varchar(100) NOT NULL PRIMARY KEY,
nombreh varchar(200) ,
apellidoh varchar(200) ,
dnih varchar(20),
direccionh varchar(200),
gradoa varchar(80) ,
secciona varchar(10),
sexoh varchar(20) ,
departamento varchar(200) ,   
distrito varchar(200),
obser text,
edad int(11),
nombrep varchar(200) ,
apellidop varchar(200) ,
dnip varchar(20),
estadoCi varchar(80) ,
sexop varchar(20) ,
telefono int(11),
contra varchar(60),
estado int(11),
idanio int(11),
CONSTRAINT anio_f7 FOREIGN KEY (idanio) REFERENCES anio(idanio) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT aula_fore1 FOREIGN KEY (gradoa) REFERENCES aula(gradog) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT aula_fore2 FOREIGN KEY (secciona) REFERENCES aula(secciong) ON DELETE RESTRICT ON UPDATE CASCADE
);

create table nota(
usuarioA varchar(20),
usuarioP varchar(20),
cursod varchar(20),
gradon varchar(80) ,
seccionn varchar(10),
bimestre varchar(10),
noral int(11),
nprac int(11),
ntrab int(11),
ncuad int(11),
exbi int(11),
proce double,
prome double,
estado int(11),
idanio int(11),
CONSTRAINT anio_f8 FOREIGN KEY (idanio) REFERENCES anio(idanio) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT curso_forea2 FOREIGN KEY (cursod) REFERENCES curso(codCurso) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT alumno_foreana1 FOREIGN KEY (usuarioA) REFERENCES alumno(usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT alumno_foreana2 FOREIGN KEY (usuarioP) REFERENCES profesor(usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT aula_for1 FOREIGN KEY (gradon) REFERENCES aula(gradog) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT aula_for2 FOREIGN KEY (seccionn) REFERENCES aula(secciong) ON DELETE RESTRICT ON UPDATE CASCADE,
primary key (usuarioA,usuarioP,cursod,gradon,seccionn,bimestre)
);



DELIMITER $$
CREATE  PROCEDURE LoginPadre (IN usu VARCHAR(20))  BEGIN
select usuario,contra from alumno
where usuario = usu
LIMIT 1;
END$$

DELIMITER $$
CREATE  PROCEDURE LoginProfesor (IN usu VARCHAR(20))  BEGIN
select usuario,contraseña from profesor
where usuario = usu
LIMIT 1;
END$$


DELIMITER $$
CREATE PROCEDURE InsertarProfesor (
IN codigo VARCHAR(20), 
IN nombre VARCHAR(200), 
IN apellido VARCHAR(200),
IN dni VARCHAR(20), 
IN direccion VARCHAR(200), 
IN ciudad VARCHAR(40), 
IN edad INT(11), 
IN telefonoCasa INT(11), 
IN telefonoMovil INT(11), 
IN correo VARCHAR(40), 
IN contraseña VARCHAR(40),
IN anio int(11) )
BEGIN
insert into profesor
(usuario, 
nombre, 
apellido,
dni,
direccion, 
ciudad, 
edad,
telefonoCasa,
telefonoMovil,
correo,
contraseña,
estado,
idanio
)
values(codigo, nombre, apellido, dni,direccion, ciudad, edad,telefonoCasa,telefonoMovil,correo,contraseña,0,anio);
END$$

DELIMITER $$
CREATE PROCEDURE EditarProfesor 
(IN usu VARCHAR(20), 
IN nom VARCHAR(200), 
IN ape VARCHAR(200),
IN d VARCHAR(20),
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
dni = d,
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
CREATE  PROCEDURE ConsultarProfesor (IN an int(11))  BEGIN
select * from profesor
where estado = 0 and idanio = an;
END$$

DELIMITER $$
CREATE  PROCEDURE EliminarProfesor (IN usu VARCHAR(20))  BEGIN
update profesor
set usuario = concat(usuario,'i'),
estado = 1
where usuario = usu;
END$$







DELIMITER $$
CREATE  PROCEDURE InsertarAlumno (
IN usu VARCHAR(20), 
IN nomh VARCHAR(20), 
IN apeh VARCHAR(200),
IN dnh VARCHAR(20), 
IN direh VARCHAR(200), 
IN grad varchar(80) ,
IN sec varchar(20) ,
IN sexh varchar(20) ,
IN depa varchar(200) ,
IN dis varchar(200),
IN ob text,
IN edadh int(11),
IN nomp varchar(200) ,
IN apep varchar(200) ,
IN dnp varchar(20),
IN estaCi varchar(80) ,
IN sexp varchar(20) ,
IN tele int(11),
IN pass varchar(60),
IN an int(11) 
)  
BEGIN
INSERT INTO alumno(usuario,nombreh,apellidoh,dnih,direccionh,gradoa,secciona,sexoh,departamento,
                    distrito,obser, edad, nombrep, apellidop,dnip, estadoCi,sexop,telefono,contra,estado,idanio)
VALUES(usu , nomh, apeh,dnh, direh, grad  ,sec  ,sexh  ,depa  ,dis ,ob ,edadh ,nomp  ,apep  ,dnp ,estaCi  ,
        sexp,tele,pass,0,an) ;
END$$

DELIMITER $$
CREATE  PROCEDURE EditarAlumno (
IN usu VARCHAR(20), 
IN nomh VARCHAR(20), 
IN apeh VARCHAR(200),
IN dnh VARCHAR(20), 
IN direh VARCHAR(200), 
IN grad varchar(80) ,
IN sec varchar(20) ,
IN sexh varchar(20) ,
IN depa varchar(200) ,
IN dis varchar(200),
IN ob text,
IN edadh int(11),
IN nomp varchar(200) ,
IN apep varchar(200) ,
IN dnp varchar(20),
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
gradoa=grad,
secciona=sec,
sexoh=sexh,
departamento=depa,
distrito=dis,
obser=ob,
edad=edadh,
nombrep=nomp,
apellidop=apep,
dnip=dnp,
estadoCi=estaCi,
sexop=sexp,
telefono=tele,
contra=pass
WHERE usuario = usu ;
END$$

DELIMITER $$
CREATE  PROCEDURE ConsultarAlumno (IN an int(11))  BEGIN
select * from alumno
where estado = 0 and idanio = an;
END$$

DELIMITER $$
CREATE  PROCEDURE EliminarAlumno (IN usu VARCHAR(20))  BEGIN
update alumno
set 
usuario = concat(usuario,'in'),
estado = 1
where usuario = usu;
END$$



DELIMITER $$
CREATE PROCEDURE InsertarNota (
IN alu VARCHAR(20), 
IN profe VARCHAR(20),
IN cur varchar(20),
IN gra varchar(80) ,
IN sec varchar(10), 
IN bim varchar(10),
IN nor int(11),
IN npra int(11),
IN ntra int(11),
IN ncua int(11),
IN bi int(11),
IN pro double,
IN prom double,
IN an int(11)
) BEGIN
insert into 
nota(
usuarioA, 
usuarioP,
cursod,
gradon,
seccionn,
bimestre, 
noral, 
nprac, 
ntrab,
ncuad,
exbi,
proce,
prome,
estado,
idanio
)
values(
alu,
profe,
cur,
gra,
sec,
bim,  
nor, 
npra, 
ntra,
ncua,
bi,
pro,
prom,
0,
an);
END$$


DELIMITER $$
CREATE PROCEDURE EditarNota (
IN alu VARCHAR(20), 
IN profe VARCHAR(20),
IN cur varchar(20),
IN gra varchar(80) ,
IN sec varchar(10), 
IN bim varchar(10),
IN nor int(11),
IN npra int(11),
IN ntra int(11),
IN ncua int(11),
IN bi int(11),
IN pro double,
IN prom double
) BEGIN
update nota
set 
noral=nor, 
nprac=npra, 
ntrab=ntra,
ncuad=ncua,
exbi=bi,
proce=pro,
prome=prom
where usuarioA=alu and usuarioP=profe and cursod=cur and gradon=gra and seccionn=sec and bimestre=bim;
END$$

DELIMITER $$
CREATE  PROCEDURE ConsultarNotas (in an int(11))  BEGIN
select * from nota
where estado = 0 and idanio = an;
END$$

DELIMITER $$
CREATE  PROCEDURE EliminarNota (IN usu VARCHAR(20))  BEGIN
update nota
set estado = 1
where usuarioA = usu;
END$$





DELIMITER $$
CREATE  PROCEDURE InsertarSeccion (IN sec VARCHAR(20),IN an int(11))  BEGIN
insert into seccion values(sec,0,an);
END$$

DELIMITER $$
CREATE  PROCEDURE EditarSeccion (IN seca VARCHAR(20),IN secn VARCHAR(20))  BEGIN
update seccion
set seccion = secn
where seccion = seca;
END$$

DELIMITER $$
CREATE  PROCEDURE EliminarSeccion(IN sec VARCHAR(20))  BEGIN
update seccion
set 
seccion = concat(seccion,'i'),
estado = 1
where seccion = sec;
END$$

DELIMITER $$
CREATE  PROCEDURE ConsultarSeccion (IN an int(11))  BEGIN
select * from seccion
where estado=0 and idanio = an;
END$$





DELIMITER $$
CREATE  PROCEDURE InsertarGrado (IN gra VARCHAR(20), IN an int(11))  BEGIN
insert into grado values(gra,0,an);
END$$

DELIMITER $$
CREATE  PROCEDURE EditarGrado (IN graa VARCHAR(20),IN gran VARCHAR(20))  BEGIN
update grado
set grado = gran
where grado = graa;
END$$

DELIMITER $$
CREATE  PROCEDURE EliminarGrado (IN graa VARCHAR(20))  BEGIN
update grado
set 
grado = concat(grado,'i'),
estado = 1
where grado = graa;
END$$

DELIMITER $$
CREATE  PROCEDURE ConsultarGrado (IN an int(11))  BEGIN
select * from grado
where estado=0 and idanio = an;
END$$





DELIMITER $$
CREATE  PROCEDURE InsertarAula (
IN gra VARCHAR(80),
IN sec VARCHAR(20),
IN pro VARCHAR(20),
IN can int(11),
IN an int(11)
)  BEGIN
insert into aula(
gradog,
secciong,
usuarioP,
cantMax,
estado,
idanio
) 
values(
gra,
sec,
pro,
can,
0,
an
);
END$$

DELIMITER $$
CREATE  PROCEDURE EditarAula (
IN gra VARCHAR(80),
IN sec VARCHAR(20),
IN pro VARCHAR(20),
IN can int(11)
)  BEGIN
update aula
set usuarioP=pro,
cantMax = can
where gradog = gra and secciong = sec;
END$$

DELIMITER $$
CREATE  PROCEDURE EliminarAula (IN gra VARCHAR(80), IN sec VARCHAR(20))  BEGIN
update aula
set 
estado = 1
where gradog = gra and secciong = sec;
END$$

DELIMITER $$
CREATE  PROCEDURE ConsultarAula (IN an int(11))  BEGIN
select * from aula
where estado=0 and idanio = an;
END$$






DELIMITER $$
CREATE  PROCEDURE InsertarCurso (IN cod VARCHAR(20),IN nom VARCHAR(200),IN an int(11))  BEGIN
insert into curso(codCurso, nombre, estado,idanio) values(cod,nom,0,an);
END$$

DELIMITER $$
CREATE  PROCEDURE ConsultarCurso (IN an int(11))  BEGIN
select * from curso
where estado=0 and idanio = an;
END$$

DELIMITER $$
CREATE  PROCEDURE EditarCurso (IN cod VARCHAR(20),IN nom VARCHAR(200))  
BEGIN
update curso
set nombre = nom
where `codCurso` = cod;
END$$

DELIMITER $$
CREATE  PROCEDURE EliminarCurso (IN cod VARCHAR(20))  
BEGIN
update curso
set codCurso = concat(codCurso,'i'),
estado =1
where `codCurso` = cod;
END$$



DELIMITER $$
CREATE  PROCEDURE InsertarAsignacion (
IN cur VARCHAR(20),
IN pro VARCHAR(200),
IN gra VARCHAR(80),
IN sec VARCHAR(20),
IN an int(11)
)  BEGIN
insert into asignacion(cursod, profesord, grad,seccio,estado,idanio) 
values(cur,pro,gra,sec,0,an);
END$$

DELIMITER $$
CREATE  PROCEDURE EditarAsignacion (
IN cur VARCHAR(20),
IN pro VARCHAR(200),
IN gra VARCHAR(80),
IN sec VARCHAR(20)
)  BEGIN
update asignacion
set profesord = pro
where grad = gra and cursod = cur and seccio = sec;
END$$

DELIMITER $$
CREATE  PROCEDURE EliminarAsignacion (
IN cur VARCHAR(20),
IN gra VARCHAR(80),
IN sec VARCHAR(20)
)  BEGIN
update asignacion
set estado = 1
where grad = gra and cursod = cur and seccio = sec;
END$$

DELIMITER $$
CREATE  PROCEDURE ConsultarAsignacion (IN an int(11))  BEGIN
select * from asignacion
where estado=0 and idanio=an;
END$$

DELIMITER $$
CREATE  PROCEDURE Observacion (IN palabra varchar(90))  BEGIN
select * from alumno
where usuario like concat('%',palabra,'%') or nombreh like concat('%',palabra,'%') or apellidoh like concat('%',palabra,'%');
END$$



DELIMITER $$
CREATE  PROCEDURE InsertarAnio (IN a VARCHAR(20))  BEGIN
insert into anio values(a,0);
END$$

DELIMITER $$
CREATE  PROCEDURE EditarAnio (IN an VARCHAR(20),IN na VARCHAR(20))  BEGIN
update anio
set idanio = na
where idanio = an;
END$$

DELIMITER $$
CREATE  PROCEDURE EliminarAnio(IN a VARCHAR(20))  BEGIN
update anio
set 
estado = 1
where idanio = a;
END$$

DELIMITER $$
CREATE  PROCEDURE ConsultarAnio ()  BEGIN
select * from anio
where estado=0;
END$$