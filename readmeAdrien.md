### Analyse du projet
Vérification de la structure du projet et des services à conteneuriser (Auth, Product, Order).
Identification des fichiers et dépendances nécessaires à la construction des images Docker.

### Correction des erreurs de build
Initialement, la build échouait à cause de l'absence des fichiers package-lock.json dans chaque service backend.
Solution : Exécuter npm install pour générer ces fichiers dans auth-service, product-service et order-service.

### Ajout des fichiers manquants et commit Git
Ajout de package-lock.json dans chaque service backend pour garantir une installation stable et reproductible.
IL FAUDRA QUE SOIS JE COMMIT LES FICHIERS SOIT JE FASSE UN NPM I LORS DU BUILD

### Construction des images Docker pour chaque service backend
Utilisation d’un Dockerfile générique dans docker/backend/Dockerfile pour builder les trois services.
Exécution de docker build avec l’argument --build-arg SERVICE_NAME pour adapter la build à chaque service :

    docker build --build-arg SERVICE_NAME=auth-service -t auth-service-test -f docker/backend/Dockerfile .
    docker build --build-arg SERVICE_NAME=product-service -t product-service-test -f docker/backend/Dockerfile .
    docker build --build-arg SERVICE_NAME=order-service -t order-service-test -f docker/backend/Dockerfile .

