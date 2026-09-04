const { chromium } = require('playwright');
const path = require('path');

(async () => {
  const browser = await chromium.launch({ headless: true, executablePath: 'C:\\\\Program Files\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe' });
  const page = await browser.newPage({ viewport: { width: 1440, height: 900 }, deviceScaleFactor: 1 });
  await page.goto('http://127.0.0.1:4173/', { waitUntil: 'networkidle' });
  await page.evaluate(() => {
    const gallery = document.querySelector('#gallery');
    document.querySelector('#galleryEmpty').hidden = true;
    document.querySelector('#loading').hidden = true;
    document.querySelector('#currentGalleryName').textContent = 'Travel';
    document.querySelector('#imageCount').textContent = '3 folders · 248 images';
    const palettes = [
      ['#334155','#94a3b8'],['#312e81','#818cf8'],['#164e63','#67e8f9'],['#3f3f46','#a1a1aa'],
      ['#4c1d95','#c4b5fd'],['#1e3a5f','#60a5fa'],['#27272a','#71717a'],['#134e4a','#5eead4']
    ];
    const heights = [260,360,220,310,400,245,335,275,385,230,320,290,350,250,375,215,340,280,305,395];
    gallery.innerHTML = '';
    for (let columnIndex = 0; columnIndex < 5; columnIndex++) {
      const column = document.createElement('div');
      column.className = 'gallery-column';
      heights.filter((_, index) => index % 5 === columnIndex).forEach((height, index) => {
        const card = document.createElement('div');
        const palette = palettes[(columnIndex * 4 + index) % palettes.length];
        card.className = 'photo-card is-loaded';
        card.style.height = `${height}px`;
        card.style.background = `linear-gradient(${125 + index * 17}deg, ${palette[0]}, ${palette[1]})`;
        card.innerHTML = '<span class="photo-meta">sample-image.jpg</span>';
        column.appendChild(card);
      });
      gallery.appendChild(column);
    }
  });
  await page.screenshot({ path: path.join(__dirname, '..', 'docs', 'screenshot.png'), fullPage: false });
  await browser.close();
})().catch(error => { console.error(error); process.exit(1); });

