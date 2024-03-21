set @old_unique_checks=@@unique_checks, unique_checks=0;
set @old_foreign_key_checks=@@foreign_key_checks, foreign_key_checks=0;
set @old_sql_mode=@@sql_mode, sql_mode='only_full_group_by,strict_trans_tables,no_zero_in_date,no_zero_date,error_for_division_by_zero,no_engine_substitution';

drop schema if exists `db_bus`;
-- -----------------------------------------------------
create schema if not exists `db_bus` default character set utf8;
-- -----------------------------------------------------
use `db_bus`;

-- -----------------------------------------------------
-- table `db_bus`.`arrêt`
-- -----------------------------------------------------
drop table if exists `db_bus`.`arrêt`;

create table if not exists `db_bus`.`arrêt` (
  `id` bigint not null auto_increment,
  `name` varchar(25) not null,
  `ligne_id` bigint, -- made nullable
  `horaire_id` bigint, -- made nullable
  `arrêt_remplacement_id` bigint null, -- nouvelle colonne pour l'arrêt de remplacement
  primary key (`id`),
  index `fk_arrêt_ligne1_idx` (`ligne_id` asc),
  index `fk_arrêt_horaire1_idx` (`horaire_id` asc),
  index `fk_arrêt_arrêt1_idx` (`arrêt_remplacement_id` asc), -- ajout d'une fk pour si jamais il y a un arrêt qui n'est plus disponible qu'il puisse être remplacé
  constraint `fk_arrêt_ligne1`
    foreign key (`ligne_id`)
    references `db_bus`.`ligne` (`id`)
    on delete no action
    on update no action,
  constraint `fk_arrêt_horaire1`
    foreign key (`horaire_id`)
    references `db_bus`.`horaire` (`id`)
    on delete no action
    on update no action,
  constraint `fk_arrêt_arrêt1` -- nouvelle contrainte de clé étrangère pour l'arrêt de remplacement
    foreign key (`arrêt_remplacement_id`)
    references `db_bus`.`arrêt` (`id`)
    on delete no action
    on update no action)
engine = innodb;

-- -----------------------------------------------------
-- table `db_bus`.`direction`
-- -----------------------------------------------------
drop table if exists `db_bus`.`direction`;

create table if not exists `db_bus`.`direction` (
  `id` bigint not null auto_increment,
  `to` varchar(50) not null,
  `ligne_id` bigint, -- made nullable
  primary key (`id`),
  index `fk_direction_ligne1_idx` (`ligne_id` asc),
  constraint `fk_direction_ligne1`
    foreign key (`ligne_id`)
    references `db_bus`.`ligne` (`id`)
    on delete no action
    on update no action)
engine = innodb;

-- -----------------------------------------------------
-- table `db_bus`.`horaire`
-- -----------------------------------------------------
drop table if exists `db_bus`.`horaire`;

create table if not exists `db_bus`.`horaire` (
  `id` bigint not null auto_increment,
  `horaire` time not null,
  primary key (`id`))
engine = innodb;

-- -----------------------------------------------------
-- table `db_bus`.`jour`
-- -----------------------------------------------------
drop table if exists `db_bus`.`jour`;

create table if not exists `db_bus`.`jour` (
  `id` bigint not null auto_increment,
  `day` varchar(10) not null,
  `horaire_id` bigint, -- made nullable
  primary key (`id`),
  index `fk_jour_horaire1_idx` (`horaire_id` asc),
  constraint `fk_jour_horaire1`
    foreign key (`horaire_id`)
    references `db_bus`.`horaire` (`id`)
    on delete no action
    on update no action)
engine = innodb;

-- -----------------------------------------------------
-- table `db_bus`.`ligne`
-- -----------------------------------------------------
drop table if exists `db_bus`.`ligne`;

create table if not exists `db_bus`.`ligne` (
  `id` bigint not null auto_increment,
  `ligne_name` varchar(10) not null,
  primary key (`id`))
engine = innodb;

set sql_mode=@old_sql_mode;
set foreign_key_checks=@old_foreign_key_checks;
set unique_checks=@old_unique_checks;
