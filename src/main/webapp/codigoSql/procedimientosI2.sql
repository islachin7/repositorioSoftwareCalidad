
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
anio
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
where estado = 0 and anio = an;
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
                    distrito,obser, edad, nombrep, apellidop,dnip, estadoCi,sexop,telefono,contra,estado,anio)
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
where estado = 0 and anio = an;
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
anio
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
where estado = 0 and anio = an;
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
where estado=0 and anio = an;
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
where estado=0 and anio = an;
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
anio
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
where estado=0 and anio = an;
END$$


DELIMITER $$
CREATE  PROCEDURE InsertarCurso (IN cod VARCHAR(20),IN nom VARCHAR(200),IN an int(11))  BEGIN
insert into curso(codCurso, nombre, estado,anio) values(cod,nom,0,an);
END$$

DELIMITER $$
CREATE  PROCEDURE ConsultarCurso (IN an int(11))  BEGIN
select * from curso
where estado=0 and anio = an;
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
insert into asignacion(cursod, profesord, grad,seccio,estado,anio) 
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
where estado=0 and anio=an;
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
set anio = na
where anio = an;
END$$

DELIMITER $$
CREATE  PROCEDURE EliminarAnio(IN a VARCHAR(20))  BEGIN
update anio
set 
estado = 1
where anio = a;
END$$

DELIMITER $$
CREATE  PROCEDURE ConsultarAnio ()  BEGIN
select * from anio
where estado=0;
END$$