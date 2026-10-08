#!/usr/bin/env bash
set -euo pipefail
[ -f package.json ] && [ -f src/pages/index.astro ] && [ -f src/styles/global.css ] || { echo 'Pokreni u glavnoj mapi Astro projekta.'; exit 1; }
python3 - <<'PY'
from pathlib import Path
import re
p=Path('src/pages/index.astro')
s=p.read_text()
pattern=r'<section\b[^>]*class="[^"]*history-section[^"]*"[^>]*>.*?</section>'
new='''<section class="section history-section gavran-history" id="povijest">
  <div class="container">
    <div class="gh-heading">
      <div><div class="eyebrow">NAŠA PRIČA · LANIŠTE, ZAGREB</div><h2>VIŠE OD NOGOMETA.<br /><span>OD 2003.</span></h2></div>
      <p>Od kvartovskih početaka do novih generacija nogometaša. Naš klub povezuje sport, prijateljstvo i ponos na Lanište.</p>
    </div>
    <div class="gh-grid">
      <div class="gh-story">
        <span class="gh-label">KAKO JE SVE POČELO</span>
        <h3>NAŠ KVART.<br />NAŠ KLUB.<br /><em>NAŠ PONOS.</em></h3>
        <p>Priča NK Gavrana započinje <strong>26. listopada 2003.</strong> na zagrebačkom Laništu. Klub je nastao iz ljubavi prema nogometu i želje da naš kvart ima mjesto okupljanja, sporta i zajedništva.</p>
        <p>Ime <strong>Gavran</strong> nosimo u spomen na <strong>Damira Tomljanovića – Gavrana</strong>, hrvatskog branitelja i heroja Domovinskog rata. Ono nas podsjeća na vrijednosti predanosti, hrabrosti i zajedništva.</p>
        <p>Seniorski natjecateljski put započeo je u sezoni <strong>2008./09.</strong> Nakon prekida rada prvotnog kluba, <strong>13. lipnja 2017.</strong> osnovan je današnji NK Gavran 2003. Novi početak donio je i sportski uspjeh: naslov prvaka <strong>3. Zagrebačke nogometne lige 2017./18.</strong></p>
        <p>Danas okupljamo mlađe uzraste i seniore. Gradimo okruženje u kojem djeca uče, igrači napreduju, a prijateljstva traju i nakon posljednjeg sučeva zvižduka.</p>
        <div class="gh-quote">„Nogomet je više od igre kada iza njega stoji cijeli kvart.”</div>
      </div>
      <aside class="gh-side">
        <div class="gh-years">
          <div><strong>2003.</strong><span><b>Početak priče</b><small>Osnivanje prvotnog kluba na Laništu</small></span></div>
          <div><strong>2008.</strong><span><b>Prvi seniorski nastupi</b><small>Natjecateljska sezona 2008./09.</small></span></div>
          <div><strong>2017.</strong><span><b>Novi početak</b><small>Registracija NK Gavran 2003 – 13. lipnja</small></span></div>
          <div><strong>2018.</strong><span><b>Prvaci 3. ZNL</b><small>Naslov u sezoni 2017./18.</small></span></div>
        </div>
        <div class="gh-location"><div class="gh-location-top">NAŠ DOM DANAS <span>↗</span></div><h3>SPORTSKI CENTAR<br />GAVRAN</h3><p>Remetinečka cesta bb<br />Lanište, Zagreb · preko puta hotela</p><a href="https://www.google.com/maps/search/?api=1&amp;query=Remetine%C4%8Dka+cesta+bb+Zagreb" target="_blank" rel="noopener noreferrer">PRONAĐI NAS NA KARTI ↗</a></div>
      </aside>
    </div>
  </div>
</section>'''
s,n=re.subn(pattern,lambda _:new,s,count=1,flags=re.S)
if n!=1: raise SystemExit('Nisam pronašao sekciju history-section. Ništa nije izmijenjeno.')
p.write_text(s)
css=Path('src/styles/global.css')
css.write_text(css.read_text()+'''
/* NK Gavran V6: povijest kluba */
.gavran-history{padding-block:clamp(64px,8vw,115px);background:#fff;color:#171717}
.gh-heading{display:flex;align-items:end;justify-content:space-between;gap:35px;padding-bottom:32px;border-bottom:1px solid #ddd}
.gh-heading h2{font-size:clamp(42px,5.5vw,78px);line-height:.95;margin:14px 0 0;letter-spacing:-.02em}
.gh-heading h2 span{color:#ce0b14}.gh-heading>p{max-width:345px;color:#666;line-height:1.7;font-size:15px;margin:0}
.gh-grid{display:grid;grid-template-columns:minmax(0,1.25fr) minmax(300px,.85fr);gap:clamp(35px,6vw,95px);padding-top:46px}
.gh-label{font-size:11px;letter-spacing:.15em;color:#c90011;font-weight:900}
.gh-story h3{font-size:clamp(35px,4.5vw,62px);line-height:.98;margin:18px 0 26px}
.gh-story h3 em{font-style:normal;color:#c90011}.gh-story p{font-size:15px;line-height:1.85;color:#555;margin:0 0 17px;max-width:680px}.gh-story p strong{color:#171717}
.gh-quote{margin-top:30px;border-left:4px solid #ce0b14;padding:17px 20px;background:#f6f6f6;font-weight:800;font-size:clamp(17px,2vw,23px);line-height:1.35}
.gh-years{border-top:4px solid #ce0b14;background:#f5f5f5;padding:8px 25px}
.gh-years>div{display:flex;gap:20px;align-items:start;padding:23px 0;border-bottom:1px solid #ddd}.gh-years>div:last-child{border:0}
.gh-years strong{font-family:'Barlow Condensed',Impact,sans-serif;font-size:clamp(35px,3.6vw,49px);line-height:1;color:#ce0b14;min-width:92px}.gh-years span{display:grid;gap:7px}.gh-years b{font-size:15px}.gh-years small{font-size:13px;color:#666;line-height:1.5}
.gh-location{margin-top:20px;background:#171717;color:white;padding:29px;position:relative;overflow:hidden}.gh-location:after{content:'';position:absolute;right:-50px;bottom:-70px;width:180px;height:180px;opacity:.08;background:repeating-conic-gradient(#fff 0 25%,transparent 0 50%) 50%/55px 55px;pointer-events:none}
.gh-location-top{font-size:11px;font-weight:900;letter-spacing:.14em;color:#ff8585;display:flex;justify-content:space-between}.gh-location h3{font-size:clamp(29px,3vw,42px);line-height:1.02;color:#fff;margin:25px 0 15px}.gh-location p{color:#ddd;font-size:14px;line-height:1.7}.gh-location a{display:inline-block;margin-top:17px;color:#fff;text-decoration:none;font-size:12px;font-weight:900;border-bottom:2px solid #ce0b14;padding-bottom:8px;position:relative;z-index:1}
@media(max-width:850px){.gh-grid{grid-template-columns:1fr;gap:35px}.gh-heading{align-items:start;flex-direction:column;gap:15px}.gh-heading>p{max-width:600px}.gh-years{padding:5px 20px}}
@media(max-width:520px){.gavran-history{padding-block:55px}.gh-years strong{min-width:76px}.gh-years>div{gap:13px}.gh-location{padding:23px}}
''')
print('Uspješno zamijenjena samo sekcija Povijest kluba.')
PY
