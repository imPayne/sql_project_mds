# Table des matières

1. [Installation et Utilisation](#installation)
2. [Conception](#conception)
3. [Référence](#référence)

# Installation et utilisation
Prérequis : vous devez disposer d'un environnement de développement opérationnel, c'est-à-dire avoir préalablement installé MySQL, et avoir un environnement GitHub pour pouvoir cloner le dépôt, ainsi qu'avoir MySQL Workbench d'installé.

## 1. Clonage du projet

Sur votre machine, cloner le dépôt grâce à la commande :

```bash
git clone git@github.com:imPayne/sql_project_mds.git
```
via la clé ssh ou via le lien https
```bash
git clone https://github.com/imPayne/sql_project_mds.git
```


## 2. Ouvrez tous les fichiers .sql contenue dans le repo (queries.sql, schema.sql, data.sql) : 
Exécutez le fichier schema.sql depuis MySQL Workbench en faisant Ctrl + A dans le fichier et en cliquant sur l'éclair en haut à gauche du fichier dans la partie outil. Ensuite, réalisez la même manipulation avec le fichier data.sql pour pouvoir insérer les données. Les requêtes sont dans le fichier queries.sql, pour les utiliser il suffit de sélectionner chaque requête une après l'autre et de cliquer sur l'éclair pour voir le résultat de la requête.


## Conception <a name="conception"></a>
MCD réalisé avec mysql workbench:

<img src="./mcd.png">


## Référence
- https://stackoverflow.com/
- https://dev.mysql.com/doc/