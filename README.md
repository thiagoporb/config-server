# Config Server

## Esse projeto segue o padrão **External Configuration**

# Docker e Docker Compose

## Construindo e executando a imagem do Docker
Para criar uma imagem Docker utilizamos [Jib](https://github.com/GoogleContainerTools/jib/tree/master/jib-gradle-plugin) conectando-se ao daemon do Docker local:

Com o Gradle digitando o seguinte comando: 
 ```bash
./gradlew -Pprod bootJar jibDockerBuild
```

Rodando a imagem com o Docker: 
 ```bash
./docker run -d -p 8888:8888 config-server
```

# Kubernetes

## Orquestrando o container com o Kubernetes
Para orquestrar o container é necessário a instalação do Kubernetes e kubectl [Kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl/):

Com o Gradle digitando o seguinte comando: 
 ```bash
./kubectl apply -f config-server.yaml
```