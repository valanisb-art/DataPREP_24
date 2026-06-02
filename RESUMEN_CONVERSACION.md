# Resumen de Conversación — PREP 2024 IEEM Estado de México

**Proyecto:** Dashboard PREP 2024 — Instituto Electoral del Estado de México  
**Fecha de sesión:** Mayo–Junio 2026  
**Archivos principales:** `index.html`, `analisis_avanzado_prep2024.html`, `comparativo_dip_ayu_2024.html`, `dashboard_prep2024_ieem_edomex.html`, `datos_integral.js`, `datos_reales.js`

---

## 1. Documentos Analizados

### Acuerdos IEEM

| # | Archivo | Acuerdo | Tema |
|---|---|---|---|
| 1 | `a071-24.pdf` | IEEM/CG/71/2024 | Registro supletorio de candidaturas |
| 2 | `a078-24.docx` | IEEM/CG/78/2024 | Bloques de competitividad (todos los partidos) |
| 3 | `a081-24.docx` | IEEM/CG/81/2024 | Modificación bloques coalición "SIGAMOS HACIENDO HISTORIA" |
| 4 | `a095-24.pdf` | IEEM/CG/95/2024 | Requerimiento paridad "FUERZA Y CORAZÓN POR EL EDOMEX" (diputaciones) |
| 5 | `a096-24.docx` | IEEM/CG/96/2024 | Requerimiento paridad ayuntamientos (todos los partidos) |

### Datos clave de los acuerdos

- **Coalición "SIGAMOS HACIENDO HISTORIA"** (acuerdo 81): 32 distritos y 73 municipios en coalición; 4 distritos y 52 municipios individuales por MORENA/PT/PVEM
- **Candidatura Común "FUERZA Y CORAZÓN POR EL EDOMEX"**: 10 distritos, 40 municipios — incumplió paridad horizontal (4 mujeres 40% vs 6 hombres 60%)
- **Planillas de Ayuntamientos** (acuerdo 96): Todos los partidos cumplieron acciones afirmativas (3% presidencias, 3% sindicaturas, 5% regidurías)

---

## 2. Archivos de Datos del Workspace

### CSV / Excel
| Archivo | Contenido |
|---|---|
| `MEX_DIP_LOC_2024.csv` | Resultados PREP — Diputaciones Locales por casilla |
| `MEX_AYUN_2024.csv` | Resultados PREP — Ayuntamientos por casilla |
| `DIP_LOC.csv` | Datos de Diputaciones Locales (formato anterior) |
| `DETALLE MAPEO DISTRITAL Actualizado 22-04-2024.xlsx` | Mapeo distrital de referencia |
| `DETALLE MAPEO MUNICIPAL Actualizado 22-04-2024.xlsx` | Mapeo municipal de referencia |
| `PREP 2024 Concentrado de casillas y mapeos bien v1.xlsx` | Concentrado de casillas y mapeos |

### JS / JSON
| Archivo | Contenido |
|---|---|
| `datos_integral.js` | MUNICIPIOS y DISTRITOS con lógica de coaliciones (fuente principal) |
| `datos_reales.js` | Totales de referencia por partido (actualizado) |
| `datos_prep.js` | Datos PREP para dashboards |
| `analisis_data.js` | Metadatos de análisis |
| `mun_centroids.js` | **NUEVO** — Centroides municipales INEGI 2025 (WGS84) |

### Shapefile INEGI 2025
| Archivo | Descripción |
|---|---|
| `igecemdivpolmunene2025cg.shp` | Polígonos municipales |
| `igecemdivpolmunene2025cg.dbf` | Atributos (125 registros) |
| `igecemdivpolmunene2025cg.prj` | Proyección: WGS84/UTM Zone 14N (EPSG:32614) |
| `igecemdivpolmunene2025cg.shx` | Índice espacial |
| `igecemdivpolmunene2025cg.cst` | Codificación: UTF-8 |

**Campos del DBF:** `cveigecem`, `nom_mun`, `cveinegi` (15XXX), `delegacion`, `nom_reg`, `num_reg`, `lon` (UTM E), `lat` (UTM N), `area`

---

## 3. Cambios Realizados

### `datos_reales.js` — Actualizado
- Llenados todos los campos vacíos con datos reales calculados desde `datos_integral.js`
- **TDIP** (votos individuales por partido — Diputaciones):
  - PAN: 804,523 | PRI: 1,083,903 | PRD: 125,114 | PVEM: 359,598
  - PT: 197,391 | MC: 1,605,910 | MORENA: 2,725,814 | NAEM: 80,837
  - NULOS: 274,379 | TOTAL: 6,983,090
- **TAYU** (votos individuales por partido — Ayuntamientos):
  - PAN: 792,219 | PRI: 1,010,110 | PRD: 93,493 | PVEM: 543,137
  - PT: 295,749 | MC: 1,577,278 | MORENA: 3,100,375 | NAEM: 51,993
  - NULOS: 310,987 | TOTAL: 7,464,354
- **WDIP**: 4T=39 distritos | VA=6 | MC=0
- **WAYU**: 4T=90 municipios | VA=28 | MC=7

### `index.html` — Múltiples correcciones
- Votos válidos Aytos corregido: `6,890,006` → `7,667,913`
- Votos válidos DIP corregido: `7,682,679` → `7,676,002`
- Porcentajes tabla DIP: 4T=53.4% | VA=33.1% | MC=10.1% | Nulos=3.4%
- Porcentajes tabla AYU: 4T=56.7% | VA=28.0% | MC=11.0% | Nulos=4.3%
- Selector de municipios: ordenado por número de ID (001→125) en lugar de alfabético
- Popups de mapas actualizados con nombre oficial INEGI 2025 y clave `cveinegi`
- Cargado `mun_centroids.js` para enriquecer popups

### `dashboard_prep2024_ieem_edomex.html` — Corregido
- `winsDip` corregido: `{MORENA:36, PAN:9, MC:0}` (antes: 43/2)
- `winsAyu` corregido: `{MORENA:88, PAN:29, MC:8}` (antes: desglose incorrecto)

### `analisis_avanzado_prep2024.html` — Múltiples correcciones
- `COALICION_DATA` corregido con valores reales:
  - PRI: directo=1,083,903 | coalición=449,461 | total=1,533,364
  - MC: directo=802,955 | coalición=0 | total=802,955
  - PT: directo=197,391 | coalición=768,413 | total=965,804
  - PRD: directo=125,114 | coalición=449,461 | total=574,575
  - NAEM: directo=80,837 | coalición=449,461 | total=530,298
- **Footer movido al final** del documento (estaba en línea 636, antes de la sección 7)
- **`datos_integral.js` cargado** en el `<head>` para que `MUNICIPIOS` esté disponible
- `buildBloques` envuelto en `$(document).ready()` para garantizar carga correcta
- Sección 7 ahora dentro de `<main>` correctamente

### Sección 7 — Bloques de Competitividad (analisis_avanzado_prep2024.html)
Completamente rediseñada con:
- **Highlight box** con datos del Acuerdo IEEM/CG/81/2024
- **10 KPIs** en 2 filas: conteos por bloque, municipio más/menos disputado, participación promedio, ganador frecuente por bloque
- **5 gráficas:**
  1. Barras — municipios por bloque
  2. Donut — distribución porcentual
  3. Barras agrupadas — victorias por bloque y partido (4T/VA/MC)
  4. Barras dobles — participación promedio vs margen promedio
  5. Dispersión — margen de victoria vs participación ciudadana
- **Top 10** municipios más disputados y más dominantes
- **Tabla DataTable** con filtros por bloque y exportación CSV/Excel

### `comparativo_dip_ayu_2024.html` — Actualizado
- `tooltipMun` y `tooltipDist` actualizados para mostrar nombre oficial INEGI 2025 y clave `cveinegi`
- Porcentajes redondeados a 2 decimales (antes 4)

### `mun_centroids.js` — NUEVO ARCHIVO
- Creado con los 125 centroides municipales del Shapefile INEGI 2025
- Coordenadas convertidas de UTM Zone 14N (EPSG:32614) a WGS84 lat/lon
- Estructura: `MUN_CENTROIDS[mun_code] = { cveinegi, nom, lat, lon }`

---

## 4. Datos de Referencia PREP 2024

### Resumen General
| Concepto | Diputaciones | Ayuntamientos |
|---|---|---|
| Actas esperadas | 21,091 | 21,030 |
| Actas contabilizadas | 19,966 (94.67%) | 20,063 (95.40%) |
| Lista nominal | 12,354,078 | 12,440,818 |
| Total votos | 7,950,381 | 7,978,900 |
| Participación | 64.35% | 64.13% |
| Nulos | 274,379 | 310,987 |

### Resultados por Bloque
| Bloque | Votos DIP | Distritos | Votos AYU | Municipios |
|---|---|---|---|---|
| 4T (PVEM·PT·MORENA) | 4,248,971 | 36 | 4,083,467 | 88 |
| VA (PAN·PRI·PRD·NAEM) | 2,630,753 | 9 | 2,017,900 | 29 |
| MC | 802,955 | 0 | 788,639 | 8 |

---

## 5. Estado de Tareas

| Tarea | Estado | Archivos |
|---|---|---|
| Análisis acuerdos IEEM y corrección de datos | ✅ Completado | `datos_reales.js`, `index.html`, `dashboard_prep2024_ieem_edomex.html`, `analisis_avanzado_prep2024.html` |
| Selector de municipios — orden numérico | ✅ Completado | `index.html` |
| Sección 7 — Bloques de Competitividad | ✅ Completado | `analisis_avanzado_prep2024.html` |
| Shapefile INEGI 2025 — Actualización de mapas | ✅ Completado | `mun_centroids.js`, `index.html`, `comparativo_dip_ayu_2024.html` |
| Resumen de conversación en Markdown | ✅ Completado | `RESUMEN_CONVERSACION.md` |

### Verificación de mapas Leaflet
- `index.html` — ✅ `mun_centroids.js` cargado, popups actualizados (AYU, DIP, Sistema de Consulta)
- `comparativo_dip_ayu_2024.html` — ✅ `mun_centroids.js` cargado (línea 484), `tooltipMun` y `tooltipDist` actualizados
- `dashboard_prep2024_ieem_edomex.html` — ✅ Sin mapas Leaflet (solo Chart.js), no requiere cambios
- `analisis_avanzado_prep2024.html` — ✅ Sin mapas Leaflet (solo Chart.js), no requiere cambios

---

## 6. Notas Técnicas

### Mapas Leaflet
- **Librería:** Leaflet 1.9.4
- **TopoJSON:** `https://gist.githubusercontent.com/diegovalle/5129746/raw/mx_tj.json` (polígonos municipales)
- **Tiles:** CartoDB Light (`basemaps.cartocdn.com/light_nolabels`)
- **Identificador:** `mun_code` (1-125) en el TopoJSON = ID de municipio en los datos
- **Proyección datos:** WGS84 lat/lon (EPSG:4326)

### Shapefile INEGI 2025
- **Proyección original:** WGS84/UTM Zone 14N (EPSG:32614)
- **Meridiano central:** -99° (zona 14N)
- **125 registros** — uno por municipio del Estado de México
- **Clave INEGI:** formato `15XXX` donde XXX = número de municipio (001-125)

### Estructura de datos `MUNICIPIOS` (datos_integral.js)
```js
{ id:'001', n:'NOMBRE', v4T:..., vVA:..., vMC:..., nul:..., tv:...,
  ln:..., part:..., g:'4T'|'VA'|'MC', vent:...,
  mVA:'coalicion'|'cc'|'individual', m4T:'coalicion'|'cc'|'individual',
  PAN:..., PRI:..., PRD:..., PVEM:..., PT:..., MC:..., MORENA:..., NAEM:... }
```

### Estructura `MUN_CENTROIDS` (mun_centroids.js)
```js
MUN_CENTROIDS[mun_code_int] = {
  cveinegi: '15XXX',  // Clave INEGI
  nom: 'Nombre oficial INEGI 2025',
  lat: 19.XXXXXX,     // WGS84
  lon: -99.XXXXXX     // WGS84
}
```
