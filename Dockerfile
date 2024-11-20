# Use uma imagem base do Java 17
FROM openjdk:17-jdk-slim

# Define o diretório de trabalho no container
WORKDIR /app

# Copia o arquivo JAR gerado para o container
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta que o Spring Boot usa
EXPOSE 8080

# Comando para executar o JAR
CMD ["java", "-jar", "app.jar"]