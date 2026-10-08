#!/usr/bin/env bash
set -euo pipefail
[ -f package.json ] && [ -f src/components/Hero.astro ] && [ -f src/styles/global.css ] || { echo 'Pokreni skriptu iz korijena nk-gavran-laniste projekta.'; exit 1; }
python3 - <<'PY'
from pathlib import Path
import re
p=Path('src/components/Hero.astro')
s=p.read_text()
# Remove any old inline hero crest and insert crest to the right of the copy in the hero content.
s=re.sub(r'<img\b(?=[^>]*class=["\'][^"\']*hero-crest)[^>]*\/?>','',s,flags=re.S)
# Find hero-content wrapper; preserve all original hero copy and buttons.
start=s.find('<div class="hero-content">')
if start<0:
 raise SystemExit('Nisam pronašao hero-content; datoteka nije izmijenjena.')
# Wrap original content inside a copy div, then insert crest as a sibling before closing hero-content.
opening='<div class="hero-content">'
s=s[:start]+s[start:].replace(opening,opening+'<div class="hero-copy">',1)
# Existing markup from V2: hero-content closes immediately before container and section.
pattern=r'(</div>)(\s*</div>\s*</section>)'
replacement='</div><div class="hero-emblem" aria-hidden="true"><img src="/images/nk-gavran-grb.png" alt="" width="350" height="410" /></div></div>\\2'
s,n=re.subn(pattern,replacement,s,count=1)
if n!=1:
 raise SystemExit('Nije pronađen završetak hero sekcije; provjeri Hero.astro.')
p.write_text(s)
css=Path('src/styles/global.css')
css.write_text(css.read_text()+'''\n/* NK Gavran V5 — hero grb bez pozadinske kartice */\n.hero .hero-content{width:100%;max-width:none;display:grid;grid-template-columns:minmax(0,1fr) minmax(230px,390px);align-items:center;gap:clamp(30px,6vw,110px);position:relative;z-index:2}\n.hero .hero-copy{min-width:0;max-width:680px}\n.hero .hero-emblem{display:flex;justify-content:center;align-items:center;background:transparent!important;border:0!important;box-shadow:none!important;padding:0!important;min-height:0}\n.hero .hero-emblem img{display:block;width:min(100%,350px);height:auto;max-height:440px;object-fit:contain;background:transparent!important;border:0!important;box-shadow:none!important;filter:drop-shadow(0 14px 22px rgba(0,0,0,.35))}\n.hero .hero-identity{display:block}\n.hero .hero-crest{display:none!important}\n/* Ukloni pozadinsku šahovnicu iz kartice grba u povijesti */\n.history-art{background:transparent!important;box-shadow:none!important;color:#151515}\n.history-art img{background:transparent!important;box-shadow:none!important}\n@media(max-width:760px){.hero .hero-content{grid-template-columns:1fr;gap:20px;padding-block:30px}.hero .hero-emblem{justify-content:flex-start}.hero .hero-emblem img{width:clamp(125px,40vw,210px);max-height:250px}}\n''')
print('Hero ažuriran. Grb: /images/nk-gavran-grb.png')
PY
