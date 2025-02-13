use db_defensiuum;

insert into tb_categoria_credencial (descricao) values ('Website');
insert into tb_categoria_credencial (descricao) values ('Aplicativo');
insert into tb_categoria_credencial (descricao) values ('Website e Aplicativo');
insert into tb_categoria_credencial (descricao) values ('Cartão de Crédito');
insert into tb_categoria_credencial (descricao) values ('Wi-Fi');
insert into tb_categoria_credencial (descricao) values ('Banco de Dados');

insert into tb_pessoa (nome) values ('Google');

insert into tb_credencial (id_categoria_credencial, id_pessoa, identificador, senha, descricao, endereco) values (
    (select code from tb_categoria_credencial where descricao = 'Website e Aplicativo'),
    (select code from tb_pessoa where nome = 'Google'),
    'email@gmail.com',
    '99f11f37-4b97-462f-8353-08d91d3b7e93',
    'Contas Google',
    'https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Faccounts.google.com%2F%3Fhl%3Dpt-br&followup=https%3A%2F%2Faccounts.google.com%2F%3Fhl%3Dpt-br&hl=pt-br&ifkv=ASSHykqZ4S3kLtn-LHKOO2DgzSlBUHhlKVIKp-HDYy-c0XLdAAQJbdnBIUTrSfWm0aVuy3BEFCPG&passive=1209600&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S807899150%3A1739388985224845&ddm=1'
);