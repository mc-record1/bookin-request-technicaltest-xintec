# Booking Requests API

## Descripción

Aplicación desarrollada en Java 17, Spring Boot, Gradle y MySQL para la gestión de solicitudes de reserva (Booking Requests).

---

# Requisitos Previos

Antes de ejecutar la aplicación, asegúrese de tener instalado:

- Java JDK 17
- Gradle (opcional, puede utilizar el wrapper incluido en el proyecto)
- XAMPP
- MySQL/MariaDB (incluido en XAMPP)
- phpMyAdmin
- IntelliJ IDEA o Visual Studio Code
- Git

Verificar versiones:

```bash
java -version
```

```bash
gradle -v
```

---

# Configuración de Base de Datos

La aplicación utiliza una base de datos MySQL llamada:

```text
bd_booking_requests
```

## 1. Iniciar XAMPP

Levantar los servicios:

- Apache
- MySQL

## 2. Crear Base de Datos

Ingresar a:

```text
http://localhost/phpmyadmin
```

Crear la base de datos:

```sql
CREATE DATABASE bd_booking_requests;
```

## 3. Importar Script SQL

Dentro del proyecto existe un archivo SQL ubicado en:

```text
xintec_technical_test_booking_request/sql/bd_booking_requests.sql
```

Importar dicho archivo utilizando la opción:

```text
phpMyAdmin -> Importar
```

Este script crea:

- Tabla supplier
- Tabla bookingrequest
- Tabla bookingitem
- Relaciones FK
- Datos de prueba

## 4. Configuración application.yaml

Verificar que el archivo:

```text
src/main/resources/application.yaml
```

contenga una configuración similar a:

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/bd_booking_requests
    username: root
    password:
    driver-class-name: com.mysql.cj.jdbc.Driver

  jpa:
    hibernate:
      ddl-auto: validate

    properties:
      hibernate:
        format_sql: true

    show-sql: true
```

> Si su instalación de MySQL posee contraseña, reemplazar el valor correspondiente.

---

# Ejecución de la Aplicación

## IntelliJ IDEA

1. Abrir el proyecto.
2. Esperar la descarga de dependencias Gradle.
3. Verificar que se encuentre seleccionada la JDK 17.
4. Ejecutar la clase:

```text
BookingrequestsApiApplication
```

o presionar:

```text
Run
```

## Visual Studio Code

1. Instalar Extension Pack for Java.
2. Abrir la carpeta del proyecto.
3. Esperar indexación y descarga de dependencias.
4. Ejecutar:

```text
BookingrequestsApiApplication.java
```

o desde terminal:

```bash
./gradlew bootRun
```

Windows:

```cmd
gradlew.bat bootRun
```

---

# Verificación

Una vez iniciada la aplicación debería quedar disponible en:

```text
http://localhost:8080
```

Ejemplo:

```text
GET http://localhost:8080/api/v1/bookings?taxId=1123456
```

---

# Arquitectura

El proyecto se encuentra estructurado utilizando:

- Arquitectura Hexagonal
- Principios SOLID
- Spring Boot 3
- Spring Data JPA
- MySQL

Estructura general:

```text
src/main/java
│
├── application
├── domain
│   ├── model
│   ├── enums
│   ├── port
│   │   ├── in
│   │   └── out
│   └── exception
│
├── infrastructure
│   ├── persistence
│   ├── mapper
│   └── exception
│
└── presentation
    ├── controller
    ├── request
    ├── response
    └── mapper
```

---

# Tecnologías

- Java 17
- Spring Boot 3
- Spring Data JPA
- Hibernate
- Gradle
- MySQL / MariaDB
- XAMPP
- phpMyAdmin
