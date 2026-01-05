# Amazon Viewer: Sistema de Gestión de Contenido Multimedia
<img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white" alt="Java">
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
  <img src="https://img.shields.io/badge/JDBC-005A9C?style=for-the-badge&logo=java&logoColor=white" alt="JDBC">
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux">
  <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" alt="Git">
  <img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white" alt="Markdown">

> **Estado del Proyecto:** Desarrollo de Arquitectura y Persistencia.
---
## 📋 Resumen Ejecutivo
**Amazon Viewer** es una solución robusta desarrollada en **Java SE** diseñada para la gestión, catalogación y seguimiento de consumo de contenido multimedia (Cine/TV) y editorial. El sistema destaca por su arquitectura desacoplada, implementando el patrón **DAO (Data Access Object)** para garantizar una persistencia de datos íntegra en motores **MySQL**, optimizada específicamente para la zona horaria de Ecuador (GMT-5).

---
## Especificaciones Funcionales

* **Catálogo Multimaterial:** Clasificación jerárquica de películas, series, capítulos, libros y revistas.
* **Seguimiento de Visualización:** Registro dinámico en base de datos para diferenciar elementos vistos de los pendientes.
* **Sistema de Reportes:** Módulo dedicado para la exportación de estadísticas de uso en formato de texto plano (.txt).
* **Lógica de Negocio Avanzada:** Implementación de polimorfismo para la gestión de identificadores de material y tiempos de consumo.
* **Capa de Persistencia:** Interfaz orientada a datos (DAO) para la comunicación eficiente con MySQL.

---

## Requisitos del Sistema

## Tecnologías y Herramientas
* **Lenguaje:** [Java JDK 21+](https://www.oracle.com/java/technologies/downloads/) - Core del sistema y lógica de negocio.
* **Base de Datos:** [MySQL 8.0+](https://www.mysql.com/) - Almacenamiento relacional de metadatos y transacciones.
* **Conectividad:** [JDBC Connector/J](https://dev.mysql.com/downloads/connector/j/) - Puente de comunicación entre la aplicación y el servidor DB.
* **Entorno:** [Linux / Unix](https://www.linux.org/) - Sistema operativo base para despliegue y scripts de compilación.
* **Control de Versiones:** [Git](https://git-scm.com/) - Gestión de cambios y colaboración.

---
### Entorno de Ejecución
* **Sistema Operativo:** Distribuciones basadas en Linux (Ubuntu 20.04 LTS o superior recomendadas).
* **Java Development Kit:** Versión 21 o superior.
* **Gestor de Base de Datos:** MySQL Server 8.0 o superior.

### Dependencias Externas
* **JDBC Driver:** MySQL Connector/J (debe incluirse en el directorio de librerías del proyecto).
---

## Arquitectura del Sistema
El proyecto se basa en una arquitectura de N-Capas para facilitar el mantenimiento y la escalabilidad:

### 1. Capa de Modelo (Entities)
Representación de objetos del mundo real mediante POJOs (`Movie`, `Serie`, `Book`, `Chapter`). Implementa herencia y polimorfismo para optimizar atributos comunes como título, género y duración.

### 2. Capa de Persistencia (DAO)
Implementación del patrón **Data Access Object**. Las interfaces definen los contratos de persistencia, mientras que los métodos `default` gestionan las consultas SQL, asegurando que la lógica de la base de datos no contamine la lógica de negocio.

### 3. Capa de Utilidades y Reportes
* **AmazonUtil:** Gestión de entradas de usuario y validaciones.
* **Report Module:** Generación dinámica de archivos `.txt` utilizando **Java Streams** para filtrar contenido visto en fechas específicas.
---

## Configuración y Despliegue

### Esquema de Base de Datos
El sistema requiere una estructura relacional normalizada. Asegúrese de que su tabla `viewed` (tabla puente) esté correctamente vinculada:

| Tabla | Función |
| :--- | :--- |
| `movie` / `serie` | Catálogo principal de material audiovisual. |
| `chapter` | Elementos dependientes de series con relación FK. |
| `viewed` | Tabla transaccional que registra: `id_user`, `id_element`, `id_material` y `date`. |

### Preparación de la Base de Datos
Para inicializar el esquema de datos, ejecute las siguientes sentencias SQL en su gestor de base de datos:

```sql
CREATE DATABASE amazon_viewer;
-- Nota: Asegúrese de ejecutar los scripts de creación para las tablas: 
-- movie, serie, chapter, material, user y viewed.
```
### Configuración de Conexión

La configuración de acceso a datos se centraliza en la lógica de conexión del sistema.
```Java
// Ejemplo de configuración en la cadena de conexión
String URL = "jdbc:mysql://localhost:3306/amazon_viewer
```
Asegúrese de ajustar los parámetros de red y zona horaria para garantizar la precisión de los reportes:

* **Parámetros de Conexión:** Valide que la constante `URL_PARAMS` incluya los flags de seguridad necesarios para drivers modernos:
    ```java
    public static final String URL_PARAMS = "?useSSL=false"
                                          + "&serverTimezone=America/Guayaquil"
                                          + "&allowPublicKeyRetrieval=true";
    ```
### Sincronización Horaria (Ecuador)
Para garantizar la precisión en los reportes diarios, la conexión está configurada para **Ecuador**:
```java
// DBConfig.java
public static final String URL_PARAMS = "?useSSL=false&serverTimezone=America/Guayaquil";
```

### Requisitos Previos

* Instalar MySQL Server y crear la base de datos amazonviewer.
* Configurar las credenciales en `src/com/anncode/amazonviewer/db/DBConfig.java`

### Compilación y Ejecución Manual
**Pipeline de Compilación (Terminal Linux)**

Para compilar y ejecutar el sistema desde la interfaz de línea de comandos en sistemas Unix/Linux, utilice los siguientes comandos:
```Bash
# 1. Limpiar y preparar entorno
rm -rf bin && mkdir bin

# 2. Compilar con dependencias de MySQL
javac -d bin -cp "libs/mysql-connector-j.jar" src/com/anncode/amazonviewer/**/*.java

# 3. Ejecutar la aplicación
java -cp "bin:libs/mysql-connector-j.jar" com.anncode.amazonviewer.Main
```
---
## Estructura de Directorios

El proyecto sigue una organización de paquetes estándar de Java, separando la lógica de la interfaz de consola, el modelo de datos y la persistencia:
* **src**/: Código fuente organizado por paquetes siguiendo el estándar de nombrado de Java.
* **libs**/: Librerías externas y conectores necesarios para la ejecución.
* **docs**/: Documentación técnica adicional y recursos del sistema.
```text
AmazonViewer/
├── bin/                        # Archivos binarios compilados (.class)
├── libs/                       # Librerías externas (Connector/J)
├── src/                        # Código fuente del proyecto
│   └── com/
│       └── anncode/
│           └── amazonviewer/
│               ├── db/         # Configuración de conexión y drivers
│               ├── dao/        # Interfaces de Data Access Object
│               ├── model/      # Entidades (Movie, Serie, Book, etc.)
│               ├── report/     # Lógica de generación de archivos .txt
│               ├── util/       # Clases de apoyo y utilitarios
│               └── Main.java   # Punto de entrada de la aplicación
├── .gitignore                  # Definición de archivos excluidos
├── README.md                   # Documentación principal
└── CONTRIBUTING.md             # Guía para colaboradores
```
---
## Documentación de Código (JavaDoc)

El proyecto utiliza **JavaDoc** para generar documentación técnica automatizada a partir del código fuente. Se han documentado exhaustivamente las clases, interfaces y métodos siguiendo las convenciones de Oracle para garantizar que cualquier desarrollador pueda entender la lógica de negocio y la arquitectura de persistencia.

### Estándares de Documentación Aplicados:
* **@author:** Identifica al desarrollador responsable del componente **Luigi** (Luis Cacuango).
* **@param:** Detalla los parámetros de entrada en métodos críticos como los de la capa DAO.
* **@return:** Explica el tipo de dato y el significado del valor devuelto.
* **@see:** Vincula clases relacionadas, útil para navegar entre modelos y sus interfaces DAO.

### Generación de la Documentación HTML
Si deseas generar los archivos de ayuda en formato HTML localmente, ejecuta el siguiente comando desde la raíz del proyecto:

```bash
# Crear directorio para la documentación
mkdir -p docs/javadoc

# Generar JavaDocs para todo el proyecto
javadoc -d docs/javadoc -sourcepath src -subpackages com.anncode.amazonviewer
```
Una vez generado, abre el archivo `docs/javadoc/index.html` en cualquier navegador para visualizar la documentación técnica completa.

---
## Recursos y Documentación

Para asegurar la transparencia y facilitar la colaboración, este repositorio incluye la siguiente documentación:

* **[Guía de Contribución](./CONTRIBUTING.md):** Contiene los estándares de arquitectura, reglas de estilo de código Java y el flujo de trabajo para enviar Pull Requests.
* **[Reporte de Issues](https://github.com/luiscacuango2/AmazonViewer/issues):** Espacio para informar sobre errores detectados o proponer nuevas funcionalidades.
---
## Créditos de Desarrollo
Este proyecto forma parte de mi ruta de aprendizaje en ingeniería de software. Un agradecimiento especial a **Platzi**.

* **Autor**: Luis Cacuango [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github)](https://github.com/luiscacuango2)
* **Rol**: Arquitectura de Software y Desarrollo Core.
---

## Licencia

Este proyecto se distribuye bajo la **[Licencia MIT](./LICENSE):** con fines educativos bajo los estándares de desarrollo de software para la gestión de datos persistentes.