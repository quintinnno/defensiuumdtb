-- docker exec -it fasciculuum-mysql-5.7 mysql -u root -p

create database if not exists db_defensiuum;

use db_defensiuum;

drop table if exists tb_credencial cascade;
drop table if exists tb_categoria_credencial cascade;
drop table if exists tb_pessoa cascade;

create table if not exists tb_pessoa (
    code bigint auto_increment,
    nome varchar(200) not null,
    constraint pk_pessoa primary key (code),
    constraint un_pessoa_nome unique (nome)
);

create table if not exists tb_categoria_credencial (
    code bigint auto_increment,
    descricao varchar(100) not null,
    constraint pk_categoria_credencial primary key (code),
    constraint un_categoria_credencial_descricao unique (descricao)
);

create table if not exists tb_credencial (
    code bigint auto_increment,
    id_categoria_credencial bigint not null,
    id_pessoa bigint not null,
    identificador varchar (100) not null,
    senha varchar (255) not null,
    descricao varchar (100) not null,
    endereco text null,
    data_hora_criacao timestamp not null default current_timestamp,
    e_ativo boolean not null default true,
    constraint pk_credencial primary key (code),
    constraint fk_categoria_credencial foreign key (id_categoria_credencial) references tb_categoria_credencial (code),
    constraint fk_pessoa foreign key (id_pessoa) references tb_pessoa (code)
);
