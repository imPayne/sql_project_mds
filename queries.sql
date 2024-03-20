use db_bus;

-- 1.

-- jointure sur la table horaire où on récupère les horaires, where => condition 
-- pour récupérer uniquement les données des horaires pour l'arrêt 'Madeleine'
select h.horaire
from `arrêt` a
join `horaire` h on a.horaire_id = h.id
where a.name = 'Madeleine'
order by h.horaire asc;

-- même principe ici mais pour l'arrêt 'République'
select h.horaire
from `arrêt` a
join `horaire` h on a.horaire_id = h.id
where a.name = 'République'
order by h.horaire asc;

-- 2.

set @@session.sql_mode = replace(@@session.sql_mode, 'ONLY_FULL_GROUP_BY', '');

-- Récupère le nom des arrêts en faisant une jointure join sur la table horaire et ligne on peut filtrer les données
-- en récupérant uniquement la ligne 2 et en triant les données par horaire
select a.name as `Arrêt`
from `arrêt` a
join `horaire` h on a.horaire_id = h.id
join `ligne` l on a.ligne_id = l.id
where l.ligne_name = 'Ligne 2'
order by h.horaire asc;


-- 3.
-- Modification du schéma ajout d'une colonne arrêt_remplacement_id 
-- insert de l'id de remplacement pour l'arrêt Delestraint (data.sql l.34)

-- 4.
-- ici on récupère le nom de l'arrêt dans le cas où la colonne arrêt_remplacement_id n'est pas null 
-- donc qu'il y a un remplacement d'arrêt alors on affiche le message et on récupère uniquement (where)
-- quand il y a un id dans la colonne arrêt_remplacement

select a.name,
  case 
    when a.`arrêt_remplacement_id` is not null then 'Arrêt temporairement non desservi.'
  end as Message
from `arrêt` a
where a.`arrêt_remplacement_id` is not null;

-- 5
select 
  concat('Horaires à l\'arrêt ', a.name, ' (Lundi)') as 'Informations', -- on récupère le nom de l'arrêt
  case 
    when a.`arrêt_remplacement_id` is not null then concat('L\'arrêt n\'est pas desservi. Veuillez vous reporter à l\'arrêt ', (select name from `arrêt` where id = a.`arrêt_remplacement_id`), '.') -- on récupère le nom de l'arrêt de remplacement grâce à son id
    else 'Horaire non disponible'
  end as Message
from `arrêt` a
where a.`arrêt_remplacement_id` is not null;

-- 6. 
