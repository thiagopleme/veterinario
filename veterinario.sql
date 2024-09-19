create schema veterinario;
use veterinario;

create table pacientes (
    id_paciente integer primary key auto_increment,
    nome varchar(100),
    especie varchar(50),
    idade integer
);


create table veterinarios (
    id_veterinario integer primary key auto_increment,
    nome varchar(100),
    especialidade varchar(50)
);


create table consultas (
    id_consulta integer primary key auto_increment,
    id_paciente integer,
    id_veterinario integer,
    data_consulta DATE,
    custo DECIMAL(10, 2),
    FOREIGN KEY (id_paciente) references pacientes(id_paciente),
    FOREIGN KEY (id_veterinario) references veterinarios(id_veterinario)
);


DELIMITER //

create procedure agendar_consulta(
    in p_id_paciente integer,
    in p_id_veterinario integer,
    in p_data_consulta date,
    in p_custo decimal (10, 2)
)
BEGIN
    insert into consultas (id_paciente, id_veterinario, data_consulta, custo)
    values (p_id_paciente, p_id_veterinario, p_data_consulta, p_custo);
END //

DELIMITER ;


DELIMITER //

create procedure atualizar_paciente(
    in p_id_paciente integer,
    in p_novo_nome varchar(100),
    in p_nova_especie varchar(50),
    in p_nova_idade integer
)
BEGIN
    update pacientes
    set nome = p_novo_nome, especie = p_nova_especie, idade = p_nova_idade
    where id_paciente = p_id_paciente;
END //

DELIMITER ;


DELIMITER //

create procedure remover_consulta(
    in p_id_consulta integer
)
BEGIN
    delele from consultas
    where id_consulta = p_id_consulta;
END //

DELIMITER ;
