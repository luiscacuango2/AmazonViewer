# Amazon Viewer: Sistema de Gestión de Contenido Multimedia
![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

> **Estado del Proyecto:** Desarrollo de Arquitectura y Persistencia.

Amazon Viewer es una solución integral desarrollada en Java SE para la administración y seguimiento de consumo de material visual y editorial. El sistema implementa una arquitectura basada en el paradigma orientado a objetos, garantizando la persistencia de datos mediante el uso de bases de datos relacionales y permitiendo la generación de reportes detallados de actividad.

---

## Especificaciones Funcionales

* **Catálogo Multimaterial:** Clasificación jerárquica de películas, series, capítulos, libros y revistas.
* **Seguimiento de Visualización:** Registro dinámico en base de datos para diferenciar elementos vistos de los pendientes.
* **Sistema de Reportes:** Módulo dedicado para la exportación de estadísticas de uso en formato de texto plano (.txt).
* **Lógica de Negocio Avanzada:** Implementación de polimorfismo para la gestión de identificadores de material y tiempos de consumo.
* **Capa de Persistencia:** Interfaz orientada a datos (DAO) para la comunicación eficiente con MySQL.

---

## Requisitos del Sistema

### Entorno de Ejecución
* **Sistema Operativo:** Distribuciones basadas en Linux (Ubuntu 20.04 LTS o superior recomendadas).
* **Java Development Kit:** Versión 11 o superior.
* **Gestor de Base de Datos:** MySQL Server 8.0 o superior.

### Dependencias Externas
* **JDBC Driver:** MySQL Connector/J (debe incluirse en el directorio de librerías del proyecto).

---

## Configuración y Despliegue

### Preparación de la Base de Datos
Para inicializar el esquema de datos, ejecute las siguientes sentencias SQL en su gestor de base de datos:

```sql
CREATE DATABASE amazon_viewer;
-- Nota: Asegúrese de ejecutar los scripts de creación para las tablas: 
-- movie, serie, chapter, material, user y viewed.
```
### Configuración de Conexión

La configuración de acceso a datos se centraliza en la lógica de conexión del sistema. Asegúrese de ajustar los parámetros de red y zona horaria para garantizar la precisión de los reportes:
```Java
// Ejemplo de configuración en la cadena de conexión
String URL = "jdbc:mysql://localhost:3306/amazon_viewer?serverTimezone=America/Guayaquil";
```
### Compilación y Ejecución Manual

Para compilar y ejecutar el sistema desde la interfaz de línea de comandos en sistemas Unix/Linux, utilice los siguientes comandos:
```Bash
# Crear directorio de salida
mkdir -p bin

# Compilación
javac -d bin -cp "libs/*" src/com/anncode/amazonviewer/*.java

# Ejecución
java -cp "bin:libs/mysql-connector-java.jar" com.anncode.amazonviewer.Main
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
## Recursos y Documentación

Para asegurar la transparencia y facilitar la colaboración, este repositorio incluye la siguiente documentación:

* **[Guía de Contribución](./CONTRIBUTING.md):** Contiene los estándares de arquitectura, reglas de estilo de código Java y el flujo de trabajo para enviar Pull Requests.
* **[Licencia MIT](./LICENSE):** Información legal sobre el uso, modificación y distribución de este software (disponible en Inglés y Español).
* **[Reporte de Issues](https://github.com/luiscacuango2/AmazonViewer/issues):** Espacio para informar sobre errores detectados o proponer nuevas funcionalidades.
---
## Créditos de Desarrollo
* **Autor**: Luis Cacuango
* **Rol**: Arquitectura de Software y Desarrollo Core.
* **Tecnologías**: Java Standard Edition, MySQL, JDBC.

## Licencia

Este proyecto se distribuye con fines educativos bajo los estándares de desarrollo de software para la gestión de datos persistentes.