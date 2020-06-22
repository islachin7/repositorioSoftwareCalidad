
CREATE TABLE alumno (
  usuario varchar(20) NOT NULL PRIMARY KEY,
  nombreh varchar(200) ,
  apellidoh varchar(200) ,
  dnih varchar(20),
  direccionh varchar(200),
  grado varchar(80) ,
  sexoh varchar(20) ,
  departamento varchar(200) ,
  distrito varchar(200),
  obser text,
  edad int(11),
  nombrep varchar(200) ,
  apellidop varchar(200) ,
  dnip varchar(20),
  direccionp varchar(200),
  estadoCi varchar(80) ,
  sexop varchar(20) ,
  telefono int(11),
  contra varchar(60),
  estado int(11) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table profesor(
usuario varchar(20) NOT NULL PRIMARY KEY,
nombre varchar(200) ,
apellido varchar(200),
direccion varchar(200) ,
ciudad varchar(40),
edad int(11),
telefonoCasa int(20),
telefonoMovil int(20),
correo varchar(100),
contraseña varchar(20),
estado int(11)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table nota(
usuarioA varchar(20) primary key,
nombre varchar(200),
apellido varchar(200),
noral int(11),
nprac int(11),
ntrab int(11),
ncuad int(11),
exbi int(11),
proce double,
prome double,
estado int(11)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

