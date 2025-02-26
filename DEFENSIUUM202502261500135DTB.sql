/*
    Objetivo: Modelagem para funcionalidade de gerenciador de históricos de credenciais
    Data: 26/02/2025
    Autor: Desenvolvimento
*/

create table if not exists tb_historico (
    code bigint not null auto_increment,
    id_usuario_edicao bigint not null, 
    identificador varchar (100) not null,
    senha varchar (255) not null,
    data_hora_edicao timestamp not null default current_timestamp,
    e_ativo boolean not null default true,
    constraint pk_historico primary key (code),
    constraint fk_usuario foreign key (id_usuario_edicao) references tb_usuario (code)
);

create table if not exists tb_historico_credencial (
    code bigint not null auto_increment,
    id_credencial bigint not null, 
    id_historico bigint not null,
    constraint pk_historico_credencial primary key (code),
    constraint fk_credencial foreign key (id_credencial) references tb_credencial (code),
    constraint fk_historico foreign key (id_historico) references tb_historico (code)
);