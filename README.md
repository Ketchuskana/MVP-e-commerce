# ShopFlutter - MVP E-Commerce

## Objectif du projet

Ce projet a pour but de livrer un **MVP e-commerce fonctionnel** avec une architecture **MVVM/Clean**, authentification, et une version Web.

---

## Fonctionnalités réalisées

* **Catalogue produits** : affichage d’une liste avec titre, prix, image et description.
* **Détail produit** : page affichant image, description, prix, et possibilité de choisir la quantité.
* **Panier** : ajout au panier, modification de quantité, affichage des items et total.
* **Checkout** : bouton de validation fictive, simulation de commande confirmée.
* **Authentification Firebase** : login et logout avec email/password.
* **Architecture MVVM/Clean** : séparation des vues, viewmodels, services et modèles.
* **Gestion locale des données** : utilisation de Hive pour persister panier et commandes.
* **Navigation** : `go_router` avec routes `/login`,`/register`, `/catalog`, `/product/:id`, `/cart`, `/checkout`.

---

## Spécificité Web

* Le projet est configuré pour Flutter Web avec build vers `build/web`.
* Utilisation de `go_router` pour navigation SPA.
* Aucun bouton PWA ou partage Web n’a été finalisé.

---

## Déploiement

Le projet a été tenté sur **Vercel**, mais le déploiement **n’a pas fonctionné** correctement malgré la configuration des builds.

* Tentatives avec `vercel.json` et `flutter build web` ont généré des builds sans erreur de compilation locale.
* Cependant, Vercel ne reconnait pas `pubspec.yaml` comme source de build et les routes `/` vers `index.html` ne s’affichent pas.
* En conséquence, l’URL de déploiement Vercel aboutit à une **page blanche** et n’ouvre pas la page `/login`.

---

## Instructions pour tester localement

1. Cloner le projet :

```bash
git clone https://github.com/Ketchuskana/MVP-e-commerce.git
```

2. Installer les dépendances :

```bash
flutter pub get
```

3. Tester Flutter Web :

```bash
flutter run -d chrome
```

4. Tester Android (si SDK installé) :

```bash
flutter run -d <device_id>
```

5. Tester le build Web :

```bash
flutter build web
```

Le dossier `build/web` contient les fichiers pour déploiement manuel ou serveur local.

---

## Remarques

* Le projet fonctionne **localement** pour toutes les fonctionnalités principales.
* Le déploiement Web via Vercel nécessite une configuration spécifique que Flutter Web ne supporte pas nativement avec Vercel.

---
