#!/usr/bin/env bash
set -euo pipefail
if [ ! -f package.json ] || [ ! -d src ]; then echo 'Pokreni skriptu iz glavne Astro mape.'; exit 1; fi
mkdir -p src/components src/layouts src/pages/momcadi src/pages/vijesti src/data src/styles public/images
cat > src/data/site.ts <<'EOF'
export const club = {name:'NK Gavran 2003',city:'Lanište, Zagreb',address:'Lanište 9a, Zagreb',email:'',phone:'',hns:'https://semafor.hns.family/klubovi/120231/nk-gavran-2003/'};
export const teams = [
 {slug:'seniori',name:'Seniori',tag:'Prva momčad',desc:'Utakmice, rezultati i novosti seniorske momčadi.'},
 {slug:'juniori',name:'Juniori',tag:'Mladi',desc:'Informacije o juniorskoj kategoriji.'},
 {slug:'kadeti',name:'Kadeti',tag:'Mladi',desc:'Informacije o kadetskoj kategoriji.'},
 {slug:'pioniri',name:'Pioniri',tag:'Škola nogometa',desc:'Razvoj, treninzi i utakmice pionira.'},
 {slug:'mladi-pioniri',name:'Mlađi pioniri',tag:'Škola nogometa',desc:'Nogometni razvoj mlađih pionira.'},
 {slug:'limaci',name:'Limači',tag:'Škola nogometa',desc:'Prvi koraci u ekipnom nogometu.'},
 {slug:'zagici',name:'Zagići',tag:'Škola nogometa',desc:'Igra, prijateljstvo i ljubav prema nogometu.'}
];
export const articles = [
 {slug:'dobrodosli-na-novi-web',category:'KLUPSKE NOVOSTI',date:'NOVO',title:'Dobro došli na novi web NK Gavran 2003',excerpt:'Jedno mjesto za sve informacije o klubu, momčadima i školi nogometa.',image:'https://images.unsplash.com/photo-1574629810360-7efbbe195018?auto=format&fit=crop&w=1100&q=80'},
 {slug:'skola-nogometa',category:'ŠKOLA NOGOMETA',date:'INFO',title:'Nogomet za sve generacije',excerpt:'Saznajte više o programu škole nogometa i načinu prijave.',image:'https://images.unsplash.com/photo-1518091043644-c1d4457512c6?auto=format&fit=crop&w=1100&q=80'},
 {slug:'pratite-nas',category:'OBAVIJESTI',date:'INFO',title:'Pratite sve klupske informacije',excerpt:'Rasporedi, utakmice i obavijesti uskoro na jednom mjestu.',image:'https://images.unsplash.com/photo-1431324155629-1a6deb1dec8d?auto=format&fit=crop&w=1100&q=80'}
];
EOF
cat > src/styles/global.css <<'EOF'
@import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@500;600;700;800;900&family=DM+Sans:wght@400;500;600;700;800&display=swap');
:root{--navy:#091a35;--navy2:#11294d;--red:#dc2638;--gold:#f1c84b;--paper:#f5f7fa;--ink:#14243b;--muted:#66758a;--line:#e4eaf1}*{box-sizing:border-box}html{scroll-behavior:smooth}body{margin:0;font-family:'DM Sans',Arial,sans-serif;color:var(--ink);background:#fff}a{text-decoration:none;color:inherit}button,input,textarea{font:inherit}button{cursor:pointer}img{max-width:100%;display:block}.container{width:min(1180px,calc(100% - 40px));margin:auto}.eyebrow{color:var(--red);font-size:12px;font-weight:800;letter-spacing:2px;text-transform:uppercase}.section{padding:84px 0}.section.alt{background:var(--paper)}h1,h2,h3,h4{font-family:'Barlow Condensed',Impact,sans-serif;text-transform:uppercase;line-height:1.02;margin:0}h1{font-size:clamp(60px,9vw,124px);letter-spacing:-2px}h2{font-size:clamp(42px,5vw,68px)}h3{font-size:30px}p{line-height:1.7}.section-head{display:flex;align-items:end;justify-content:space-between;gap:24px;margin-bottom:30px}.section-head p{max-width:540px;color:var(--muted);margin:12px 0 0}.btn{display:inline-flex;align-items:center;justify-content:center;gap:12px;padding:15px 23px;font-size:13px;font-weight:800;text-transform:uppercase;letter-spacing:.6px;border:1px solid transparent;transition:.2s}.btn-red{background:var(--red);color:white}.btn-red:hover{background:#b8192b}.btn-white{background:white;color:var(--navy)}.btn-outline{color:white;border-color:#ffffff77;background:transparent}.btn-outline:hover{background:#ffffff20}.btn-dark{background:var(--navy);color:white}.arrow{font-size:18px}.header{position:sticky;top:0;z-index:50;background:#fff;box-shadow:0 1px 15px #00000010}.topline{height:5px;background:linear-gradient(90deg,var(--red) 0 38%,var(--gold) 38% 48%,var(--navy) 48%)}.nav-inner{min-height:84px;display:flex;align-items:center;gap:32px}.brand{display:flex;align-items:center;gap:13px;min-width:205px}.crest{width:53px;height:62px;display:grid;place-items:center;background:#fff;border:4px solid #f3c800;clip-path:polygon(50% 0,95% 14%,92% 70%,50% 100%,8% 70%,5% 14%);color:#fff;font:900 12px 'Barlow Condensed';text-align:center}.crest span{background:var(--navy);width:100%;padding:7px 1px}.brand strong{font-family:'Barlow Condensed';font-size:25px;line-height:1;display:block}.brand small{color:var(--muted);font-size:10px;letter-spacing:1.5px;font-weight:800}.nav-links{display:flex;align-items:center;gap:23px;margin-left:auto}.nav-links a{font-size:12px;font-weight:800;text-transform:uppercase;white-space:nowrap}.nav-links a:hover{color:var(--red)}.nav-toggle{display:none;background:none;border:0;font-size:26px;margin-left:auto}.hero{background:var(--navy);color:white;position:relative;min-height:660px;display:flex;align-items:center;overflow:hidden}.hero:before{content:'';position:absolute;inset:0;background:linear-gradient(90deg,#08162f 0%,#08162feb 34%,#08162f78 72%,#08162f70),url('https://images.unsplash.com/photo-1522778119026-d647f0596c20?auto=format&fit=crop&w=2000&q=85') center/cover}.hero:after{content:'';position:absolute;bottom:0;left:0;width:100%;height:6px;background:var(--red)}.hero-content{position:relative;padding:95px 0;max-width:850px}.hero h1 em{color:var(--gold);font-style:normal}.hero p{max-width:540px;color:#d2d9e5;font-size:17px}.hero-actions{display:flex;gap:12px;flex-wrap:wrap;margin-top:32px}.hero-tag{display:inline-block;border-left:3px solid var(--red);padding-left:12px;color:#f3d877;font-weight:800;font-size:12px;letter-spacing:2px;margin-bottom:25px}.match-strip{background:var(--navy2);color:#fff}.match-grid{display:grid;grid-template-columns:1fr 1fr}.match-block{padding:26px 34px;border-right:1px solid #ffffff20}.match-block:first-child{border-left:1px solid #ffffff20}.match-label{font-size:11px;letter-spacing:1.4px;color:#afc0d9;font-weight:800;text-transform:uppercase}.match-value{font:800 25px 'Barlow Condensed';margin:7px 0}.match-note{color:#afc0d9;font-size:12px}.cards-3{display:grid;grid-template-columns:repeat(3,1fr);gap:22px}.card{background:#fff;border:1px solid var(--line);overflow:hidden;transition:.2s}.card:hover{transform:translateY(-3px);box-shadow:0 16px 35px #0a234016}.card-body{padding:26px}.card p{color:var(--muted);font-size:14px}.card-image{height:200px;width:100%;object-fit:cover}.text-link{color:var(--red);font-weight:800;font-size:12px;text-transform:uppercase;letter-spacing:.6px}.team-card{padding:28px;position:relative;min-height:215px;background:#fff;border:1px solid var(--line);display:flex;flex-direction:column;justify-content:space-between}.team-card:before{content:'';position:absolute;top:0;left:0;height:4px;width:60px;background:var(--red)}.team-card:hover{background:var(--navy);color:white}.team-card p{color:var(--muted);font-size:13px}.team-card:hover p{color:#c6d3e4}.teams-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:15px}.split{display:grid;grid-template-columns:1fr 1fr;gap:55px;align-items:center}.split-image{width:100%;height:470px;object-fit:cover}.check-list{padding:0;list-style:none}.check-list li{padding:11px 0;border-bottom:1px solid var(--line)}.check-list li:before{content:'✓';color:var(--red);font-weight:900;margin-right:13px}.cta{background:var(--red);color:white;padding:65px 0}.cta-inner{display:flex;align-items:center;justify-content:space-between;gap:25px}.cta p{color:#ffe0e3}.page-hero{background:linear-gradient(110deg,#091a35,#1b3b69);color:#fff;padding:85px 0}.page-hero h1{font-size:clamp(55px,8vw,95px)}.page-hero p{color:#d2ddeb;max-width:660px}.content-box{padding:28px;background:#fff;border:1px solid var(--line)}.info-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:20px}.info-grid .content-box h3{font-size:27px}.iframe-wrap{overflow:hidden;border:1px solid var(--line);background:#fff}.iframe-wrap iframe{width:100%;height:850px;border:0}.note{padding:16px 20px;background:#f1f4f8;border-left:3px solid var(--red);font-size:13px;color:#56667b}.footer{background:#07172e;color:#fff;padding:70px 0 25px}.footer-grid{display:grid;grid-template-columns:2fr 1fr 1fr;gap:65px}.footer p,.footer a{color:#b5c3d5;font-size:13px}.footer a{display:block;margin:11px 0}.footer h4{font-size:21px;margin-bottom:17px}.footer-bottom{border-top:1px solid #ffffff20;margin-top:50px;padding-top:20px;font-size:12px;color:#91a5bd;display:flex;justify-content:space-between}.article-body{max-width:760px}.article-body p{font-size:17px;color:#526176}.contact-form{display:grid;gap:12px}.contact-form input,.contact-form textarea{width:100%;border:1px solid var(--line);padding:14px;background:#fff}.contact-form textarea{min-height:135px}.contact-form button{border:0}.contact-form small{color:var(--muted)}@media(max-width:1000px){.nav-toggle{display:block}.nav-links{display:none;position:absolute;top:89px;left:0;right:0;background:white;padding:25px;box-shadow:0 15px 20px #0002;flex-direction:column;align-items:flex-start;gap:18px}.nav-links.open{display:flex}.nav-inner>.btn{display:none}.teams-grid{grid-template-columns:repeat(2,1fr)}}@media(max-width:720px){.container{width:min(100% - 30px,1180px)}.section{padding:58px 0}.hero{min-height:590px}.hero-content{padding:75px 0}.hero h1{font-size:clamp(56px,13vw,80px)}.match-grid,.split,.info-grid,.footer-grid,.cards-3{grid-template-columns:1fr}.match-block{border-bottom:1px solid #ffffff20}.teams-grid{grid-template-columns:repeat(2,1fr)}.section-head,.cta-inner{align-items:flex-start;flex-direction:column}.split-image{height:310px}.footer-grid{gap:25px}.footer-bottom{flex-direction:column;gap:10px}.iframe-wrap iframe{height:700px}.brand{min-width:0}}
EOF
cat > src/components/Header.astro <<'EOF'
---
const nav=[['Naslovnica','/'],['Klub','/klub'],['Momčadi','/momcadi'],['Utakmice','/utakmice'],['Škola nogometa','/skola-nogometa'],['Vijesti','/vijesti'],['Roditelji','/roditelji']];
---
<header class="header"><div class="topline"></div><div class="container nav-inner"><a class="brand" href="/" aria-label="NK Gavran 2003 početna"><div class="crest"><span>NK<br/>GAVRAN</span></div><div><strong>NK GAVRAN 2003</strong><small>LANIŠTE · ZAGREB</small></div></a><button class="nav-toggle" id="menu-toggle" aria-label="Otvori izbornik" aria-expanded="false" aria-controls="main-menu">☰</button><nav class="nav-links" id="main-menu" aria-label="Glavna navigacija">{nav.map(([label,href])=><a href={href}>{label}</a>)}</nav><a class="btn btn-red" href="/kontakt">KONTAKT <span class="arrow">↗</span></a></div></header>
<script>const toggle=document.querySelector<HTMLButtonElement>('#menu-toggle');const menu=document.querySelector('#main-menu');toggle?.addEventListener('click',()=>{const open=menu?.classList.toggle('open')??false;toggle.setAttribute('aria-expanded',String(open));});</script>
EOF
cat > src/components/Hero.astro <<'EOF'
<section class="hero"><div class="container"><div class="hero-content"><div class="hero-tag">LANIŠTE · ZAGREB · NK GAVRAN 2003</div><h1>JEDAN KLUB.<br/>JEDNA <em>OBITELJ.</em><br/>JEDNA STRAST.</h1><p>Mjesto gdje se gradi ljubav prema nogometu. Od prvih koraka na terenu do seniorske momčadi – zajedno rastemo, treniramo i navijamo.</p><div class="hero-actions"><a class="btn btn-red" href="/skola-nogometa">NAŠA ŠKOLA NOGOMETA <span class="arrow">↗</span></a><a class="btn btn-outline" href="/momcadi">UPOZNAJ MOMČADI <span class="arrow">→</span></a></div></div></div></section>
EOF
cat > src/components/MatchCenter.astro <<'EOF'
<section class="match-strip" aria-label="Utakmice"><div class="container match-grid"><div class="match-block"><div class="match-label">POSLJEDNJA UTAKMICA</div><div class="match-value">Rezultat na HNS Semaforu</div><div class="match-note">Provjerite najnovije službene podatke</div></div><div class="match-block"><div class="match-label">SLJEDEĆA UTAKMICA</div><div class="match-value">Raspored na HNS Semaforu</div><div class="match-note"><a href="/utakmice" style="color:#f1c84b">OTVORI RASPORED ↗</a></div></div></div></section>
EOF
cat > src/components/Teams.astro <<'EOF'
---
import {teams} from '../data/site';
---
<section class="section alt" id="momcadi"><div class="container"><div class="section-head"><div><div class="eyebrow">NAŠE MOMČADI</div><h2>SVAKA GENERACIJA.<br/>ISTI GRB.</h2><p>Pronađite informacije o momčadima i kategorijama. Popis uzrasta je početni predložak i prilagodit ćemo ga stvarnoj strukturi kluba.</p></div><a class="text-link" href="/momcadi">SVE MOMČADI ↗</a></div><div class="teams-grid">{teams.map((team)=><a href={`/momcadi/${team.slug}`} class="team-card"><div><div class="eyebrow">{team.tag}</div><h3 style="margin-top:12px">{team.name}</h3><p>{team.desc}</p></div><span class="text-link">SAZNAJ VIŠE ↗</span></a>)}</div></div></section>
EOF
cat > src/components/News.astro <<'EOF'
---
import {articles} from '../data/site';
---
<section class="section"><div class="container"><div class="section-head"><div><div class="eyebrow">AKTUALNO IZ KLUBA</div><h2>VIJESTI I OBAVIJESTI</h2><p>Sve važne informacije na jednom mjestu.</p></div><a class="text-link" href="/vijesti">SVE VIJESTI ↗</a></div><div class="cards-3">{articles.map((article)=><a class="card" href={`/vijesti/${article.slug}`}><img class="card-image" src={article.image} alt="Nogometna fotografija – ilustracija" loading="lazy"/><div class="card-body"><div class="eyebrow">{article.category} · {article.date}</div><h3 style="margin-top:12px">{article.title}</h3><p>{article.excerpt}</p><span class="text-link">PROČITAJ VIŠE ↗</span></div></a>)}</div></div></section>
EOF
cat > src/components/Footer.astro <<'EOF'
---
import {club} from '../data/site';
---
<footer class="footer"><div class="container"><div class="footer-grid"><div><div class="brand"><div class="crest"><span>NK<br/>GAVRAN</span></div><div><strong>NK GAVRAN 2003</strong><small>LANIŠTE · ZAGREB</small></div></div><p>Nogomet, zajedništvo i razvoj mladih generacija. Dobro došli u našu klupsku obitelj.</p><p>{club.address}</p></div><div><h4>ISTRAŽI</h4><a href="/klub">O klubu</a><a href="/momcadi">Momčadi</a><a href="/utakmice">Utakmice i rezultati</a><a href="/vijesti">Vijesti</a></div><div><h4>INFORMACIJE</h4><a href="/skola-nogometa">Škola nogometa</a><a href="/roditelji">Kutak za roditelje</a><a href="/kontakt">Kontakt</a><a href={club.hns} target="_blank" rel="noopener noreferrer">HNS Semafor ↗</a></div></div><div class="footer-bottom"><span>© {new Date().getFullYear()} NK Gavran 2003. Sva prava pridržana.</span><span>Web u izradi · Sadržaj se ažurira</span></div></div></footer>
EOF
cat > src/layouts/MainLayout.astro <<'EOF'
---
import Header from '../components/Header.astro';
import Footer from '../components/Footer.astro';
import '../styles/global.css';
const {title='NK Gavran 2003 | Nogometni klub Lanište, Zagreb',description='NK Gavran 2003 – nogometni klub s Laništa. Momčadi, škola nogometa, utakmice, vijesti i informacije za roditelje.'}=Astro.props;
---
<!doctype html><html lang="hr"><head><meta charset="UTF-8"/><meta name="viewport" content="width=device-width,initial-scale=1"/><meta name="description" content={description}/><meta name="theme-color" content="#091a35"/><title>{title}</title></head><body><Header/><main><slot/></main><Footer/></body></html>
EOF
cat > src/pages/index.astro <<'EOF'
---
import MainLayout from '../layouts/MainLayout.astro';
import Hero from '../components/Hero.astro';
import MatchCenter from '../components/MatchCenter.astro';
import Teams from '../components/Teams.astro';
import News from '../components/News.astro';
---
<MainLayout><Hero/><MatchCenter/><section class="section"><div class="container split"><div><div class="eyebrow">DOBRO DOŠLI U NK GAVRAN 2003</div><h2>VIŠE OD<br/>NOGOMETA.</h2><p>Na Laništu nogomet povezuje generacije. Naš cilj je graditi okruženje u kojem djeca i mladi razvijaju sportske vještine, prijateljstva i timski duh.</p><p>Ovdje ćete pronaći sve važne klupske informacije, od vijesti i momčadi do rasporeda utakmica.</p><a class="btn btn-dark" href="/klub">UPOZNAJ KLUB ↗</a></div><img class="split-image" src="https://images.unsplash.com/photo-1574629810360-7efbbe195018?auto=format&fit=crop&w=1200&q=85" alt="Nogometni teren – ilustrativna fotografija" loading="lazy"/></div></section><Teams/><section class="section"><div class="container split"><img class="split-image" src="https://images.unsplash.com/photo-1518091043644-c1d4457512c6?auto=format&fit=crop&w=1200&q=85" alt="Nogometni trening – ilustrativna fotografija" loading="lazy"/><div><div class="eyebrow">ZA NAJMLAĐE</div><h2>VELIKI SNOVI<br/>POČINJU MALI.</h2><p>Škola nogometa mjesto je za učenje, druženje i stvaranje ljubavi prema sportu. Informacije o upisima i treninzima pronađite na posebnoj stranici.</p><ul class="check-list"><li>Razvoj sportskih vještina</li><li>Prijateljstvo i timski duh</li><li>Informacije za roditelje</li></ul><a class="btn btn-red" href="/skola-nogometa">ISTRAŽI ŠKOLU NOGOMETA ↗</a></div></div></section><News/><section class="cta"><div class="container cta-inner"><div><div style="font-size:12px;font-weight:800;letter-spacing:2px">POSTANI DIO EKIPE</div><h2 style="margin-top:8px">TVOJE MJESTO JE NA TERENU.</h2><p>Zanima te nogomet? Javi nam se i saznaj više o mogućnostima upisa.</p></div><a class="btn btn-white" href="/kontakt">KONTAKTIRAJ NAS ↗</a></div></section></MainLayout>
EOF
cat > src/pages/momcadi/index.astro <<'EOF'
---
import MainLayout from '../../layouts/MainLayout.astro';
import {teams} from '../../data/site';
---
<MainLayout title="Momčadi | NK Gavran 2003"><section class="page-hero"><div class="container"><div class="eyebrow">NK GAVRAN 2003</div><h1>NAŠE MOMČADI</h1><p>Od škole nogometa do seniorske momčadi. Odaberite uzrast za više informacija.</p></div></section><section class="section alt"><div class="container"><p class="note">Kategorije su zasad predložak. Potvrdit ćemo koje uzraste klub ima u aktualnoj sezoni.</p><div class="teams-grid" style="margin-top:25px">{teams.map(team=><a class="team-card" href={`/momcadi/${team.slug}`}><div><div class="eyebrow">{team.tag}</div><h3 style="margin-top:12px">{team.name}</h3><p>{team.desc}</p></div><span class="text-link">OTVORI MOMČAD ↗</span></a>)}</div></div></section></MainLayout>
EOF
cat > 'src/pages/momcadi/[slug].astro' <<'EOF'
---
import MainLayout from '../../layouts/MainLayout.astro';
import {teams,club} from '../../data/site';
export function getStaticPaths(){return teams.map(team=>({params:{slug:team.slug},props:{team}}));}
const {team}=Astro.props;
---
<MainLayout title={`${team.name} | NK Gavran 2003`}><section class="page-hero"><div class="container"><div class="eyebrow">{team.tag}</div><h1>{team.name}</h1><p>{team.desc}</p></div></section><section class="section"><div class="container"><div class="info-grid"><div class="content-box"><div class="eyebrow">TRENER</div><h3 style="margin-top:12px">Uskoro</h3><p>Podaci o stručnom stožeru nakon potvrde kluba.</p></div><div class="content-box"><div class="eyebrow">TRENINZI</div><h3 style="margin-top:12px">Raspored uskoro</h3><p>Termini i lokacije treninga bit će objavljeni ovdje.</p></div><div class="content-box"><div class="eyebrow">UTAKMICE</div><h3 style="margin-top:12px">HNS Semafor</h3><p>Provjerite službeni raspored i rezultate.</p><a class="text-link" href={club.hns} target="_blank" rel="noopener noreferrer">OTVORI HNS ↗</a></div></div><div style="margin-top:45px"><h2>INFORMACIJE ZA MOMČAD</h2><p>Ovdje ćemo naknadno dodati potvrđene informacije, vijesti i fotografije kategorije {team.name.toLowerCase()}.</p><a class="btn btn-dark" href="/roditelji">KUTAK ZA RODITELJE ↗</a></div></div></section></MainLayout>
EOF
cat > src/pages/utakmice.astro <<'EOF'
---
import MainLayout from '../layouts/MainLayout.astro';
import {club} from '../data/site';
---
<MainLayout title="Utakmice i rezultati | NK Gavran 2003"><section class="page-hero"><div class="container"><div class="eyebrow">NATJECANJA</div><h1>UTAKMICE I REZULTATI</h1><p>Raspored, rezultati i ljestvice putem HNS Semafora.</p></div></section><section class="section alt"><div class="container"><div class="section-head"><div><div class="eyebrow">SLUŽBENI PODACI</div><h2>HNS SEMAFOR</h2><p>U ugrađenom prikazu odaberite sezonu, uzrast i natjecanje ako su dostupni.</p></div><a class="btn btn-dark" href={club.hns} target="_blank" rel="noopener noreferrer">OTVORI NA HNS-U ↗</a></div><p class="note">Privremeni testni iframe. Ugrađivanje i funkcionalnost filtara treba dodatno provjeriti te potvrditi uvjete korištenja HNS-a. Ako filter ne radi, otvorite službenu stranicu gumbom iznad.</p><div class="iframe-wrap" style="margin-top:22px"><iframe src={club.hns} title="HNS Semafor – NK Gavran 2003" loading="lazy" referrerpolicy="strict-origin-when-cross-origin"></iframe></div></div></section></MainLayout>
EOF
cat > src/pages/skola-nogometa.astro <<'EOF'
---
import MainLayout from '../layouts/MainLayout.astro';
---
<MainLayout title="Škola nogometa | NK Gavran 2003"><section class="page-hero"><div class="container"><div class="eyebrow">ZA BUDUĆE NOGOMETAŠE</div><h1>ŠKOLA NOGOMETA</h1><p>Prvi dodir s loptom, novi prijatelji i sportske vrijednosti.</p></div></section><section class="section"><div class="container split"><div><div class="eyebrow">RASTEMO ZAJEDNO</div><h2>SVAKI VELIKI IGRAČ<br/>NEGDJE JE POČEO.</h2><p>Ovdje ćemo predstaviti klupski program, trenere i način rada s mlađim uzrastima.</p><ul class="check-list"><li>Informacije o uzrastima</li><li>Termini i lokacije treninga</li><li>Postupak prijave i kontakt</li></ul><a class="btn btn-red" href="/kontakt">RASPITAJ SE ZA UPIS ↗</a></div><img class="split-image" src="https://images.unsplash.com/photo-1518091043644-c1d4457512c6?auto=format&fit=crop&w=1200&q=85" alt="Nogometni trening – ilustracija"/></div></section></MainLayout>
EOF
cat > src/pages/roditelji.astro <<'EOF'
---
import MainLayout from '../layouts/MainLayout.astro';
---
<MainLayout title="Kutak za roditelje | NK Gavran 2003"><section class="page-hero"><div class="container"><div class="eyebrow">INFORMACIJE NA JEDNOM MJESTU</div><h1>KUTAK ZA RODITELJE</h1><p>Sve što vam treba za lakše praćenje treninga, utakmica i klupskih obavijesti.</p></div></section><section class="section alt"><div class="container info-grid"><div class="content-box"><div class="eyebrow">01 / TRENINZI</div><h3>Termini treninga</h3><p>Rasporedi po uzrastima bit će objavljeni nakon potvrde s trenerima.</p><a class="text-link" href="/momcadi">ODABERI UZRAST ↗</a></div><div class="content-box"><div class="eyebrow">02 / UTAKMICE</div><h3>Raspored utakmica</h3><p>Provjerite natjecanja i službene rasporede.</p><a class="text-link" href="/utakmice">OTVORI RASPORED ↗</a></div><div class="content-box"><div class="eyebrow">03 / KONTAKT</div><h3>Pitanja i obavijesti</h3><p>Za pitanja o upisu i organizaciji javite se klubu.</p><a class="text-link" href="/kontakt">KONTAKT ↗</a></div></div></section></MainLayout>
EOF
cat > src/pages/klub.astro <<'EOF'
---
import MainLayout from '../layouts/MainLayout.astro';
import {club} from '../data/site';
---
<MainLayout title="O klubu | NK Gavran 2003"><section class="page-hero"><div class="container"><div class="eyebrow">NAŠ KLUB</div><h1>NK GAVRAN 2003</h1><p>Nogometni klub s Laništa, Zagreb.</p></div></section><section class="section"><div class="container split"><div><div class="eyebrow">ZAJEDNO NA TERENU</div><h2>KLUB KOJI<br/>POVEZUJE.</h2><p>NK Gavran 2003 okuplja ljubitelje nogometa na Laništu. Ovdje ćemo uskoro dodati službenu povijest kluba, postignuća i predstavljanje ljudi koji stoje iza njegovog rada.</p><p><strong>Lokacija:</strong> {club.address}</p><a class="btn btn-dark" href="/kontakt">KONTAKTIRAJ KLUB ↗</a></div><img class="split-image" src="https://images.unsplash.com/photo-1431324155629-1a6deb1dec8d?auto=format&fit=crop&w=1200&q=85" alt="Nogometni teren – ilustracija"/></div></section></MainLayout>
EOF
cat > src/pages/vijesti/index.astro <<'EOF'
---
import MainLayout from '../../layouts/MainLayout.astro';
import {articles} from '../../data/site';
---
<MainLayout title="Vijesti | NK Gavran 2003"><section class="page-hero"><div class="container"><div class="eyebrow">KLUPSKE INFORMACIJE</div><h1>VIJESTI</h1><p>Novosti, najave i informacije iz NK Gavran 2003.</p></div></section><section class="section alt"><div class="container cards-3">{articles.map(a=><a class="card" href={`/vijesti/${a.slug}`}><img class="card-image" src={a.image} alt="Nogometna ilustracija"/><div class="card-body"><div class="eyebrow">{a.category}</div><h3 style="margin-top:12px">{a.title}</h3><p>{a.excerpt}</p><span class="text-link">PROČITAJ ↗</span></div></a>)}</div></section></MainLayout>
EOF
cat > 'src/pages/vijesti/[slug].astro' <<'EOF'
---
import MainLayout from '../../layouts/MainLayout.astro';
import {articles} from '../../data/site';
export function getStaticPaths(){return articles.map(article=>({params:{slug:article.slug},props:{article}}));}
const {article}=Astro.props;
---
<MainLayout title={`${article.title} | NK Gavran 2003`} description={article.excerpt}><section class="page-hero"><div class="container"><div class="eyebrow">{article.category}</div><h1>{article.title}</h1><p>{article.excerpt}</p></div></section><section class="section"><div class="container article-body"><img src={article.image} alt="Nogometna ilustracija" style="width:100%;max-height:450px;object-fit:cover"/><p>{article.excerpt}</p><p>Ovo je početni sadržaj. Uskoro ćemo dodati potvrđene klupske informacije i fotografije.</p><a class="btn btn-dark" href="/vijesti">← SVE VIJESTI</a></div></section></MainLayout>
EOF
cat > src/pages/kontakt.astro <<'EOF'
---
import MainLayout from '../layouts/MainLayout.astro';
import {club} from '../data/site';
---
<MainLayout title="Kontakt | NK Gavran 2003"><section class="page-hero"><div class="container"><div class="eyebrow">JAVITE NAM SE</div><h1>KONTAKT</h1><p>Imate pitanje o klubu, momčadima ili upisima u školu nogometa?</p></div></section><section class="section alt"><div class="container split"><div><div class="eyebrow">NK GAVRAN 2003</div><h2>OSTANIMO<br/>U KONTAKTU.</h2><p><strong>Adresa:</strong> {club.address}</p><p>Kontaktni e-mail i telefon dodat ćemo nakon službene potvrde kluba.</p><p class="note">Kontakt obrazac još nije aktiviran. Prije objave povezat ćemo ga s e-mail uslugom, zaštitom od spama i pravilima privatnosti.</p></div><div class="content-box"><h3>POŠALJITE UPIT</h3><form class="contact-form" onsubmit="event.preventDefault();alert('Obrazac još nije aktiviran.');"><label>Ime i prezime<input type="text" placeholder="Vaše ime" required/></label><label>E-mail<input type="email" placeholder="ime@primjer.hr" required/></label><label>Poruka<textarea placeholder="Kako vam možemo pomoći?" required></textarea></label><button class="btn btn-red" type="submit">POŠALJI UPIT ↗</button><small>Demonstracijski obrazac – poruke se još ne šalju.</small></form></div></div></section></MainLayout>
EOF
cat > public/robots.txt <<'EOF'
User-agent: *
Disallow:
EOF
printf '\nProjekt NK Gavran 2003 je instaliran. Pokreni: npm run dev -- --host 0.0.0.0\n'
