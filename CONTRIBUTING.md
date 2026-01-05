# Guía de Contribución: Amazon Viewer

Gracias por considerar contribuir a Amazon Viewer. Para mantener la integridad de la arquitectura y la calidad del código, solicitamos que todos los colaboradores sigan estos lineamientos técnicos.

---

## Estándares de Arquitectura

El proyecto se basa en una arquitectura de capas bien definida. Cualquier adición debe respetar esta separación:

### 1. Modelo de Datos (POJOs)
* Las nuevas clases deben extender de la clase base correspondiente (ej. `Film` o `Publication`).
* Es obligatorio implementar el polimorfismo mediante la sobreescritura del método `getMaterialName()`.
* Utilice encapsulamiento estricto (atributos privados y métodos getter/setter).

### 2. Capa de Persistencia (DAO)
* No se debe incluir lógica de base de datos directamente en las clases de modelo.
* Utilice interfaces en el paquete `dao` para definir el comportamiento.
* Implemente los métodos `default` para operaciones que no requieren estado específico.

### 3. Generación de Reportes
* Cualquier material nuevo debe ser integrable con el sistema de reportes en `com.anncode.amazonviewer.report`.

---

## Flujo de Trabajo (Workflow)

Para proponer cambios, siga este procedimiento:

1. **Fork del Repositorio:** Cree su propia copia del proyecto en su cuenta de GitHub.
2. **Creación de Rama:** Trabaje sobre ramas descriptivas:
    - `feature/nueva-funcionalidad`
    - `bugfix/correccion-error`
3. **Sincronización:** Asegúrese de que su entorno local esté sincronizado con la rama `main` original antes de comenzar.
4. **Commits:** Realice mensajes de commit claros y en presente (ej. "Añade persistencia para Revistas" en lugar de "Cambié cosas").

---

## Reglas de Estilo de Código

* **Documentación:** Use Javadoc (`/** ... */`) para documentar clases nuevas y métodos públicos complejos.
* **Nomenclatura:** Siga las convenciones de Java (*CamelCase* para clases, *lowerCamelCase* para métodos y variables).
* **Base de Datos:** Verifique que sus consultas SQL sean compatibles con MySQL 8.0 y que manejen correctamente la zona horaria `America/Guayaquil`.

---

## Reporte de Errores

Si identifica un error en la lógica de negocio o en la conexión JDBC:
1. Abra un **Issue** en GitHub.
2. Describa los pasos para reproducir el error.
3. Adjunte el log de error de la consola o el stacktrace de la excepción SQL.

---

## Licencia
Al contribuir, usted acepta que sus aportes estarán bajo la misma licencia que el proyecto original.

**Desarrollado con compromiso por la calidad del código.**