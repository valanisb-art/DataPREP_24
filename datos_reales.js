// PREP 2024 - Estado de Mexico - Corte: 03/06/2024 20:00 UTC-6
// Totales calculados sumando votos individuales por partido de DISTRITOS y MUNICIPIOS
// Fuente: datos_integral.js (MEX_DIP_LOC_2024.csv y MEX_AYUN_2024.csv)
const RDIP={actas_esp:21091,actas_cap:21091,pct_cap:100.0,actas_cont:19966,pct_cont:94.67,ln:12354078,tv:7950381,pct_part:64.35};
const RAYU={actas_esp:21030,actas_cap:20823,pct_cap:99.02,actas_cont:20063,pct_cont:95.40,ln:12440818,tv:7978900,pct_part:64.13};
// Totales de votos por partido — Diputaciones Locales (45 distritos)
const TDIP={PAN:804523,PRI:1083903,PRD:125114,PVEM:359598,PT:197391,MC:1605910,MORENA:2725814,NAEM:80837,NULOS:274379,TOTAL:6983090};
// Totales de votos por partido — Ayuntamientos (125 municipios)
const TAYU={PAN:792219,PRI:1010110,PRD:93493,PVEM:543137,PT:295749,MC:1577278,MORENA:3100375,NAEM:51993,NULOS:310987,TOTAL:7464354};
// Victorias por bloque — Diputaciones: 4T=39, VA=6, MC=0
const WDIP={MORENA:39,PAN:6,MC:0};
// Victorias por bloque — Ayuntamientos: 4T=90, VA=28, MC=7
const WAYU={MORENA:90,PAN:28,MC:7,PRI:0,PVEM:0,PT:0,PRD:0,NAEM:0};
// DISTRITOS y MUNICIPIOS se cargan desde datos_integral.js
// Este archivo provee los totales de referencia para los dashboards
const DISTRITOS=typeof window!=='undefined'&&window.DISTRITOS?window.DISTRITOS:[];
const MUNICIPIOS=typeof window!=='undefined'&&window.MUNICIPIOS?window.MUNICIPIOS:[];
