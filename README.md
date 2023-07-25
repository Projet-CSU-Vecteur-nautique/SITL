# SITL

*Ce répertoire sert de documentation pour le logiciel de simulation SITL.*

## Installation de SITL

[Guide ardupilot](https://ardupilot.org/dev/docs/setting-up-sitl-on-linux.html#setting-up-sitl-on-linux)

### Installation par docker

*Pour éviter d'installer trop d'applications en local ou se protéger lors de tests, il peut être intéressant de passer par des conteneurs.*

1. Construire l'image à partir du [Dockerfile](/Dockerfile).

    ```sh
    # Depuis le répertoire du fichier Dockerfile
    sudo docker build -t sitl .
    ```

    *Cette étape peut durer quelques minutes*

2. Créer le conteneur SITL

Pour autoriser l'execution d'application graphique depuis le conteneur, executer la commande

```sh
xhost +local:root
```

Pour créer le conteneur

```sh
sudo docker run -it \
    --privileged \
    --network host \
    --name=SITL \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="LIBGL_ALWAYS_SOFTWARE=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    sitl \
    bash
```

Pour démarrer le conteneur et accéder à l'application depuis un conteneur en actif

```sh
sudo docker start SITL # Démarrage
sudo docker exec -it SITL bash # Executer un conteneur en cours
```

## Liens

- [SITL](https://ardupilot.org/dev/docs/sitl-simulator-software-in-the-loop.html#sitl-simulator-software-in-the-loop)
