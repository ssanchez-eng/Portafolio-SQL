# 📊 Portafolio SQL - Sebastián Sánchez Cortés

Tecnólogo en Informática Biomédica 

---

## 🎯 Sobre este repositorio

Este repositorio reúne consultas SQL organizadas por nivel de dificultad, desde conceptos fundamentales hasta técnicas avanzadas de SQL Server.

Los ejercicios se orientan a:

- ✅ Comprensión de los conceptos básicos del lenguaje
- ✅ Resolución de casos sobre datos de negocio
- ✅ Integración de datos de múltiples tablas
- ✅ Obtención de información útil para la toma de decisiones

---

## 📚 Estructura del portafolio

| Estado | Significado |
|--------|-------------|
| ✅ | Disponible |
| 🔄 | En progreso |
| 🔜 | Próximamente |

---

### 🟢 NIVEL BÁSICO

Fundamentos del lenguaje SQL.

**Conceptos incluidos:**

- `SELECT`, `WHERE`, `ORDER BY`, `TOP/LIMIT`
- `GROUP BY`, `HAVING`
- Funciones de agregación: `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`
- `DISTINCT`
- `CASE WHEN` (lógica condicional)
- `INNER JOIN` (relaciones entre tablas)

---

#### ✅ Capítulo 1 - Conceptos Fundamentales *(30 ejercicios)*

Ejercicios de `SELECT`, `WHERE`, `ORDER BY`, `INNER JOIN`, `GROUP BY`, agregaciones básicas y `DISTINCT`.

📄 Archivo: [`Consultas Basicas #1.sql`](./Consultas%20Basicas%20%231.sql)

---

#### 🔄 Capítulo 2 - Consolidación de Conceptos *(30 ejercicios - en progreso)*

Refuerzo de los conceptos anteriores:

- `SUM`, `AVG`, `MAX`, `MIN` (funciones de agregación)
- `HAVING` (filtrado posterior a la agregación)
- `CASE WHEN` (lógica condicional compleja)
- `TOP/LIMIT` (limitación de resultados)
- Combinación de varios conceptos en una misma consulta

---

#### 🔜 Capítulo 3 - Manipulación y Diseño de Tablas

Ejercicios de DML y DDL:

- `INSERT` - Inserción de datos
- `UPDATE` - Actualización de datos
- `DELETE` - Eliminación de datos
- `CREATE TABLE` - Creación de tablas
- `ALTER TABLE` - Modificación de estructuras

---

### 🟡 NIVEL INTERMEDIO 🔜

Manipulación y análisis de datos con consultas de mayor complejidad.

**Conceptos previstos:**

- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`
- `SELF JOIN`
- Subconsultas (correlacionadas y no correlacionadas)
- `UNION`, `INTERSECT`, `EXCEPT`
- Funciones de texto: `CONCAT`, `SUBSTRING`, `UPPER`, `LOWER`, `LEN`, `TRIM`
- Funciones de fecha: `DATEADD`, `DATEDIFF`, `YEAR`, `MONTH`, `DAY`
- Vistas (`CREATE VIEW`)
- Índices (`CREATE INDEX`)
- `EXISTS`, `IN`, `NOT IN`

---

### 🔴 NIVEL AVANZADO 🔜

Técnicas de SQL Server utilizadas en entornos profesionales.

**Conceptos previstos:**

- Window Functions: `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`, `LEAD`
- CTEs (Common Table Expressions - cláusula `WITH`)
- Stored Procedures (`CREATE PROCEDURE`)
- Triggers (`CREATE TRIGGER`)
- Transacciones (`BEGIN`, `COMMIT`, `ROLLBACK`)
- Optimización de consultas (planes de ejecución, índices avanzados)
- Particionamiento de datos
- Manejo de errores (`TRY-CATCH`)

---

## 🛠️ Tecnologías

| Herramienta | Descripción |
|---|---|
| **Microsoft SQL Server** | Motor de base de datos principal |
| **DBeaver** | IDE para desarrollo y ejecución de consultas |

---

## 💾 Base de datos

### Nivel básico: Northwind

- Base de datos de muestra oficial de Microsoft
- Representa una empresa comercial ficticia
- Incluye clientes, órdenes, productos, empleados y proveedores
- Ofrece relaciones entre tablas cercanas a un caso real

### Niveles intermedio y avanzado 🔜

- Bases de datos de mayor complejidad
- Mayor volumen de datos
- Esquemas más elaborados
- Casos de uso más cercanos al entorno laboral

---

## 🚀 Cómo usar este repositorio

**1. Descarga la base de datos Northwind:**
> Repositorio oficial: [Microsoft SQL Server Samples](https://github.com/microsoft/sql-server-samples)

**2. Abre el archivo SQL en un IDE:**
> DBeaver, SQL Server Management Studio (SSMS) o similar

**3. Ejecuta las consultas:**
> Cada ejercicio está numerado y comentado. Es posible ejecutarlos todos o seleccionar ejercicios específicos.

**4. Practica modificando:**
> Cambia condiciones, agrega filtros y experimenta con los resultados.

---

## 📖 Metodología

Cada nivel sigue estos criterios:

- ✅ **Progresión:** de lo simple a lo complejo
- ✅ **Repetición:** los conceptos se retoman en distintos contextos
- ✅ **Aplicación práctica:** ejercicios basados en situaciones de negocio
- ✅ **Independencia:** el foco está en razonar la consulta, no en copiarla

---

## 📞 Contacto

- 💼 **LinkedIn:** [Sebastián Sánchez Cortés](https://www.linkedin.com/in/sebasti%C3%A1n-s%C3%A1nchez-cort%C3%A9s-52781b223)
- 📧 **Email:** s.sanchez@duocuc.cl
- 🐙 **GitHub:** [ssanchez-eng](https://github.com/ssanchez-eng)

---

## 📝 Notas

- Los ejercicios fueron resueltos de forma individual, sin apoyo automatizado.
- Las consultas se organizan por nivel y se amplían de forma progresiva.
- El repositorio se encuentra en desarrollo activo.

---

*Última actualización: Octubre 2026*
