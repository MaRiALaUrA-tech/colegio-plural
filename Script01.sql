select version ();

create database colegio_plural;

create table responsavel (
responsavel_id serial primary key,
nome_responsavel varchar (120),
cpf_responsavel char(11),
celular char(11)

);

alter table responsavel drop column cpf_responsavel, add column cpf_responsavel char(32) unique not null;

insert into responsavel (responsavel_id, nome_responsavel, cpf_responsavel, celular) values
(1, 'Clara Nunes', md5('12345678911'), '24988765453'),
(2, 'Tim Maia', md5('19876543201'), '24988765463'),
(3, 'Elba Ramalho', md5('21436587093'), '24988765422');


create table aluno(
aluno_id serial primary key,
nome_aluno varchar (120),
cpf_aluno char(32) unique not null,
responsavel_id int references responsavel (responsavel_id) on delete cascade
);

insert into aluno values
(1, 'Vitão', md5('12345678912'), 1),
(2, 'Clarice', md5('12345678917'), 2),
(3, 'Ana', md5('12345678910'), 3);

create table usuario(
usuario_id serial primary key,
nome_usuario varchar (120) not null,
cpf char(32) unique not null,
email varchar (120) not null,
senha varchar (20) not null
);

alter table usuario drop column senha, add column senha char(32)  not null;

insert into usuario (usuario_id, nome_usuario, cpf, email, senha) values
(1, 'Fernando', md5('21436587092'), 'fefe@gmail.com', md5('1234')),
(2, 'Carlos', md5('21436587044'), 'carlitos@gmail.com', md5('4321')),
(3, 'Laís', md5('21436587077'), 'lala@gmail.com', md5('lais1900'));

create table agendamento(
agendamento_id serial primary key,
data timestamp,
aluno_id int references aluno (aluno_id) on delete cascade,
usuario_id int references usuario (usuario_id) on delete cascade
);

insert into agendamento values
(1, '2026-10-05 14:30:00', 1, 1),
(2, '2026-10-06 14:30:00', 2, 2),
(3, '2026-10-07 14:30:00', 3, 3);