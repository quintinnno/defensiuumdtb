/*
    Objetivo: Modelagem para funcionalidade de gerenciador de usuários do sistema
    Data: 26/02/2025
    Autor: Desenvolvimento
*/

drop table if exists tb_usuario cascade;
drop table if exists tb_usuario_categoria cascade;

create table if not exists tb_usuario_categoria (
    code bigint not null auto_increment,
    descricao varchar (80) not null,
    constraint pk_usuario_caegoria primary key (code)
);

create table if not exists tb_usuario (
    code bigint not null auto_increment,
    id_usuario_categoria bigint not null,
    id_pessoa bigint not null,
    identificador varchar (100) not null,
    senha varchar (255) not null,
    data_hora_criacao timestamp not null default current_timestamp,
    e_ativo boolean not null default true,
    constraint pk_usuario primary key (code),
    constraint fk_usuario_categoria foreign key (id_usuario_categoria) references tb_usuario_categoria (code)
);