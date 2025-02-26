/*
    Objetivo: Modelagem para funcionalidade de gerenciador de usuários do sistema
    Data: 26/02/2025
    Autor: Desenvolvimento
*/

create table if not exists tb_usuario_categoria (
    code bigint not null auto_increment,
    descricao varchar (80) not null,
    constraint pk_usuario_caegoria primary key (code)
);

create table if not exists tb_usuario (
    code bigint not null auto_increment,
    id_usuario_categoria bigint not null,
    constraint pk_usuario primary key (code),
    constraint fk_usuario_categoria foreign key (id_usuario_categoria) references tb_usuario_categoria (code)
);