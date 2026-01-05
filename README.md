# Amazon Viewer - Consola Java

Amazon Viewer es una aplicación de gestión de contenido visual (Películas, Series, Libros y Revistas) desarrollada en Java. Permite a los usuarios llevar un control detallado de lo que han visto o leído, persistiendo toda la información en una base de datos MySQL y generando reportes consolidados.

## 🚀 Características

- **Gestión de Catálogo:** Visualización de películas, series (con capítulos), libros y revistas.
- **Persistencia en DB:** Registro automático de visualizaciones en MySQL.
- **Polimorfismo:** Lógica avanzada para diferenciar visualizaciones entre películas y capítulos.
- **Reportes:** Generación de archivos `.txt` con el resumen de actividad del usuario.
- **Interfaz de Consola:** Experiencia fluida con barras de progreso y colores ANSI.

## 🛠️ Requisitos Técnico

- **SO:** Recomendado Ubuntu 20.04+ o Linux Mint.
- **Java:** JDK 11 o superior.
- **DB:** MySQL Server 8.0+.
- **Driver:** MySQL Connector/J.

## ⚙️ Configuración de la Base de Datos

1. Crea la base de datos:
   ```sql
   CREATE DATABASE amazon_viewer;

2. Importa las tablas principales (movie, serie, chapter, viewed, etc.).

3. Configura tu conexión en IDBConnection.java:
Java

    String URL = "jdbc:mysql://localhost:3306/amazon_viewer?serverTimezone=America/Guayaquil";

🖥️ Ejecución

Desde la terminal en la raíz del proyecto:
Bash

javac -d bin src/com/anncode/amazonviewer/*.java
java -cp bin:lib/mysql-connector-java.jar com.anncode.amazonviewer.Main

👤 Autor

    Luigi - Desarrollo Inicial y Arquitectura - TuUsuarioGitHub

---

### 2. CONTRIBUTING.md
Para cuando otros desarrolladores quieran ayudarte a mejorar el código (por ejemplo, añadiendo "Documentales").

# Contribuyendo a Amazon Viewer

¡Gracias por tu interés en mejorar este proyecto! Para mantener la calidad del código, por favor sigue estas guías:

## Estilo de Código
1. **Polimorfismo:** Si añades un nuevo tipo de material, asegúrate de sobrescribir el método `getMaterialName()` en la clase correspondiente.
2. **DAOs:** Sigue el patrón DAO utilizando interfaces con métodos `default` para la persistencia.
3. **Documentación:** Usa Javadoc para todos los métodos públicos y clases nuevas.

## Proceso de Pull Request
1. Haz un Fork del proyecto.
2. Crea una rama para tu mejora: `git checkout -b feature/MejoraIncreible`.
3. Asegúrate de que la hora de visualización esté sincronizada con `America/Guayaquil`.
4. Haz tus cambios y envía el PR.

## Reporte de Bugs
Si encuentras un error en la persistencia o en el cálculo de tiempos, abre un *Issue* detallando los pasos para reproducirlo y tu entorno (Versión de MySQL y Java).