create table anio(
anio int(11) primary key,
estado int(11)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table seccion(
seccion varchar(100) primary key,
estado int(11),
anio int(11),
CONSTRAINT anio_f1 FOREIGN KEY (anio) REFERENCES anio(anio) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table grado(
grado varchar(100) primary key,
estado int(11),
anio int(11),
CONSTRAINT anio_f2 FOREIGN KEY (anio) REFERENCES anio(anio) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table curso(
codCurso varchar(100) primary key,
nombre varchar(200),
estado int(11),
anio int(11),
CONSTRAINT anio_f3 FOREIGN KEY (anio) REFERENCES anio(anio) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
anio int(11),
CONSTRAINT anio_f4 FOREIGN KEY (anio) REFERENCES anio(anio) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table aula(
gradog varchar(80),
secciong varchar(20),
usuarioP varchar(20),
cantMax int(11),
estado int(11),
anio int(11),
CONSTRAINT anio_f5 FOREIGN KEY (anio) REFERENCES anio(anio) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT profe_foreana2 FOREIGN KEY (usuarioP) REFERENCES profesor(usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT secc_foreana2 FOREIGN KEY (secciong) REFERENCES seccion(seccion) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT grado_foreana2 FOREIGN KEY (gradog) REFERENCES grado(grado) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (gradog, secciong)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table asignacion(
cursod varchar(100),
profesord varchar(20),
grad varchar(80),
seccio varchar(20),
estado int(11),
anio int(11),
CONSTRAINT anio_f6 FOREIGN KEY (anio) REFERENCES anio(anio) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT curso_foreana1 FOREIGN KEY (cursod) REFERENCES curso(codCurso) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT profesor_foreana1 FOREIGN KEY (profesord) REFERENCES profesor(usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT aula_fo3 FOREIGN KEY (grad) REFERENCES aula(gradog) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT aula_fo4 FOREIGN KEY (seccio) REFERENCES aula(secciong) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (cursod,grad, seccio)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
anio int(11),
CONSTRAINT anio_f7 FOREIGN KEY (anio) REFERENCES anio(anio) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT aula_fore1 FOREIGN KEY (gradoa) REFERENCES aula(gradog) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT aula_fore2 FOREIGN KEY (secciona) REFERENCES aula(secciong) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
anio int(11),
CONSTRAINT anio_f8 FOREIGN KEY (anio) REFERENCES anio(anio) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT curso_forea2 FOREIGN KEY (cursod) REFERENCES curso(codCurso) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT alumno_foreana1 FOREIGN KEY (usuarioA) REFERENCES alumno(usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT alumno_foreana2 FOREIGN KEY (usuarioP) REFERENCES profesor(usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT aula_for1 FOREIGN KEY (gradon) REFERENCES aula(gradog) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT aula_for2 FOREIGN KEY (seccionn) REFERENCES aula(secciong) ON DELETE RESTRICT ON UPDATE CASCADE,
primary key (usuarioA,usuarioP,cursod,gradon,seccionn,bimestre)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
