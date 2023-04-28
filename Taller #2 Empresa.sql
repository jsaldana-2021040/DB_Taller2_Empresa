-- José Roberto Saldaña Arrazola--
-- Código técnico: IN5BM --
-- Grupo: 2 --
-- Jornada Matutina --

-- DDL --
drop database if exists empresa;
create database empresa;
use empresa;

create table if not exists tipos_empleados (
	id int not null auto_increment,
    nombre_tipo_empleado VARCHAR(45) not null,
    sueldo_base DECIMAL(10,2) not null,
    bonificacion_ley DECIMAL(10,2) not null,
    bonificacion_empresa DECIMAL(10,2),
    constraint pk_tipos_empleados primary key (id)
);

create table if not exists departamentos_empresas (
	id int not null auto_increment,
	nombre_depto_emp VARCHAR(45) not null,
    constraint pk_departamentos_empresas primary key(id)
);

create table if not exists regiones (
	id int not null auto_increment,
    nombre_region VARCHAR(255) not null,
	constraint pk_regiones primary key (id)
);

create table if not exists telefonos (
	id int not null auto_increment,
	numero_telefono VARCHAR(8) not null,
    constraint pk_telefonos primary key (id)
);

create table if not exists departamentos_guate (
	id int not null auto_increment,
	nombre_depto_guate VARCHAR(45) not null,
    region_id int not null,
    constraint pk_departamentos_guate primary key (id),
    constraint fk_departamentos_guate_regiones
		foreign key (region_id)
		references regiones (id)
);

create table if not exists oficinas (
	id int not null auto_increment,
    direccion VARCHAR(45),
    departamentos_guate_id int not null,
    constraint pk_oficinas primary key(id),
    constraint fk_oficinas_departamentos_guate
		foreign key (departamentos_guate_id)
		references departamentos_guate (id) 
);

create table if not exists depto_emp_oficinas (
	id int not null auto_increment,
	departamento_empresa_id int not null,
    oficina_id int not null,
    telefono_id int not null,
    constraint pk_empleados primary key (id),
    constraint fk_empleados_departamentos_empresas
		foreign key (departamento_empresa_id)
		references departamentos_empresas (id),
	constraint fk_empleados_oficinas
		foreign key (oficina_id)
        references oficinas (id),
	constraint fk_empleados_telefonos
		foreign key (telefono_id)
        references telefonos (id)
);


create table if not exists empleados (
	id int not null auto_increment,
    nombre VARCHAR(45) not null,
	apellido VARCHAR(45) not null,
    fecha_nacimiento DATE not null,
    fecha_contratacion DATE not null,
    telefono VARCHAR(8),
    tipo_empleado_id int not null,
    depto_emp_oficina_id int not null,
    constraint pk_empleados primary key (id),
    constraint fk_empleados_tipos_empleados
		foreign key (tipo_empleado_id) 
		references tipos_empleados(id),
	constraint fk_empleados_depto_emp_oficinas
		foreign key (depto_emp_oficina_id)
        references depto_emp_oficinas (id)
);
-- DDL --

-- DML --
insert into tipos_empleados (nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ("Jefe de departamento",35345.00 , 250.00, 3000.00);
insert into tipos_empleados (nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ("Repartidor",11548.00 , 250.00, 250.00);
insert into tipos_empleados (nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ("Recepcionista",64581.00 , 250.00, 425.00);
insert into tipos_empleados (nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ("Secretaria",10124.00 , 250.00, 820.00);
insert into tipos_empleados (nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ("Contador",1245.50 , 250.00, 1000.00);
insert into tipos_empleados (nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ("Jefe de sección",30156.32 , 250.00, 124.00);
insert into tipos_empleados (nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ("Cajero",50000.00 , 250.00, 345.00);
insert into tipos_empleados (nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ("Bodeguero",37215.00 , 250.00, 210.00);
insert into tipos_empleados (nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ("Director",36450.00 , 250.00, 500.00);
insert into tipos_empleados (nombre_tipo_empleado, sueldo_base, bonificacion_ley, bonificacion_empresa)
values ("Gerente",45000.00 , 250.00, 100.00);

insert into departamentos_empresas (nombre_depto_emp)
values ("Financiero");
insert into departamentos_empresas (nombre_depto_emp)
values ("Recursos humanos");
insert into departamentos_empresas (nombre_depto_emp)
values ("Marketing");
insert into departamentos_empresas (nombre_depto_emp)
values ("Comercial");
insert into departamentos_empresas (nombre_depto_emp)
values ("Compras");
insert into departamentos_empresas (nombre_depto_emp)
values ("Logistica");
insert into departamentos_empresas (nombre_depto_emp)
values ("Control de gestion");
insert into departamentos_empresas (nombre_depto_emp)
values ("Comite de direccion");
insert into departamentos_empresas (nombre_depto_emp)
values ("Administrativo");
insert into departamentos_empresas (nombre_depto_emp)
values ("Contabilidad");

insert into regiones (nombre_region)
values ("Región I o Metropolitana: Guatemala");
insert into regiones (nombre_region)
values ("Región II o Verapaz: Alta Verapaz y Baja Verapaz");
insert into regiones (nombre_region)
values ("Región III o Nororiente: Chiquimula, El Progreso, Izabal y Zacapa");
insert into regiones (nombre_region)
values ("Región IV o Suroriente: Jutiapa, Jalapa y Santa Rosa");
insert into regiones (nombre_region)
values ("Región V o Central: Chimaltenango, Sacatepéquez y Escuintla");
insert into regiones (nombre_region)
values ("Región VI o Suroccidente: Quetzaltenango, Retalhuleu, San Marcos, Suchitepéquez, Sololá y Totonicapán");
insert into regiones (nombre_region)
values ("Región VII o Noroccidente: Huehuetenango y Quiché.");
insert into regiones (nombre_region)
values ("Región VIII o Petén: Petén");

insert into telefonos (numero_telefono)
values ("34658915");
insert into telefonos (numero_telefono)
values ("34679512");
insert into telefonos (numero_telefono)
values ("64985761");
insert into telefonos (numero_telefono)
values ("84651249");
insert into telefonos (numero_telefono)
values ("84651051");
insert into telefonos (numero_telefono)
values ("34921054");
insert into telefonos (numero_telefono)
values ("34680124");
insert into telefonos (numero_telefono)
values ("49501245");
insert into telefonos (numero_telefono)
values ("94675201");
insert into telefonos (numero_telefono)
values ("46785798");

insert into departamentos_guate (nombre_depto_guate,region_id)
values ("Jalapa",4);
insert into departamentos_guate (nombre_depto_guate,region_id)
values ("Guatemala",1);
insert into departamentos_guate (nombre_depto_guate,region_id)
values ("Quiché",7);
insert into departamentos_guate (nombre_depto_guate,region_id)
values ("El Progreso",3);
insert into departamentos_guate (nombre_depto_guate,region_id)
values ("Quetzaltenango",6);
insert into departamentos_guate (nombre_depto_guate,region_id)
values ("Petén",8);
insert into departamentos_guate (nombre_depto_guate,region_id)
values ("Escuintla",5);
insert into departamentos_guate (nombre_depto_guate,region_id)
values ("Alta Verapaz",2);
insert into departamentos_guate (nombre_depto_guate,region_id)
values ("Chimaltenango",5);
insert into departamentos_guate (nombre_depto_guate,region_id)
values ("Izabal",3);

insert into oficinas (direccion, departamentos_guate_id)
values ("9A Avenida 56-21",10);
insert into oficinas (direccion, departamentos_guate_id)
values ("7A Avenida 22-72",7);
insert into oficinas (direccion, departamentos_guate_id)
values ("4A Avenida 13-84",3);
insert into oficinas (direccion, departamentos_guate_id)
values ("8A Avenida 44-27",6);
insert into oficinas (direccion, departamentos_guate_id)
values ("57A Avenida 15-34",2);
insert into oficinas (direccion, departamentos_guate_id)
values ("46A Avenida 45-30",4);
insert into oficinas (direccion, departamentos_guate_id)
values ("22A Avenida 20-56",9);
insert into oficinas (direccion, departamentos_guate_id)
values ("34A Avenida 15-84",8);
insert into oficinas (direccion, departamentos_guate_id)
values ("56A Avenida 15-67",5);
insert into oficinas (direccion, departamentos_guate_id)
values ("21A Avenida 78-33",1);

insert into depto_emp_oficinas (departamento_empresa_id, oficina_id, telefono_id)
values (5,2,3);
insert into depto_emp_oficinas (departamento_empresa_id, oficina_id, telefono_id)
values (7,10,6);
insert into depto_emp_oficinas (departamento_empresa_id, oficina_id, telefono_id)
values (9,4,1);
insert into depto_emp_oficinas (departamento_empresa_id, oficina_id, telefono_id)
values (10,7,4);
insert into depto_emp_oficinas (departamento_empresa_id, oficina_id, telefono_id)
values (1,3,10);
insert into depto_emp_oficinas (departamento_empresa_id, oficina_id, telefono_id)
values (3,6,8);
insert into depto_emp_oficinas (departamento_empresa_id, oficina_id, telefono_id)
values (6,8,5);
insert into depto_emp_oficinas (departamento_empresa_id, oficina_id, telefono_id)
values (2,5,7);
insert into depto_emp_oficinas (departamento_empresa_id, oficina_id, telefono_id)
values (4,1,9);
insert into depto_emp_oficinas (departamento_empresa_id, oficina_id, telefono_id)
values (8,9,2);

insert into empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ("Juan", "Garcia", "1979-02-21", "2021-05-01", "16495764", 2, 3);
insert into empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ("Antonia", "Mendez", "1995-02-21", "2020-10-11", "60319570", 6, 3);
insert into empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ("José", "Castillo", "1998-05-30", "2017-08-24", "64950315", 3, 5);
insert into empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ("Andres", "Mendoza", "1970-09-11", "1999-03-29", "34956705", 1, 3);
insert into empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ("Eduardo", "Dias", "1980-08-24", "2000-11-05", "64805465", 5, 4);
insert into empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ("Esteban", "Ramirez", "1976-10-18", "1997-02-08", "47895042", 8, 9);
insert into empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ("Josue", "Sanches", "1984-08-16", "2005-12-13", "26794305", 7, 2);
insert into empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ("Maria", "Rodrigues", "2000-10-27", "2020-02-10", "58946102", 4, 7);
insert into empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ("Roberto", "Hernandez", "1968-11-03", "1995-04-04", "34916750", 9, 1);
insert into empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, tipo_empleado_id, depto_emp_oficina_id)
values ("Emanuel", "Arriola", "1968-11-03", "1990-06-07", "10946059", 10, 8);
-- DML --

-- consultas --

-- 1.Nombre y edad de los empleados --
select empleados.nombre, TIMESTAMPDIFF(YEAR,empleados.fecha_nacimiento,CURDATE()) AS edad
from empleados;

-- 2.Fecha de contratación de cada empleado --
select empleados.nombre, empleados.fecha_contratacion from empleados;

-- 3.Edades de los empleados --
SELECT TIMESTAMPDIFF(YEAR,empleados.fecha_nacimiento,CURDATE()) AS edad
FROM empleados;

-- 4.Número de empleados que hay para cada una de las edades --
SELECT TIMESTAMPDIFF(YEAR,empleados.fecha_nacimiento,CURDATE()) AS edad, count(empleados.fecha_nacimiento) as empleados_por_edad
FROM empleados
group by edad;

-- 5.Edad media de los empleados por departamento --
SELECT avg(TIMESTAMPDIFF(YEAR,empleados.fecha_nacimiento,CURDATE())) as edad_media, departamentos_empresas.nombre_depto_emp 
from empleados
inner join depto_emp_oficinas
on empleados.depto_emp_oficina_id=depto_emp_oficinas.id
inner join departamentos_empresas
on departamentos_empresas.id=depto_emp_oficinas.departamento_empresa_id
group by departamentos_empresas.id;

-- 6.Tipos de Empleados que superan las 35.000 de salario --
select tipos_empleados.nombre_tipo_empleado, tipos_empleados.sueldo_base from tipos_empleados
where tipos_empleados.sueldo_base>35000.00;

-- 7.Datos del empleado número X --
select empleados.nombre, apellido, fecha_nacimiento, fecha_contratacion, telefono, tipo_empleado_id, depto_emp_oficina_id
from empleados
where empleados.id= 2;

-- 8.Empleados del departamento de empresa X --
select empleados.nombre, departamentos_empresas.nombre_depto_emp
from empleados
inner join depto_emp_oficinas
on empleados.depto_emp_oficina_id=depto_emp_oficinas.id
inner join departamentos_empresas
on departamentos_empresas.id=depto_emp_oficinas.departamento_empresa_id
and departamentos_empresas.id="9";

-- 9.Empleados cuya contratación se produjo en el año X --
select empleados.nombre, empleados.fecha_contratacion
from empleados
where fecha_contratacion="2020-10-11";

-- 10.Empleados que no sean jefe de Departamento X --
select empleados.nombre, tipos_empleados.nombre_tipo_empleado 
from empleados, tipos_empleados
where tipos_empleados.nombre_tipo_empleado not in (select tipos_empleados.nombre_tipo_empleado 
from tipos_empleados
where tipos_empleados.nombre_tipo_empleado ="Jefe de Departamento")
and empleados.tipo_empleado_id=tipos_empleados.id;

-- 11.Empleados contratados entre los años X y X --
select empleados.nombre, empleados.fecha_contratacion
from empleados
where empleados.fecha_contratacion between "1997-02-08" and "2017-08-24";

-- 12.Tipos de Empleado que tienen un salario superior a 35.000 e inferior a 40.000 --
select tipos_empleados.nombre_tipo_empleado, tipos_empleados.sueldo_base
from tipos_empleados
where tipos_empleados.sueldo_base>35000.00 and tipos_empleados.sueldo_base<40000.00;

-- 13.Empleados cuyo tipo de empleado es director o jefe de sección --
SELECT empleados.nombre, tipos_empleados.nombre_tipo_empleado 
FROM empleados, tipos_empleados
where (tipos_empleados.nombre_tipo_empleado like "%Director%" or tipos_empleados.nombre_tipo_empleado like "%sección%")
and empleados.tipo_empleado_id=tipos_empleados.id;

-- 14. Empleados de nombre 'Jose' --
select empleados.nombre, empleados.apellido
from empleados
where empleados.nombre like "%José%";

-- 15.Empleados que pertenecen al departamento administrativo y que tienen una edad mayor a 35 años --
select empleados.nombre, departamentos_empresas.nombre_depto_emp, TIMESTAMPDIFF(YEAR,empleados.fecha_nacimiento,CURDATE()) as edad
from empleados
inner join depto_emp_oficinas
on empleados.depto_emp_oficina_id=depto_emp_oficinas.id
inner join departamentos_empresas
on departamentos_empresas.id=depto_emp_oficinas.departamento_empresa_id
where departamentos_empresas.id="9"
and TIMESTAMPDIFF(YEAR,empleados.fecha_nacimiento,CURDATE())>35;

-- 16.Empleados que no pertenecen al departamento de la empresa X --
select empleados.nombre, departamentos_empresas.nombre_depto_emp
from empleados, departamentos_empresas, depto_emp_oficinas
where departamentos_empresas.nombre_depto_emp not in (select departamentos_empresas.nombre_depto_emp 
from departamentos_empresas
where departamentos_empresas.nombre_depto_emp ="Comercial")
and empleados.depto_emp_oficina_id=depto_emp_oficinas.id
and depto_emp_oficinas.departamento_empresa_id=departamentos_empresas.id;

-- 17. Nombre y edad de los empleados ordenados de menor a mayor edad --
select empleados.nombre, TIMESTAMPDIFF(YEAR,empleados.fecha_nacimiento,CURDATE()) AS edad
from empleados
order by edad asc;

-- 18. Nombre y edad de los empleados ordenados por nombre de forma descendente --
select empleados.nombre, TIMESTAMPDIFF(YEAR,empleados.fecha_nacimiento,CURDATE()) AS edad
from empleados
order by empleados.nombre desc;

-- 19.Nombre del empleado y el departamento de la empresa en la que trabaja --
select empleados.nombre, departamentos_empresas.nombre_depto_emp
from empleados
inner join depto_emp_oficinas
on empleados.depto_emp_oficina_id=depto_emp_oficinas.id
inner join departamentos_empresas
on departamentos_empresas.id=depto_emp_oficinas.departamento_empresa_id;

-- 20.Código y teléfonos de los departamentos de las oficinas de la región 'Centro' --
select depto_emp_oficinas.id, telefonos.numero_telefono, regiones.nombre_region
from depto_emp_oficinas
inner join telefonos
on depto_emp_oficinas.telefono_id=telefonos.id
inner join oficinas 
on depto_emp_oficinas.oficina_id=oficinas.id
inner join departamentos_guate
on oficinas.departamentos_guate_id=departamentos_guate.id
inner join regiones
on regiones.id=departamentos_guate.region_id
where regiones.id=5;

-- 21.Nombre del empleado y departamento de Guatemala en el que trabaja --
select empleados.nombre, departamentos_guate.nombre_depto_guate
from empleados
inner join depto_emp_oficinas
on empleados.depto_emp_oficina_id=depto_emp_oficinas.id
inner join oficinas 
on depto_emp_oficinas.oficina_id=oficinas.id
inner join departamentos_guate
on oficinas.departamentos_guate_id=departamentos_guate.id
inner join regiones
on regiones.id=departamentos_guate.region_id;

-- 22.Sueldo de cada empleado y sus bonificaciones --
select empleados.nombre,tipos_empleados.sueldo_base +tipos_empleados.bonificacion_ley+tipos_empleados.bonificacion_empresa as sueldo
from tipos_empleados
inner join empleados
on empleados.tipo_empleado_id=tipos_empleados.id;

-- 23.Nombre de los empleados y de sus jefes de departamento. --
select empleados.nombre, tipos_empleados.nombre_tipo_empleado
from empleados
inner join depto_emp_oficinas
on empleados.depto_emp_oficina_id=depto_emp_oficinas.id
inner join departamentos_empresas
on depto_emp_oficinas.departamento_empresa_id=departamentos_empresas.id
inner join tipos_empleados
on empleados.tipo_empleado_id=tipos_empleados.id
where departamentos_empresas.id="9";

-- 24.Suma del sueldo de los empleados, sin la bonificación --
select sum(tipos_empleados.sueldo_base) as suma_sueldo
from tipos_empleados;

-- 25.Promedio del sueldo, sin contar bonificación --
select avg(tipos_empleados.sueldo_base) as promedio_sueldo
from tipos_empleados
group by tipos_empleados.id;

-- 26.Salarios máximo y mínimo de los empleados, incluyendo bonificación --
select empleados.nombre, tipos_empleados.sueldo_base+tipos_empleados.bonificacion_ley+tipos_empleados.bonificacion_empresa as salarios
from empleados, tipos_empleados
where empleados.tipo_empleado_id=tipos_empleados.id
and (tipos_empleados.sueldo_base+tipos_empleados.bonificacion_ley+tipos_empleados.bonificacion_empresa=
(SELECT MIN(tipos_empleados.sueldo_base+tipos_empleados.bonificacion_ley+tipos_empleados.bonificacion_empresa)FROM empleados,tipos_empleados)
or tipos_empleados.sueldo_base+tipos_empleados.bonificacion_ley+tipos_empleados.bonificacion_empresa=
(SELECT max(tipos_empleados.sueldo_base+tipos_empleados.bonificacion_ley+tipos_empleados.bonificacion_empresa)FROM empleados,tipos_empleados));

-- 27.Número de empleados que superan los 40 años --
select count(TIMESTAMPDIFF(YEAR,empleados.fecha_nacimiento,CURDATE()))as emplados_mayores_40
from empleados
where TIMESTAMPDIFF(YEAR,empleados.fecha_nacimiento,CURDATE())>40;

-- 28. Número de edades diferentes que tienen los empleados.
select count(distinct TIMESTAMPDIFF(YEAR,empleados.fecha_nacimiento,CURDATE())) as edades_diferentes
from empleados;