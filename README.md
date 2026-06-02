# PREP 2024 — IEEM Estado de México
## Sistema Integral de Consulta y Análisis de Resultados Electorales Preliminares

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Publicado-brightgreen)](https://pages.github.com)
[![Datos](https://img.shields.io/badge/Fuente-IEEM%20PREP%202024-purple)](https://www.ieem.org.mx/prep2024/)
[![Corte](https://img.shields.io/badge/Corte-03%2F06%2F2024%2020%3A00%20UTC--6-blue)](https://www.ieem.org.mx)

---

### Descripción

Sistema de visualización y análisis de los resultados del **Programa de Resultados Electorales Preliminares (PREP) 2024** del Instituto Electoral del Estado de México (IEEM), correspondiente a la elección del **2 de junio de 2024**.

Incluye resultados de:
- **45 Distritos Electorales Locales** — Diputaciones Locales
- **125 Municipios** — Ayuntamientos

---

### Resultados Globales

| Elección | Bloque | Votos | Municipios/Distritos |
|---|---|---|---|
| Ayuntamientos | PVEM · PT · MORENA (4T) | 4,083,467 | 88 |
| Ayuntamientos | PAN · PRI · PRD · NAEM (VA) | 2,017,900 | 29 |
| Ayuntamientos | Movimiento Ciudadano | 788,639 | 8 |
| Diputaciones | PVEM · PT · MORENA (4T) | 4,248,971 | 36 |
| Diputaciones | PAN · PRI · PRD · NAEM (VA) | 2,630,753 | 9 |
| Diputaciones | Movimiento Ciudadano | 802,955 | 0 |

**Actas contabilizadas:** 95.4% Ayuntamientos · 94.7% Diputaciones  
**Corte:** 03/06/2024 20:00 hrs (UTC-6)

---

### Módulos del Sistema

| Módulo | Descripción |
|---|---|
| 🏠 **Inicio** | Landing con resumen ejecutivo y acceso rápido |
| 🗳️ **Sistema de Resultados** | Dashboard PREP, Análisis Avanzado y Comparativo DIP/AYU |
| 🔍 **Sistema de Consulta** | Filtros avanzados, gráficas, mapas y exportación |
| 📊 **Análisis** | Mapas, gráficas, tablas por distrito y municipio |

---

### Estructura del Proyecto

```
DataPREP24/
├── index.html                          # Página principal (SPA)
├── dashboard_prep2024_ieem_edomex.html # Dashboard PREP 2024
├── analisis_avanzado_prep2024.html     # Análisis avanzado
├── comparativo_dip_ayu_2024.html       # Comparativo DIP vs AYU
├── datos_integral.js                   # Datos procesados (45 distritos + 125 municipios)
├── datos_prep.js                       # Datos PREP por casilla
├── datos_reales.js                     # Datos reales validados
├── analisis_data.js / .json            # Datos de análisis
├── prep_data.json                      # Datos JSON del PREP
├── img/                                # Logos SVG de partidos y coaliciones
│   ├── MORENA.svg, PAN.svg, PRI.svg...
│   ├── C_PVEM_PT_MORENA.svg            # Coalición 4T
│   ├── C_PAN_PRI_PRD_NAEM.svg          # Coalición VA
│   ├── CC_PVEM_PT_MORENA.svg           # Candidatura Común 4T
│   └── CC_PAN_PRI_PRD_NAEM.svg         # Candidatura Común VA
└── _config.yml                         # Configuración GitHub Pages
```

---

### Publicar en GitHub Pages

1. Sube este repositorio a GitHub
2. Ve a **Settings → Pages**
3. En **Source** selecciona `main` branch y carpeta `/ (root)`
4. Guarda — en unos minutos el sitio estará disponible en:
   `https://[tu-usuario].github.io/[nombre-repo]/`

---

### Fuente de Datos

- **Instituto Electoral del Estado de México (IEEM)**
- Sitio oficial PREP: [https://www.ieem.org.mx/prep2024/](https://www.ieem.org.mx/prep2024/)
- Archivos CSV originales: `MEX_DIP_LOC_2024.csv` y `MEX_AYUN_2024.csv`
- Los datos son **preliminares**, de carácter informativo y sin efectos jurídicos

---

### Tecnologías

- HTML5 / CSS3 / JavaScript (Vanilla)
- [Chart.js](https://www.chartjs.org/) — Gráficas
- [DataTables](https://datatables.net/) — Tablas interactivas
- [Leaflet.js](https://leafletjs.com/) — Mapas
- [noUiSlider](https://refreshless.com/nouislider/) — Filtros de rango
- GitHub Pages — Hosting gratuito

---

*PREP 2024 — Datos preliminares, sujetos a verificación oficial. Elección del 2 de junio de 2024 — Estado de México.*
