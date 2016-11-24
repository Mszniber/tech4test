# Test Ruby on Rails

### Contexte 
Le but de ce test est de réaliser une application permettant importer, stocker, et exporter des données via une base de données.

Le fichier de données initial correspond à un liste de réservations contenant les informations sur l'acheteur, l'événément et la tarification.

### Résultat attendu
L'application doit comprendre:

* Une base de données permettant des stocker l'ensemble des données du fichier
* Une page d'import de fichiers (Avec colones prédéfinit dans le fichier initial)
* Une page de récaputilatif des données en base avec :
  * le nombre de réservations total
  * le nombre d'acheteurs total
  * l'âge moyen des clients
  * le prix moyen par spectacle
  * le prix moyen par clients
  * le prix moyen par panier(Optionnel)
* Un lien permettant d'exporter l'ensemble les données sous format excel similaire au format du fichier initial.

#### Optionnel
* Proposer une interface permettant à l'utilisateur de choisir où seront importer les colones du fichier initial (Pour pouvoir traiter les fichiers avec des colonnes differentes)
* Ajouter un filter sur la page récapitulative permettant de faire les calculs sur les segments de la base.
* Ajouter un page permettant d'avoir l'historique des fichiers importer ainsi que les données associées
* Ajouter un systéme d'authetification et séparer les données par utilisateurs

