use `db_bus`;

-- supprime les horaires avant d'en insérer pour éviter les doublons
delete from `horaire` where `id` >= 1;

insert into `horaire` (`id`, `horaire`) values 
(1, '6:32:00'), (2, '6:34:00'), (3, '6:37:00'), (4, '6:42:00'), (5, '6:44:00'),
(6, '6:46:00'), (7, '6:47:00'), (8, '6:50:00'), (9, '6:51:00'), (10, '6:52:00'),
(11, '6:54:00'), (12, '6:55:00'), (13, '6:56:00'), (14, '6:57:00'), (15, '7:00:00'),
(16, '7:01:00'), (17, '7:02:00'), (18, '7:05:00'), (19, '7:06:00'), (20, '7:07:00'),
(21, '7:10:00');

delete from `ligne` where `id` >= 1;

insert into `ligne` (`id`, `ligne_name`) values 
(1, "Ligne 2");

delete from `arrêt` where `id` >= 1;

-- insertion des arrêts pour la ligne 2
insert into `arrêt` (`id`, `name`, `ligne_id`, `horaire_id`) values
(1, 'P+R Ouest', 1, 1), 
(6, 'Fourchène1', 1, 2), 
(11, 'Madeleine', 1, 3), 
(16, 'République', 1, 4), 
(21, 'Pibs2', 1, 6), 
(26, 'Petit Tohannic', 1, 8), 
(31, 'Delestraint', 1, 9), 
(36, 'Kersec', 1, 12);

-- modification de l'arrêt Petit Tohannic par l'arrêt Delestraint
update `arrêt` set `arrêt_remplacement_id` = 31 where `id` = 26;

delete from `direction` where `id` >= 1;

insert into `direction` (`id`, `to`, `ligne_id`) values 
(1, 'Direction Kersec', 1);

delete from `jour` where `id` >= 1;

insert into `jour` (`id`, `day`) values 
(1, "Lundi");
