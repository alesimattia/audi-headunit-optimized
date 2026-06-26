---
name: ntg062-debloat-targets
description: NTG_062 — bersagli di debloat VERIFICATI nel codice (cosa togliere e cosa NO) — bg.png 1.5MB coperta, car.png orfana, androidx/media inutilizzato ~1.5MB, e perché il resto delle androidx NON è rimovibile a cuor leggero
metadata:
  type: project
---

Bersagli di alleggerimento **verificati nel codice** (2026-06-25), per l'obiettivo "footprint minimo". Distinguo **win sicuri** da **trappole**. Storia del debloat già fatto in [[ntg062-applied-mods]]; meccanica cancellazione risorse in [[ntg062-modding-build]].

**WIN SICURI — ✅ APPLICATI 2026-06-25** (diff in [[ntg062-applied-mods]] punto 14; ancora da ricompilare)
- ✅ **`res/drawable/bg.png` = 1.52 MB** (sfondo del `LinearLayout` root di `activity_fullscreen.xml`, coperto da `ViewPager` `#f000` + `DvrPreviewSurfaceView` → mai visibile): `android:background` ripuntato a `#ff000000`, PNG + voce `public.xml` (0x7f040001) eliminati. ⚠️ LEZIONE: è un `android:background` **statico** → si DEVE togliere/repuntare l'attributo PRIMA di cancellare il PNG (Trappola 4 di [[ntg062-cardoor-images]]); avevo cancellato il PNG prima dell'edit layout → stato rotto transitorio, poi sistemato subito.
- ✅ **`res/drawable/car.png` = 113 KB**: orfana (0 usi reali) → file + voce `public.xml` (0x7f040002) eliminati.
- ✅ **Isola media morta = `androidx/media` (434) + `android/support/v4/media` (167) = 601 classi (~5.6 MB smali)**: **0 riferimenti** da `com/spd` (l'unico contatto, `MediaPlayer2.MEDIA_INFO_BAD_INTERLEAVING`, è una **costante int inlinata** =800). ⚠️ CORREZIONE: NON era isola di sola `androidx/media` — questa era referenziata da `android/support/v4/media[/session]` (`MediaSessionCompat`), a sua volta non referenziata da nient'altro fuori dall'isola → **closure chiusa**, rimossa per intero. Orfani innocui: campi `R$drawable.bg/.car`, `notification_*` (layout/drawable/id da `NotificationCompat`).

**TRAPPOLE (NON rimuovere "perché senza import")**
- Le altre `androidx/*` (~5.3 MB totali di smali-libreria: `core` ~390 file, `fragment`, `lifecycle`, `loader`, `support/v4` legacy, `customview`, `collection`, `interpolator`, `coordinatorlayout`, `swiperefreshlayout`, `drawerlayout`, `slidingpanelayout`, `cursoradapter`, `print`, `documentfile`, `localbroadcastmanager`, ecc.) **NON sono tutte morte**. L'app usa davvero solo `androidx/viewpager` (lo slider) + `androidx/annotation` (@NonNull/@Nullable), MA `viewpager` tira **dipendenze transitive** (`androidx/core`, `androidx/customview`, `androidx/collection`, `androidx/interpolator`, compat `support-v4`/`legacy`). Rimuoverle perché "senza import diretto nel codice app" rompe compilazione/runtime. Per potarle serve il **grafo delle dipendenze reale** (non l'assenza di import): un'euristica di un sub-agente aveva proposto erroneamente ~3.8 MB "liberi" — da NON seguire.
- `notification_*` (14 layout + ~11 drawable + ~44 id orfani in `ids.xml`/`public.xml`, ~30 KB totali): provengono da `NotificationCompat` (androidx media/core). Piccoli → ha senso toglierli **solo insieme** alla libreria che li genera, altrimenti l'analisi statica li vede orfani ma il build li reintroduce.

**Rimosso (2026-06-25)**: bg.png 1.5MB + car.png 0.11MB (asset diretti) + isola media **601 classi / ~5.6 MB smali** (→ riduzione dex significativa dopo compilazione). Oltre questo è dependency-pruning ad alto rischio/basso ritorno (vedi Trappole). NB: `compile_sign_align.sh` fa già `rm -rf build/` (obbligatorio dopo cancellazioni risorse — Trappola cache di [[ntg062-modding-build]]). **Da validare con build+install** (ancora non ricompilato).
