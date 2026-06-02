// Script temporal para contar victorias
const fs = require('fs');

// Extraer datos de municipios del comparativo (tiene g por partido individual)
const html = fs.readFileSync('comparativo_dip_ayu_2024.html', 'utf8');

// Extraer array de municipios
const munMatch = html.match(/const municipios = \[([\s\S]+?)\];\s*\n/);
if (!munMatch) { console.log('No se encontró municipios'); process.exit(1); }

const munData = eval('[' + munMatch[1] + ']');
console.log('Total municipios:', munData.length);

const ayuWins = {};
munData.forEach(m => {
  ayuWins[m.g] = (ayuWins[m.g] || 0) + 1;
});
console.log('=== AYU Victorias por partido ===');
Object.entries(ayuWins).sort((a,b) => b[1]-a[1]).forEach(([k,v]) => console.log(k + ': ' + v));

// Extraer distritos del comparativo
const distMatch = html.match(/const distritos = \[([\s\S]+?)\];\s*\n/);
if (distMatch) {
  const distData = eval('[' + distMatch[1] + ']');
  console.log('\nTotal distritos:', distData.length);
  const dipWins = {};
  distData.forEach(d => {
    dipWins[d.g] = (dipWins[d.g] || 0) + 1;
  });
  console.log('=== DIP Victorias por partido ===');
  Object.entries(dipWins).sort((a,b) => b[1]-a[1]).forEach(([k,v]) => console.log(k + ': ' + v));
}
