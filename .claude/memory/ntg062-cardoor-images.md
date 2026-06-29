---
name: ntg062-cardoor-images
description: NTG_062 — sistema immagini "stato porte" (CarDoorWindowView), le 4 trappole non ovvie per chi vuole cambiare/snellire le sagome auto
metadata:
  type: reference
---

> ⚠️ **STORICO — pagina RIMOSSA il 2026-06-29** (punto 16 di [[ntg062-applied-mods]]). `CarDoorWindowView`, il layout e i 15 PNG `carinfo_audi_car_door_*_02` non esistono più nei sorgenti. Questo file resta come riferimento sul *come funzionava* (utile se in futuro si vuole reintrodurre una pagina porte). I 7 id `id_car_door_*` sono ancora in `ids.xml`/`public.xml` come orfani innocui.

`CarDoorWindowView` (layout `carinfo_benz_car_door_layout.xml`) mostra l'auto **vista dall'alto** con overlay di cofano/baule/4 porte che si attivano all'apertura. Le immagini sono caricate **DINAMICAMENTE** in `resetBenzCarDoorIcon` via:
`getResources().getIdentifier("carinfo_audi_car_door_<pezzo>" + "_0" + type, "drawable", pkg)`, dove `type = Settings.System.getInt("SETTING_BENZ_CAR_TYPE", 0)` (**default 0**).

**Trappola 1 — audi vs benz**: la famiglia VIVA è **`carinfo_audi_car_door_*`** (nome "audi" usato come base generica), NON la benz, malgrado l'app sia per NTG/Benz. I tipi audi `_00`.._03 = 4 carrozzerie (0 berlina scura, 1 SUV, 2 berlina/coupé≈A5, 3 cabrio). La famiglia **`carinfo_benz_car_door_*`** (124 file, tipi `_00`.._07, ~5 MB) è dichiarata solo nelle classi `R$` e **mai caricata** → peso morto.

**Trappola 2 — `getIdentifier` inganna gli shrinker**: risorse risolte per NOME sembrano "inutilizzate" all'analisi statica ma servono. Stesso schema per la navi: `assets/a_map_auto_tip_<n>.png` e `cross_tip_<n>.png` (vedi [[ntg062-navigation]]). Non fidarsi di resource-shrinker.

**Trappola 3 — i "3257 riferimenti benz" nello smali sono falsi**: sono dichiarazioni di campo in `R$drawable.smali` ripetute in ogni modulo androidx, NON uso reale.

**Trappola 4 — `android:src` statico nel layout**: `carinfo_benz_car_door_layout.xml` imposta `android:src` sui drawable benz **non tipizzati** (`carinfo_benz_car_door_bg/hood/trunk/front_left/front_right/rear_left/rear_right`). Cancellarli rompe il link aapt2 (anche se il codice li sovrascrive all'init). Fix: tenerli, oppure ripuntare i `src` sul set tenuto.

**Un set-tipo completo = 15 pezzi** (tutti suffissi `_0<tipo>`): `bg, front_left, front_right, rear_left, rear_right, hood, trunk` (overlay) + `left_front, right_front, left_rear, right_rear, hood_on, trunk_on, left_off, right_off` (composizioni singola-porta/chiuso). `warning_icon` (non tipizzato) è inutilizzato.

**Per tenere UN solo tipo e vederlo sempre**: conservare i 15 file audi di quel tipo **E** fissare il tipo nello smali (col default 0 non troverebbe un `_02` tenuto). Vedi [[ntg062-applied-mods]].
