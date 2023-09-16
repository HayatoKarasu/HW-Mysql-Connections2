drop database if exists homedb;
create database if not exists homedb;
use homedb;

DROP TABLE IF EXISTS паспорт;
create table if not exists паспорт(
id int primary key auto_increment,
номер int,
серия int,
кем_выдан varchar(200),
когда_выдан date,
код_подразделения int,
index (id, номер, серия, когда_выдан)
);

DROP TABLE IF EXISTS гражданин;
create table if not exists гражданин(
id int primary key auto_increment,
фамилия varchar(50),
имя varchar(50),
отчество varchar(50),
дата_рождения date,
index (id, фамилия, дата_рождения),
foreign key (id) references паспорт(id)
);

DROP TABLE IF EXISTS квартира;
create table if not exists квартира(
id int,
полный_адрес varchar(200),
владелец varchar(50),
владелец_ид int primary key auto_increment,
index (id, полный_адрес, владелец),
foreign key (владелец_ид) references гражданин(id)
);

DROP TABLE IF EXISTS домашние_животные;
create table if not exists домашние_животные(
id int,
кличка varchar(50),
порода varchar(50),
тип varchar(50),
хозяин varchar(50),
хозяин_ид int primary key auto_increment,
index (id, кличка, порода, тип, хозяин),
foreign key (хозяин_ид) references гражданин(id)
);

insert into паспорт(номер, серия, кем_выдан, когда_выдан, код_подразделения) values
(012345, 1234, 'ОВД1', '2000-01-01', 123),
(012346, 1235, 'ОВД2', '2000-01-02', 124);

insert into гражданин(фамилия, имя, отчество, дата_рождения) values
('Иванов', 'Иван', 'Иванович', '1982-01-01'),
('Петров', 'Петор', 'Петрович', '1982-01-02');

insert into квартира(id, полный_адрес, владелец) values
(1, 'Москва, ул. Зеленая 35, кв. 35', 'Иванов Иван Иванович'),
(2, 'Москва, ул. Краная 36, кв. 36', 'Петров Петор Петрович');

insert into домашние_животные(id, кличка, порода, тип, хозяин) values
(1, 'Мурка', 'сиамская', 'кошка', 'Иванов Иван Иванович'),
(2, 'Барбос', 'овчарка', 'собака', 'Петров Петор Петрович');

select*from паспорт, гражданин, квартира, домашние_животные;

-- выбранные значения для индексации нужны бля более быстрых выборки и сортировки, что бы не перебирать все строки подряд.