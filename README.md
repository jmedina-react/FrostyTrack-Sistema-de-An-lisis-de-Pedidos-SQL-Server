# 🍦 FrostyTrack — Sistema de Análisis de Pedidos SQL Server

> Proyecto académico de análisis de datos con SQL Server sobre una empresa ficticia de helados a domicilio.

---

## 📋 Descripción del Proyecto

**FrostyTrack** es una empresa limeña de helados artesanales con delivery a domicilio, fundada en 2010.  
Opera en varios distritos de Lima con una flota de repartidores y un catálogo de sabores de temporada.

Este repositorio documenta el análisis de su base de datos operacional mediante **SQL Server**, 
resolviendo problemas reales del negocio organizados por nivel de complejidad.

---

## 🗂️ Estructura del Repositorio

```
proyecto_heladeria/
│
├── README.md
├── Script_general.sql          ← Script de creación e inserción de datos
│
├── sql/
│   ├── basico/
│   │   ├── 01_catalogo_helados.sql
│   │   ├── 02_directorio_clientes.sql
│   │   ├── 03_stock_critico.sql
│   │   └── 04_resumen_pedidos.sql
│   │
│   ├── intermedio/
│   │   ├── 05_total_por_pedido.sql
│   │   ├── 06_clientes_frecuentes.sql
│   │   ├── 07_helado_mas_vendido.sql
│   │   └── 08_rendimiento_repartidores.sql
│   │
│   ├── avanzado/
│   │   ├── 09_ticket_promedio_cliente.sql
│   │   ├── 10_reporte_consolidado.sql
│   │   └── 11_helados_sin_rotacion.sql
│   │
│   └── subqueries/
│       ├── 12_clientes_sobre_promedio.sql
│       ├── 13_repartidores_san_isidro.sql
│       ├── 14_pedidos_sin_repartidor.sql
│       └── 15_ranking_helados_cte.sql
│
└── docs/
    └── Conclusiones_FrostyTrack.docx
```

---

## 🏢 Modelo de Datos

| Tabla | Descripción |
|-------|-------------|
| `tb_cliente` | Clientes registrados con datos personales y ubigeo |
| `tb_pedido` | Cabecera de cada pedido (estado, repartidor, horario) |
| `tb_detalle_pedido` | Líneas de pedido con helados, cantidades y precios |
| `tb_helado` | Catálogo de productos con stock y precio |
| `tb_repartidor` | Personal de reparto con ubicación |
| `tb_horario` | Franjas horarias de entrega |
| `tb_ubigeo` | Tabla geográfica de Peru (departamento/provincia/distrito) |

---

## 🎯 Problemas de Negocio Resueltos

### 🟢 Nivel Básico
| # | Problema | Script |
|---|----------|--------|
| 01 | ¿Cuáles son todos los helados del catálogo? | `sql/basico/01_catalogo_helados.sql` |
| 02 | Directorio de clientes para atención al cliente | `sql/basico/02_directorio_clientes.sql` |
| 03 | ¿Qué helados tienen stock crítico (< 10 unidades)? | `sql/basico/03_stock_critico.sql` |
| 04 | Resumen de pedidos totales y pendientes | `sql/basico/04_resumen_pedidos.sql` |

### 🔵 Nivel Intermedio
| # | Problema | Script |
|---|----------|--------|
| 05 | Total facturado por cada pedido | `sql/intermedio/05_total_por_pedido.sql` |
| 06 | Clientes frecuentes (3+ pedidos) | `sql/intermedio/06_clientes_frecuentes.sql` |
| 07 | Top 5 helados más vendidos en unidades | `sql/intermedio/07_helado_mas_vendido.sql` |
| 08 | Rendimiento de repartidores por entregas | `sql/intermedio/08_rendimiento_repartidores.sql` |

### 🟠 Nivel Avanzado
| # | Problema | Script |
|---|----------|--------|
| 09 | Ticket promedio y gasto total por cliente | `sql/avanzado/09_ticket_promedio_cliente.sql` |
| 10 | Reporte consolidado: cliente + distrito + horario + gasto | `sql/avanzado/10_reporte_consolidado.sql` |
| 11 | Helados sin rotación (nunca pedidos) | `sql/avanzado/11_helados_sin_rotacion.sql` |

### 🟣 Subqueries
| # | Problema | Script |
|---|----------|--------|
| 12 | Clientes que gastan más que el promedio general | `sql/subqueries/12_clientes_sobre_promedio.sql` |
| 13 | Repartidores que atendieron a clientes de San Isidro | `sql/subqueries/13_repartidores_san_isidro.sql` |
| 14 | Clientes con pedidos sin repartidor asignado | `sql/subqueries/14_pedidos_sin_repartidor.sql` |
| 15 | Ranking de helados por ingreso (CTE + RANK) | `sql/subqueries/15_ranking_helados_cte.sql` |

---

## ⚙️ Requisitos

- SQL Server 2017 o superior (también compatible con SQL Server 2022)
- SQL Server Management Studio (SSMS) 18+ o Azure Data Studio

## 🚀 Cómo usar

```sql
-- 1. Ejecutar primero el script base
-- Abrir Script_general.sql en SSMS y ejecutar (crea BD_HELADERIA)

-- 2. Seleccionar la base de datos
USE BD_HELADERIA;

-- 3. Ejecutar cualquier script de la carpeta sql/
-- Los scripts son independientes entre sí
```

---

## 👤 Autor

Proyecto académico — SQL Server · Lima, Perú  
Base de datos: `BD_HELADERIA`
