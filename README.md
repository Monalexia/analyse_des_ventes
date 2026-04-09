# 🚇 Projet UrbanMove - Audit et Prédiction IDFM

Ce dépôt contient le code source développé dans le cadre du projet de certification Data Analyst (La Capsule, 2026). Il regroupe la partie transformation des données et l'analyse prédictive.

## 🏗️ Architecture du dépôt

Le code est divisé en deux grandes parties technologiques :

### 1. Transformation des données (dbt / SQL)
L'ensemble des modèles de transformation (pipeline ELT) exécutés sur Google BigQuery se trouve dans l'arborescence standard dbt.
* `/models/staging` : Requêtes de nettoyage et de standardisation des données brutes.
* `/models/marts` : Création du modèle en constellation (tables de faits et de dimensions) pour l'analyse métier.

### 2. Machine Learning (Python)
Les algorithmes de prédiction des retards sont isolés dans le dossier dédié.
* `/notebooks` : Contient les fichiers Jupyter (`.ipynb`) pour le réseau ferré et le réseau de surface. Les modèles testés incluent la Forêt Aléatoire (RandomForestRegressor) et des Réseaux de Neurones (TensorFlow/Keras).

## 🔒 Note de sécurité
Pour des raisons évidentes de sécurité, les fichiers d'identification (`credentials`) permettant l'accès à la base de données Google Cloud Platform et les clés API ont été exclus de ce dépôt public. Les notebooks et les profils dbt ne peuvent donc pas être réexécutés directement depuis cette source sans l'ajout de ces clés locales.
