drop database if exists pochtadb;
create database if not exists pochtadb;
use pochtadb;

DROP TABLE IF EXISTS почтовые_отделения;
create table if not exists почтовые_отделения(
id int primary key auto_increment,
адрес varchar(50),
время_работы varchar(50),
index (id, адрес)
);

DROP TABLE IF EXISTS работники;
create table if not exists работники(
id int primary key auto_increment,
ФИО varchar(200),
паспортные_данные varchar(200),
адрес_проживания varchar(200),
номер_трудовой_книжки int,
index (id, ФИО, паспортные_данные, адрес_проживания, номер_трудовой_книжки),
foreign key (id) references почтовые_отделения(id)
);

DROP TABLE IF EXISTS посылки;
create table if not exists посылки(
id int,
вес float,
категория varchar(50),
трек_номер int,
трек_номер_ид int primary key auto_increment,
index (id, вес, категория),
foreign key (трек_номер_ид) references почтовые_отделения(id)
);

insert into почтовые_отделения(адрес, время_работы) values
('Москва, ул. Белая 11', '8:00-20:00'),
('Москва, ул. Черная 22', '8:00-20:00');

insert into работники(ФИО, паспортные_данные, адрес_проживания, номер_трудовой_книжки) values
('Иванов Иван Иванович', '012345, 1234, ОВД1, 2000-01-01, 123', 'Москва, ул. Зеленая 35, кв. 35', 123456789),
('Петров Петор Петрович', '012346, 1235, ОВД2, 2000-01-02, 124', 'Москва, ул. Краная 36, кв. 36', 987654321);

insert into посылки(id, вес, категория, трек_номер) values
(1, 1.50, 'срочная', 1234),
(2, 0.50, 'обычная', 5678);

select*from почтовые_отделения, работники, посылки;