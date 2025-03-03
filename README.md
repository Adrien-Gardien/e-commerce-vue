# E-commerce Vue.js - Application Microservices

## 📋 Description

Application e-commerce moderne basée sur une architecture microservices, développée avec Vue.js pour le frontend et Node.js pour le backend. L'application offre une expérience utilisateur complète pour la gestion des produits, du panier et des commandes.

## 🚀 Fonctionnalités Principales

### 🔐 Authentification

- Inscription et connexion des utilisateurs
- Authentification sécurisée via JWT
- Gestion des profils utilisateurs

### 🛍️ Gestion des Produits

- Catalogue de produits avec recherche
- Affichage détaillé des produits
- Gestion des stocks en temps réel

### 🛒 Panier d'Achat

- Ajout/suppression de produits
- Modification des quantités
- Calcul automatique du total
- Persistance du panier

### 📦 Gestion des Commandes

- Création de commandes
- Suivi des commandes
- Historique des achats
- Gestion des adresses de livraison

## 🛠️ Technologies Utilisées

### Frontend

- Vue.js
- Vue Router
- Axios
- Vite

### Backend

- Node.js
- Express.js
- MongoDB
- JWT

### DevOps

- Docker & Docker Compose
- Docker Swarm (Production)
- GitLab CI/CD
- PM2 (Pré-production)

## 🔧 Installation

### Prérequis

- Node.js (v14+)
- Docker & Docker Compose
- MongoDB
- PM2 (pour la pré-production)

### Installation en Développement

```bash
# Cloner le projet
git clone <URL_DU_PROJET>
cd e-commerce-vue

# Installer les dépendances
npm install

# Démarrer avec Docker Compose
docker-compose up --build

# Initialiser les données de test
./scripts/init-products.sh
```

### Déploiement en Production

```bash
# Initialiser Docker Swarm
docker swarm init

# Déployer la stack
docker stack deploy -c docker-compose.prod.yml e-commerce
```

## 🌐 Architecture

### Microservices

- **Auth Service** (Port 3001) : Gestion de l'authentification
- **Product Service** (Port 3000) : Gestion des produits et du panier
- **Order Service** (Port 3002) : Gestion des commandes

### Base de Données

- MongoDB distinct pour chaque service
- Schémas optimisés pour les performances

## 📝 Configuration

### Variables d'Environnement

- `.env` : Configuration générale
- `.env.development` : Configuration de développement
- `.env.production` : Configuration de production

### Ports par Défaut

- Frontend : 8080
- Auth Service : 3001
- Product Service : 3000
- Order Service : 3002

## 🔍 Tests

```bash
# Tests Frontend
cd frontend
npm run test
npm run test:unit

# Tests Backend (par service)
cd services/<service-name>
npm test
```

## 🔐 Sécurité

- Authentification JWT
- Hachage des mots de passe (bcrypt)
- Protection CORS
- Variables d'environnement sécurisées
- Scan de vulnérabilités avec Trivy

## 📈 Monitoring

- Logs centralisés
- Métriques Docker
- Surveillance PM2 en pré-production

## 🤝 Contribution

1. Fork le projet
2. Créer une branche (`git checkout -b feature/AmazingFeature`)
3. Commit les changements (`git commit -m 'Add AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## 📄 Licence

Ce projet est sous licence MIT.

## 📞 Support

Pour toute question ou problème, veuillez ouvrir une issue dans le repository.
