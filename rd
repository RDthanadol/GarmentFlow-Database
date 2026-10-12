<!doctype html>
<html lang="th">
<head>
<meta charset="utf-8">
<title>GarmentFlow PMS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+Thai:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;500;600&display=swap">
<style>
/* ================= TOKENS ================= */
:root{
  --bg:#f2f3f0; --surface:#fcfcfb; --surface2:#f5f5f2; --surface3:#eeeeea;
  --ink:#15171e; --ink2:#565962; --ink3:#8b8d94;
  --line:#e3e3de; --line2:#d2d2cc;
  --accent:#3450a8; --accent-strong:#2a4290; --accent-ink:#ffffff; --accent-soft:#e8ecf8; --accent-soft2:#dbe2f4;
  --good:#0ca30c; --good-text:#006300; --warn:#fab219; --warn-text:#8a5d00;
  --serious:#ec835a; --serious-text:#a34518; --critical:#d03b3b; --critical-text:#b02a2a;
  --s1:#2a78d6; --s2:#eb6834; --s3:#1baf7a; --s4:#eda100; --s5:#e87ba4; --s6:#008300; --s7:#4a3aa7; --s8:#e34948;
  --grid:#e1e0d9; --axis:#c3c2b7;
  --shadow:0 1px 2px rgba(21,23,30,.06),0 4px 14px rgba(21,23,30,.07);
  --shadow-lg:0 6px 32px rgba(21,23,30,.18);
  --chip-critical-bg:#fbe7e7; --chip-warn-bg:#fdf3d9; --chip-good-bg:#e2f3e2; --chip-serious-bg:#fceee7; --chip-info-bg:#e8ecf8;
  color-scheme:light;
}
@media (prefers-color-scheme: dark){
  :root:not([data-theme="light"]){
    --bg:#121316; --surface:#1c1d21; --surface2:#212226; --surface3:#28292e;
    --ink:#f0f1f3; --ink2:#b4b6bd; --ink3:#82848b;
    --line:#2c2d32; --line2:#3b3c42;
    --accent:#8ba3ec; --accent-strong:#a3b6f1; --accent-ink:#10131f; --accent-soft:#252b40; --accent-soft2:#2e3650;
    --good:#0ca30c; --good-text:#4cc44c; --warn:#fab219; --warn-text:#fab219;
    --serious:#ec835a; --serious-text:#ec835a; --critical:#d03b3b; --critical-text:#ef7373;
    --s1:#3987e5; --s2:#d95926; --s3:#199e70; --s4:#c98500; --s5:#d55181; --s6:#008300; --s7:#9085e9; --s8:#e66767;
    --grid:#2c2c2a; --axis:#383835;
    --shadow:0 1px 2px rgba(0,0,0,.4),0 4px 14px rgba(0,0,0,.35);
    --shadow-lg:0 8px 40px rgba(0,0,0,.55);
    --chip-critical-bg:#3a2224; --chip-warn-bg:#37301c; --chip-good-bg:#1e3120; --chip-serious-bg:#382822; --chip-info-bg:#252b40;
    color-scheme:dark;
  }
}
:root[data-theme="dark"]{
  --bg:#121316; --surface:#1c1d21; --surface2:#212226; --surface3:#28292e;
  --ink:#f0f1f3; --ink2:#b4b6bd; --ink3:#82848b;
  --line:#2c2d32; --line2:#3b3c42;
  --accent:#8ba3ec; --accent-strong:#a3b6f1; --accent-ink:#10131f; --accent-soft:#252b40; --accent-soft2:#2e3650;
  --good:#0ca30c; --good-text:#4cc44c; --warn:#fab219; --warn-text:#fab219;
  --serious:#ec835a; --serious-text:#ec835a; --critical:#d03b3b; --critical-text:#ef7373;
  --s1:#3987e5; --s2:#d95926; --s3:#199e70; --s4:#c98500; --s5:#d55181; --s6:#008300; --s7:#9085e9; --s8:#e66767;
  --grid:#2c2c2a; --axis:#383835;
  --shadow:0 1px 2px rgba(0,0,0,.4),0 4px 14px rgba(0,0,0,.35);
  --shadow-lg:0 8px 40px rgba(0,0,0,.55);
  --chip-critical-bg:#3a2224; --chip-warn-bg:#37301c; --chip-good-bg:#1e3120; --chip-serious-bg:#382822; --chip-info-bg:#252b40;
  color-scheme:dark;
}

/* ================= BASE ================= */
*{box-sizing:border-box}
html,body{margin:0;padding:0}
body{
  background:var(--bg); color:var(--ink);
  font-family:"IBM Plex Sans Thai","Segoe UI","Leelawadee UI",system-ui,sans-serif;
  font-size:13.5px; line-height:1.5;
  overflow:hidden; height:100vh;
}
.mono{font-family:"IBM Plex Mono","Consolas",monospace}
.num{font-variant-numeric:tabular-nums}
button{font:inherit;color:inherit;background:none;border:none;cursor:pointer;padding:0}
input,select,textarea{
  font:inherit;color:var(--ink);background:var(--surface);
  border:1px solid var(--line2);border-radius:6px;padding:6px 9px;
}
input:focus,select:focus,textarea:focus,button:focus-visible{outline:2px solid var(--accent);outline-offset:1px}
input::placeholder{color:var(--ink3)}
h1,h2,h3{margin:0;text-wrap:balance}
::-webkit-scrollbar{width:10px;height:10px}
::-webkit-scrollbar-thumb{background:var(--line2);border-radius:6px;border:2px solid var(--bg)}
::-webkit-scrollbar-track{background:transparent}

/* ================= APP FRAME ================= */
#app{display:grid;grid-template-columns:216px 1fr;grid-template-rows:52px 1fr;height:100vh}
#sidebar{grid-row:1/3;background:var(--surface);border-right:1px solid var(--line);display:flex;flex-direction:column;overflow-y:auto}
#topbar{background:var(--surface);border-bottom:1px solid var(--line);display:flex;align-items:center;gap:12px;padding:0 18px;position:relative;z-index:40}
#main{overflow:hidden;position:relative}
.page{position:absolute;inset:0;overflow-y:auto;padding:20px 24px;display:none}
.page.active{display:block}
#page-board.page{display:none;padding:0;overflow:hidden}
#page-board.page.active{display:flex;flex-direction:column}

/* ---------- Sidebar ---------- */
.brand{display:flex;align-items:center;gap:10px;padding:14px 16px 12px;border-bottom:1px solid var(--line)}
.brand-mark{width:30px;height:30px;border-radius:7px;background:var(--accent);color:var(--accent-ink);display:grid;place-items:center;font-weight:700;font-size:14px;letter-spacing:-.5px}
.brand-name{font-weight:700;font-size:14.5px;line-height:1.15}
.brand-sub{font-size:10.5px;color:var(--ink3);letter-spacing:.4px;text-transform:uppercase}
.nav{padding:10px 8px;display:flex;flex-direction:column;gap:2px}
.nav-label{font-size:10.5px;letter-spacing:.8px;text-transform:uppercase;color:var(--ink3);padding:10px 10px 4px;font-weight:600}
.nav-item{display:flex;align-items:center;gap:9px;padding:7px 10px;border-radius:7px;color:var(--ink2);font-weight:500;text-align:left;width:100%}
.nav-item svg{flex:none;opacity:.75}
.nav-item:hover{background:var(--surface2);color:var(--ink)}
.nav-item.active{background:var(--accent-soft);color:var(--accent);font-weight:600}
.nav-item.active svg{opacity:1}
.nav-badge{margin-left:auto;background:var(--critical);color:#fff;font-size:10.5px;font-weight:600;border-radius:99px;padding:0 6px;min-width:17px;text-align:center;line-height:16px}
.sidebar-foot{margin-top:auto;padding:12px 16px;border-top:1px solid var(--line);font-size:11px;color:var(--ink3)}
#sync-chip{display:inline-flex;align-items:center;gap:6px;font-size:11px;color:var(--ink2)}
#sync-chip .dot{width:7px;height:7px;border-radius:50%;background:var(--good)}
#sync-chip.saving .dot{background:var(--warn)}
#sync-chip.local .dot{background:var(--ink3)}
#sync-chip.error .dot{background:var(--critical)}

/* ---------- Topbar ---------- */
#page-title{font-size:15px;font-weight:700}
.top-search{position:relative;flex:0 1 420px;margin-left:8px}
.top-search input{width:100%;padding-left:32px;background:var(--surface2);border-color:var(--line)}
.top-search .search-ic{position:absolute;left:9px;top:50%;transform:translateY(-50%);color:var(--ink3);pointer-events:none}
#search-results{position:absolute;top:calc(100% + 6px);left:0;right:0;background:var(--surface);border:1px solid var(--line2);border-radius:9px;box-shadow:var(--shadow-lg);max-height:420px;overflow-y:auto;display:none;z-index:100}
#search-results.open{display:block}
.sr-item{display:flex;align-items:center;gap:10px;padding:8px 12px;cursor:pointer;border-bottom:1px solid var(--line)}
.sr-item:last-child{border-bottom:none}
.sr-item:hover,.sr-item.sel{background:var(--surface2)}
.sr-jobno{font-weight:600;min-width:64px}
.sr-meta{color:var(--ink3);font-size:12px;margin-left:auto;white-space:nowrap}
.top-right{margin-left:auto;display:flex;align-items:center;gap:10px}
#user-select{max-width:190px;background:var(--surface2);border-color:var(--line);font-weight:500}
.icon-btn{width:32px;height:32px;border-radius:7px;display:grid;place-items:center;color:var(--ink2);position:relative}
.icon-btn:hover{background:var(--surface2);color:var(--ink)}
.icon-btn .bub{position:absolute;top:2px;right:2px;background:var(--critical);color:#fff;font-size:9.5px;font-weight:700;border-radius:99px;min-width:15px;line-height:15px;text-align:center;padding:0 3px}

/* ---------- Buttons / chips ---------- */
.btn{display:inline-flex;align-items:center;gap:7px;padding:7px 13px;border-radius:7px;font-weight:600;font-size:13px;border:1px solid var(--line2);background:var(--surface);color:var(--ink)}
.btn:hover{background:var(--surface2)}
.btn.primary{background:var(--accent);border-color:var(--accent);color:var(--accent-ink)}
.btn.primary:hover{background:var(--accent-strong);border-color:var(--accent-strong)}
.btn.danger{color:var(--critical-text);border-color:var(--critical)}
.btn.sm{padding:4px 9px;font-size:12px}
.btn.ghost{border-color:transparent;background:transparent;color:var(--ink2)}
.btn.ghost:hover{background:var(--surface2);color:var(--ink)}
.chip{display:inline-flex;align-items:center;gap:5px;font-size:11px;font-weight:600;border-radius:99px;padding:1.5px 8px;line-height:1.5;white-space:nowrap}
.chip.critical{background:var(--chip-critical-bg);color:var(--critical-text)}
.chip.warn{background:var(--chip-warn-bg);color:var(--warn-text)}
.chip.good{background:var(--chip-good-bg);color:var(--good-text)}
.chip.serious{background:var(--chip-serious-bg);color:var(--serious-text)}
.chip.info{background:var(--chip-info-bg);color:var(--accent)}
.chip.neutral{background:var(--surface3);color:var(--ink2)}

/* ---------- Board toolbar ---------- */
.board-toolbar{display:flex;align-items:center;gap:8px;flex-wrap:wrap;padding:12px 18px;background:var(--surface);border-bottom:1px solid var(--line)}
.board-toolbar input,.board-toolbar select{font-size:12.5px;padding:5.5px 8px}
.board-toolbar input{width:130px}
.board-toolbar select{max-width:150px;color:var(--ink2)}
.board-toolbar select.has-value,.board-toolbar input.has-value{border-color:var(--accent);color:var(--ink);background:var(--accent-soft)}
.tb-sep{width:1px;height:22px;background:var(--line2);margin:0 2px}
.tb-count{font-size:12px;color:var(--ink3);margin-left:4px;white-space:nowrap}

/* ---------- Kanban ---------- */
#kanban{flex:1;display:flex;gap:10px;overflow-x:auto;overflow-y:hidden;padding:14px 18px 18px;align-items:stretch}
.kcol{flex:0 0 252px;display:flex;flex-direction:column;background:var(--surface2);border:1px solid var(--line);border-radius:10px;max-height:100%}
.kcol.drag-over{border-color:var(--accent);background:var(--accent-soft)}
.kcol-head{display:flex;align-items:center;gap:7px;padding:9px 11px;border-bottom:1px solid var(--line)}
.kcol-dot{width:8px;height:8px;border-radius:50%;flex:none}
.kcol-title{font-weight:600;font-size:12.5px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.kcol-count{margin-left:auto;font-size:11px;font-weight:600;color:var(--ink2);background:var(--surface3);border-radius:99px;padding:0 7px;line-height:17px}
.kcol-body{flex:1;overflow-y:auto;padding:8px;display:flex;flex-direction:column;gap:8px}
.kcol-empty{color:var(--ink3);font-size:11.5px;text-align:center;padding:14px 4px;border:1.5px dashed var(--line2);border-radius:8px}
.jcard{background:var(--surface);border:1px solid var(--line);border-radius:9px;padding:9px 10px;cursor:grab;box-shadow:0 1px 2px rgba(21,23,30,.05);position:relative}
.jcard:hover{border-color:var(--accent);box-shadow:var(--shadow)}
.jcard.dragging{opacity:.45;cursor:grabbing}
.jcard.overdue{border-left:3px solid var(--critical)}
.jcard.duesoon{border-left:3px solid var(--warn)}
.jcard-top{display:flex;align-items:center;gap:6px;margin-bottom:2px}
.jcard-no{font-weight:600;font-size:12.5px}
.jcard-flags{margin-left:auto;display:flex;gap:4px;font-size:10.5px}
.jcard-name{font-weight:600;font-size:13px;line-height:1.3;margin-bottom:5px}
.jcard-meta{display:grid;grid-template-columns:1fr 1fr;gap:1px 8px;font-size:11.5px;color:var(--ink2)}
.jcard-meta b{font-weight:500;color:var(--ink)}
.jcard-bot{display:flex;align-items:center;gap:8px;margin-top:7px}
.prog{flex:1;height:4px;background:var(--surface3);border-radius:99px;overflow:hidden}
.prog>i{display:block;height:100%;background:var(--accent);border-radius:99px}
.prog>i.done{background:var(--good)}
.jcard-prog-t{font-size:10.5px;color:var(--ink3);min-width:30px;text-align:right}
.avatar{width:20px;height:20px;border-radius:50%;background:var(--accent-soft2);color:var(--accent);display:inline-grid;place-items:center;font-size:9.5px;font-weight:700;flex:none}
.jcard-due{font-size:11px;color:var(--ink2);display:flex;align-items:center;gap:4px}
.jcard-due.overdue{color:var(--critical-text);font-weight:600}
.jcard-due.duesoon{color:var(--warn-text);font-weight:600}

/* ---------- Generic cards / KPI ---------- */
.card{background:var(--surface);border:1px solid var(--line);border-radius:11px;padding:16px 18px}
.card-title{font-size:13px;font-weight:700;margin-bottom:12px;display:flex;align-items:center;gap:8px}
.card-title .hint{font-weight:400;color:var(--ink3);font-size:11.5px;margin-left:auto}
.kpi-row{display:grid;gap:12px;margin-bottom:16px}
.kpi{background:var(--surface);border:1px solid var(--line);border-radius:11px;padding:13px 16px;cursor:default}
.kpi.clickable{cursor:pointer}
.kpi.clickable:hover{border-color:var(--accent)}
.kpi-label{font-size:11.5px;color:var(--ink2);font-weight:500;display:flex;align-items:center;gap:6px}
.kpi-value{font-size:24px;font-weight:700;line-height:1.25;margin-top:2px}
.kpi-value small{font-size:13px;font-weight:500;color:var(--ink3)}
.kpi-sub{font-size:11.5px;color:var(--ink3);margin-top:1px}
.kpi.tone-critical .kpi-value{color:var(--critical-text)}
.kpi.tone-good .kpi-value{color:var(--good-text)}
.kpi.tone-warn .kpi-value{color:var(--warn-text)}
.kpi.tone-accent .kpi-value{color:var(--accent)}
.grid2{display:grid;grid-template-columns:1fr 1fr;gap:14px}
.grid3{display:grid;grid-template-columns:2fr 1fr;gap:14px}
.section-gap{margin-bottom:16px}

/* ---------- Tables ---------- */
.tbl{width:100%;border-collapse:collapse;font-size:12.5px}
.tbl th{font-size:11px;letter-spacing:.4px;text-transform:uppercase;color:var(--ink3);text-align:left;font-weight:600;padding:7px 10px;border-bottom:1px solid var(--line2);white-space:nowrap}
.tbl td{padding:7px 10px;border-bottom:1px solid var(--line);vertical-align:middle}
.tbl tr:last-child td{border-bottom:none}
.tbl .r{text-align:right}
.tbl tr.rowlink{cursor:pointer}
.tbl tr.rowlink:hover td{background:var(--surface2)}
.tbl-wrap{overflow-x:auto}
.tbl input,.tbl select{padding:4px 7px;font-size:12.5px;width:100%}
.tbl input.w-num{max-width:110px;text-align:right}

/* ---------- Modal ---------- */
.modal-back{position:fixed;inset:0;background:rgba(15,17,24,.5);display:none;z-index:200;align-items:flex-start;justify-content:center;overflow-y:auto;padding:4vh 20px}
.modal-back.open{display:flex}
.modal{background:var(--bg);border:1px solid var(--line2);border-radius:14px;box-shadow:var(--shadow-lg);width:100%;position:relative}
.modal.w-md{max-width:640px}
.modal.w-lg{max-width:1060px}
.modal-head{display:flex;align-items:center;gap:12px;padding:16px 22px 0}
.modal-close{position:absolute;top:14px;right:14px;width:30px;height:30px;border-radius:7px;display:grid;place-items:center;color:var(--ink2);font-size:18px}
.modal-close:hover{background:var(--surface3);color:var(--ink)}
.modal-body{padding:16px 22px 22px}
/* Google Sheets: หน้าต่างใส่รหัสทีม (ปิดด้วย Esc/คลิกนอกกรอบไม่ได้) */
.gs-lock{position:fixed;inset:0;background:rgba(15,17,24,.6);backdrop-filter:blur(3px);display:none;z-index:300;align-items:center;justify-content:center;padding:20px}
.gs-lock.open{display:flex}
.gs-lock .modal{max-width:400px}
#sync-chip.gs{cursor:pointer}

/* ---------- Forms ---------- */
.fgrid{display:grid;grid-template-columns:1fr 1fr;gap:11px 14px}
.fgrid .full{grid-column:1/-1}
.field label{display:block;font-size:11.5px;font-weight:600;color:var(--ink2);margin-bottom:3px}
.field input,.field select,.field textarea{width:100%}
.field .req{color:var(--critical)}

/* ---------- Job detail ---------- */
.jd-head{display:flex;align-items:flex-start;gap:14px;padding:18px 24px 0}
.jd-no{font-size:13px;font-weight:600;color:var(--accent)}
.jd-name{font-size:19px;font-weight:700;line-height:1.25}
.jd-chips{display:flex;gap:6px;flex-wrap:wrap;margin-top:6px}
.jd-side{margin-left:auto;text-align:right;flex:none}
.tabs{display:flex;gap:2px;padding:12px 24px 0;border-bottom:1px solid var(--line);overflow-x:auto}
.tab{padding:8px 13px;font-weight:600;font-size:12.5px;color:var(--ink2);border-bottom:2px solid transparent;margin-bottom:-1px;white-space:nowrap}
.tab:hover{color:var(--ink)}
.tab.active{color:var(--accent);border-bottom-color:var(--accent)}
.jd-body{padding:18px 24px 24px;min-height:340px}

/* ---------- Timeline ---------- */
.tl{position:relative;padding-left:24px}
.tl::before{content:"";position:absolute;left:7px;top:6px;bottom:6px;width:2px;background:var(--line2);border-radius:2px}
.tl-item{position:relative;padding:0 0 16px}
.tl-dot{position:absolute;left:-24px;top:4px;width:16px;height:16px;border-radius:50%;border:3px solid var(--surface);box-shadow:0 0 0 1px var(--line2)}
.tl-date{font-size:11px;color:var(--ink3);font-weight:600}
.tl-title{font-weight:600;font-size:13px}
.tl-meta{font-size:12px;color:var(--ink2)}
.tl-note{font-size:12px;color:var(--ink2);background:var(--surface2);border:1px solid var(--line);border-radius:7px;padding:5px 9px;margin-top:4px}
.tl-dur{font-size:11px;color:var(--ink3)}

/* ---------- Charts ---------- */
.chart-wrap{overflow-x:auto}
.chart-legend{display:flex;gap:14px;flex-wrap:wrap;font-size:11.5px;color:var(--ink2);margin-bottom:8px}
.leg-item{display:inline-flex;align-items:center;gap:6px}
.leg-swatch{width:10px;height:10px;border-radius:3px}
.bar-h-row{display:grid;grid-template-columns:150px 1fr 64px;align-items:center;gap:10px;padding:3.5px 0;font-size:12px}
.bar-h-row .lbl{color:var(--ink2);white-space:nowrap;overflow:hidden;text-overflow:ellipsis;text-align:right}
.bar-h-track{height:16px;background:transparent;position:relative}
.bar-h-fill{height:100%;border-radius:0 4px 4px 0;min-width:2px}
.bar-h-val{color:var(--ink);font-weight:600;font-size:11.5px}
svg text{font-family:inherit}

/* ---------- Calendar ---------- */
.cal-head{display:flex;align-items:center;gap:12px;margin-bottom:14px}
.cal-title{font-size:16px;font-weight:700;min-width:170px;text-align:center}
.cal-grid{display:grid;grid-template-columns:repeat(7,1fr);border:1px solid var(--line);border-radius:11px;overflow:hidden;background:var(--line)}
.cal-dow{background:var(--surface2);padding:6px;text-align:center;font-size:11px;font-weight:600;color:var(--ink3);text-transform:uppercase;letter-spacing:.4px}
.cal-cell{background:var(--surface);min-height:104px;padding:5px 6px;gap:1px;display:flex;flex-direction:column}
.cal-cell.dim{background:var(--surface2)}
.cal-cell.today{outline:2px solid var(--accent);outline-offset:-2px}
.cal-daynum{font-size:11.5px;font-weight:600;color:var(--ink2);margin-bottom:2px}
.cal-cell.today .cal-daynum{color:var(--accent)}
.cal-ev{font-size:10.5px;font-weight:500;border-radius:4px;padding:1px 5px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;cursor:pointer;border-left:3px solid transparent;background:var(--surface3)}
.cal-ev:hover{filter:brightness(.96)}
.cal-more{font-size:10px;color:var(--ink3);cursor:pointer}

/* ---------- Gantt ---------- */
.gantt{border:1px solid var(--line);border-radius:11px;overflow:hidden}
.gantt-scroll{overflow-x:auto}
.gantt-grid{display:grid;font-size:11.5px}
.g-namecol{position:sticky;left:0;background:var(--surface);border-right:1px solid var(--line2);padding:6px 10px;white-space:nowrap;z-index:2;display:flex;align-items:center;gap:7px}
.g-row-track{position:relative;border-bottom:1px solid var(--line);background:var(--surface)}
.g-bar{position:absolute;top:7px;height:16px;border-radius:5px;cursor:pointer;opacity:.9}
.g-bar:hover{opacity:1}
.g-bar .g-bar-label{position:absolute;left:6px;top:0;line-height:16px;font-size:10px;color:#fff;white-space:nowrap;overflow:hidden;max-width:calc(100% - 10px)}
.g-today{position:absolute;top:0;bottom:0;width:2px;background:var(--critical);z-index:1}
.g-day-head{border-bottom:1px solid var(--line2);background:var(--surface2);font-size:10px;color:var(--ink3);text-align:center;padding:3px 0;white-space:nowrap}

/* ---------- Notifications panel ---------- */
#notif-panel{position:fixed;top:56px;right:14px;width:390px;max-height:70vh;overflow-y:auto;background:var(--surface);border:1px solid var(--line2);border-radius:12px;box-shadow:var(--shadow-lg);z-index:150;display:none}
#notif-panel.open{display:block}
.notif-head{padding:12px 16px;font-weight:700;border-bottom:1px solid var(--line);display:flex;align-items:center}
.notif-item{padding:10px 16px;border-bottom:1px solid var(--line);cursor:pointer;display:flex;gap:10px;align-items:flex-start}
.notif-item:hover{background:var(--surface2)}
.notif-item:last-child{border-bottom:none}
.notif-ic{font-size:14px;line-height:1.4}
.notif-t{font-weight:600;font-size:12.5px}
.notif-d{font-size:11.5px;color:var(--ink2)}

/* ---------- Toast ---------- */
#toast-zone{position:fixed;bottom:18px;left:50%;transform:translateX(-50%);z-index:400;display:flex;flex-direction:column;gap:8px;align-items:center}
.toast{background:var(--ink);color:var(--bg);padding:9px 16px;border-radius:9px;font-size:13px;font-weight:500;box-shadow:var(--shadow-lg);animation:toast-in .18s ease}
.toast.warn-t{background:var(--critical)}
@keyframes toast-in{from{opacity:0;transform:translateY(8px)}to{opacity:1;transform:none}}
@media (prefers-reduced-motion: reduce){.toast{animation:none}}

/* ---------- Misc ---------- */
.muted{color:var(--ink3)}
.small{font-size:11.5px}
.right{text-align:right}
.flex{display:flex;align-items:center;gap:8px}
.spacer{flex:1}
.mt8{margin-top:8px}.mt14{margin-top:14px}.mb8{margin-bottom:8px}
.empty-state{text-align:center;color:var(--ink3);padding:30px 10px;font-size:12.5px}
.warn-banner{background:var(--chip-warn-bg);color:var(--warn-text);border:1px solid var(--warn);border-radius:9px;padding:9px 13px;font-size:12.5px;font-weight:500;margin-bottom:12px}
.crit-banner{background:var(--chip-critical-bg);color:var(--critical-text);border:1px solid var(--critical);border-radius:9px;padding:9px 13px;font-size:12.5px;font-weight:500;margin-bottom:12px}
.subtle-list{display:flex;flex-direction:column;gap:6px}
.stat-line{display:flex;justify-content:space-between;font-size:12.5px;padding:5px 0;border-bottom:1px dashed var(--line)}
.stat-line:last-child{border-bottom:none}
.stat-line b{font-weight:600}
.period-tabs{display:inline-flex;background:var(--surface2);border:1px solid var(--line);border-radius:8px;padding:2px;gap:1px}
.period-tabs button{padding:4px 11px;border-radius:6px;font-size:12px;font-weight:600;color:var(--ink2)}
.period-tabs button.active{background:var(--surface);color:var(--accent);box-shadow:0 1px 2px rgba(21,23,30,.1)}
@media (max-width:1100px){
  .grid2,.grid3{grid-template-columns:1fr}
  #app{grid-template-columns:64px 1fr}
  .brand-name,.brand-sub,.nav-item span,.nav-label,.sidebar-foot{display:none}
  .nav-item{justify-content:center}
  .nav-badge{display:none}
}
</style>
</head>
<body>
<div id="app">
  <aside id="sidebar">
    <div class="brand">
      <div class="brand-mark">GF</div>
      <div>
        <div class="brand-name">GarmentFlow</div>
        <div class="brand-sub">Production PMS</div>
      </div>
    </div>
    <nav class="nav" id="nav">
      <div class="nav-label">งานผลิต</div>
      <button class="nav-item active" data-page="board">
        <svg width="15" height="15" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="1.5" y="2" width="3.6" height="12" rx="1"/><rect x="6.2" y="2" width="3.6" height="8.5" rx="1"/><rect x="10.9" y="2" width="3.6" height="5.5" rx="1"/></svg>
        <span>Kanban Board</span>
      </button>
      <button class="nav-item" data-page="calendar">
        <svg width="15" height="15" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="1.5" y="2.5" width="13" height="12" rx="1.5"/><path d="M1.5 6h13M5 1v3M11 1v3"/></svg>
        <span>Calendar / Gantt</span>
      </button>
      <div class="nav-label">ภาพรวม</div>
      <button class="nav-item" data-page="dashboard">
        <svg width="15" height="15" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="1.5" y="1.5" width="5.5" height="5.5" rx="1"/><rect x="9" y="1.5" width="5.5" height="5.5" rx="1"/><rect x="1.5" y="9" width="5.5" height="5.5" rx="1"/><rect x="9" y="9" width="5.5" height="5.5" rx="1"/></svg>
        <span>Dashboard</span>
        <span class="nav-badge" id="nav-overdue" hidden>0</span>
      </button>
      <button class="nav-item" data-page="business">
        <svg width="15" height="15" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M1.5 14.5h13M3 11l3-3.5 2.5 2L13.5 4"/><path d="M10.5 4h3v3"/></svg>
        <span>Business</span>
      </button>
      <button class="nav-item" data-page="performance">
        <svg width="15" height="15" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="8" cy="8" r="6.5"/><path d="M8 4.5V8l2.5 1.8"/></svg>
        <span>Performance</span>
      </button>
      <button class="nav-item" data-page="team">
        <svg width="15" height="15" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="5.5" cy="5.5" r="2.5"/><circle cx="11.5" cy="6.5" r="2"/><path d="M1.5 13.5c0-2.2 1.8-4 4-4s4 1.8 4 4M9.8 9.9c.5-.2 1.1-.4 1.7-.4 1.7 0 3 1.3 3 3"/></svg>
        <span>Team Workload</span>
      </button>
    </nav>
    <div class="sidebar-foot">
      <div id="sync-chip" class="local"><span class="dot"></span><span id="sync-text">เฉพาะเครื่องนี้</span></div>
      <div class="mt8" id="db-stamp"></div>
    </div>
  </aside>

  <header id="topbar">
    <h1 id="page-title">Kanban Board</h1>
    <div class="top-search">
      <svg class="search-ic" width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.7"><circle cx="7" cy="7" r="5"/><path d="M11 11l3.5 3.5"/></svg>
      <input id="global-search" type="text" placeholder="ค้นหา Job No. / เซลเจ้าของงาน / สินค้า / SKU / ผู้รับผิดชอบ…" autocomplete="off" aria-label="Global search">
      <div id="search-results"></div>
    </div>
    <div class="top-right">
      <button class="icon-btn" id="notif-btn" title="การแจ้งเตือน" aria-label="Notifications">
        <svg width="16" height="16" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M8 1.8a4.2 4.2 0 0 0-4.2 4.2c0 3.2-1.3 4.4-1.3 4.4h11s-1.3-1.2-1.3-4.4A4.2 4.2 0 0 0 8 1.8ZM6.5 13a1.6 1.6 0 0 0 3 0"/></svg>
        <span class="bub" id="notif-count" hidden>0</span>
      </button>
      <button class="icon-btn" id="theme-btn" title="สลับโหมดสว่าง/มืด" aria-label="Toggle theme">
        <svg width="15" height="15" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M13.5 9.5A6 6 0 0 1 6.5 2.5a6 6 0 1 0 7 7Z"/></svg>
      </button>
      <select id="user-select" title="ผู้ใช้งานปัจจุบัน (ใช้บันทึก Activity Log)"></select>
    </div>
  </header>

  <main id="main">
    <!-- ============ KANBAN ============ -->
    <section class="page active" id="page-board">
      <div class="board-toolbar">
        <input id="f-jobno" type="text" placeholder="Job No." aria-label="Search job no">
        <input id="f-customer" type="text" placeholder="เซลเจ้าของงาน" aria-label="Search sales owner">
        <input id="f-product" type="text" placeholder="Product / SKU" aria-label="Search product">
        <span class="tb-sep"></span>
        <select id="f-status" aria-label="Filter status"><option value="">สถานะ: ทั้งหมด</option></select>
        <select id="f-priority" aria-label="Filter priority">
          <option value="">Priority: ทั้งหมด</option>
          <option value="high">🔥 High</option>
          <option value="normal">Normal</option>
          <option value="low">Low</option>
        </select>
        <select id="f-due" aria-label="Filter due date">
          <option value="">Due: ทั้งหมด</option>
          <option value="overdue">🔴 Overdue</option>
          <option value="today">วันนี้</option>
          <option value="3d">ภายใน 3 วัน</option>
          <option value="7d">ภายใน 7 วัน</option>
          <option value="month">เดือนนี้</option>
        </select>
        <select id="f-person" aria-label="Filter responsible"><option value="">ผู้รับผิดชอบ: ทั้งหมด</option></select>
        <button class="btn ghost sm" id="f-clear" hidden>ล้างตัวกรอง ✕</button>
        <span class="tb-count" id="board-count"></span>
        <span class="spacer"></span>
        <button class="btn primary" id="btn-new-job">＋ New Job</button>
      </div>
      <div id="kanban"></div>
    </section>

    <!-- ============ DASHBOARD ============ -->
    <section class="page" id="page-dashboard">
      <div class="kpi-row" style="grid-template-columns:repeat(6,1fr)" id="dash-kpis"></div>
      <div class="grid3 section-gap">
        <div class="card">
          <div class="card-title">Workflow — จำนวนงานในแต่ละขั้นตอน <span class="hint">คลิกแท่งเพื่อดูงานในสถานะนั้น</span></div>
          <div id="dash-workflow"></div>
        </div>
        <div class="card">
          <div class="card-title">การแจ้งเตือน</div>
          <div id="dash-alerts" class="subtle-list"></div>
        </div>
      </div>
      <div class="grid2 section-gap">
        <div class="card">
          <div class="card-title">งานที่ต้องส่งเร็ว ๆ นี้ <span class="hint">เรียงตามกำหนดส่ง</span></div>
          <div class="tbl-wrap"><table class="tbl" id="dash-due-tbl"></table></div>
        </div>
        <div class="card">
          <div class="card-title">Activity ล่าสุด</div>
          <div id="dash-activity" class="subtle-list"></div>
        </div>
      </div>
    </section>

    <!-- ============ BUSINESS ============ -->
    <section class="page" id="page-business">
      <div class="flex section-gap">
        <div class="period-tabs" id="biz-period">
          <button data-p="today">Today</button>
          <button data-p="week">Week</button>
          <button data-p="month" class="active">Month</button>
          <button data-p="q1">Q1</button>
          <button data-p="q2">Q2</button>
          <button data-p="q3">Q3</button>
          <button data-p="q4">Q4</button>
          <button data-p="year">Year</button>
          <button data-p="all">All</button>
        </div>
        <span class="muted small" id="biz-period-label"></span>
      </div>
      <div class="kpi-row" style="grid-template-columns:repeat(4,1fr)" id="biz-kpis"></div>
      <div class="kpi-row" style="grid-template-columns:repeat(4,1fr)" id="biz-kpis2"></div>
      <div class="grid2 section-gap">
        <div class="card">
          <div class="card-title">Sales vs Cost รายเดือน</div>
          <div class="chart-legend" id="biz-chart-legend"></div>
          <div class="chart-wrap" id="biz-monthly"></div>
        </div>
        <div class="card">
          <div class="card-title">Gross Profit ราย Job <span class="hint">เฉพาะงานที่มียอดขาย · เรียงตามกำไร</span></div>
          <div id="biz-by-job"></div>
        </div>
      </div>
      <div class="card section-gap">
        <div class="card-title">รายละเอียดราย Job</div>
        <div class="tbl-wrap"><table class="tbl" id="biz-tbl"></table></div>
      </div>
    </section>

    <!-- ============ PERFORMANCE ============ -->
    <section class="page" id="page-performance">
      <div class="kpi-row" style="grid-template-columns:repeat(5,1fr)" id="perf-kpis"></div>
      <div class="kpi-row" style="grid-template-columns:repeat(5,1fr)" id="perf-kpis2"></div>
      <div class="grid2 section-gap">
        <div class="card">
          <div class="card-title">เวลาเฉลี่ยในแต่ละขั้นตอน (วัน) <span class="hint">จากงานทั้งหมดที่ผ่านขั้นตอนนั้น</span></div>
          <div id="perf-stage-time"></div>
        </div>
        <div class="card">
          <div class="card-title">Defect / Rework ราย Job <span class="hint">% เทียบจำนวนที่เย็บ</span></div>
          <div id="perf-defect"></div>
        </div>
      </div>
    </section>

    <!-- ============ CALENDAR ============ -->
    <section class="page" id="page-calendar">
      <div class="cal-head">
        <div class="period-tabs">
          <button id="cal-view-month" class="active">เดือน</button>
          <button id="cal-view-gantt">Gantt</button>
        </div>
        <span class="spacer"></span>
        <button class="btn sm" id="cal-prev">‹</button>
        <div class="cal-title" id="cal-title"></div>
        <button class="btn sm" id="cal-next">›</button>
        <button class="btn sm" id="cal-today">วันนี้</button>
        <span class="spacer"></span>
        <div class="chart-legend" id="cal-legend"></div>
      </div>
      <div id="cal-month-wrap"></div>
      <div id="cal-gantt-wrap" hidden></div>
    </section>

    <!-- ============ TEAM ============ -->
    <section class="page" id="page-team">
      <div class="kpi-row" style="grid-template-columns:repeat(4,1fr)" id="team-kpis"></div>
      <div class="card">
        <div class="card-title">ภาระงานรายบุคคล <span class="hint">คลิกชื่อเพื่อดูงานในมือ</span></div>
        <div class="tbl-wrap"><table class="tbl" id="team-tbl"></table></div>
      </div>
      <div class="card mt14" id="team-detail-card" hidden>
        <div class="card-title" id="team-detail-title"></div>
        <div class="tbl-wrap"><table class="tbl" id="team-detail-tbl"></table></div>
      </div>
    </section>
  </main>
</div>

<!-- ============ NEW JOB MODAL ============ -->
<div class="modal-back" id="modal-new">
  <div class="modal w-md" role="dialog" aria-label="สร้าง Job ใหม่">
    <button class="modal-close" data-close="modal-new">✕</button>
    <div class="modal-head"><h2 style="font-size:16px">สร้าง Job ใหม่</h2></div>
    <div class="modal-body">
      <div class="fgrid">
        <div class="field"><label>Job No. <span class="req">*</span></label><input id="nj-jobno" class="mono" placeholder="MD-xxx"></div>
        <div class="field"><label>เซลเจ้าของงาน <span class="req">*</span></label><input id="nj-customer" list="dl-customers" placeholder="ชื่อเซลเจ้าของงาน"></div>
        <div class="field full"><label>Product Name <span class="req">*</span></label><input id="nj-product" placeholder="เช่น Linen Oversized Shirt"></div>
        <div class="field"><label>SKU</label><input id="nj-sku" class="mono" placeholder="SH-001"></div>
        <div class="field"><label>Product Type</label>
          <select id="nj-type"><option>Shirt</option><option>T-Shirt</option><option>Polo</option><option>Dress</option><option>Pants</option><option>Skirt</option><option>Jacket</option><option>Uniform</option><option>Other</option></select>
        </div>
        <div class="field"><label>Order Quantity (pcs)</label><input id="nj-qty" type="number" min="0" value="0"></div>
        <div class="field"><label>Sample Quantity (pcs)</label><input id="nj-sampleqty" type="number" min="0" value="1"></div>
        <div class="field"><label>Start Date</label><input id="nj-start" type="date"></div>
        <div class="field"><label>Due Date <span class="req">*</span></label><input id="nj-due" type="date"></div>
        <div class="field"><label>Priority</label>
          <select id="nj-priority"><option value="normal">Normal</option><option value="high">🔥 High</option><option value="low">Low</option></select>
        </div>
        <div class="field"><label>ผู้รับผิดชอบหลัก</label><select id="nj-person"></select></div>
        <div class="field full"><label>Notes</label><textarea id="nj-notes" rows="2" placeholder="รายละเอียดเพิ่มเติม…"></textarea></div>
      </div>
      <div class="flex mt14" style="justify-content:flex-end;gap:8px">
        <button class="btn" data-close="modal-new">ยกเลิก</button>
        <button class="btn primary" id="nj-save">สร้าง Job</button>
      </div>
    </div>
  </div>
</div>
<datalist id="dl-customers"></datalist>

<!-- ============ JOB DETAIL MODAL ============ -->
<div class="modal-back" id="modal-job">
  <div class="modal w-lg" role="dialog" aria-label="รายละเอียด Job">
    <button class="modal-close" data-close="modal-job">✕</button>
    <div id="jd-header"></div>
    <div class="tabs" id="jd-tabs">
      <button class="tab active" data-tab="info">ข้อมูลงาน</button>
      <button class="tab" data-tab="timeline">Timeline</button>
      <button class="tab" data-tab="samples">Samples</button>
      <button class="tab" data-tab="materials">Materials</button>
      <button class="tab" data-tab="costing">Costing</button>
      <button class="tab" data-tab="sales">Sales &amp; Profit</button>
      <button class="tab" data-tab="qty">Quantity</button>
      <button class="tab" data-tab="activity">Activity Log</button>
    </div>
    <div class="jd-body" id="jd-body"></div>
  </div>
</div>

<!-- ============ DRILLDOWN MODAL ============ -->
<div class="modal-back" id="modal-drill">
  <div class="modal w-md" role="dialog" aria-label="รายการงาน">
    <button class="modal-close" data-close="modal-drill">✕</button>
    <div class="modal-head"><h2 style="font-size:15px" id="drill-title"></h2></div>
    <div class="modal-body"><div class="tbl-wrap"><table class="tbl" id="drill-tbl"></table></div></div>
  </div>
</div>

<!-- ============ GOOGLE SHEETS: TEAM KEY ============ -->
<div class="gs-lock" id="gs-lock">
  <div class="modal" role="dialog" aria-modal="true" aria-labelledby="gs-lock-title">
    <div class="modal-head"><h2 style="font-size:16px" id="gs-lock-title">🔒 ใส่รหัสทีม</h2></div>
    <div class="modal-body">
      <div class="small muted">ข้อมูลงานเก็บอยู่ใน Google Sheet ของทีม ใส่รหัสทีมเพื่อเชื่อมต่อ (ขอรหัสได้จากผู้ดูแลระบบ)</div>
      <div class="field mt14"><label for="gs-key">รหัสทีม</label><input id="gs-key" type="password" autocomplete="current-password"></div>
      <div class="small" id="gs-key-err" role="alert" style="color:var(--critical);min-height:18px;margin-top:6px"></div>
      <div class="flex mt8" style="justify-content:flex-end"><button class="btn primary" id="gs-key-ok">เชื่อมต่อ</button></div>
    </div>
  </div>
</div>

<div id="toast-zone"></div>
<div id="notif-panel"></div>
<script>
/* ===================== ตั้งค่า Google Sheets =====================
   วาง Web App URL ของ Apps Script (ลงท้ายด้วย /exec) ไว้ในเครื่องหมายคำพูดด้านล่าง
   ถ้าเว้นว่าง เว็บจะทำงานแบบเดิม (เก็บข้อมูลเฉพาะเครื่อง) */
window.GSHEET_API = "https://script.googleusercontent.com/macros/echo?user_content_key=AUkAhnS6FZQ4cFbfyCcVUvqUMxrfG2aAVWa2awv-bAaMAsleSm2NfTjx00q1YitXFSArHronVhw1naNUd76y49a0fSQUAsA4PWKY_m4AoQ4A-KMjcoa7k46HMQ5w_O97GpKy_JySwWNer2w7IsDHkHyowAtU0Z9acqOjUfYIiUuCjgHrgdh_OilTF5gs2omeybEwF68jHVzlq2MtHrvSe88Arp1uW14agb8VtFtE8RIGj57b35wZt8h3wbidGZP8MACfH8--bFUNG3xb_-C8eALH4kVBLV86wg&lib=MoUK7t5XdSROfWn2dE-ipQrmBf1_V4Fmt";
</script>
<script type="application/json" id="db-embed">{}</script>
<script>
"use strict";
/* Capture pristine page source before any DOM mutation — used only by the
   html-form publish fallback (files-form publish never needs it). */
const PRISTINE_HTML = "<!doctype html>\n" + document.documentElement.outerHTML;

/* ================= CONSTANTS ================= */
const STATUSES = [
  {key:"new",           label:"NEW JOB",            dot:"#8b8d94", phase:"start"},
  {key:"wait_fabric",   label:"รอหาผ้า",             dot:"#fab219", phase:"material"},
  {key:"fabric_ready",  label:"ได้ผ้าแล้ว",           dot:"#1baf7a", phase:"material"},
  {key:"sampling",      label:"กำลังขึ้นตัวอย่าง",      dot:"#2a78d6", phase:"sample"},
  {key:"sample_revise", label:"แก้ไขตัวอย่าง",         dot:"#ec835a", phase:"sample"},
  {key:"sample_ok",     label:"ตัวอย่างผ่าน",          dot:"#0ca30c", phase:"sample"},
  {key:"wait_prod",     label:"รอผลิต",              dot:"#fab219", phase:"production"},
  {key:"cutting",       label:"กำลังตัด",             dot:"#2a78d6", phase:"production"},
  {key:"sewing",        label:"กำลังเย็บ",            dot:"#4a3aa7", phase:"production"},
  {key:"qc",            label:"QC",                 dot:"#eda100", phase:"production"},
  {key:"rework",        label:"แก้ไขงาน",            dot:"#e34948", phase:"production"},
  {key:"done_prod",     label:"ผลิตเสร็จ",            dot:"#0ca30c", phase:"closing"},
  {key:"delivered",     label:"ส่งมอบ",              dot:"#0ca30c", phase:"closing"},
  {key:"closed",        label:"ปิดงาน",              dot:"#8b8d94", phase:"closing"}
];
const ST = Object.fromEntries(STATUSES.map((s,i)=>[s.key,{...s,idx:i}]));
const stLabel = k => ST[k] ? ST[k].label : k;
const ACTIVE_KEYS = STATUSES.map(s=>s.key).filter(k=>!["done_prod","delivered","closed"].includes(k));
const PROGRESS = {new:0,wait_fabric:8,fabric_ready:15,sampling:25,sample_revise:30,sample_ok:38,wait_prod:42,cutting:55,sewing:70,qc:82,rework:85,done_prod:92,delivered:97,closed:100};

const MAT_TYPES = ["Fabric","Button","Zipper","Label","Thread","Packaging","Other"];
const PROD_COST_FIELDS = [
  ["pattern","Pattern"],["sample","Sample"],["cutting","Cutting"],["sewing","Sewing"],
  ["embroidery","Embroidery"],["printing","Printing"],["washing","Washing"],["finishing","Finishing"],
  ["qc","QC"],["outsourcing","Outsourcing"],["transportation","Transportation"],
  ["labor","Labor"],["overhead","Overhead"],["other","Other Cost"]
];
const ROLES = ["Production Manager","Sales","Merchandise","R&D","Pattern","Cutting","Sewing","QC"];

/* ================= HELPERS ================= */
const $ = s => document.querySelector(s);
const $$ = s => [...document.querySelectorAll(s)];
const esc = s => String(s??"").replace(/[&<>"']/g,c=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"}[c]));
const num = v => { const n = parseFloat(v); return isFinite(n) ? n : 0; };
const money = v => (Math.round(num(v))).toLocaleString("en-US");
const money2 = v => num(v).toLocaleString("en-US",{maximumFractionDigits:2});
const pct = v => (isFinite(v)? (Math.round(v*10)/10).toLocaleString("en-US") : "0") + "%";
const TH_M = ["ม.ค.","ก.พ.","มี.ค.","เม.ย.","พ.ค.","มิ.ย.","ก.ค.","ส.ค.","ก.ย.","ต.ค.","พ.ย.","ธ.ค."];
const TH_M_FULL = ["มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม"];
function parseD(s){ if(!s) return null; const [y,m,d]=s.split("-").map(Number); return new Date(y,m-1,d); }
function iso(d){ return d.getFullYear()+"-"+String(d.getMonth()+1).padStart(2,"0")+"-"+String(d.getDate()).padStart(2,"0"); }
function todayIso(){ return iso(new Date()); }
function fmtD(s){ const d=parseD(s); return d? d.getDate()+" "+TH_M[d.getMonth()] : "—"; }
function fmtDY(s){ const d=parseD(s); return d? d.getDate()+" "+TH_M[d.getMonth()]+" "+(d.getFullYear()+543)%100 : "—"; }
function fmtDT(ts){ const d=new Date(ts); return d.getDate()+" "+TH_M[d.getMonth()]+" "+String(d.getHours()).padStart(2,"0")+":"+String(d.getMinutes()).padStart(2,"0"); }
function daysDiff(a,b){ return Math.round((parseD(b)-parseD(a))/864e5); }
function dueInfo(job){
  if(["delivered","closed"].includes(job.status)) return {state:"done",days:null};
  if(!job.dueDate) return {state:"none",days:null};
  const d = daysDiff(todayIso(), job.dueDate);
  if(d < 0) return {state:"overdue",days:-d};
  if(d <= 3) return {state:"duesoon",days:d};
  return {state:"ok",days:d};
}
function durText(days){
  if(days==null||!isFinite(days)) return "";
  if(days < 1) return "< 1 วัน";
  return (Math.round(days*10)/10)+" วัน";
}
function toast(msg, warn){
  const t=document.createElement("div"); t.className="toast"+(warn?" warn-t":""); t.textContent=msg;
  $("#toast-zone").appendChild(t); setTimeout(()=>t.remove(), 3200);
}
let _uid = 0;
function uid(p){ return p+"-"+Date.now().toString(36)+"-"+(_uid++).toString(36); }

/* ================= DERIVED CALCS ================= */
function materialCost(job){ return (job.materials||[]).reduce((s,m)=>s+num(m.qty)*num(m.costPerUnit)+num(m.flatCost),0); }
function productionCost(job){ return PROD_COST_FIELDS.reduce((s,[k])=>s+num((job.costs||{})[k]),0); }
function totalCost(job){ return materialCost(job)+productionCost(job); }
function costPerPiece(job){ const q=num(job.prodQty)||num(job.qty); return q>0? totalCost(job)/q : 0; }
function totalSales(job){ return num(job.sales?.price)*num(job.sales?.qtySold); }
function grossProfit(job){ return totalSales(job)-totalCost(job); }
function grossMargin(job){ const s=totalSales(job); return s>0? grossProfit(job)/s*100 : 0; }
function jobProgress(job){ return PROGRESS[job.status] ?? 0; }
function stageDurations(job){
  /* [{status,start,end,days,by,note}] closed intervals + open current one */
  return (job.history||[]).map((h,i,arr)=>{
    const end = h.end || (i<arr.length-1 ? arr[i+1].start : null);
    const endEff = end || todayIso();
    return {...h, end, days: Math.max(0,(parseD(endEff)-parseD(h.start))/864e5)};
  });
}
function qtyIssues(job){
  const q=job.qc||{}, issues=[];
  const order=num(job.qty), cut=num(q.cutting), sew=num(q.sewing), pass=num(q.qcPass),
        def=num(q.defect), rw=num(q.rework), comp=num(q.completed), del=num(q.delivered);
  if(cut && order && cut!==order) issues.push(`ตัด ${cut} ชิ้น ไม่เท่ายอดสั่ง ${order} ชิ้น`);
  if(sew && cut && sew>cut) issues.push(`เย็บ ${sew} ชิ้น มากกว่าที่ตัด ${cut} ชิ้น`);
  if((pass||def) && sew && pass+def!==sew) issues.push(`QC Pass ${pass} + Defect ${def} = ${pass+def} ไม่เท่าที่เย็บ ${sew} ชิ้น`);
  if(rw>def) issues.push(`Rework ${rw} มากกว่า Defect ${def}`);
  if(comp && pass && comp>pass+rw) issues.push(`Completed ${comp} มากกว่า QC Pass + Rework (${pass+rw})`);
  if(del>comp && comp) issues.push(`ส่งมอบ ${del} มากกว่าที่ผลิตเสร็จ ${comp} ชิ้น`);
  if(num(job.sales?.qtySold) > comp && comp) issues.push(`ขาย ${num(job.sales.qtySold)} ชิ้น มากกว่าที่ผลิตเสร็จ ${comp} ชิ้น`);
  return issues;
}

/* ================= SEED DATA ================= */
function makeSeed(){
  const users=[
    {id:"u1",name:"เจม",role:"ทีมงาน"},
    {id:"u2",name:"คิว",role:"ทีมงาน"},
    {id:"u3",name:"นะ",role:"ทีมงาน"},
    {id:"u4",name:"เดียร์",role:"ทีมงาน"}
  ];
  const mkHist = (pairs)=> pairs.map(([st,d],i)=>({status:st,start:d,end:pairs[i+1]?pairs[i+1][1]:null,by:"seed",note:""}));
  const J=(o)=>Object.assign({
    id:uid("job"), sku:"", productType:"Shirt", qty:0, sampleQty:1, prodQty:0,
    priority:"normal", responsible:"u3", notes:"", attachments:[],
    materials:[], costs:{}, sales:{price:0,qtySold:0},
    qc:{cutting:0,sewing:0,qcPass:0,defect:0,rework:0,completed:0,delivered:0},
    samples:[], history:[], activity:[]
  },o);
  const jobs=[
    J({jobNo:"MD-111",product:"Linen Oversized Shirt",customer:"ABC",sku:"SH-001",productType:"Shirt",
      qty:100,sampleQty:1,prodQty:100,startDate:"2026-08-01",dueDate:"2026-08-15",priority:"normal",responsible:"u4",
      status:"delivered",
      notes:"ลูกค้าขอผ้าลินินเนื้อหนา สีธรรมชาติ / งานตัวอย่างต้องส่งก่อนผลิตจริง",
      history:mkHist([["new","2026-08-01"],["wait_fabric","2026-08-01"],["fabric_ready","2026-08-03"],
        ["sampling","2026-08-04"],["sample_revise","2026-08-06"],["sample_ok","2026-08-08"],
        ["wait_prod","2026-08-08"],["cutting","2026-08-09"],["sewing","2026-08-10"],["qc","2026-08-12"],
        ["rework","2026-08-13"],["done_prod","2026-08-14"],["delivered","2026-08-16"]]),
      samples:[
        {no:1,date:"2026-08-04",desc:"ตัวอย่างแรก — แก้ Pattern ช่วงไหล่",status:"revised"},
        {no:2,date:"2026-08-06",desc:"ปรับขนาดแขน +2 ซม.",status:"revised"},
        {no:3,date:"2026-08-08",desc:"Approved โดยลูกค้า",status:"approved"}],
      materials:[
        {id:"m1",type:"Fabric",name:"Linen Premium",supplier:"XYZ Textile",qty:120,unit:"m",costPerUnit:250,flatCost:0},
        {id:"m2",type:"Button",name:"กระดุมเปลือกหอย 15mm",supplier:"BTN House",qty:1000,unit:"pcs",costPerUnit:1.5,flatCost:0},
        {id:"m3",type:"Label",name:"ป้ายแบรนด์ทอ",supplier:"Label Pro",qty:100,unit:"pcs",costPerUnit:3,flatCost:0},
        {id:"m4",type:"Thread",name:"ด้ายโพลีเอสเตอร์",supplier:"XYZ Textile",qty:0,unit:"",costPerUnit:0,flatCost:500},
        {id:"m5",type:"Packaging",name:"ถุง OPP + กล่อง",supplier:"PackThai",qty:0,unit:"",costPerUnit:0,flatCost:1000}],
      costs:{pattern:800,sample:1200,cutting:1500,sewing:4000,qc:500,transportation:700},
      sales:{price:850,qtySold:80},
      qc:{cutting:100,sewing:100,qcPass:96,defect:4,rework:4,completed:100,delivered:100},
      activity:[
        {ts:Date.parse("2026-08-01T09:20:00"),user:"นะ",action:"Created Job"},
        {ts:Date.parse("2026-08-01T10:15:00"),user:"นะ",action:"Assigned to เดียร์"},
        {ts:Date.parse("2026-08-03T13:20:00"),user:"นะ",action:"Material Updated — Linen Premium 120 m"},
        {ts:Date.parse("2026-08-03T15:30:00"),user:"เดียร์",action:"Status: รอหาผ้า → ได้ผ้าแล้ว"},
        {ts:Date.parse("2026-08-04T09:10:00"),user:"เดียร์",action:"Status: ได้ผ้าแล้ว → กำลังขึ้นตัวอย่าง"},
        {ts:Date.parse("2026-08-16T14:00:00"),user:"เจม",action:"Status: ผลิตเสร็จ → ส่งมอบ"}]}),
    J({jobNo:"MD-112",product:"Cotton Polo Classic",customer:"Zenith Brand",sku:"PL-014",productType:"Polo",
      qty:250,prodQty:250,startDate:"2026-08-05",dueDate:"2026-09-10",responsible:"u3",status:"sewing",
      history:mkHist([["new","2026-08-05"],["wait_fabric","2026-08-05"],["fabric_ready","2026-08-08"],["sampling","2026-08-09"],["sample_ok","2026-08-13"],["wait_prod","2026-08-13"],["cutting","2026-08-17"],["sewing","2026-08-20"]]),
      samples:[{no:1,date:"2026-08-09",desc:"ผ่านรอบแรก",status:"approved"}],
      materials:[{id:"m1",type:"Fabric",name:"Cotton Pique 220g",supplier:"ThaiKnit",qty:300,unit:"kg",costPerUnit:185,flatCost:0},
        {id:"m2",type:"Button",name:"กระดุมเรซิน",supplier:"BTN House",qty:800,unit:"pcs",costPerUnit:0.8,flatCost:0},
        {id:"m3",type:"Packaging",name:"ถุงพับ",supplier:"PackThai",qty:0,unit:"",costPerUnit:0,flatCost:1500}],
      costs:{pattern:600,sample:900,cutting:3000,sewing:11000,qc:1200,labor:2000},
      sales:{price:450,qtySold:0},
      qc:{cutting:250,sewing:180,qcPass:0,defect:0,rework:0,completed:0,delivered:0}}),
    J({jobNo:"MD-113",product:"Oxford Work Shirt",customer:"Siam Uniform",sku:"SH-022",productType:"Uniform",
      qty:300,prodQty:300,startDate:"2026-08-10",dueDate:"2026-08-30",priority:"high",responsible:"u2",status:"cutting",
      history:mkHist([["new","2026-08-10"],["wait_fabric","2026-08-10"],["fabric_ready","2026-08-14"],["sampling","2026-08-15"],["sample_ok","2026-08-19"],["wait_prod","2026-08-19"],["cutting","2026-08-24"]]),
      samples:[{no:1,date:"2026-08-15",desc:"Approved",status:"approved"}],
      materials:[{id:"m1",type:"Fabric",name:"Oxford Cotton 40s",supplier:"XYZ Textile",qty:420,unit:"m",costPerUnit:95,flatCost:0},
        {id:"m2",type:"Button",name:"กระดุมขาวมาตรฐาน",supplier:"BTN House",qty:3600,unit:"pcs",costPerUnit:0.5,flatCost:0}],
      costs:{pattern:500,sample:800,cutting:3600,sewing:13500,qc:1500},
      sales:{price:320,qtySold:0},
      qc:{cutting:120,sewing:0,qcPass:0,defect:0,rework:0,completed:0,delivered:0}}),
    J({jobNo:"MD-114",product:"Tencel Summer Dress",customer:"BEYOND Studio",sku:"DR-007",productType:"Dress",
      qty:80,prodQty:80,startDate:"2026-08-12",dueDate:"2026-08-25",priority:"high",responsible:"u4",status:"sample_revise",
      notes:"ลูกค้าติดเรื่องทรงกระโปรง — รอ confirm แพทเทิร์นรอบ 2",
      history:mkHist([["new","2026-08-12"],["wait_fabric","2026-08-12"],["fabric_ready","2026-08-16"],["sampling","2026-08-17"],["sample_revise","2026-08-21"]]),
      samples:[{no:1,date:"2026-08-17",desc:"ทรงหลวมเกิน — แก้เข้ารูปช่วงเอว",status:"revised"},
        {no:2,date:"2026-08-21",desc:"รอลูกค้า confirm ความยาว",status:"pending"}],
      materials:[{id:"m1",type:"Fabric",name:"Tencel Twill",supplier:"EcoFab",qty:130,unit:"m",costPerUnit:210,flatCost:0}],
      costs:{pattern:1200,sample:1800},
      sales:{price:1290,qtySold:0}}),
    J({jobNo:"MD-115",product:"Ripstop Cargo Pants",customer:"Harbor Cloth",sku:"PT-031",productType:"Pants",
      qty:150,prodQty:150,startDate:"2026-08-15",dueDate:"2026-09-20",responsible:"u3",status:"wait_fabric",
      notes:"รอผ้า ripstop สีเขียวโอลีฟจากโรงงาน — ETA ต้นเดือน ก.ย.",
      history:mkHist([["new","2026-08-15"],["wait_fabric","2026-08-16"]]),
      sales:{price:790,qtySold:0}}),
    J({jobNo:"MD-116",product:"Pique Polo Uniform",customer:"Siam Uniform",sku:"PL-020",productType:"Uniform",
      qty:500,prodQty:500,startDate:"2026-08-18",dueDate:"2026-10-01",responsible:"u3",status:"wait_fabric",
      history:mkHist([["new","2026-08-18"],["wait_fabric","2026-08-20"]]),
      sales:{price:290,qtySold:0}}),
    J({jobNo:"MD-117",product:"Rayon Hawaiian Shirt",customer:"BEYOND Studio",sku:"SH-030",productType:"Shirt",
      qty:120,prodQty:120,startDate:"2026-08-20",dueDate:"2026-09-15",responsible:"u4",status:"fabric_ready",
      history:mkHist([["new","2026-08-20"],["wait_fabric","2026-08-20"],["fabric_ready","2026-08-26"]]),
      materials:[{id:"m1",type:"Fabric",name:"Rayon Print ลายใบไม้",supplier:"PrintFab",qty:150,unit:"m",costPerUnit:120,flatCost:0}],
      sales:{price:590,qtySold:0}}),
    J({jobNo:"MD-118",product:"Denim Chore Jacket",customer:"Harbor Cloth",sku:"JK-004",productType:"Jacket",
      qty:60,prodQty:60,startDate:"2026-08-08",dueDate:"2026-09-25",responsible:"u4",status:"sampling",
      history:mkHist([["new","2026-08-08"],["wait_fabric","2026-08-08"],["fabric_ready","2026-08-18"],["sampling","2026-08-25"]]),
      samples:[{no:1,date:"2026-08-25",desc:"กำลังขึ้นตัวแรก",status:"pending"}],
      materials:[{id:"m1",type:"Fabric",name:"Denim 12oz",supplier:"IndigoMill",qty:100,unit:"m",costPerUnit:180,flatCost:0}],
      costs:{pattern:1500},
      sales:{price:1490,qtySold:0}}),
    J({jobNo:"MD-119",product:"Muslin Baby Set",customer:"ABC",sku:"BB-002",productType:"Other",
      qty:200,prodQty:200,startDate:"2026-08-22",dueDate:"2026-09-30",responsible:"u3",status:"new",
      history:mkHist([["new","2026-08-22"]]),
      sales:{price:420,qtySold:0}}),
    J({jobNo:"MD-120",product:"Twill Chef Apron",customer:"Siam Uniform",sku:"AP-001",productType:"Other",
      qty:300,prodQty:300,startDate:"2026-08-06",dueDate:"2026-08-27",priority:"high",responsible:"u4",status:"qc",
      notes:"งานเร่ง — ลูกค้าเปิดร้านสาขาใหม่",
      history:mkHist([["new","2026-08-06"],["wait_fabric","2026-08-06"],["fabric_ready","2026-08-09"],["sampling","2026-08-10"],["sample_ok","2026-08-12"],["wait_prod","2026-08-12"],["cutting","2026-08-14"],["sewing","2026-08-17"],["qc","2026-08-25"]]),
      samples:[{no:1,date:"2026-08-10",desc:"Approved",status:"approved"}],
      materials:[{id:"m1",type:"Fabric",name:"Cotton Twill หนา",supplier:"XYZ Textile",qty:330,unit:"m",costPerUnit:85,flatCost:0},
        {id:"m2",type:"Other",name:"หัวเข็มขัดปรับสาย",supplier:"HW Supply",qty:300,unit:"pcs",costPerUnit:6,flatCost:0}],
      costs:{pattern:400,sample:500,cutting:2400,sewing:9000,qc:900},
      sales:{price:250,qtySold:0},
      qc:{cutting:300,sewing:300,qcPass:280,defect:12,rework:12,completed:0,delivered:0}}),
    J({jobNo:"MD-121",product:"Linen Camp Collar",customer:"ABC",sku:"SH-002",productType:"Shirt",
      qty:150,prodQty:150,startDate:"2026-07-20",dueDate:"2026-08-20",responsible:"u1",status:"done_prod",
      history:mkHist([["new","2026-07-20"],["wait_fabric","2026-07-20"],["fabric_ready","2026-07-24"],["sampling","2026-07-25"],["sample_revise","2026-07-29"],["sample_ok","2026-08-01"],["wait_prod","2026-08-01"],["cutting","2026-08-04"],["sewing","2026-08-07"],["qc","2026-08-16"],["done_prod","2026-08-19"]]),
      samples:[{no:1,date:"2026-07-25",desc:"แก้ปกเสื้อ",status:"revised"},{no:2,date:"2026-07-29",desc:"Approved",status:"approved"}],
      materials:[{id:"m1",type:"Fabric",name:"Linen Blend",supplier:"XYZ Textile",qty:170,unit:"m",costPerUnit:190,flatCost:0},
        {id:"m2",type:"Button",name:"กระดุมมะพร้าว",supplier:"BTN House",qty:1200,unit:"pcs",costPerUnit:2,flatCost:0},
        {id:"m3",type:"Packaging",name:"ถุงผ้า+กล่อง",supplier:"PackThai",qty:0,unit:"",costPerUnit:0,flatCost:1800}],
      costs:{pattern:900,sample:1400,cutting:2200,sewing:7500,qc:800,transportation:900,overhead:1500},
      sales:{price:690,qtySold:150},
      qc:{cutting:150,sewing:150,qcPass:146,defect:4,rework:4,completed:150,delivered:0}}),
    J({jobNo:"MD-122",product:"Jersey Oversize Tee",customer:"Zenith Brand",sku:"TS-101",productType:"T-Shirt",
      qty:400,prodQty:400,startDate:"2026-07-01",dueDate:"2026-08-05",responsible:"u1",status:"closed",
      history:mkHist([["new","2026-07-01"],["wait_fabric","2026-07-01"],["fabric_ready","2026-07-06"],["sampling","2026-07-07"],["sample_ok","2026-07-10"],["wait_prod","2026-07-10"],["cutting","2026-07-13"],["sewing","2026-07-16"],["qc","2026-07-27"],["done_prod","2026-07-30"],["delivered","2026-08-02"],["closed","2026-08-05"]]),
      samples:[{no:1,date:"2026-07-07",desc:"Approved",status:"approved"}],
      materials:[{id:"m1",type:"Fabric",name:"Cotton Jersey 200g",supplier:"ThaiKnit",qty:280,unit:"kg",costPerUnit:160,flatCost:0},
        {id:"m2",type:"Label",name:"ป้ายพิมพ์คอ",supplier:"Label Pro",qty:400,unit:"pcs",costPerUnit:1.2,flatCost:0},
        {id:"m3",type:"Packaging",name:"ถุง OPP",supplier:"PackThai",qty:0,unit:"",costPerUnit:0,flatCost:1200}],
      costs:{pattern:500,sample:600,cutting:2800,sewing:14000,printing:8000,qc:1600,transportation:1500,overhead:2000},
      sales:{price:320,qtySold:400},
      qc:{cutting:400,sewing:400,qcPass:392,defect:8,rework:8,completed:400,delivered:400}}),
    J({jobNo:"MD-123",product:"Poplin School Shirt",customer:"Siam Uniform",sku:"SH-050",productType:"Uniform",
      qty:600,prodQty:600,startDate:"2026-07-05",dueDate:"2026-08-10",responsible:"u1",status:"closed",
      history:mkHist([["new","2026-07-05"],["wait_fabric","2026-07-05"],["fabric_ready","2026-07-08"],["sampling","2026-07-09"],["sample_ok","2026-07-11"],["wait_prod","2026-07-11"],["cutting","2026-07-14"],["sewing","2026-07-18"],["qc","2026-08-01"],["done_prod","2026-08-04"],["delivered","2026-08-07"],["closed","2026-08-10"]]),
      samples:[{no:1,date:"2026-07-09",desc:"Approved",status:"approved"}],
      materials:[{id:"m1",type:"Fabric",name:"Poplin TC",supplier:"XYZ Textile",qty:700,unit:"m",costPerUnit:65,flatCost:0},
        {id:"m2",type:"Button",name:"กระดุมขาว",supplier:"BTN House",qcty:0,qty:7200,unit:"pcs",costPerUnit:0.4,flatCost:0}],
      costs:{pattern:400,sample:500,cutting:4200,sewing:21000,qc:2400,transportation:2000,overhead:3000},
      sales:{price:260,qtySold:550},
      qc:{cutting:600,sewing:600,qcPass:585,defect:15,rework:15,completed:600,delivered:600}}),
    J({jobNo:"MD-124",product:"Corduroy Bucket Hat",customer:"BEYOND Studio",sku:"HT-003",productType:"Other",
      qty:200,prodQty:200,startDate:"2026-08-24",dueDate:"2026-09-08",responsible:"u1",status:"sample_ok",
      history:mkHist([["new","2026-08-24"],["sampling","2026-08-25"],["sample_ok","2026-08-27"]]),
      samples:[{no:1,date:"2026-08-25",desc:"Approved รอบแรก",status:"approved"}],
      sales:{price:390,qtySold:0}}),
    J({jobNo:"MD-125",product:"Flannel Overshirt",customer:"Harbor Cloth",sku:"SH-041",productType:"Shirt",
      qty:100,prodQty:100,startDate:"2026-08-16",dueDate:"2026-09-05",responsible:"u1",status:"wait_prod",
      history:mkHist([["new","2026-08-16"],["wait_fabric","2026-08-16"],["fabric_ready","2026-08-19"],["sampling","2026-08-20"],["sample_ok","2026-08-24"],["wait_prod","2026-08-24"]]),
      samples:[{no:1,date:"2026-08-20",desc:"Approved",status:"approved"}],
      materials:[{id:"m1",type:"Fabric",name:"Flannel ลายสก็อต",supplier:"IndigoMill",qty:130,unit:"m",costPerUnit:145,flatCost:0}],
      costs:{pattern:800,sample:1000},
      sales:{price:890,qtySold:0}}),
    J({jobNo:"MD-126",product:"Satin Slip Dress",customer:"BEYOND Studio",sku:"DR-012",productType:"Dress",
      qty:90,prodQty:90,startDate:"2026-08-14",dueDate:"2026-09-01",priority:"high",responsible:"u3",status:"rework",
      notes:"เจอตะเข็บย่นช่วงชายกระโปรง 8 ตัว — กำลังแก้",
      history:mkHist([["new","2026-08-14"],["wait_fabric","2026-08-14"],["fabric_ready","2026-08-15"],["sampling","2026-08-16"],["sample_ok","2026-08-18"],["wait_prod","2026-08-18"],["cutting","2026-08-19"],["sewing","2026-08-21"],["qc","2026-08-26"],["rework","2026-08-27"]]),
      samples:[{no:1,date:"2026-08-16",desc:"Approved",status:"approved"}],
      materials:[{id:"m1",type:"Fabric",name:"Satin Silky",supplier:"EcoFab",qty:110,unit:"m",costPerUnit:160,flatCost:0}],
      costs:{pattern:900,sample:1100,cutting:1300,sewing:5400,qc:600},
      sales:{price:990,qtySold:0},
      qc:{cutting:90,sewing:90,qcPass:82,defect:8,rework:8,completed:0,delivered:0}})
  ];
  /* seed per-status activity from history */
  jobs.forEach(j=>{
    if(!j.activity.length){
      j.activity = j.history.map((h,i)=>({
        ts: parseD(h.start).getTime()+9*36e5+i*60e4,
        user: "seed",
        action: i===0? "Created Job" : `Status: ${stLabel(j.history[i-1].status)} → ${stLabel(h.status)}`
      }));
    }
  });
  return {schema:1, savedAt:Date.now(), users, jobs};
}

/* ================= STORE / PERSISTENCE ================= */
const LS_KEY="gpms-db-v1", LS_USER="gpms-user", LS_THEME="gpms-theme";
const state={ db:null, mode:"local", artifact:null, filesOk:true, currentUser:null,
  openJobId:null, jobTab:"info", bizPeriod:"month", calCursor:new Date(), calView:"month",
  saveTimer:null, dirty:false };

function loadLocal(){
  try{ const raw=localStorage.getItem(LS_KEY); if(raw) return JSON.parse(raw); }catch(e){}
  return null;
}
function loadEmbed(){
  try{ const el=$("#db-embed"); const v=JSON.parse(el.textContent); return v && v.jobs ? v : null; }catch(e){ return null; }
}
function setSyncChip(cls,text){
  const chip=$("#sync-chip"); chip.className=cls; chip.querySelector("#sync-text").textContent=text;
}
function save(reason){
  state.db.savedAt=Date.now();
  if(state.mode==="sheets"){ gsQueue(); refreshAll(); return; }
  try{ localStorage.setItem(LS_KEY,JSON.stringify(state.db)); }catch(e){}
  $("#db-stamp").textContent="อัปเดตล่าสุด "+fmtDT(state.db.savedAt);
  if(state.mode==="shared"){
    state.dirty=true; setSyncChip("saving","กำลังซิงค์…");
    clearTimeout(state.saveTimer);
    state.saveTimer=setTimeout(publishShared, 2500);
  }
  refreshAll();
}
async function publishShared(){
  if(!state.artifact || !state.dirty) return;
  state.dirty=false;
  const json=JSON.stringify(state.db);
  try{
    if(state.filesOk){
      try{
        await state.artifact.publish({"data/db.json":{content:json,contentType:"application/json"}});
        setSyncChip("","ซิงค์กับทีมแล้ว");
        return;
      }catch(e){
        if(e && (e.code==="capability_disabled"||e.code==="capability_removed"||e.code==="read_only_path")){ state.filesOk=false; }
        else throw e;
      }
    }
    /* html-form fallback: page reloads after publish — stash UI state first */
    stashUi();
    const safe=json.replace(/</g,"\\u003c");
    const html=PRISTINE_HTML.replace(/(<script type="application\/json" id="db-embed">)[\s\S]*?(<\/script>)/, `$1${safe}$2`);
    await state.artifact.publish(html);
    setSyncChip("","ซิงค์กับทีมแล้ว");
  }catch(e){
    if(e && e.code==="conflict"){ stashUi(); /* view will reload to newer version */ }
    else if(e && (e.code==="not_writer"||e.code==="not_granted")){
      state.mode="local"; setSyncChip("local","ดูอย่างเดียว — บันทึกเฉพาะเครื่องนี้");
    }else if(e && e.code==="rate_limited"){
      state.dirty=true; clearTimeout(state.saveTimer); state.saveTimer=setTimeout(publishShared, 15000);
      setSyncChip("saving","กำลังซิงค์… (รอคิว)");
    }else{
      setSyncChip("error","ซิงค์ไม่สำเร็จ — เก็บไว้ในเครื่องแล้ว");
    }
  }
}
function stashUi(){
  try{ sessionStorage.setItem("gpms-ui",JSON.stringify({
    page:currentPage, openJobId:state.openJobId, jobTab:state.jobTab, bizPeriod:state.bizPeriod
  })); }catch(e){}
}
function restoreUi(){
  try{
    const raw=sessionStorage.getItem("gpms-ui"); if(!raw) return; sessionStorage.removeItem("gpms-ui");
    const ui=JSON.parse(raw);
    if(ui.bizPeriod) state.bizPeriod=ui.bizPeriod;
    if(ui.page) showPage(ui.page);
    if(ui.openJobId && findJob(ui.openJobId)){ state.jobTab=ui.jobTab||"info"; openJob(ui.openJobId); }
  }catch(e){}
}
function findJob(id){ return state.db.jobs.find(j=>j.id===id||j.jobNo===id); }
function userName(id){ const u=state.db.users.find(u=>u.id===id); return u? u.name : "—"; }
function userRole(id){ const u=state.db.users.find(u=>u.id===id); return u? u.role : ""; }
function curUser(){ return state.currentUser? state.currentUser.name : "ไม่ระบุ"; }
function logAct(job,action){
  job.activity.push({ts:Date.now(),user:curUser(),action});
}
</script>
<script>
"use strict";
/* ================= NAVIGATION ================= */
let currentPage="board";
const PAGE_TITLES={board:"Kanban Board",dashboard:"Dashboard",business:"Business Dashboard",performance:"Production Performance",calendar:"Calendar / Gantt",team:"Team Workload"};
function showPage(p){
  currentPage=p;
  $$(".page").forEach(el=>el.classList.toggle("active", el.id==="page-"+p));
  $$("#nav .nav-item").forEach(b=>b.classList.toggle("active", b.dataset.page===p));
  $("#page-title").textContent=PAGE_TITLES[p]||p;
  renderPage(p);
}
function renderPage(p){
  if(p==="board") renderKanban();
  else if(p==="dashboard") renderDashboard();
  else if(p==="business") renderBusiness();
  else if(p==="performance") renderPerformance();
  else if(p==="calendar") renderCalendar();
  else if(p==="team") renderTeam();
}
function refreshAll(){
  renderPage(currentPage);
  renderNotifBadge();
  if(state.openJobId && $("#modal-job").classList.contains("open")) renderJobDetail();
}

/* ================= FILTERS ================= */
const filters={jobno:"",customer:"",product:"",status:"",priority:"",due:"",person:""};
function applyFilterUi(){
  const map={jobno:"#f-jobno",customer:"#f-customer",product:"#f-product",status:"#f-status",priority:"#f-priority",due:"#f-due",person:"#f-person"};
  let any=false;
  for(const k in map){ const el=$(map[k]); el.classList.toggle("has-value",!!filters[k]); if(filters[k]) any=true; }
  $("#f-clear").hidden=!any;
}
function jobMatches(j){
  const inc=(v,q)=>String(v||"").toLowerCase().includes(q.toLowerCase());
  if(filters.jobno && !inc(j.jobNo,filters.jobno)) return false;
  if(filters.customer && !inc(j.customer,filters.customer)) return false;
  if(filters.product && !(inc(j.product,filters.product)||inc(j.sku,filters.product))) return false;
  if(filters.status && j.status!==filters.status) return false;
  if(filters.priority && (j.priority||"normal")!==filters.priority) return false;
  if(filters.person && j.responsible!==filters.person) return false;
  if(filters.due){
    const di=dueInfo(j), t=todayIso();
    if(filters.due==="overdue" && di.state!=="overdue") return false;
    if(filters.due==="today" && j.dueDate!==t) return false;
    if(filters.due==="3d" && !(di.days!=null && di.state!=="overdue" && di.state!=="done" && di.days<=3)) return false;
    if(filters.due==="7d" && !(di.days!=null && di.state!=="overdue" && di.state!=="done" && di.days<=7)) return false;
    if(filters.due==="month"){ const d=parseD(j.dueDate), n=new Date(); if(!d||d.getMonth()!==n.getMonth()||d.getFullYear()!==n.getFullYear()) return false; }
  }
  return true;
}

/* ================= KANBAN ================= */
function priorityChip(j){
  if(j.priority==="high") return `<span class="chip critical">🔥 HIGH</span>`;
  if(j.priority==="low") return `<span class="chip neutral">Low</span>`;
  return "";
}
function dueChipHtml(j){
  const di=dueInfo(j);
  if(di.state==="overdue") return `<span class="chip critical">🔴 OVERDUE ${di.days} วัน</span>`;
  if(di.state==="duesoon") return `<span class="chip warn">⚠ อีก ${di.days} วัน</span>`;
  return "";
}
function jobCardHtml(j){
  const di=dueInfo(j), prog=jobProgress(j);
  const dueCls=di.state==="overdue"?"overdue":di.state==="duesoon"?"duesoon":"";
  return `<div class="jcard ${dueCls}" draggable="true" data-id="${j.id}" role="button" tabindex="0" aria-label="${esc(j.jobNo)} ${esc(j.product)}">
    <div class="jcard-top">
      <span class="jcard-no mono">${esc(j.jobNo)}</span>
      <span class="jcard-flags">${priorityChip(j)}</span>
    </div>
    <div class="jcard-name">${esc(j.product)}</div>
    <div class="jcard-meta">
      <span>เซล: <b>${esc(j.customer)}</b></span>
      <span>SKU: <b class="mono">${esc(j.sku||"—")}</b></span>
      <span>จำนวน: <b class="num">${money(j.qty)} pcs</b></span>
      <span class="jcard-due ${dueCls}">Due: <b>${fmtD(j.dueDate)}</b></span>
    </div>
    ${dueChipHtml(j)?`<div class="mt8">${dueChipHtml(j)}</div>`:""}
    <div class="jcard-bot">
      <span class="avatar" title="${esc(userName(j.responsible))} · ${esc(userRole(j.responsible))}">${esc(userName(j.responsible).slice(0,2))}</span>
      <div class="prog"><i class="${prog>=100?'done':''}" style="width:${prog}%"></i></div>
      <span class="jcard-prog-t num">${prog}%</span>
    </div>
  </div>`;
}
function renderKanban(){
  const board=$("#kanban");
  const jobs=state.db.jobs.filter(jobMatches);
  $("#board-count").textContent=`แสดง ${jobs.length} / ${state.db.jobs.length} งาน`;
  board.innerHTML=STATUSES.map(s=>{
    const list=jobs.filter(j=>j.status===s.key);
    return `<div class="kcol" data-status="${s.key}">
      <div class="kcol-head">
        <span class="kcol-dot" style="background:${s.dot}"></span>
        <span class="kcol-title" title="${esc(s.label)}">${esc(s.label)}</span>
        <span class="kcol-count num">${list.length}</span>
      </div>
      <div class="kcol-body" data-status="${s.key}">
        ${list.map(jobCardHtml).join("") || `<div class="kcol-empty">ลากงานมาวางที่นี่</div>`}
      </div>
    </div>`;
  }).join("");
  bindKanbanEvents();
  applyFilterUi();
}
let dragJobId=null;
function bindKanbanEvents(){
  $$("#kanban .jcard").forEach(card=>{
    card.addEventListener("click",()=>openJob(card.dataset.id));
    card.addEventListener("keydown",e=>{ if(e.key==="Enter"||e.key===" "){ e.preventDefault(); openJob(card.dataset.id);} });
    card.addEventListener("dragstart",e=>{
      dragJobId=card.dataset.id; card.classList.add("dragging");
      e.dataTransfer.effectAllowed="move";
      try{ e.dataTransfer.setData("text/plain",dragJobId); }catch(_){}
    });
    card.addEventListener("dragend",()=>{ card.classList.remove("dragging"); dragJobId=null; $$(".kcol").forEach(c=>c.classList.remove("drag-over")); });
  });
  $$("#kanban .kcol").forEach(col=>{
    col.addEventListener("dragover",e=>{ e.preventDefault(); e.dataTransfer.dropEffect="move"; col.classList.add("drag-over"); });
    col.addEventListener("dragleave",e=>{ if(!col.contains(e.relatedTarget)) col.classList.remove("drag-over"); });
    col.addEventListener("drop",e=>{
      e.preventDefault(); col.classList.remove("drag-over");
      const id=dragJobId||e.dataTransfer.getData("text/plain");
      if(id) changeStatus(id,col.dataset.status);
    });
  });
}
function changeStatus(jobId,newStatus,note){
  const j=findJob(jobId); if(!j||j.status===newStatus) return;
  const old=j.status, now=todayIso();
  const last=j.history[j.history.length-1];
  if(last && !last.end) last.end=now;
  j.history.push({status:newStatus,start:now,end:null,by:curUser(),note:note||""});
  j.status=newStatus;
  if(newStatus==="delivered" && !num(j.qc.delivered)) j.qc.delivered=num(j.qc.completed)||num(j.qty);
  logAct(j,`Status: ${stLabel(old)} → ${stLabel(newStatus)}`);
  save();
  toast(`${j.jobNo} → ${stLabel(newStatus)}`);
}

/* ================= NEW JOB ================= */
function openModal(id){ $("#"+id).classList.add("open"); }
function closeModal(id){ $("#"+id).classList.remove("open"); if(id==="modal-job") state.openJobId=null; }
function fillPersonSelects(){
  const opts=state.db.users.map(u=>`<option value="${u.id}">${esc(u.name)} · ${esc(u.role)}</option>`).join("");
  $("#nj-person").innerHTML=opts;
  $("#f-person").innerHTML=`<option value="">ผู้รับผิดชอบ: ทั้งหมด</option>`+opts;
  $("#user-select").innerHTML=state.db.users.map(u=>`<option value="${u.id}">👤 ${esc(u.name)} (${esc(u.role)})</option>`).join("");
  $("#f-status").innerHTML=`<option value="">สถานะ: ทั้งหมด</option>`+STATUSES.map(s=>`<option value="${s.key}">${esc(s.label)}</option>`).join("");
  $("#dl-customers").innerHTML=[...new Set(state.db.jobs.map(j=>j.customer))].map(c=>`<option value="${esc(c)}">`).join("");
}
function suggestJobNo(){
  const nums=state.db.jobs.map(j=>{ const m=/^MD-(\d+)$/.exec(j.jobNo); return m? +m[1] : 0; });
  return "MD-"+(Math.max(110,...nums)+1);
}
function newJobOpen(){
  $("#nj-jobno").value=suggestJobNo();
  $("#nj-customer").value=""; $("#nj-product").value=""; $("#nj-sku").value="";
  $("#nj-qty").value="0"; $("#nj-sampleqty").value="1";
  $("#nj-start").value=todayIso(); $("#nj-due").value="";
  $("#nj-priority").value="normal"; $("#nj-notes").value="";
  openModal("modal-new");
  $("#nj-jobno").focus();
}
function newJobSave(){
  const jobNo=$("#nj-jobno").value.trim(), customer=$("#nj-customer").value.trim(),
        product=$("#nj-product").value.trim(), due=$("#nj-due").value;
  if(!jobNo||!customer||!product||!due){ toast("กรอก Job No. / เซลเจ้าของงาน / Product / Due Date ให้ครบ", true); return; }
  if(state.db.jobs.some(j=>j.jobNo.toLowerCase()===jobNo.toLowerCase())){ toast(`Job No. ${jobNo} มีอยู่แล้ว`, true); return; }
  const start=$("#nj-start").value||todayIso();
  const j={
    id:uid("job"), jobNo, customer, product,
    sku:$("#nj-sku").value.trim(), productType:$("#nj-type").value,
    qty:num($("#nj-qty").value), sampleQty:num($("#nj-sampleqty").value), prodQty:num($("#nj-qty").value),
    startDate:start, dueDate:due, priority:$("#nj-priority").value,
    responsible:$("#nj-person").value, notes:$("#nj-notes").value.trim(), attachments:[],
    status:"new", history:[{status:"new",start,end:null,by:curUser(),note:""}],
    materials:[], costs:{}, sales:{price:0,qtySold:0},
    qc:{cutting:0,sewing:0,qcPass:0,defect:0,rework:0,completed:0,delivered:0},
    samples:[], activity:[]
  };
  logAct(j,"Created Job");
  logAct(j,`Assigned to ${userName(j.responsible)} (${userRole(j.responsible)})`);
  state.db.jobs.unshift(j);
  save();
  closeModal("modal-new");
  toast(`สร้าง ${jobNo} แล้ว`);
  showPage("board");
}

/* ================= GLOBAL SEARCH ================= */
function searchJobs(q){
  q=q.trim().toLowerCase(); if(!q) return [];
  return state.db.jobs.map(j=>{
    const fields=[j.jobNo,j.customer,j.product,j.sku,stLabel(j.status),userName(j.responsible)];
    const hit=fields.findIndex(f=>String(f||"").toLowerCase().includes(q));
    return hit>=0? {j,score:(j.jobNo.toLowerCase()===q?0:1)+hit*0.1} : null;
  }).filter(Boolean).sort((a,b)=>a.score-b.score).slice(0,12).map(x=>x.j);
}
let srSel=-1;
function renderSearchResults(list){
  const box=$("#search-results");
  if(!list.length){ box.classList.remove("open"); box.innerHTML=""; return; }
  box.innerHTML=list.map((j,i)=>`<div class="sr-item ${i===srSel?'sel':''}" data-id="${j.id}">
    <span class="sr-jobno mono">${esc(j.jobNo)}</span>
    <span>${esc(j.product)} · <span class="muted">${esc(j.customer)}</span></span>
    <span class="sr-meta">${esc(stLabel(j.status))} · ${esc(userName(j.responsible))}</span>
  </div>`).join("");
  box.classList.add("open");
  box.querySelectorAll(".sr-item").forEach(el=>el.addEventListener("mousedown",e=>{ e.preventDefault(); openJob(el.dataset.id); closeSearch(); }));
}
function closeSearch(){ $("#search-results").classList.remove("open"); $("#global-search").value=""; srSel=-1; }

/* ================= NOTIFICATIONS ================= */
function buildNotifs(){
  const out=[], t=todayIso();
  state.db.jobs.forEach(j=>{
    const di=dueInfo(j);
    const stDays = j.history.length? Math.max(0,daysDiff(j.history[j.history.length-1].start,t)) : 0;
    if(di.state==="overdue") out.push({ic:"🔴",cls:"critical",t:`${j.jobNo} — OVERDUE ${di.days} วัน`,d:`${j.product} · สถานะ: ${stLabel(j.status)}`,id:j.id,w:0});
    else if(di.state==="duesoon") out.push({ic:"🟠",cls:"warn",t:`${j.jobNo} — Due in ${di.days===0?"วันนี้":di.days+" days"}`,d:`${j.product} · สถานะ: ${stLabel(j.status)} · ค้างมา ${stDays} วัน`,id:j.id,w:1});
    if(j.status==="wait_fabric" && stDays>=2) out.push({ic:"🟡",cls:"warn",t:`${j.jobNo} — WAITING MATERIAL ${stDays} วัน`,d:`${j.product} · รอผ้าตั้งแต่ ${fmtD(j.history[j.history.length-1].start)}`,id:j.id,w:2});
    if(["sampling","sample_revise"].includes(j.status) && stDays>=3) out.push({ic:"🔵",cls:"info",t:`${j.jobNo} — WAITING APPROVAL ${stDays} วัน`,d:`${j.product} · ${stLabel(j.status)}`,id:j.id,w:3});
    if(j.status==="done_prod") out.push({ic:"🟢",cls:"good",t:`${j.jobNo} — ผลิตเสร็จแล้ว รอส่งมอบ`,d:j.product,id:j.id,w:4});
    const qi=qtyIssues(j);
    if(qi.length && !["closed"].includes(j.status)) out.push({ic:"⚠️",cls:"warn",t:`${j.jobNo} — จำนวนไม่ตรงกัน`,d:qi[0],id:j.id,w:2});
  });
  return out.sort((a,b)=>a.w-b.w);
}
function renderNotifBadge(){
  const n=buildNotifs();
  const urgent=n.filter(x=>x.w<=2).length;
  $("#notif-count").hidden=!urgent; $("#notif-count").textContent=urgent;
  const od=state.db.jobs.filter(j=>dueInfo(j).state==="overdue").length;
  $("#nav-overdue").hidden=!od; $("#nav-overdue").textContent=od;
}
function renderNotifPanel(){
  const n=buildNotifs(), panel=$("#notif-panel");
  panel.innerHTML=`<div class="notif-head">การแจ้งเตือน <span class="chip neutral" style="margin-left:8px">${n.length}</span></div>`+
    (n.length? n.map(x=>`<div class="notif-item" data-id="${x.id}">
      <span class="notif-ic">${x.ic}</span>
      <div><div class="notif-t">${esc(x.t)}</div><div class="notif-d">${esc(x.d)}</div></div>
    </div>`).join("") : `<div class="empty-state">ไม่มีการแจ้งเตือน 🎉</div>`);
  panel.querySelectorAll(".notif-item").forEach(el=>el.addEventListener("click",()=>{ panel.classList.remove("open"); openJob(el.dataset.id); }));
}
</script>
<script>
"use strict";
/* ================= JOB DETAIL ================= */
function openJob(id){
  const j=findJob(id); if(!j) return;
  state.openJobId=j.id;
  if(!$("#modal-job").classList.contains("open")){ state.jobTab=state.jobTab||"info"; }
  openModal("modal-job");
  renderJobDetail();
}
function renderJobDetail(){
  const j=findJob(state.openJobId); if(!j) return;
  const di=dueInfo(j), st=ST[j.status];
  $("#jd-header").innerHTML=`<div class="jd-head">
    <div>
      <div class="jd-no mono">${esc(j.jobNo)}</div>
      <div class="jd-name">${esc(j.product)}</div>
      <div class="jd-chips">
        <span class="chip info"><span class="kcol-dot" style="background:${st.dot};width:7px;height:7px"></span>${esc(st.label)}</span>
        ${priorityChip(j)}
        ${dueChipHtml(j)}
        <span class="chip neutral">${esc(j.customer)}</span>
        <span class="chip neutral">👤 ${esc(userName(j.responsible))} · ${esc(userRole(j.responsible))}</span>
      </div>
    </div>
    <div class="jd-side">
      <div class="small muted">Progress</div>
      <div class="flex" style="gap:8px;justify-content:flex-end">
        <div class="prog" style="width:120px"><i class="${jobProgress(j)>=100?'done':''}" style="width:${jobProgress(j)}%"></i></div>
        <b class="num">${jobProgress(j)}%</b>
      </div>
      <div class="small muted mt8">เริ่ม ${fmtDY(j.startDate)} · กำหนดส่ง <b>${fmtDY(j.dueDate)}</b></div>
      <div class="mt8"><select id="jd-status-select" title="เปลี่ยนสถานะ">${STATUSES.map(s=>`<option value="${s.key}" ${s.key===j.status?"selected":""}>${esc(s.label)}</option>`).join("")}</select></div>
    </div>
  </div>`;
  $("#jd-status-select").addEventListener("change",e=>changeStatus(j.id,e.target.value));
  $$("#jd-tabs .tab").forEach(t=>t.classList.toggle("active",t.dataset.tab===state.jobTab));
  const R={info:jdInfo,timeline:jdTimeline,samples:jdSamples,materials:jdMaterials,costing:jdCosting,sales:jdSales,qty:jdQty,activity:jdActivity};
  $("#jd-body").innerHTML=(R[state.jobTab]||jdInfo)(j);
  bindJdEvents(j);
  /* ค่าตอนแสดงฟอร์ม — ใช้เช็คว่าผู้ใช้พิมพ์ค้างอยู่ไหม และบันทึกเฉพาะช่องที่แก้จริงเมื่อทีมอัปเดตงานเดียวกัน */
  state.jdBase=JSON.parse(JSON.stringify(j));
  state.jdSnap=jdFormSnap();
}
function jdFormSnap(){
  return $$("#jd-body input, #jd-body select, #jd-body textarea").map(e=>e.type==="checkbox"?e.checked:e.value).join("\u0001");
}

/* ---------- Tab: Info ---------- */
function jdInfo(j){
  const f=(label,html)=>`<div class="field"><label>${label}</label>${html}</div>`;
  return `<div class="fgrid">
    ${f("Job No.",`<input id="ji-jobno" class="mono" value="${esc(j.jobNo)}">`)}
    ${f("เซลเจ้าของงาน",`<input id="ji-customer" list="dl-customers" value="${esc(j.customer)}">`)}
    ${f("Product Name",`<input id="ji-product" value="${esc(j.product)}">`)}
    ${f("SKU",`<input id="ji-sku" class="mono" value="${esc(j.sku)}">`)}
    ${f("Product Type",`<select id="ji-type">${["Shirt","T-Shirt","Polo","Dress","Pants","Skirt","Jacket","Uniform","Other"].map(t=>`<option ${t===j.productType?"selected":""}>${t}</option>`).join("")}</select>`)}
    ${f("Order Quantity (pcs)",`<input id="ji-qty" type="number" min="0" value="${num(j.qty)}">`)}
    ${f("Sample Quantity (pcs)",`<input id="ji-sampleqty" type="number" min="0" value="${num(j.sampleQty)}">`)}
    ${f("Production Quantity (pcs)",`<input id="ji-prodqty" type="number" min="0" value="${num(j.prodQty)}">`)}
    ${f("Start Date",`<input id="ji-start" type="date" value="${esc(j.startDate)}">`)}
    ${f("Due Date",`<input id="ji-due" type="date" value="${esc(j.dueDate)}">`)}
    ${f("Priority",`<select id="ji-priority">${[["normal","Normal"],["high","🔥 High"],["low","Low"]].map(([v,l])=>`<option value="${v}" ${v===(j.priority||"normal")?"selected":""}>${l}</option>`).join("")}</select>`)}
    ${f("ผู้รับผิดชอบหลัก",`<select id="ji-person">${state.db.users.map(u=>`<option value="${u.id}" ${u.id===j.responsible?"selected":""}>${esc(u.name)} · ${esc(u.role)}</option>`).join("")}</select>`)}
    <div class="field full"><label>Notes</label><textarea id="ji-notes" rows="2">${esc(j.notes)}</textarea></div>
    <div class="field full"><label>Attachments (ลิงก์ไฟล์ / ชื่อเอกสารอ้างอิง)</label>
      <div class="subtle-list" id="ji-atts">
        ${(j.attachments||[]).map((a,i)=>`<div class="flex"><span>📎 ${/^https?:\/\//.test(a)?`<a href="${esc(a)}" target="_blank" rel="noopener">${esc(a)}</a>`:esc(a)}</span><span class="spacer"></span><button class="btn ghost sm" data-del-att="${i}">ลบ</button></div>`).join("")||`<span class="muted small">ยังไม่มีไฟล์แนบ</span>`}
      </div>
      <div class="flex mt8"><input id="ji-att-new" placeholder="เช่น https://drive… หรือ 'Tech pack v2.pdf'" style="flex:1"><button class="btn sm" id="ji-att-add">＋ เพิ่ม</button></div>
    </div>
  </div>
  <div class="flex mt14" style="justify-content:space-between">
    <button class="btn danger sm" id="ji-delete">ลบ Job นี้</button>
    <button class="btn primary" id="ji-save">บันทึกข้อมูลงาน</button>
  </div>`;
}
function jdInfoSave(j){
  const changes=[], base=state.jdBase||j;
  const setIf=(key,val,label)=>{
    if(JSON.stringify(base[key])===JSON.stringify(val)) return; /* ช่องนี้ผู้ใช้ไม่ได้แก้ — ไม่ทับค่าที่ทีมเพิ่งอัปเดต */
    if(JSON.stringify(j[key])!==JSON.stringify(val)){ j[key]=val; changes.push(label); }
  };
  setIf("jobNo",$("#ji-jobno").value.trim()||j.jobNo,"Job No.");
  setIf("customer",$("#ji-customer").value.trim(),"เซลเจ้าของงาน");
  setIf("product",$("#ji-product").value.trim(),"Product");
  setIf("sku",$("#ji-sku").value.trim(),"SKU");
  setIf("productType",$("#ji-type").value,"Product Type");
  setIf("qty",num($("#ji-qty").value),"Order Qty");
  setIf("sampleQty",num($("#ji-sampleqty").value),"Sample Qty");
  setIf("prodQty",num($("#ji-prodqty").value),"Production Qty");
  setIf("startDate",$("#ji-start").value,"Start Date");
  setIf("dueDate",$("#ji-due").value,"Due Date");
  setIf("priority",$("#ji-priority").value,"Priority");
  const np=$("#ji-person").value;
  if(np!==base.responsible && np!==j.responsible){ j.responsible=np; changes.push("ผู้รับผิดชอบ"); logAct(j,`Assigned to ${userName(np)} (${userRole(np)})`); }
  setIf("notes",$("#ji-notes").value.trim(),"Notes");
  if(changes.length){ logAct(j,"แก้ไขข้อมูลงาน: "+changes.join(", ")); save(); toast("บันทึกแล้ว"); }
  else toast("ไม่มีการเปลี่ยนแปลง");
}

/* ---------- Tab: Timeline ---------- */
function jdTimeline(j){
  const stages=stageDurations(j);
  const items=stages.map((h,i)=>{
    const st=ST[h.status]||{dot:"#8b8d94",label:h.status};
    const open=!h.end;
    return `<div class="tl-item">
      <span class="tl-dot" style="background:${st.dot}"></span>
      <div class="tl-date">${fmtDY(h.start)}${h.end?` → ${fmtDY(h.end)}`:" → ปัจจุบัน"}</div>
      <div class="tl-title">${i===0?"🟢 Created Job — ":""}${esc(st.label)} ${open?'<span class="chip info">กำลังดำเนินการ</span>':""}</div>
      <div class="tl-meta">ใช้เวลา <b class="num">${durText(h.days)}</b>${h.by&&h.by!=="seed"?` · โดย ${esc(h.by)}`:""}</div>
      ${h.note?`<div class="tl-note">📝 ${esc(h.note)}</div>`:""}
    </div>`;
  }).join("");
  const total=stages.reduce((s,h)=>s+h.days,0);
  const cur=stages[stages.length-1];
  return `<div class="grid3">
    <div><div class="tl">${items||'<div class="empty-state">ยังไม่มีประวัติ</div>'}</div></div>
    <div>
      <div class="card" style="background:var(--surface2)">
        <div class="card-title">สรุปเวลา</div>
        <div class="stat-line"><span>Lead time สะสม</span><b class="num">${durText(total)}</b></div>
        <div class="stat-line"><span>สถานะปัจจุบันค้างมา</span><b class="num">${cur?durText(cur.days):"—"}</b></div>
        <div class="stat-line"><span>ขั้นตอนที่ผ่านแล้ว</span><b class="num">${stages.length} ขั้น</b></div>
        <div class="stat-line"><span>ขั้นที่ใช้เวลานานสุด</span><b>${stages.length? esc(stLabel(stages.reduce((a,b)=>a.days>b.days?a:b).status)) : "—"}</b></div>
      </div>
      <div class="card mt14" style="background:var(--surface2)">
        <div class="card-title">เพิ่มโน้ตให้สถานะปัจจุบัน</div>
        <textarea id="tl-note" rows="2" style="width:100%" placeholder="เช่น รอผ้าจาก supplier / ลูกค้าขอเลื่อน…">${esc(cur?.note||"")}</textarea>
        <button class="btn sm mt8" id="tl-note-save">บันทึกโน้ต</button>
      </div>
    </div>
  </div>`;
}

/* ---------- Tab: Samples ---------- */
function jdSamples(j){
  const n=(j.samples||[]).length;
  const approved=(j.samples||[]).some(s=>s.status==="approved");
  return `<div class="flex mb8">
    <span class="chip info">Sample Revision: ${n} ${n===1?"Time":"Times"}</span>
    ${approved?'<span class="chip good">✓ Approved แล้ว</span>':'<span class="chip warn">ยังไม่ Approved</span>'}
    <span class="muted small">Sample Quantity: ${num(j.sampleQty)} pcs</span>
  </div>
  <div class="tbl-wrap"><table class="tbl">
    <thead><tr><th style="width:70px">Sample</th><th style="width:110px">วันที่</th><th>รายละเอียด / สิ่งที่แก้</th><th style="width:120px">ผล</th><th style="width:50px"></th></tr></thead>
    <tbody>${(j.samples||[]).map((s,i)=>`<tr>
      <td><b>#${s.no}</b></td><td>${fmtDY(s.date)}</td><td>${esc(s.desc)}</td>
      <td>${s.status==="approved"?'<span class="chip good">Approved</span>':s.status==="revised"?'<span class="chip serious">แก้ไข</span>':'<span class="chip warn">รอผล</span>'}</td>
      <td class="r"><button class="btn ghost sm" data-del-sample="${i}" title="ลบ">✕</button></td>
    </tr>`).join("")||`<tr><td colspan="5" class="empty-state">ยังไม่มีตัวอย่าง</td></tr>`}</tbody>
  </table></div>
  <div class="card mt14" style="background:var(--surface2)">
    <div class="card-title">เพิ่มรอบตัวอย่าง</div>
    <div class="flex" style="flex-wrap:wrap">
      <input id="sm-date" type="date" value="${todayIso()}">
      <input id="sm-desc" placeholder="รายละเอียด เช่น แก้ Pattern / ปรับขนาดแขน" style="flex:1;min-width:220px">
      <select id="sm-status"><option value="pending">รอผล</option><option value="revised">ต้องแก้ไข</option><option value="approved">Approved</option></select>
      <button class="btn primary sm" id="sm-add">＋ เพิ่ม Sample #${n+1}</button>
    </div>
  </div>`;
}

/* ---------- Tab: Materials ---------- */
function jdMaterials(j){
  const rows=(j.materials||[]).map((m,i)=>{
    const line=num(m.qty)*num(m.costPerUnit)+num(m.flatCost);
    return `<tr>
      <td><select data-mat="${i}" data-k="type">${MAT_TYPES.map(t=>`<option ${t===m.type?"selected":""}>${t}</option>`).join("")}</select></td>
      <td><input data-mat="${i}" data-k="name" value="${esc(m.name)}" placeholder="ชื่อวัสดุ"></td>
      <td><input data-mat="${i}" data-k="supplier" value="${esc(m.supplier||"")}" placeholder="Supplier"></td>
      <td><input class="w-num num" data-mat="${i}" data-k="qty" type="number" min="0" step="any" value="${num(m.qty)||""}"></td>
      <td><input data-mat="${i}" data-k="unit" value="${esc(m.unit||"")}" placeholder="m / pcs" style="max-width:70px"></td>
      <td><input class="w-num num" data-mat="${i}" data-k="costPerUnit" type="number" min="0" step="any" value="${num(m.costPerUnit)||""}"></td>
      <td><input class="w-num num" data-mat="${i}" data-k="flatCost" type="number" min="0" step="any" value="${num(m.flatCost)||""}"></td>
      <td class="r num"><b>${money2(line)}</b></td>
      <td class="r"><button class="btn ghost sm" data-del-mat="${i}" title="ลบ">✕</button></td>
    </tr>`;
  }).join("");
  return `<div class="tbl-wrap"><table class="tbl">
    <thead><tr><th>ประเภท</th><th>วัสดุ</th><th>Supplier</th><th class="r">จำนวน</th><th>หน่วย</th><th class="r">ราคา/หน่วย</th><th class="r">เหมา (บาท)</th><th class="r">รวม (บาท)</th><th></th></tr></thead>
    <tbody>${rows||`<tr><td colspan="9" class="empty-state">ยังไม่มีวัสดุ — กด "เพิ่มวัสดุ"</td></tr>`}</tbody>
    <tfoot><tr><td colspan="7" class="r" style="font-weight:700">Material Cost รวม</td><td class="r num" style="font-weight:700">${money2(materialCost(j))}</td><td></td></tr></tfoot>
  </table></div>
  <div class="flex mt14">
    <button class="btn sm" id="mat-add">＋ เพิ่มวัสดุ</button>
    <span class="muted small">พิมพ์แล้วระบบคำนวณและบันทึกอัตโนมัติ · รวม = จำนวน × ราคา/หน่วย + เหมา</span>
  </div>`;
}

/* ---------- Tab: Costing ---------- */
function jdCosting(j){
  const mc=materialCost(j), pc=productionCost(j), tc=mc+pc;
  const q=num(j.prodQty)||num(j.qty);
  const matByType=MAT_TYPES.map(t=>{
    const v=(j.materials||[]).filter(m=>m.type===t).reduce((s,m)=>s+num(m.qty)*num(m.costPerUnit)+num(m.flatCost),0);
    return v>0?`<div class="stat-line"><span>${t}</span><b class="num">${money2(v)}</b></div>`:"";
  }).join("");
  return `<div class="grid2">
    <div class="card" style="background:var(--surface2)">
      <div class="card-title">Material Cost <span class="hint">จากแท็บ Materials</span></div>
      ${matByType||'<div class="muted small">ยังไม่มีวัสดุ</div>'}
      <div class="stat-line" style="border-top:1px solid var(--line2)"><span><b>รวม Material</b></span><b class="num">${money2(mc)} ฿</b></div>
    </div>
    <div class="card" style="background:var(--surface2)">
      <div class="card-title">Production Cost <span class="hint">พิมพ์แล้วบันทึกอัตโนมัติ</span></div>
      <div class="fgrid" style="grid-template-columns:1fr 1fr;gap:7px 12px">
        ${PROD_COST_FIELDS.map(([k,l])=>`<div class="field"><label>${l}</label><input class="num" data-cost="${k}" type="number" min="0" step="any" value="${num(j.costs?.[k])||""}" placeholder="0"></div>`).join("")}
      </div>
    </div>
  </div>
  <div class="kpi-row mt14" style="grid-template-columns:repeat(4,1fr)">
    <div class="kpi"><div class="kpi-label">Material Cost</div><div class="kpi-value num">${money(mc)} <small>฿</small></div></div>
    <div class="kpi"><div class="kpi-label">Production Cost</div><div class="kpi-value num">${money(pc)} <small>฿</small></div></div>
    <div class="kpi tone-accent"><div class="kpi-label">Total Cost</div><div class="kpi-value num">${money(tc)} <small>฿</small></div></div>
    <div class="kpi"><div class="kpi-label">Cost / Piece</div><div class="kpi-value num">${money2(q>0?tc/q:0)} <small>฿ / ${money(q)} pcs</small></div></div>
  </div>`;
}

/* ---------- Tab: Sales & Profit ---------- */
function jdSales(j){
  const tc=totalCost(j), sales=totalSales(j), gp=grossProfit(j), gm=grossMargin(j);
  const sold=num(j.sales?.qtySold), prodQ=num(j.prodQty)||num(j.qty);
  const maxV=Math.max(sales,tc,1);
  return `<div class="grid2">
    <div class="card" style="background:var(--surface2)">
      <div class="card-title">ข้อมูลการขาย</div>
      <div class="fgrid">
        <div class="field"><label>Selling Price / Piece (฿)</label><input id="sl-price" class="num" type="number" min="0" step="any" value="${num(j.sales?.price)||""}"></div>
        <div class="field"><label>Quantity Sold (pcs)</label><input id="sl-qty" class="num" type="number" min="0" value="${sold||""}"></div>
      </div>
      <div class="stat-line mt14"><span>Production Quantity</span><b class="num">${money(prodQ)} pcs</b></div>
      <div class="stat-line"><span>Quantity Sold</span><b class="num">${money(sold)} pcs (${prodQ?pct(sold/prodQ*100):"—"})</b></div>
      <div class="stat-line"><span>Total Sales</span><b class="num">${money(sales)} ฿</b></div>
    </div>
    <div class="card" style="background:var(--surface2)">
      <div class="card-title">Sales vs Cost</div>
      <div class="bar-h-row" style="grid-template-columns:70px 1fr 90px">
        <span class="lbl">Sales</span><div class="bar-h-track"><div class="bar-h-fill" style="width:${sales/maxV*100}%;background:var(--s1)"></div></div><span class="bar-h-val num">${money(sales)} ฿</span>
      </div>
      <div class="bar-h-row" style="grid-template-columns:70px 1fr 90px">
        <span class="lbl">Cost</span><div class="bar-h-track"><div class="bar-h-fill" style="width:${tc/maxV*100}%;background:var(--s2)"></div></div><span class="bar-h-val num">${money(tc)} ฿</span>
      </div>
      <div class="chart-legend mt8"><span class="leg-item"><span class="leg-swatch" style="background:var(--s1)"></span>Total Sales</span><span class="leg-item"><span class="leg-swatch" style="background:var(--s2)"></span>Total Cost</span></div>
    </div>
  </div>
  <div class="kpi-row mt14" style="grid-template-columns:repeat(4,1fr)">
    <div class="kpi"><div class="kpi-label">Total Sales</div><div class="kpi-value num">${money(sales)} <small>฿</small></div></div>
    <div class="kpi"><div class="kpi-label">Total Cost</div><div class="kpi-value num">${money(tc)} <small>฿</small></div></div>
    <div class="kpi ${gp>=0?"tone-good":"tone-critical"}"><div class="kpi-label">Gross Profit</div><div class="kpi-value num">${money(gp)} <small>฿</small></div></div>
    <div class="kpi ${gp>=0?"tone-good":"tone-critical"}"><div class="kpi-label">Gross Margin</div><div class="kpi-value num">${pct(gm)}</div></div>
  </div>`;
}

/* ---------- Tab: Quantity ---------- */
function jdQty(j){
  const q=j.qc||{}, issues=qtyIssues(j);
  const F=[["order","Order (ยอดสั่ง)",num(j.qty),true],["sample","Sample",num(j.sampleQty),true],
    ["cutting","Cutting (ตัดแล้ว)",num(q.cutting)],["sewing","Sewing (เย็บแล้ว)",num(q.sewing)],
    ["qcPass","QC Pass",num(q.qcPass)],["defect","Defect",num(q.defect)],["rework","Rework",num(q.rework)],
    ["completed","Completed",num(q.completed)],["delivered","Delivered",num(q.delivered)]];
  const maxQ=Math.max(num(j.qty),...F.map(f=>f[2]),1);
  return `${issues.length?`<div class="crit-banner">⚠ ตรวจพบจำนวนไม่สอดคล้องกัน:<br>• ${issues.map(esc).join("<br>• ")}</div>`:`<div class="warn-banner" style="background:var(--chip-good-bg);color:var(--good-text);border-color:var(--good)">✓ จำนวนสอดคล้องกันทุกขั้นตอน</div>`}
  <div class="grid2">
    <div class="card" style="background:var(--surface2)">
      <div class="card-title">บันทึกจำนวน (pcs) <span class="hint">พิมพ์แล้วบันทึกอัตโนมัติ</span></div>
      <div class="fgrid" style="grid-template-columns:1fr 1fr 1fr;gap:8px 12px">
        ${F.map(([k,l,v,ro])=>`<div class="field"><label>${l}</label><input class="num" data-qty="${k}" type="number" min="0" value="${v||""}" ${ro?'disabled title="แก้ที่แท็บข้อมูลงาน"':""}></div>`).join("")}
      </div>
    </div>
    <div class="card" style="background:var(--surface2)">
      <div class="card-title">Flow จำนวนงาน</div>
      ${F.map(([k,l,v])=>`<div class="bar-h-row" style="grid-template-columns:130px 1fr 56px">
        <span class="lbl">${l.split(" (")[0]}</span>
        <div class="bar-h-track"><div class="bar-h-fill" style="width:${v/maxQ*100}%;background:${k==="defect"?"var(--critical)":k==="rework"?"var(--serious)":k==="qcPass"||k==="completed"||k==="delivered"?"var(--s3)":"var(--s1)"}"></div></div>
        <span class="bar-h-val num">${money(v)}</span>
      </div>`).join("")}
      <div class="stat-line mt8"><span>Defect Rate</span><b class="num">${num(q.sewing)?pct(num(q.defect)/num(q.sewing)*100):"—"}</b></div>
    </div>
  </div>`;
}

/* ---------- Tab: Activity ---------- */
function jdActivity(j){
  const acts=[...(j.activity||[])].sort((a,b)=>b.ts-a.ts);
  return `<div class="tbl-wrap"><table class="tbl">
    <thead><tr><th style="width:150px">วัน / เวลา</th><th style="width:120px">ผู้ทำรายการ</th><th>Action</th></tr></thead>
    <tbody>${acts.map(a=>`<tr><td class="num muted">${fmtDT(a.ts)}</td><td>${esc(a.user)}</td><td>${esc(a.action)}</td></tr>`).join("")||`<tr><td colspan="3" class="empty-state">ยังไม่มีบันทึก</td></tr>`}</tbody>
  </table></div>`;
}

/* ---------- Detail events ---------- */
function bindJdEvents(j){
  const body=$("#jd-body");
  if(state.jobTab==="info"){
    $("#ji-save")?.addEventListener("click",()=>jdInfoSave(j));
    $("#ji-att-add")?.addEventListener("click",()=>{
      const v=$("#ji-att-new").value.trim(); if(!v) return;
      (j.attachments=j.attachments||[]).push(v); logAct(j,"เพิ่มไฟล์แนบ: "+v); save();
    });
    body.querySelectorAll("[data-del-att]").forEach(b=>b.addEventListener("click",()=>{
      const a=j.attachments.splice(+b.dataset.delAtt,1)[0]; logAct(j,"ลบไฟล์แนบ: "+a); save();
    }));
    $("#ji-delete")?.addEventListener("click",()=>{
      if(!confirm(`ลบ ${j.jobNo} — ${j.product} ถาวร?\nข้อมูลต้นทุน/ยอดขาย/ประวัติทั้งหมดของงานนี้จะหายไป`)) return;
      state.db.jobs=state.db.jobs.filter(x=>x.id!==j.id);
      closeModal("modal-job"); save(); toast(`ลบ ${j.jobNo} แล้ว`);
    });
  }
  if(state.jobTab==="timeline"){
    $("#tl-note-save")?.addEventListener("click",()=>{
      const cur=j.history[j.history.length-1]; if(!cur) return;
      cur.note=$("#tl-note").value.trim(); logAct(j,`เพิ่มโน้ตสถานะ ${stLabel(cur.status)}`); save(); toast("บันทึกโน้ตแล้ว");
    });
  }
  if(state.jobTab==="samples"){
    $("#sm-add")?.addEventListener("click",()=>{
      const desc=$("#sm-desc").value.trim(); if(!desc){ toast("ใส่รายละเอียดตัวอย่างก่อน",true); return; }
      const no=(j.samples||[]).length+1;
      (j.samples=j.samples||[]).push({no,date:$("#sm-date").value||todayIso(),desc,status:$("#sm-status").value});
      logAct(j,`เพิ่ม Sample #${no} — ${desc}`); save();
    });
    body.querySelectorAll("[data-del-sample]").forEach(b=>b.addEventListener("click",()=>{
      const s=j.samples.splice(+b.dataset.delSample,1)[0];
      j.samples.forEach((x,i)=>x.no=i+1);
      logAct(j,`ลบ Sample #${s.no}`); save();
    }));
  }
  if(state.jobTab==="materials"){
    $("#mat-add")?.addEventListener("click",()=>{
      (j.materials=j.materials||[]).push({id:uid("m"),type:"Fabric",name:"",supplier:"",qty:0,unit:"",costPerUnit:0,flatCost:0});
      logAct(j,"Material Updated — เพิ่มรายการวัสดุ"); save();
    });
    body.querySelectorAll("[data-mat]").forEach(el=>{
      el.addEventListener("change",()=>{
        const m=j.materials[+el.dataset.mat]; if(!m) return;
        const k=el.dataset.k;
        m[k]=["qty","costPerUnit","flatCost"].includes(k)? num(el.value) : el.value;
        logAct(j,`Material Updated — ${m.name||m.type}`); save();
      });
    });
    body.querySelectorAll("[data-del-mat]").forEach(b=>b.addEventListener("click",()=>{
      const m=j.materials.splice(+b.dataset.delMat,1)[0];
      logAct(j,`ลบวัสดุ: ${m.name||m.type}`); save();
    }));
  }
  if(state.jobTab==="costing"){
    body.querySelectorAll("[data-cost]").forEach(el=>el.addEventListener("change",()=>{
      j.costs=j.costs||{}; j.costs[el.dataset.cost]=num(el.value);
      logAct(j,"Costing Updated — "+el.dataset.cost); save();
    }));
  }
  if(state.jobTab==="sales"){
    const upd=()=>{
      j.sales=j.sales||{};
      const p=num($("#sl-price").value), q=num($("#sl-qty").value);
      if(p===num(j.sales.price)&&q===num(j.sales.qtySold)) return;
      j.sales.price=p; j.sales.qtySold=q;
      logAct(j,`Sales Updated — ${money(q)} pcs @ ${money2(p)} ฿`); save();
    };
    $("#sl-price")?.addEventListener("change",upd);
    $("#sl-qty")?.addEventListener("change",upd);
  }
  if(state.jobTab==="qty"){
    body.querySelectorAll("[data-qty]:not([disabled])").forEach(el=>el.addEventListener("change",()=>{
      j.qc=j.qc||{}; j.qc[el.dataset.qty]=num(el.value);
      logAct(j,`Quantity Updated — ${el.dataset.qty}: ${money(num(el.value))} pcs`); save();
    }));
  }
}
</script>
<script>
"use strict";
/* ================= DRILLDOWN ================= */
function jobRowHtml(j){
  const di=dueInfo(j);
  return `<tr class="rowlink" data-id="${j.id}">
    <td class="mono" style="font-weight:600">${esc(j.jobNo)}</td>
    <td>${esc(j.product)}<div class="muted small">${esc(j.customer)}</div></td>
    <td><span class="chip neutral">${esc(stLabel(j.status))}</span></td>
    <td>${esc(userName(j.responsible))}</td>
    <td class="num">${fmtD(j.dueDate)} ${di.state==="overdue"?'<span class="chip critical">OVERDUE</span>':di.state==="duesoon"?'<span class="chip warn">ใกล้ถึง</span>':""}</td>
  </tr>`;
}
function openDrill(title,jobs){
  $("#drill-title").textContent=title+` (${jobs.length})`;
  $("#drill-tbl").innerHTML=`<thead><tr><th>Job</th><th>สินค้า</th><th>สถานะ</th><th>ผู้รับผิดชอบ</th><th class="num">Due</th></tr></thead><tbody>${jobs.map(jobRowHtml).join("")||`<tr><td colspan="5" class="empty-state">ไม่มีงาน</td></tr>`}</tbody>`;
  $("#drill-tbl").querySelectorAll(".rowlink").forEach(r=>r.addEventListener("click",()=>{ closeModal("modal-drill"); openJob(r.dataset.id); }));
  openModal("modal-drill");
}
function kpiHtml(label,value,sub,tone,drillKey){
  return `<div class="kpi ${tone||""} ${drillKey?"clickable":""}" ${drillKey?`data-drill="${drillKey}"`:""} ${drillKey?'role="button" tabindex="0"':""}>
    <div class="kpi-label">${label}</div><div class="kpi-value num">${value}</div>${sub?`<div class="kpi-sub">${sub}</div>`:""}
  </div>`;
}

/* ================= MAIN DASHBOARD ================= */
function renderDashboard(){
  const jobs=state.db.jobs;
  const active=jobs.filter(j=>!["delivered","closed"].includes(j.status));
  const completed=jobs.filter(j=>["delivered","closed"].includes(j.status));
  const overdue=jobs.filter(j=>dueInfo(j).state==="overdue");
  const duesoon=jobs.filter(j=>dueInfo(j).state==="duesoon");
  const high=active.filter(j=>j.priority==="high");
  $("#dash-kpis").innerHTML=
    kpiHtml("Total Jobs",jobs.length,"ทั้งหมดในระบบ","","all")+
    kpiHtml("Active Jobs",active.length,"กำลังดำเนินการ","tone-accent","active")+
    kpiHtml("Completed",completed.length,"ส่งมอบ / ปิดงานแล้ว","tone-good","completed")+
    kpiHtml("🔴 Overdue",overdue.length,"เกินกำหนดส่ง",overdue.length?"tone-critical":"","overdue")+
    kpiHtml("⚠ Due Soon",duesoon.length,"ครบกำหนดใน 3 วัน",duesoon.length?"tone-warn":"","duesoon")+
    kpiHtml("🔥 High Priority",high.length,"งานเร่งด่วนที่ยังไม่จบ",high.length?"tone-warn":"","high");
  bindDrill($("#dash-kpis"));

  /* workflow bars */
  const maxN=Math.max(...STATUSES.map(s=>jobs.filter(j=>j.status===s.key).length),1);
  $("#dash-workflow").innerHTML=STATUSES.map(s=>{
    const n=jobs.filter(j=>j.status===s.key).length;
    return `<div class="bar-h-row rowdrill" data-status="${s.key}" role="button" tabindex="0" style="cursor:pointer">
      <span class="lbl">${esc(s.label)}</span>
      <div class="bar-h-track"><div class="bar-h-fill" style="width:${n/maxN*100}%;background:${s.dot};opacity:.85"></div></div>
      <span class="bar-h-val num">${n} Jobs</span>
    </div>`;
  }).join("");
  $("#dash-workflow").querySelectorAll(".rowdrill").forEach(r=>{
    const go=()=>openDrill("สถานะ: "+stLabel(r.dataset.status), jobs.filter(j=>j.status===r.dataset.status));
    r.addEventListener("click",go);
    r.addEventListener("keydown",e=>{if(e.key==="Enter")go();});
  });

  /* alerts */
  const notifs=buildNotifs().slice(0,8);
  $("#dash-alerts").innerHTML=notifs.map(x=>`<div class="notif-item" style="padding:7px 4px;border-radius:7px" data-id="${x.id}">
    <span class="notif-ic">${x.ic}</span><div><div class="notif-t">${esc(x.t)}</div><div class="notif-d">${esc(x.d)}</div></div>
  </div>`).join("")||`<div class="empty-state">ไม่มีการแจ้งเตือน 🎉</div>`;
  $("#dash-alerts").querySelectorAll(".notif-item").forEach(el=>el.addEventListener("click",()=>openJob(el.dataset.id)));

  /* due table */
  const upcoming=[...active].filter(j=>j.dueDate).sort((a,b)=>a.dueDate.localeCompare(b.dueDate)).slice(0,8);
  $("#dash-due-tbl").innerHTML=`<thead><tr><th>Job</th><th>สินค้า</th><th>สถานะ</th><th>ผู้รับผิดชอบ</th><th class="num">Due</th></tr></thead><tbody>${upcoming.map(jobRowHtml).join("")}</tbody>`;
  $("#dash-due-tbl").querySelectorAll(".rowlink").forEach(r=>r.addEventListener("click",()=>openJob(r.dataset.id)));

  /* activity feed */
  const feed=jobs.flatMap(j=>j.activity.map(a=>({...a,jobNo:j.jobNo,id:j.id}))).sort((a,b)=>b.ts-a.ts).slice(0,10);
  $("#dash-activity").innerHTML=feed.map(a=>`<div class="stat-line" style="cursor:pointer" data-id="${a.id}">
    <span><b class="mono">${esc(a.jobNo)}</b> <span class="muted">·</span> ${esc(a.action)}</span>
    <span class="muted small num" style="white-space:nowrap;margin-left:8px">${fmtDT(a.ts)}${a.user&&a.user!=="seed"?" · "+esc(a.user):""}</span>
  </div>`).join("")||`<div class="empty-state">ยังไม่มีบันทึก</div>`;
  $("#dash-activity").querySelectorAll("[data-id]").forEach(el=>el.addEventListener("click",()=>openJob(el.dataset.id)));
}
function bindDrill(root){
  root.querySelectorAll("[data-drill]").forEach(k=>{
    const go=()=>{
      const jobs=state.db.jobs, key=k.dataset.drill;
      const sets={
        all:[jobs,"งานทั้งหมด"],
        active:[jobs.filter(j=>!["delivered","closed"].includes(j.status)),"Active Jobs"],
        completed:[jobs.filter(j=>["delivered","closed"].includes(j.status)),"Completed"],
        overdue:[jobs.filter(j=>dueInfo(j).state==="overdue"),"🔴 Overdue"],
        duesoon:[jobs.filter(j=>dueInfo(j).state==="duesoon"),"⚠ Due Soon"],
        high:[jobs.filter(j=>j.priority==="high"&&!["delivered","closed"].includes(j.status)),"🔥 High Priority"]
      };
      const [list,title]=sets[key]||[[],key];
      openDrill(title,list);
    };
    k.addEventListener("click",go);
    k.addEventListener("keydown",e=>{if(e.key==="Enter")go();});
  });
}

/* ================= BUSINESS ================= */
function periodRange(p){
  const n=new Date(), y=n.getFullYear();
  const d0=(m,d)=>new Date(y,m,d);
  switch(p){
    case "today": return [n,n,"วันนี้"];
    case "week": { const s=new Date(n); s.setDate(n.getDate()-((n.getDay()+6)%7)); const e=new Date(s); e.setDate(s.getDate()+6); return [s,e,"สัปดาห์นี้"]; }
    case "month": return [d0(n.getMonth(),1),d0(n.getMonth()+1,0),TH_M_FULL[n.getMonth()]+" "+(y+543)];
    case "q1": return [d0(0,1),d0(2,31),"Q1 · ม.ค.–มี.ค. "+(y+543)];
    case "q2": return [d0(3,1),d0(5,30),"Q2 · เม.ย.–มิ.ย. "+(y+543)];
    case "q3": return [d0(6,1),d0(8,30),"Q3 · ก.ค.–ก.ย. "+(y+543)];
    case "q4": return [d0(9,1),d0(11,31),"Q4 · ต.ค.–ธ.ค. "+(y+543)];
    case "year": return [d0(0,1),d0(11,31),"ปี "+(y+543)];
    default: return [null,null,"ข้อมูลทั้งหมด"];
  }
}
function jobRefDate(j){
  /* date a job's business numbers attribute to: delivery date if any, else due date, else start */
  const del=j.history.find(h=>h.status==="delivered");
  return (del&&del.start)||j.dueDate||j.startDate;
}
function renderBusiness(){
  const [s,e,label]=periodRange(state.bizPeriod);
  $("#biz-period-label").textContent=label;
  $$("#biz-period button").forEach(b=>b.classList.toggle("active",b.dataset.p===state.bizPeriod));
  const inRange=j=>{
    if(!s) return true;
    const d=parseD(jobRefDate(j)); if(!d) return false;
    return d>=new Date(s.getFullYear(),s.getMonth(),s.getDate()) && d<=new Date(e.getFullYear(),e.getMonth(),e.getDate(),23,59,59);
  };
  const jobs=state.db.jobs.filter(inRange);
  const withSales=jobs.filter(j=>totalSales(j)>0);
  const sales=jobs.reduce((x,j)=>x+totalSales(j),0);
  const cost=jobs.reduce((x,j)=>x+totalCost(j),0);
  const gp=sales-cost, gm=sales>0?gp/sales*100:0;
  const qProd=jobs.reduce((x,j)=>x+(num(j.qc?.completed)||0),0);
  const qSold=jobs.reduce((x,j)=>x+num(j.sales?.qtySold),0);
  $("#biz-kpis").innerHTML=
    kpiHtml("Total Sales",money(sales)+" <small>฿</small>",withSales.length+" jobs มียอดขาย")+
    kpiHtml("Total Cost",money(cost)+" <small>฿</small>","วัสดุ + ค่าผลิต ("+jobs.length+" jobs)")+
    kpiHtml("Gross Profit",money(gp)+" <small>฿</small>","",gp>=0?"tone-good":"tone-critical")+
    kpiHtml("Gross Margin",pct(gm),"",gm>=0?"tone-good":"tone-critical");
  $("#biz-kpis2").innerHTML=
    kpiHtml("Quantity Produced",money(qProd)+" <small>pcs</small>","ผลิตเสร็จ (Completed)")+
    kpiHtml("Quantity Sold",money(qSold)+" <small>pcs</small>","")+
    kpiHtml("Avg Selling Price",money2(qSold?sales/qSold:0)+" <small>฿/pc</small>","")+
    kpiHtml("Avg Cost / Piece",money2(qProd?cost/qProd:0)+" <small>฿/pc</small>","เทียบจำนวนที่ผลิตเสร็จ");

  /* monthly grouped bars (SVG) over all data */
  const byMonth={};
  state.db.jobs.forEach(j=>{
    const d=parseD(jobRefDate(j)); if(!d) return;
    const k=d.getFullYear()+"-"+String(d.getMonth()+1).padStart(2,"0");
    (byMonth[k]=byMonth[k]||{sales:0,cost:0}); byMonth[k].sales+=totalSales(j); byMonth[k].cost+=totalCost(j);
  });
  const months=Object.keys(byMonth).sort().slice(-6);
  $("#biz-chart-legend").innerHTML=`<span class="leg-item"><span class="leg-swatch" style="background:var(--s1)"></span>Sales</span><span class="leg-item"><span class="leg-swatch" style="background:var(--s2)"></span>Cost</span>`;
  $("#biz-monthly").innerHTML=groupedBarSvg(months.map(k=>{
    const [y,m]=k.split("-");
    return {label:TH_M[+m-1]+" "+String((+y+543)%100), a:byMonth[k].sales, b:byMonth[k].cost};
  }));

  /* profit by job */
  const byJob=[...withSales].sort((a,b)=>grossProfit(b)-grossProfit(a));
  const maxAbs=Math.max(...byJob.map(j=>Math.abs(grossProfit(j))),1);
  $("#biz-by-job").innerHTML=byJob.map(j=>{
    const p=grossProfit(j);
    return `<div class="bar-h-row rowdrill" data-id="${j.id}" style="cursor:pointer" title="เปิด ${esc(j.jobNo)}">
      <span class="lbl mono">${esc(j.jobNo)}</span>
      <div class="bar-h-track"><div class="bar-h-fill" style="width:${Math.abs(p)/maxAbs*100}%;background:${p>=0?"var(--s3)":"var(--s8)"}"></div></div>
      <span class="bar-h-val num" style="color:${p>=0?"var(--good-text)":"var(--critical-text)"}">${money(p)}</span>
    </div>`;
  }).join("")||`<div class="empty-state">ยังไม่มีงานที่บันทึกยอดขายในช่วงนี้</div>`;
  $("#biz-by-job").querySelectorAll(".rowdrill").forEach(r=>r.addEventListener("click",()=>openJob(r.dataset.id)));

  /* table */
  $("#biz-tbl").innerHTML=`<thead><tr><th>Job</th><th>สินค้า / เซล</th><th class="r">ผลิต (pcs)</th><th class="r">ขาย (pcs)</th><th class="r">ราคาขาย/ชิ้น</th><th class="r">ต้นทุน/ชิ้น</th><th class="r">Sales (฿)</th><th class="r">Cost (฿)</th><th class="r">Profit (฿)</th><th class="r">Margin</th></tr></thead>
  <tbody>${jobs.map(j=>{
    const gp2=grossProfit(j);
    return `<tr class="rowlink" data-id="${j.id}">
      <td class="mono" style="font-weight:600">${esc(j.jobNo)}</td>
      <td>${esc(j.product)}<div class="muted small">${esc(j.customer)}</div></td>
      <td class="r num">${money(num(j.qc?.completed))}</td>
      <td class="r num">${money(num(j.sales?.qtySold))}</td>
      <td class="r num">${money2(num(j.sales?.price))}</td>
      <td class="r num">${money2(costPerPiece(j))}</td>
      <td class="r num">${money(totalSales(j))}</td>
      <td class="r num">${money(totalCost(j))}</td>
      <td class="r num" style="color:${gp2>=0?"var(--good-text)":"var(--critical-text)"};font-weight:600">${money(gp2)}</td>
      <td class="r num">${totalSales(j)>0?pct(grossMargin(j)):"—"}</td>
    </tr>`;
  }).join("")||`<tr><td colspan="10" class="empty-state">ไม่มีงานในช่วงเวลานี้</td></tr>`}</tbody>`;
  $("#biz-tbl").querySelectorAll(".rowlink").forEach(r=>r.addEventListener("click",()=>openJob(r.dataset.id)));
}
function groupedBarSvg(rows){
  if(!rows.length) return `<div class="empty-state">ยังไม่มีข้อมูล</div>`;
  const W=560,H=240,padL=56,padB=26,padT=12;
  const maxV=Math.max(...rows.flatMap(r=>[r.a,r.b]),1);
  const step=(W-padL-8)/rows.length, bw=Math.min(26,(step-14)/2);
  const y=v=>padT+(H-padT-padB)*(1-v/maxV);
  const ticks=[0,.25,.5,.75,1].map(f=>Math.round(maxV*f));
  let s=`<svg viewBox="0 0 ${W} ${H}" width="100%" style="max-width:${W}px" role="img" aria-label="ยอดขายเทียบต้นทุนรายเดือน">`;
  ticks.forEach(t=>{
    s+=`<line x1="${padL}" x2="${W-4}" y1="${y(t)}" y2="${y(t)}" stroke="var(--grid)" stroke-width="1"/>`;
    s+=`<text x="${padL-6}" y="${y(t)+3.5}" text-anchor="end" font-size="10" fill="var(--ink3)" class="num">${t>=1000?Math.round(t/1000)+"k":t}</text>`;
  });
  rows.forEach((r,i)=>{
    const cx=padL+step*i+step/2;
    s+=`<rect x="${cx-bw-1}" y="${y(r.a)}" width="${bw}" height="${Math.max(0,H-padB-y(r.a))}" rx="3" fill="var(--s1)"><title>${r.label} · Sales ${money(r.a)} ฿</title></rect>`;
    s+=`<rect x="${cx+1}" y="${y(r.b)}" width="${bw}" height="${Math.max(0,H-padB-y(r.b))}" rx="3" fill="var(--s2)"><title>${r.label} · Cost ${money(r.b)} ฿</title></rect>`;
    s+=`<text x="${cx}" y="${H-8}" text-anchor="middle" font-size="10.5" fill="var(--ink2)">${r.label}</text>`;
  });
  s+=`<line x1="${padL}" x2="${W-4}" y1="${H-padB}" y2="${H-padB}" stroke="var(--axis)" stroke-width="1"/></svg>`;
  return s;
}

/* ================= PERFORMANCE ================= */
function renderPerformance(){
  const jobs=state.db.jobs;
  const finished=jobs.filter(j=>["done_prod","delivered","closed"].includes(j.status));
  const avg=arr=>arr.length? arr.reduce((a,b)=>a+b,0)/arr.length : 0;

  const leadTimes=finished.map(j=>{
    const done=j.history.find(h=>h.status==="done_prod")||j.history[j.history.length-1];
    return j.startDate&&done? Math.max(0,daysDiff(j.startDate,done.start)) : null;
  }).filter(v=>v!=null);

  const stageAvg=k=>{
    const ds=jobs.flatMap(j=>stageDurations(j).filter(h=>h.status===k&&h.end).map(h=>h.days));
    return {n:ds.length, avg:avg(ds)};
  };
  const sampleTimes=jobs.map(j=>{
    const sm=j.history.find(h=>h.status==="sampling"), ok=j.history.find(h=>h.status==="sample_ok");
    return sm&&ok? Math.max(0,daysDiff(sm.start,ok.start)) : null;
  }).filter(v=>v!=null);
  const matWait=stageAvg("wait_fabric"), sew=stageAvg("sewing");

  const delivered=jobs.filter(j=>j.history.some(h=>h.status==="delivered"));
  const onTime=delivered.filter(j=>{
    const d=j.history.find(h=>h.status==="delivered");
    return j.dueDate && d && daysDiff(j.dueDate,d.start)<=0;
  });
  const sewn=jobs.reduce((s,j)=>s+num(j.qc?.sewing),0);
  const defects=jobs.reduce((s,j)=>s+num(j.qc?.defect),0);
  const reworks=jobs.reduce((s,j)=>s+num(j.qc?.rework),0);
  const revs=jobs.filter(j=>(j.samples||[]).length).map(j=>j.samples.length);
  const delayed=jobs.filter(j=>dueInfo(j).state==="overdue");

  $("#perf-kpis").innerHTML=
    kpiHtml("Avg Lead Time",durText(avg(leadTimes))||"—","เริ่มงาน → ผลิตเสร็จ ("+leadTimes.length+" jobs)")+
    kpiHtml("Avg Sample Dev Time",durText(avg(sampleTimes))||"—","ขึ้นตัวอย่าง → ตัวอย่างผ่าน")+
    kpiHtml("Avg Sewing Time",sew.n?durText(sew.avg):"—",sew.n+" jobs ผ่านขั้นเย็บ")+
    kpiHtml("Material Waiting",matWait.n?durText(matWait.avg):"—","เฉลี่ยเวลารอผ้า")+
    kpiHtml("Avg Sample Revision",revs.length?(Math.round(avg(revs)*10)/10)+" รอบ":"—","ต่อ 1 product");
  $("#perf-kpis2").innerHTML=
    kpiHtml("On-Time Delivery",delivered.length?pct(onTime.length/delivered.length*100):"—",onTime.length+"/"+delivered.length+" งานส่งทันกำหนด",delivered.length&&onTime.length/delivered.length>=.8?"tone-good":"tone-warn")+
    kpiHtml("Defect Rate",sewn?pct(defects/sewn*100):"—",money(defects)+" / "+money(sewn)+" pcs",sewn&&defects/sewn<=.03?"tone-good":"tone-warn")+
    kpiHtml("Rework Rate",sewn?pct(reworks/sewn*100):"—",money(reworks)+" pcs")+
    kpiHtml("Jobs Delayed",delayed.length,"เกินกำหนด ณ วันนี้",delayed.length?"tone-critical":"tone-good","overdue")+
    kpiHtml("Jobs Completed",finished.length,"ผลิตเสร็จขึ้นไป","tone-good","completed");
  bindDrill($("#perf-kpis2"));

  /* stage time bars */
  const stages=STATUSES.filter(s=>!["new","closed"].includes(s.key)).map(s=>({...s,...stageAvg(s.key)}));
  const maxAvg=Math.max(...stages.map(s=>s.avg),1);
  $("#perf-stage-time").innerHTML=stages.map(s=>`<div class="bar-h-row">
    <span class="lbl">${esc(s.label)}</span>
    <div class="bar-h-track"><div class="bar-h-fill" style="width:${s.avg/maxAvg*100}%;background:var(--s1);opacity:.85"></div></div>
    <span class="bar-h-val num">${s.n? (Math.round(s.avg*10)/10)+" วัน":"—"}</span>
  </div>`).join("");

  /* defect by job */
  const dj=jobs.filter(j=>num(j.qc?.sewing)>0).sort((a,b)=>num(b.qc.defect)/num(b.qc.sewing)-num(a.qc.defect)/num(a.qc.sewing));
  const maxD=Math.max(...dj.map(j=>num(j.qc.defect)/num(j.qc.sewing)*100),1);
  $("#perf-defect").innerHTML=dj.map(j=>{
    const dr=num(j.qc.defect)/num(j.qc.sewing)*100;
    return `<div class="bar-h-row rowdrill" data-id="${j.id}" style="cursor:pointer">
      <span class="lbl mono">${esc(j.jobNo)}</span>
      <div class="bar-h-track"><div class="bar-h-fill" style="width:${dr/maxD*100}%;background:${dr>4?"var(--critical)":dr>2?"var(--serious)":"var(--s3)"}"></div></div>
      <span class="bar-h-val num">${pct(dr)}</span>
    </div>`;
  }).join("")||`<div class="empty-state">ยังไม่มีข้อมูล QC</div>`;
  $("#perf-defect").querySelectorAll(".rowdrill").forEach(r=>r.addEventListener("click",()=>openJob(r.dataset.id)));
}
</script>
<script>
"use strict";
/* ================= GOOGLE SHEETS SYNC =================
   ใช้เมื่อตั้งค่า window.GSHEET_API (Apps Script Web App) ไว้
   - 1 งาน = 1 แถวใน Sheet พร้อมเลข rev; ส่งเฉพาะงานที่เปลี่ยน
   - ถ้ามีคนแก้งานเดียวกันพร้อมกัน จะรวมการแก้ไขทีละช่อง (3-way merge) แล้วส่งใหม่
   - ดึงข้อมูลของทีมทุก 20 วินาที และทุกครั้งที่กลับมาที่แท็บนี้
   - งานที่ยังส่งไม่สำเร็จเก็บในเครื่องไว้ก่อน แล้วส่งอัตโนมัติเมื่อกลับมาออนไลน์ */
const LS_GS_KEY="gpms-gs-key", LS_GS_CACHE="gpms-gs-cache-v1", LS_GS_META="gpms-gs-meta-v1";
const GS_POLL_MS=20000, GS_PUSH_DELAY=800;
const gsState={ key:"", base:{}, rev:{}, failed:{}, lastPull:0, chain:Promise.resolve(), pushTimer:null, retryTimer:null,
  syncQueued:null, fails:0, error:"", locked:false, connected:false, polling:false, renderLater:false, conflictRounds:0 };

function gsEnabled(){ return typeof window.GSHEET_API==="string" && /^https:\/\//.test(window.GSHEET_API.trim()); }

/* JSON ที่เรียง key เสมอ — ใช้เทียบว่างานเปลี่ยนไหม */
function gsCanon(v){
  if(Array.isArray(v)) return "["+v.map(x=>x===undefined?"null":gsCanon(x)).join(",")+"]";
  if(v && typeof v==="object") return "{"+Object.keys(v).sort().filter(k=>v[k]!==undefined).map(k=>JSON.stringify(k)+":"+gsCanon(v[k])).join(",")+"}";
  const s=JSON.stringify(v); return s===undefined? "null" : s;
}
function gsErr(code,data){ const e=new Error(code); e.code=code; e.data=data; return e; }
async function gsApi(action, body){
  const ctl=new AbortController(), timer=setTimeout(()=>ctl.abort(), 30000);
  try{
    /* text/plain = ไม่มี CORS preflight (Apps Script ไม่รองรับ OPTIONS) */
    const res=await fetch(window.GSHEET_API.trim(), { method:"POST", cache:"no-store", signal:ctl.signal,
      headers:{"Content-Type":"text/plain;charset=utf-8"},
      body:JSON.stringify(Object.assign({}, body, {action, key:gsState.key})) });
    if(!res.ok) throw gsErr("http_"+res.status);
    let data; try{ data=await res.json(); }catch(e){ throw gsErr("bad_response"); }
    if(!data || !data.ok) throw gsErr((data && data.error) || "bad_response", data);
    return data;
  }finally{ clearTimeout(timer); }
}
/* ทำงานกับ Sheet ทีละคำสั่งตามลำดับ */
function gsRun(fn){ const p=gsState.chain.then(fn); gsState.chain=p.catch(()=>{}); return p; }

function gsJobById(id){ return state.db.jobs.find(j=>j.id===id); }
function gsPendingUps(){ return state.db.jobs.filter(j=>{ const c=gsCanon(j); return c!==gsState.base[j.id] && c!==gsState.failed[j.id]; }); }
function gsPendingDels(){ const live=new Set(state.db.jobs.map(j=>j.id)); return Object.keys(gsState.base).filter(id=>!live.has(id)); }
function gsPendingCount(){ return gsPendingUps().length+gsPendingDels().length; }
function gsSummary(j, users){
  const u=(users||state.db.users).find(x=>x.id===j.responsible), r2=v=>Math.round(num(v)*100)/100;
  return { statusLabel:stLabel(j.status), responsibleName:u?u.name:"", progress:jobProgress(j),
    totalCost:r2(totalCost(j)), totalSales:r2(totalSales(j)), grossProfit:r2(grossProfit(j)) };
}

/* ---------- cache ในเครื่อง (เปิดเร็ว + กันข้อมูลหายตอนออฟไลน์) ---------- */
function gsPersist(){
  try{
    localStorage.setItem(LS_GS_CACHE, JSON.stringify(state.db));
    const pbase={};
    gsPendingUps().forEach(j=>{ if(gsState.base[j.id]!==undefined) pbase[j.id]=gsState.base[j.id]; });
    gsPendingDels().forEach(id=>{ pbase[id]=gsState.base[id]; });
    localStorage.setItem(LS_GS_META, JSON.stringify({rev:gsState.rev, lastPull:gsState.lastPull, pbase}));
  }catch(e){}
}
function gsRestore(){
  let db=null, meta=null;
  try{ db=JSON.parse(localStorage.getItem(LS_GS_CACHE)||"null"); meta=JSON.parse(localStorage.getItem(LS_GS_META)||"null"); }catch(e){}
  if(!db || !Array.isArray(db.jobs) || !Array.isArray(db.users) || !db.users.length || !meta) return null;
  const pbase=meta.pbase||{};
  gsState.rev=meta.rev||{}; gsState.lastPull=meta.lastPull||0; gsState.base={};
  db.jobs.forEach(j=>{
    if(pbase[j.id]!==undefined) gsState.base[j.id]=pbase[j.id];
    else if(gsState.rev[j.id]) gsState.base[j.id]=gsCanon(j);
  });
  Object.keys(pbase).forEach(id=>{ if(!db.jobs.some(j=>j.id===id)) gsState.base[id]=pbase[id]; });
  return db;
}

/* ---------- รวมการแก้ไข: base = ค่าล่าสุดที่รู้จาก Sheet, local = เครื่องนี้, remote = Sheet ตอนนี้ ---------- */
function gsMerge3(baseStr, local, remote){
  const base=baseStr? JSON.parse(baseStr) : {};
  const C=gsCanon, isObj=v=>!!v && typeof v==="object" && !Array.isArray(v);
  const m3=(b,l,r)=>{
    const cl=C(l), cb=C(b), cr=C(r);
    if(cl===cb) return r;                      /* เครื่องนี้ไม่ได้แก้ → ใช้ของทีม */
    if(cr===cb || cr===cl) return l;           /* ทีมไม่ได้แก้ → ใช้ของเครื่องนี้ */
    if(isObj(b)&&isObj(l)&&isObj(r)){          /* แก้คนละช่องใน object เดียวกัน (เช่น costs, qc) */
      const o={}; new Set([...Object.keys(r),...Object.keys(l)]).forEach(k=>{ const v=m3(b[k],l[k],r[k]); if(v!==undefined) o[k]=v; });
      return o;
    }
    return l;                                  /* แก้ช่องเดียวกัน → ใช้ของเครื่องนี้ (ล่าสุด) */
  };
  const out={};
  new Set([...Object.keys(remote),...Object.keys(local)]).forEach(k=>{
    if(k==="activity"||k==="history"||k==="status") return;
    const v=m3(base[k],local[k],remote[k]); if(v!==undefined) out[k]=v;
  });
  /* สถานะกับประวัติสถานะต้องมาจากฝั่งเดียวกัน */
  const moved=C(local.status)!==C(base.status) || C(local.history)!==C(base.history);
  out.status=(moved?local:remote).status; out.history=(moved?local:remote).history;
  /* Activity Log: รวมของทั้งสองฝั่ง */
  const seen=new Set(), act=[];
  [...(remote.activity||[]), ...(local.activity||[])].forEach(a=>{
    const k=a.ts+"|"+a.user+"|"+a.action; if(!seen.has(k)){ seen.add(k); act.push(a); }
  });
  out.activity=act.sort((a,b)=>(a.ts||0)-(b.ts||0));
  return JSON.parse(JSON.stringify(out));
}
/* แทนค่าในวัตถุเดิม — ฟอร์มที่เปิดอยู่ยังชี้ไปที่งานเดียวกัน */
function gsReplace(target, src){ Object.keys(target).forEach(k=>delete target[k]); Object.assign(target, src); }

/* คืนค่า true ถ้าข้อมูลบนจอเปลี่ยน */
function gsApplyRemote(it){
  if(!it || !it.id || it.rev<=(gsState.rev[it.id]||0)) return false;
  if(!it.deleted && !it.job) return false;
  gsState.rev[it.id]=it.rev;
  const local=gsJobById(it.id);
  if(it.deleted){
    delete gsState.base[it.id];
    if(!local) return false;
    state.db.jobs=state.db.jobs.filter(j=>j!==local);
    if(state.openJobId===it.id && $("#modal-job").classList.contains("open")){ closeModal("modal-job"); toast(`${local.jobNo} ถูกลบโดยทีม`, true); }
    return true;
  }
  const remoteCanon=gsCanon(it.job);
  if(local){
    const pending=gsCanon(local)!==gsState.base[it.id];
    gsReplace(local, pending? gsMerge3(gsState.base[it.id], local, it.job) : it.job);
  }else if(gsState.base[it.id]===undefined){
    state.db.jobs.unshift(it.job);
  } /* else: เครื่องนี้ลบงานนี้ไว้และกำลังจะส่ง — ไม่ดึงกลับมา */
  gsState.base[it.id]=remoteCanon;
  delete gsState.failed[it.id];
  return true;
}
function gsApplyUsers(users){
  if(!Array.isArray(users) || !users.length || gsCanon(users)===gsCanon(state.db.users)) return false;
  state.db.users=users;
  let uid=null; try{ uid=localStorage.getItem(LS_USER); }catch(e){}
  const cur=state.currentUser && state.currentUser.id;
  state.currentUser=users.find(u=>u.id===cur)||users.find(u=>u.id===uid)||users[0];
  return true;
}

/* ---------- วาดหน้าจอใหม่หลังได้ข้อมูลจากทีม ---------- */
function gsRender(ids){
  if(dragJobId){ gsState.renderLater=true; return; }   /* กำลังลากการ์ดอยู่ — รอให้ลากเสร็จก่อน */
  const keep=["#f-person","#f-status","#nj-person"].map(s=>[s,$(s).value]);
  fillPersonSelects();
  keep.forEach(([s,v])=>{ if(v && [...$(s).options].some(o=>o.value===v)) $(s).value=v; });
  $("#user-select").value=state.currentUser.id;
  renderPage(currentPage); renderNotifBadge();
  if(state.openJobId && $("#modal-job").classList.contains("open") && (!ids || ids.has(state.openJobId))){
    if(!findJob(state.openJobId)) closeModal("modal-job");
    else if(jdFormSnap()!==state.jdSnap) toast("มีคนในทีมอัปเดตงานนี้ — ตอนบันทึก ระบบจะเก็บเฉพาะช่องที่คุณแก้");
    else renderJobDetail();
  }
}

/* ---------- ส่ง / ดึง ---------- */
async function gsPush(){
  if(gsState.locked) return;
  const ups=gsPendingUps(), dels=gsPendingDels();
  if(!ups.length && !dels.length) return;
  gsChip("saving");
  const sent=ups.map(j=>({id:j.id, canon:gsCanon(j), data:JSON.stringify(j), baseRev:gsState.rev[j.id]||0, summary:gsSummary(j)}));
  const r=await gsApi("push", { user:curUser(),
    upserts:sent.map(s=>({id:s.id, data:s.data, baseRev:s.baseRev, summary:s.summary})),
    deletes:dels.map(id=>({id})) });
  const changed=new Set(), dups=[]; let retry=false;
  (r.results||[]).forEach(res=>{
    const s=sent.find(x=>x.id===res.id);
    if(res.ok){
      if(s){ gsState.base[res.id]=s.canon; gsState.rev[res.id]=res.rev; }
      else{ delete gsState.base[res.id]; if(res.rev) gsState.rev[res.id]=res.rev; }
    }else if(res.conflict){
      if(gsApplyRemote({id:res.id, rev:res.rev, deleted:res.deleted, job:res.job})) changed.add(res.id);
      retry=true;
    }else if(res.dupJobNo){
      dups.push(res.id);
    }else if(res.error && s){
      gsState.failed[res.id]=s.canon;   /* ไม่ส่งซ้ำจนกว่างานนี้จะถูกแก้อีก */
      const j=gsJobById(res.id);
      toast(`บันทึก ${j?j.jobNo:res.id} ลง Sheet ไม่สำเร็จ (${res.error==="too_large"?"ข้อมูลงานใหญ่เกินไป":res.error})`, true);
    }
  });
  if(dups.length){
    await gsPull(false);   /* ดึงงานล่าสุดของทีมก่อน แล้วค่อยหาเลขใหม่ */
    dups.forEach(id=>{
      const j=gsJobById(id); if(!j) return;
      const old=j.jobNo; j.jobNo=suggestJobNo();
      logAct(j,`เปลี่ยน Job No. ${old} → ${j.jobNo} (ซ้ำกับงานที่ทีมเพิ่งสร้าง)`);
      toast(`${old} ซ้ำกับงานของทีม — เปลี่ยนเป็น ${j.jobNo}`, true);
      changed.add(id);
    });
    retry=true;
  }
  gsPersist();
  if(changed.size) gsRender(changed);
  if(retry && ++gsState.conflictRounds<=5) await gsPush();
  gsState.conflictRounds=0;
}
async function gsPull(full){
  const since=full? 0 : Math.max(0, gsState.lastPull-60000);   /* ย้อน 60 วิ กันพลาดรายการที่เขียนพร้อมกัน */
  const r=await gsApi("pull", {since, knownTotal:gsState.total});
  const changed=new Set();
  const usersChanged=gsApplyUsers(r.users);
  (r.jobs||[]).forEach(it=>{ if(gsApplyRemote(it)) changed.add(it.id); });
  if(full){
    /* งานที่ถูกลบแถวออกจาก Sheet ตรง ๆ → เอาออกจากเครื่องด้วย (ยกเว้นงานใหม่ที่ยังไม่ได้ส่ง) */
    const onSheet=new Set((r.jobs||[]).map(x=>x.id));
    const live=new Set((r.jobs||[]).filter(x=>!x.deleted).map(x=>x.id));
    const before=state.db.jobs.length;
    state.db.jobs=state.db.jobs.filter(j=>live.has(j.id) || gsState.base[j.id]===undefined);
    Object.keys(gsState.base).forEach(id=>{ if(!onSheet.has(id)) delete gsState.base[id]; });
    if(before!==state.db.jobs.length) changed.add("*");
  }
  if(r.order){
    /* เรียงตาม Sheet (งานใหม่ที่ยังไม่ได้ส่งอยู่บนสุด) */
    const order=new Map(r.order.map((id,i)=>[id,i]));
    const pos=j=>order.has(j.id)? order.get(j.id) : -1;
    const was=state.db.jobs.map(j=>j.id).join();
    state.db.jobs.sort((a,b)=>pos(a)-pos(b));
    if(was!==state.db.jobs.map(j=>j.id).join()) changed.add("*");
  }
  gsState.total=r.total;
  gsState.lastPull=r.serverTime||gsState.lastPull;
  gsPersist();
  if(full || usersChanged || changed.size) gsRender(full||usersChanged? null : changed);
  return r;
}
async function gsFirstRun(){
  const legacy=loadLocal();
  const hasLegacy=!!(legacy && Array.isArray(legacy.jobs) && legacy.jobs.length);
  const src=hasLegacy? legacy : makeSeed();
  const users=(src.users && src.users.length)? src.users : makeSeed().users;
  const label=hasLegacy? `ข้อมูลที่เคยบันทึกไว้ในเบราว์เซอร์นี้ (${src.jobs.length} งาน)` : `ข้อมูลตัวอย่าง (${src.jobs.length} งาน)`;
  const upload=confirm(`Google Sheet ยังว่างอยู่\n\nอัปโหลด${label} ขึ้น Sheet เพื่อเริ่มใช้งานไหม?\n\nOK = อัปโหลด\nCancel = เริ่มจาก Sheet ว่าง (ใส่เฉพาะรายชื่อทีม)`);
  try{
    await gsApi("init", { user:"init", users,
      jobs: upload? src.jobs.map(j=>({id:j.id, data:JSON.stringify(j), summary:gsSummary(j,users)})) : [] });
  }catch(e){ if(!(e && e.code==="not_empty")) throw e; }   /* มีคนตั้งต้นไปก่อนแล้ว — ใช้ของเขา */
}
async function gsConnect(){
  const r=await gsPull(true);
  if(!r.total && !(r.users||[]).length){ await gsFirstRun(); await gsPull(true); }   /* Sheet ใหม่เอี่ยม */
  await gsPush();
  gsState.connected=true;
  gsStartPolling();
}

/* ---------- สถานะ / ลองใหม่ ---------- */
function gsChip(mode){
  const n=gsPendingCount();
  if(gsState.locked) return setSyncChip("local gs","รอใส่รหัสทีม");
  if(gsState.error) return setSyncChip("error gs", n? `${gsState.error} · รอส่ง ${n} งาน` : gsState.error);
  if(mode==="saving" || n) return setSyncChip("saving gs","กำลังบันทึกลง Google Sheet…");
  setSyncChip("gs","Google Sheet · ซิงค์แล้ว");
}
function gsOk(){
  gsState.fails=0; gsState.error=""; clearTimeout(gsState.retryTimer);
  $("#db-stamp").textContent="ซิงค์ล่าสุด "+fmtDT(Date.now());
  gsChip();
}
function gsFail(e){
  const code=(e && e.code) || "offline";
  if(code==="unauthorized"){ try{ localStorage.removeItem(LS_GS_KEY); }catch(_){} gsLock("รหัสทีมไม่ถูกต้อง หรือผู้ดูแลเปลี่ยนรหัสแล้ว"); return; }
  if(code==="key_not_set"){ gsState.error="ยังไม่ได้ตั้ง TEAM_KEY ใน Apps Script"; gsChip(); return; }
  gsState.error = code==="busy"? "Sheet ไม่ว่าง — กำลังลองใหม่"
    : /^(http_|bad_response|server_error|unknown_action)/.test(code)? "เชื่อม Apps Script ไม่ได้"
    : "ออฟไลน์";
  gsChip();
  gsState.fails++;
  clearTimeout(gsState.retryTimer);
  gsState.retryTimer=setTimeout(gsSyncNow, Math.min(60000, 4000*Math.pow(2, gsState.fails-1)));
}
function gsSyncNow(){
  if(gsState.syncQueued) return gsState.syncQueued;
  const p=gsRun(async()=>{
    gsState.syncQueued=null;
    if(gsState.locked) return;
    try{
      if(!gsState.connected) await gsConnect();
      else{ await gsPush(); await gsPull(false); }
      gsOk();
    }catch(e){ gsFail(e); }
  });
  gsState.syncQueued=p;
  return p;
}
function gsQueue(){
  gsState.renderLater=false;
  gsPersist(); gsChip("saving");
  clearTimeout(gsState.pushTimer);
  gsState.pushTimer=setTimeout(()=>gsRun(async()=>{
    if(gsState.locked || !gsState.connected) return;
    try{ await gsPush(); gsOk(); }catch(e){ gsFail(e); }
  }), GS_PUSH_DELAY);
}
function gsStartPolling(){
  if(gsState.polling) return;
  gsState.polling=true;
  setInterval(()=>{ if(!document.hidden) gsSyncNow(); }, GS_POLL_MS);
  document.addEventListener("visibilitychange",()=>{ if(!document.hidden) gsSyncNow(); });
  addEventListener("online", gsSyncNow);
}

/* ---------- รหัสทีม ---------- */
function gsLock(msg){
  gsState.locked=true; gsChip();
  $("#gs-key-err").textContent=msg||"";
  $("#gs-lock").classList.add("open");
  setTimeout(()=>$("#gs-key").focus(), 50);
}
async function gsUnlock(){
  const v=$("#gs-key").value.trim();
  if(!v){ $("#gs-key-err").textContent="กรุณาใส่รหัสทีม"; return; }
  const btn=$("#gs-key-ok"); btn.disabled=true;
  $("#gs-key-err").textContent="กำลังเชื่อมต่อ…";
  gsState.key=v; gsState.locked=false; gsState.connected=false;
  let err=null;
  await gsRun(async()=>{ try{ await gsConnect(); }catch(e){ err=e; } });
  btn.disabled=false;
  if(err){
    gsState.locked=true; gsChip();
    $("#gs-key-err").textContent= err.code==="unauthorized"? "รหัสทีมไม่ถูกต้อง"
      : err.code==="key_not_set"? "ผู้ดูแลยังไม่ได้ตั้ง TEAM_KEY ใน Apps Script"
      : "เชื่อมต่อไม่ได้ — ตรวจอินเทอร์เน็ต หรือ URL ของ Apps Script";
    return;
  }
  try{ localStorage.setItem(LS_GS_KEY, v); }catch(e){}
  $("#gs-lock").classList.remove("open"); $("#gs-key").value=""; $("#gs-key-err").textContent="";
  gsOk(); toast("เชื่อมต่อ Google Sheet แล้ว");
}

/* ---------- เริ่มต้น (เรียกจาก boot) ---------- */
function gsInitialDb(){
  return gsRestore() || {schema:1, savedAt:0, users:[{id:"-",name:"กำลังโหลด…",role:"—"}], jobs:[]};
}
function gsStart(){
  const chip=$("#sync-chip");
  chip.setAttribute("role","button"); chip.tabIndex=0; chip.title="คลิกเพื่อซิงค์กับ Google Sheet ตอนนี้";
  const onChip=()=>{ if(gsState.locked) gsLock(); else gsSyncNow().then(()=>{ if(!gsState.error && !gsState.locked) toast("ซิงค์กับ Google Sheet แล้ว"); }); };
  chip.addEventListener("click", onChip);
  chip.addEventListener("keydown", e=>{ if(e.key==="Enter"||e.key===" "){ e.preventDefault(); onChip(); } });
  $("#gs-key-ok").addEventListener("click", gsUnlock);
  $("#gs-key").addEventListener("keydown", e=>{ if(e.key==="Enter") gsUnlock(); });
  document.addEventListener("dragend", ()=>{ if(gsState.renderLater){ gsState.renderLater=false; setTimeout(()=>gsRender(null), 0); } });
  addEventListener("beforeunload", e=>{ if(gsPendingCount()){ e.preventDefault(); e.returnValue=""; } });
  gsChip();
  try{ gsState.key=localStorage.getItem(LS_GS_KEY)||""; }catch(e){}
  if(!gsState.key){ gsLock(); return; }
  gsSyncNow();
}
</script>
<script>
"use strict";
/* ================= CALENDAR ================= */
const EV_TYPES=[
  {key:"sample", label:"Sample", color:"var(--s1)"},
  {key:"cutting", label:"Cutting", color:"var(--s7)"},
  {key:"sewing", label:"Sewing", color:"var(--s5)"},
  {key:"qc", label:"QC", color:"var(--s4)"},
  {key:"due", label:"Delivery Due", color:"var(--s8)"},
  {key:"delivered", label:"Delivered", color:"var(--s3)"}
];
function calEvents(){
  const evs=[];
  state.db.jobs.forEach(j=>{
    const h=k=>j.history.find(x=>x.status===k);
    const push=(type,date,extra)=>{ if(date) evs.push({type,date,job:j,extra}); };
    push("sample",(h("sampling")||{}).start,"ขึ้นตัวอย่าง");
    push("cutting",(h("cutting")||{}).start,"เริ่มตัด");
    push("sewing",(h("sewing")||{}).start,"เริ่มเย็บ");
    push("qc",(h("qc")||{}).start,"QC");
    push("due",j.dueDate,"กำหนดส่ง");
    push("delivered",(h("delivered")||{}).start,"ส่งมอบแล้ว");
  });
  return evs;
}
function renderCalendar(){
  $("#cal-legend").innerHTML=EV_TYPES.map(t=>`<span class="leg-item"><span class="leg-swatch" style="background:${t.color}"></span>${t.label}</span>`).join("");
  $("#cal-month-wrap").hidden = state.calView!=="month";
  $("#cal-gantt-wrap").hidden = state.calView!=="gantt";
  $("#cal-view-month").classList.toggle("active",state.calView==="month");
  $("#cal-view-gantt").classList.toggle("active",state.calView==="gantt");
  if(state.calView==="month") renderCalMonth(); else renderGantt();
}
function renderCalMonth(){
  const cur=state.calCursor, y=cur.getFullYear(), m=cur.getMonth();
  $("#cal-title").textContent=TH_M_FULL[m]+" "+(y+543);
  const first=new Date(y,m,1), startDay=(first.getDay()+6)%7; /* Monday first */
  const evs=calEvents();
  const byDate={};
  evs.forEach(e=>{ (byDate[e.date]=byDate[e.date]||[]).push(e); });
  const cells=[];
  const dows=["จ","อ","พ","พฤ","ศ","ส","อา"];
  let html=dows.map(d=>`<div class="cal-dow">${d}</div>`).join("");
  const t=todayIso();
  for(let i=0;i<42;i++){
    const d=new Date(y,m,1-startDay+i);
    const dIso=iso(d), dim=d.getMonth()!==m;
    const list=byDate[dIso]||[];
    const shown=list.slice(0,4);
    html+=`<div class="cal-cell ${dim?"dim":""} ${dIso===t?"today":""}">
      <div class="cal-daynum num">${d.getDate()}</div>
      ${shown.map(e=>{
        const tp=EV_TYPES.find(x=>x.key===e.type);
        return `<div class="cal-ev" style="border-left-color:${tp.color}" data-id="${e.job.id}" title="${esc(e.job.jobNo)} ${esc(e.job.product)} — ${tp.label}">
          <b class="mono">${esc(e.job.jobNo)}</b> ${esc(e.extra)}</div>`;
      }).join("")}
      ${list.length>4?`<span class="cal-more">+${list.length-4} รายการ</span>`:""}
    </div>`;
    if(i===41 && new Date(y,m,1-startDay+35).getMonth()===m) {} /* keep 6 rows always */
  }
  $("#cal-month-wrap").innerHTML=`<div class="cal-grid">${html}</div>`;
  $("#cal-month-wrap").querySelectorAll(".cal-ev").forEach(el=>el.addEventListener("click",()=>openJob(el.dataset.id)));
}
function renderGantt(){
  const jobs=[...state.db.jobs].filter(j=>j.startDate&&j.dueDate).sort((a,b)=>a.startDate.localeCompare(b.startDate));
  if(!jobs.length){ $("#cal-gantt-wrap").innerHTML=`<div class="empty-state">ไม่มีงาน</div>`; return; }
  $("#cal-title").textContent="Gantt — ระยะเวลาแต่ละ Job";
  const min=parseD(jobs.reduce((a,j)=>j.startDate<a?j.startDate:a,jobs[0].startDate));
  const maxIso=jobs.reduce((a,j)=>j.dueDate>a?j.dueDate:a,jobs[0].dueDate);
  const max=parseD(maxIso); max.setDate(max.getDate()+3); min.setDate(min.getDate()-2);
  const days=Math.round((max-min)/864e5)+1, pxDay=26;
  const X=d=>Math.round((parseD(d)-min)/864e5)*pxDay;
  const todayX=X(todayIso());
  /* day headers: mark Mondays + month starts */
  let headHtml="";
  for(let i=0;i<days;i++){
    const d=new Date(min); d.setDate(min.getDate()+i);
    const mark=d.getDate()===1||d.getDay()===1;
    headHtml+=`<span style="display:inline-block;width:${pxDay}px" class="${mark?'':''}">${mark? d.getDate()+"<br>"+TH_M[d.getMonth()] : "·"}</span>`;
  }
  const phase=j=>{
    const p=ST[j.status].phase;
    return p==="material"?"var(--s4)":p==="sample"?"var(--s1)":p==="production"?"var(--s7)":p==="closing"?"var(--s3)":"var(--axis)";
  };
  const rows=jobs.map(j=>{
    const x=X(j.startDate), w=Math.max(pxDay,X(j.dueDate)-x+pxDay);
    const di=dueInfo(j);
    return `<div class="g-namecol" style="grid-column:1">
        <b class="mono">${esc(j.jobNo)}</b><span class="muted" style="overflow:hidden;text-overflow:ellipsis;max-width:150px">${esc(j.product)}</span>
        ${di.state==="overdue"?'<span class="chip critical" style="font-size:9.5px">OD</span>':""}
      </div>
      <div class="g-row-track" style="grid-column:2;height:30px;min-width:${days*pxDay}px">
        <div class="g-today" style="left:${todayX}px"></div>
        <div class="g-bar" style="left:${x}px;width:${w}px;background:${phase(j)}" data-id="${j.id}" title="${esc(j.jobNo)} · ${fmtD(j.startDate)} → ${fmtD(j.dueDate)} · ${esc(stLabel(j.status))}">
          <span class="g-bar-label">${esc(stLabel(j.status))} ${jobProgress(j)}%</span>
        </div>
      </div>`;
  }).join("");
  $("#cal-gantt-wrap").innerHTML=`<div class="gantt"><div class="gantt-scroll">
    <div class="gantt-grid" style="grid-template-columns:250px 1fr">
      <div class="g-namecol" style="grid-column:1;font-weight:700">Job</div>
      <div class="g-day-head" style="grid-column:2;min-width:${days*pxDay}px;text-align:left">${headHtml}</div>
      ${rows}
    </div></div></div>
    <div class="chart-legend mt8">
      <span class="leg-item"><span class="leg-swatch" style="background:var(--s4)"></span>หาวัสดุ</span>
      <span class="leg-item"><span class="leg-swatch" style="background:var(--s1)"></span>ตัวอย่าง</span>
      <span class="leg-item"><span class="leg-swatch" style="background:var(--s7)"></span>ผลิต</span>
      <span class="leg-item"><span class="leg-swatch" style="background:var(--s3)"></span>เสร็จ/ส่งมอบ</span>
      <span class="leg-item"><span style="display:inline-block;width:2px;height:12px;background:var(--critical)"></span>วันนี้</span>
    </div>`;
  $("#cal-gantt-wrap").querySelectorAll(".g-bar").forEach(el=>el.addEventListener("click",()=>openJob(el.dataset.id)));
}

/* ================= TEAM ================= */
function renderTeam(){
  const jobs=state.db.jobs;
  const active=jobs.filter(j=>!["delivered","closed"].includes(j.status));
  const od=jobs.filter(j=>dueInfo(j).state==="overdue");
  const busiest=[...state.db.users].map(u=>({u,n:active.filter(j=>j.responsible===u.id).length})).sort((a,b)=>b.n-a.n)[0];
  $("#team-kpis").innerHTML=
    kpiHtml("สมาชิกทีม",state.db.users.length,"")+
    kpiHtml("งาน Active รวม",active.length,"")+
    kpiHtml("งานค้าง (Overdue)",od.length,"",od.length?"tone-critical":"tone-good")+
    kpiHtml("งานเยอะสุด",busiest?esc(busiest.u.name):"—",busiest?busiest.n+" งานในมือ":"");
  const maxN=Math.max(...state.db.users.map(u=>active.filter(j=>j.responsible===u.id).length),1);
  $("#team-tbl").innerHTML=`<thead><tr><th>ผู้รับผิดชอบ</th><th>Role</th><th style="width:34%">งานในมือ</th><th class="r">Active</th><th class="r">Overdue</th><th class="r">Due 3 วัน</th><th class="r">จบแล้ว</th></tr></thead>
  <tbody>${state.db.users.map(u=>{
    const mine=jobs.filter(j=>j.responsible===u.id);
    const a=mine.filter(j=>!["delivered","closed"].includes(j.status));
    const o=mine.filter(j=>dueInfo(j).state==="overdue");
    const ds=mine.filter(j=>dueInfo(j).state==="duesoon");
    const done=mine.filter(j=>["delivered","closed"].includes(j.status));
    return `<tr class="rowlink" data-uid="${u.id}">
      <td><span class="avatar">${esc(u.name.slice(0,2))}</span> <b>${esc(u.name)}</b></td>
      <td class="muted">${esc(u.role)}</td>
      <td><div class="bar-h-track" style="height:12px"><div class="bar-h-fill" style="width:${a.length/maxN*100}%;background:${o.length?"var(--serious)":"var(--s1)"};border-radius:4px"></div></div></td>
      <td class="r num"><b>${a.length}</b></td>
      <td class="r num" style="color:${o.length?"var(--critical-text)":"inherit"}">${o.length||"—"}</td>
      <td class="r num">${ds.length||"—"}</td>
      <td class="r num muted">${done.length}</td>
    </tr>`;
  }).join("")}</tbody>`;
  $("#team-tbl").querySelectorAll(".rowlink").forEach(r=>r.addEventListener("click",()=>{
    const u=state.db.users.find(x=>x.id===r.dataset.uid);
    const mine=jobs.filter(j=>j.responsible===u.id&&!["delivered","closed"].includes(j.status))
      .sort((a,b)=>(a.dueDate||"9999").localeCompare(b.dueDate||"9999"));
    $("#team-detail-card").hidden=false;
    $("#team-detail-title").textContent=`งานในมือของ ${u.name} (${mine.length})`;
    $("#team-detail-tbl").innerHTML=`<thead><tr><th>Job</th><th>สินค้า</th><th>สถานะ</th><th>ผู้รับผิดชอบ</th><th class="num">Due</th></tr></thead><tbody>${mine.map(jobRowHtml).join("")||`<tr><td colspan="5" class="empty-state">ไม่มีงานค้าง 🎉</td></tr>`}</tbody>`;
    $("#team-detail-tbl").querySelectorAll(".rowlink").forEach(x=>x.addEventListener("click",()=>openJob(x.dataset.id)));
    $("#team-detail-card").scrollIntoView({behavior:"smooth"});
  }));
}

/* ================= BOOT ================= */
function bindGlobalEvents(){
  $$("#nav .nav-item").forEach(b=>b.addEventListener("click",()=>showPage(b.dataset.page)));
  $$("[data-close]").forEach(b=>b.addEventListener("click",()=>closeModal(b.dataset.close)));
  $$(".modal-back").forEach(m=>m.addEventListener("mousedown",e=>{ if(e.target===m) closeModal(m.id); }));
  document.addEventListener("keydown",e=>{ if(e.key==="Escape"){ $$(".modal-back.open").forEach(m=>closeModal(m.id)); $("#notif-panel").classList.remove("open"); closeSearch(); } });
  $("#btn-new-job").addEventListener("click",newJobOpen);
  $("#nj-save").addEventListener("click",newJobSave);

  /* filters */
  const bindF=(sel,key,ev)=>$(sel).addEventListener(ev||"input",e=>{ filters[key]=e.target.value; renderKanban(); });
  bindF("#f-jobno","jobno"); bindF("#f-customer","customer"); bindF("#f-product","product");
  bindF("#f-status","status","change"); bindF("#f-priority","priority","change");
  bindF("#f-due","due","change"); bindF("#f-person","person","change");
  $("#f-clear").addEventListener("click",()=>{
    Object.keys(filters).forEach(k=>filters[k]="");
    ["#f-jobno","#f-customer","#f-product","#f-status","#f-priority","#f-due","#f-person"].forEach(s=>$(s).value="");
    renderKanban();
  });

  /* global search */
  const gs=$("#global-search");
  gs.addEventListener("input",()=>{ srSel=-1; renderSearchResults(searchJobs(gs.value)); });
  gs.addEventListener("keydown",e=>{
    const list=searchJobs(gs.value);
    if(e.key==="ArrowDown"){ e.preventDefault(); srSel=Math.min(srSel+1,list.length-1); renderSearchResults(list); }
    else if(e.key==="ArrowUp"){ e.preventDefault(); srSel=Math.max(srSel-1,0); renderSearchResults(list); }
    else if(e.key==="Enter"){
      const j=list[srSel>=0?srSel:0];
      if(j){ openJob(j.id); closeSearch(); }
    }
  });
  gs.addEventListener("blur",()=>setTimeout(()=>$("#search-results").classList.remove("open"),150));

  /* notifications */
  $("#notif-btn").addEventListener("click",()=>{
    const p=$("#notif-panel");
    if(p.classList.contains("open")) p.classList.remove("open");
    else{ renderNotifPanel(); p.classList.add("open"); }
  });
  document.addEventListener("mousedown",e=>{
    const p=$("#notif-panel");
    if(p.classList.contains("open") && !p.contains(e.target) && !$("#notif-btn").contains(e.target)) p.classList.remove("open");
  });

  /* theme */
  $("#theme-btn").addEventListener("click",()=>{
    const cur=document.documentElement.dataset.theme;
    const next=cur==="dark"?"light":cur==="light"?"dark":(matchMedia("(prefers-color-scheme: dark)").matches?"light":"dark");
    document.documentElement.dataset.theme=next;
    try{ localStorage.setItem(LS_THEME,next); }catch(e){}
  });

  /* current user */
  $("#user-select").addEventListener("change",e=>{
    state.currentUser=state.db.users.find(u=>u.id===e.target.value)||null;
    try{ localStorage.setItem(LS_USER,e.target.value); }catch(err){}
  });

  /* job detail tabs */
  $$("#jd-tabs .tab").forEach(t=>t.addEventListener("click",()=>{ state.jobTab=t.dataset.tab; renderJobDetail(); }));

  /* business period */
  $$("#biz-period button").forEach(b=>b.addEventListener("click",()=>{ state.bizPeriod=b.dataset.p; renderBusiness(); }));

  /* calendar */
  $("#cal-prev").addEventListener("click",()=>{ state.calCursor.setMonth(state.calCursor.getMonth()-1); renderCalendar(); });
  $("#cal-next").addEventListener("click",()=>{ state.calCursor.setMonth(state.calCursor.getMonth()+1); renderCalendar(); });
  $("#cal-today").addEventListener("click",()=>{ state.calCursor=new Date(); renderCalendar(); });
  $("#cal-view-month").addEventListener("click",()=>{ state.calView="month"; renderCalendar(); });
  $("#cal-view-gantt").addEventListener("click",()=>{ state.calView="gantt"; renderCalendar(); });
}

async function boot(){
  try{ const th=localStorage.getItem(LS_THEME); if(th) document.documentElement.dataset.theme=th; }catch(e){}
  const sheets=gsEnabled();
  if(sheets){
    /* Google Sheets mode: แสดง cache ในเครื่องก่อน แล้วค่อยดึงจาก Sheet */
    state.mode="sheets"; state.db=gsInitialDb();
  }else{
    /* prefer whichever copy is newer: a fresh embed (republish) must beat a stale local cache */
    const loc=loadLocal(), emb=loadEmbed();
    state.db = (loc&&emb)? (((emb.savedAt||0)>(loc.savedAt||0))? emb : loc) : (loc || emb || makeSeed());
    if(!state.db.jobs) state.db=makeSeed();
  }
  /* current user */
  try{
    const uid=localStorage.getItem(LS_USER);
    state.currentUser=state.db.users.find(u=>u.id===uid)||state.db.users[0];
  }catch(e){ state.currentUser=state.db.users[0]; }
  fillPersonSelects();
  $("#user-select").value=state.currentUser.id;
  bindGlobalEvents();
  $("#db-stamp").textContent=state.db.savedAt?"อัปเดตล่าสุด "+fmtDT(state.db.savedAt):"";
  showPage("board");
  renderNotifBadge();
  restoreUi();
  if(sheets){ gsStart(); return; }

  /* shared mode: light up artifact sync when available */
  if(window.claude && typeof window.claude.use==="function"){
    try{
      const art=await window.claude.use("artifact");
      if(art){
        state.artifact=art; state.mode="shared";
        setSyncChip("","ซิงค์กับทีมแล้ว");
        /* pull latest shared db.json if it exists and is newer */
        try{
          const res=await fetch("data/db.json",{cache:"no-store"});
          if(res.ok){
            const shared=await res.json();
            if(shared && shared.jobs){
              if(!state.db.savedAt || (shared.savedAt||0) >= (state.db.savedAt||0)){
                state.db=shared;
                try{ localStorage.setItem(LS_KEY,JSON.stringify(state.db)); }catch(e){}
                const uid2=localStorage.getItem(LS_USER);
                state.currentUser=state.db.users.find(u=>u.id===uid2)||state.db.users[0];
                fillPersonSelects(); $("#user-select").value=state.currentUser.id;
                refreshAll();
              }else{
                /* local copy is newer (a save didn't reach the team yet) — push it */
                state.dirty=true; publishShared();
              }
            }
          }
        }catch(e){ /* no shared data file yet — embedded/local data stands */ }
      }else{
        setSyncChip("local","เฉพาะเครื่องนี้ (localStorage)");
      }
    }catch(e){ setSyncChip("local","เฉพาะเครื่องนี้ (localStorage)"); }
  }else{
    setSyncChip("local","เฉพาะเครื่องนี้ (localStorage)");
  }
  /* flush pending sync before leaving */
  addEventListener("beforeunload",()=>{ if(state.dirty){ /* html publish may reload anyway */ } });
}
boot();
</script>
</body>
</html>
