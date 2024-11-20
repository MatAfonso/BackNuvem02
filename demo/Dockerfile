# Use uma imagem base do Maven para construir o projeto
FROM maven:3.9.5-eclipse-temurin-17 AS build

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo pom.xml e as dependências para o cache
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copie o restante do código-fonte do projeto para o contêiner
COPY src ./src

# Construa o aplicativo
RUN mvn package -DskipTests

# Use uma imagem base do JDK para executar o aplicativo
FROM eclipse-temurin:17-jdk-jammy

# Define o diretório de trabalho no contêiner final
WORKDIR /app

# Copie o JAR gerado no estágio de build para o contêiner final
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar

# Expor a porta do Spring Boot
EXPOSE 8080

# Comando para executar o aplicativo
ENTRYPOINT ["java", "-jar", "app.jar"]
