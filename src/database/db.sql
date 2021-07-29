--Tabla roles
CREATE TABLE if not EXISTS roles(
    id uuid DEFAULT gen_random_uuid(),
    id_role text,
    nombre text,
    
    PRIMARY KEY (id)

);

--Tabla usuarios
CREATE TABLE if not EXISTS users(
    id uuid DEFAULT gen_random_uuid(),
    rut text,
    name text,
    email text,
    password text,
    password_salt text,
    phone text,
    position text,
    id_role uuid,
    state boolean,
    
    PRIMARY KEY (id),
    FOREIGN KEY (id_role) references roles(id)

);

--Tabla especies
CREATE TABLE IF NOT EXISTS species(
    id uuid DEFAULT gen_random_uuid(),
    id_species text,
    name TEXT,

    PRIMARY KEY (id)
);

INSERT INTO species(id_species, name) values ('E1', 'Especie 1');
INSERT INTO species(id_species, name) values ('E2', 'Especie 2');

--Tabla productos o activos
CREATE TABLE IF NOT EXISTS products(
    id uuid DEFAULT gen_random_uuid(),
    id_product text,
    name TEXT,
    days int,

    PRIMARY KEY (id)
);

INSERT INTO products(id_product, name, days) values ('A', 'Activo A', 30);
INSERT INTO products(id_product, name, days) values ('B', 'Activo B', 40);

-- Tabla estanques
CREATE TABLE IF NOT EXISTS storage_ponds(
    id uuid DEFAULT gen_random_uuid(),
    id_storage_pond text,
    capacitance float,
    current_liters float,
    status boolean,

    PRIMARY KEY (id)
);

INSERT INTO storage_ponds(id_storage_pond, capacitance) values ('TK1', 4000);
INSERT INTO storage_ponds(id_storage_pond, capacitance) values ('TK2', 5000);

--Tabla bins
CREATE TABLE IF NOT EXISTS bins(
    id uuid DEFAULT gen_random_uuid(),
    id_bins text,
    status boolean,

    PRIMARY KEY (id)
);

INSERT INTO bins(id_bins, name) values ('1', 'Tabali');
INSERT INTO bins(id_bins, name) values ('2', 'Los Lirios');

--Tabla predios o fundos
CREATE TABLE IF NOT EXISTS estates(
    id uuid DEFAULT gen_random_uuid(),
    id_estate text,
    name TEXT,

    PRIMARY KEY (id)
);

INSERT INTO estates(id_estate, name) values ('TL', 'Tabali');
INSERT INTO estates(id_estate, name) values ('LL', 'Los Lirios');

--Tabla macrozonas
CREATE TABLE IF NOT EXISTS macrozones(
    id uuid DEFAULT gen_random_uuid(),
    id_macrozone text,
    name TEXT,
    id_estate uuid,

    PRIMARY KEY (id),
    FOREIGN KEY (id_estate) references estates(id)
);

INSERT INTO macrozones(id_macrozone, name) values ('M1', 'Macrozona 1');
INSERT INTO macrozones(id_macrozone, name) values ('M2', 'Macrozona 2');


--Tabla secciones
CREATE TABLE IF NOT EXISTS sections(
    id uuid DEFAULT gen_random_uuid(),
    id_section text,
    name TEXT,
    estimated_harvest_kg float,
    id_macrozone uuid,

    PRIMARY KEY (id),
    FOREIGN KEY (id_macrozone) references macrozones(id)
);

INSERT INTO sections(id_section, name) values ('S1', 'Seccion 1');
INSERT INTO sections(id_section, name) values ('S2', 'Seccion 2');


--Tabla cuarteles
CREATE TABLE IF NOT EXISTS quarters(
    id uuid DEFAULT gen_random_uuid(),
    id_quarter text,
    name TEXT,
    estimated_harvest_kg float,
    id_section uuid,

    PRIMARY KEY (id),
    FOREIGN KEY (id_section) references sections(id)
);

INSERT INTO quarters(id_quarter, name) values ('C1', 'Cuartel 1');
INSERT INTO quarters(id_quarter, name) values ('C2', 'Cuartel 2');


--Tabla variedades
CREATE TABLE IF NOT EXISTS varieties(
    id uuid DEFAULT gen_random_uuid(),
    id_variety text,
    name TEXT,
    id_species uuid,

    PRIMARY KEY (id),
    FOREIGN KEY (id_species) references species(id)
);

INSERT INTO varieties(id_variety, name) values ('V1', 'Variedad 1');
INSERT INTO varieties(id_variety, name) values ('V2', 'Variedad 2');


--Tabla relacion entre las tablas de variedades y cuarteles
-- PENDIENTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
CREATE TABLE IF NOT EXISTS varieties_quarters(
    id_var uuid,
    id_qua uuid,

    PRIMARY KEY (id_var, id_qua),
    FOREIGN KEY (id_var) references varieties(id),
    FOREIGN KEY (id_qua) references quarters(id)

);

INSERT INTO varieties_quarters(id_var, id_qua) values ('V1', 'C1');
INSERT INTO varieties_quarters(id_var, id_qua) values ('V2', 'C2');

-- PENDIENTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

--Tabla guias pelequen
CREATE TABLE IF NOT EXISTS pelequen_guides(
    id uuid DEFAULT gen_random_uuid(),
    id_pelequen_guide text,
    document text,
    id_user uuid,

    PRIMARY KEY (id),
    FOREIGN KEY (id_user) references users(id)
);

INSERT INTO pelequen_guides(id_pelequen_guide, name) values ('PG1', 'documento1');
INSERT INTO pelequen_guides(id_pelequen_guide, name) values ('PG2', 'documento2');


--Tabla limpiezas de estanques
CREATE TABLE IF NOT EXISTS cleanings_storage_ponds(
    id uuid DEFAULT gen_random_uuid(),
    id_cleaning_storage_pond text,
    date date,
    id_user uuid,
    id_storage_pond uuid,

    PRIMARY KEY (id),
    FOREIGN KEY (id_storage_pond) references storage_ponds(id),
    FOREIGN KEY (id_user) references users(id)
);

INSERT INTO cleanings_storage_ponds(id_cleaning_storage_pond, date) values ('CSP1', '01/01/2020');
INSERT INTO cleanings_storage_ponds(id_cleaning_storage_pond, date) values ('CSP2', '02/02/2021');

--Tabla limpiezas de linea de proceso
CREATE TABLE IF NOT EXISTS cleanings_line(
    id uuid DEFAULT gen_random_uuid(),
    id_cleaning_line text,
    date date,
    id_user uuid,

    PRIMARY KEY (id),
    FOREIGN KEY (id_user) references users(id)
);

INSERT INTO cleanings_line(id_cleaning_line, date) values ('CL1', '05/05/2020');
INSERT INTO cleanings_line(id_cleaning_line, date) values ('CL2', '06/06/2021');

--Tabla lotes de transporte
CREATE TABLE IF NOT EXISTS transport_batchs(
    id uuid DEFAULT gen_random_uuid(),
    id_transport_batch text,
    date date,
    condition text,
    correlative SERIAL,
    id_pelequen_guide uuid,
    id_user uuid,

    PRIMARY KEY (id),
    FOREIGN KEY (id_pelequen_guide) references pelequen_guides(id),
    FOREIGN KEY (id_user) references users(id)
);

INSERT INTO transport_batchs(id_transport_batch, date) values ('TB1', '01/01/2021');
INSERT INTO transport_batchs(id_transport_batch, date) values ('TB2', '02/02/2022');

--Tabla lotes de guarda
CREATE TABLE IF NOT EXISTS save_batchs(
    id uuid DEFAULT gen_random_uuid(),
    id_save_batch text,
    date date,
    totalLiters float,
    condition text,
    correlative SERIAL,
    id_storage_pond uuid,
    id_user uuid,
    id_transport_batch uuid,

    PRIMARY KEY (id),
    FOREIGN KEY (id_storage_pond) references storage_ponds(id),
    FOREIGN KEY (id_user) references users(id),
    FOREIGN KEY (id_transport_batch) references transport_batchs(id)
);

INSERT INTO save_batchs(id_save_batch, date) values ('V1', 'C1');

--Tabla lotes de proceso
CREATE TABLE IF NOT EXISTS process_batchs(
    id uuid DEFAULT gen_random_uuid(),
    id_process_batch text,
    date date,
    condition text,
    correlative SERIAL,
    id_user uuid,
    id_save_batch uuid,

    PRIMARY KEY (id),
    FOREIGN KEY (id_user) references users(id),
    FOREIGN KEY (id_save_batch) references save_batchs(id)
);

INSERT INTO process_batchs(id_process_batch, date) values ('PB1', '03/03/3030');

--Tabla registros fitosanitarios
CREATE TABLE IF NOT EXISTS phytosanitary_registers(
    id uuid DEFAULT gen_random_uuid(),
    id_phytosanitary_register text,
    start_date date,
    end_date date,
    id_user uuid,
    id_section uuid,

    PRIMARY KEY (id),
    FOREIGN KEY (id_user) references users(id),
    FOREIGN KEY (id_section) references sections(id)
);

INSERT INTO phytosanitary_registers(id_phytosanitary_register, start_date, end_date) values ('', 'C1');

--Tabla relacion entre tablas de registros fitosanitarios y productos o activos
CREATE TABLE IF NOT EXISTS phytosanitary_registers_products(
    id_phy uuid,
    id_pro uuid,

    PRIMARY KEY (id_phy, id_pro),
    FOREIGN KEY (id_phy) references phytosanitary_registers(id),
    FOREIGN KEY (id_pro) references products(id)
);

--Tabla tarjas
CREATE TABLE IF NOT EXISTS cards(
    id uuid DEFAULT gen_random_uuid(),
    id_card text,
    date date,
    quadrille text,
    percentage_volume float,
    harvest_type text,
    gross_weight float,
    contractor text,
    condition text,
    correlative SERIAL,
    id_bins uuid,
    id_process_batch uuid,
    id_user_register uuid,
    id_user_weight uuid,
    id_variety uuid,
    id_save_batch uuid,
    id_transport_batch uuid,
    id_quarter uuid,

    PRIMARY KEY (id),
    FOREIGN KEY (id_bins) references bins(id),
    FOREIGN KEY (id_process_batch) references process_batchs(id),
    FOREIGN KEY (id_user_register) references users(id),
    FOREIGN KEY (id_user_weight) references users(id),
    FOREIGN KEY (id_variety) references varieties(id),
    FOREIGN KEY (id_save_batch) references save_batchs(id),
    FOREIGN KEY (id_transport_batch) references transport_batchs(id),
    FOREIGN KEY (id_quarter) references quarters(id)
);

