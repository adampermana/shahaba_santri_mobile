# APK/AAB Size Reduction Plan — Sahaba Mobile

**Current size:** APK 150.9 MB | AAB 104.8 MB  
**Target:** APK < 50 MB (per-ABI) | AAB < 60 MB  
**Date:** 2026-09-15

---

## Root Cause Analysis

### APK Breakdown (150.9 MB)

| Component | Size | % | Notes |
|---|---|---|---|
| `lib/` (native .so) | **131 MB** | **87%** | 3 ABIs bundled, no split |
| `assets/flutter_assets/` | 13 MB | 8.6% | Fonts, images, audio, SVGs |
| `classes.dex` | 6.8 MB | 4.5% | Compiled Dart + Kotlin |
| `res/` | 2.7 MB | 1.8% | Android resources |
| Other | <1 MB | <1% | Manifest, META-INF, etc. |

### Native Libraries Detail (131 MB total)

| Library | arm64-v8a | armeabi-v7a | x86_64 | Source |
|---|---|---|---|---|
| `libapp.so` | 23 MB | 26 MB | 24 MB | Flutter app (Dart AOT) |
| `libflutter.so` | 12 MB | 8.1 MB | 13 MB | Flutter engine |
| `libmlkit_google_ocr_pipeline.so` | 11 MB | 6.5 MB | 12 MB | MLKit text recognition |
| `libdartjni.so` | 124 KB | 76 KB | 108 KB | flutter_compass JNI |
| Other small .so | <200 KB | <200 KB | <200 KB | Various |

### Asset Bloat in APK

| Asset | Size | Package/Source | Used? |
|---|---|---|---|
| KaTeX fonts (21 .ttf files) | ~540 KB | flutter_math_fork (via flutter_html) | ❌ Unlikely — Quran app, no math |
| JetBrainsMono-Regular.ttf | 274 KB | gpt_markdown | ⚠️ Only if AI chat uses code blocks |
| glass_kit/noise.png | 850 KB | glass_kit package | ⚠️ If glass effect used |
| Synonym font (6 weights) | ~404 KB | Project fonts | ✅ Used in UI |
| lpmq.otf | 180 KB | Project fonts | ✅ Quran text (Indopak) |
| adzan-default.mp3 | 795 KB | Project audio | ✅ Adzan alarm |

---

## Identified Causes (Ranked by Impact)

### 1. [CRITICAL] No ABI Split — 3 architectures bundled in one APK (~131 MB)
- **build.gradle.kts** has no `splits { abi { ... } }` block
- x86_64 (47 MB) is emulator-only — **zero production devices need this**
- armeabi-v7a (40 MB) — only older devices, ~5% of modern Android market
- arm64-v8a (45 MB) — 95%+ of devices, this is the only one most users need
- **APK impact:** Single APK = 131 MB native. With ABI split, each user downloads only ~45 MB
- **AAB impact:** Play Store does per-ABI delivery automatically, but the AAB itself is 104 MB (still large)

### 2. [HIGH] MLKit OCR native lib — ~30 MB across ABIs
- `libmlkit_google_ocr_pipeline.so` = 11 + 6.5 + 12 = **~29.5 MB**
- From `google_mlkit_text_recognition` + 4 additional language models
- Used in: `lib/infrastructure/services/ocr_service.dart` (scan produk feature)
- 4 unnecessary model dependencies in build.gradle.kts:
  - `text-recognition-chinese` (unused — not an Indopak/Arabic OCR model)
  - `text-recognition-japanese` (unused)
  - `text-recognition-korean` (unused)
  - `text-recognition-devanagari` (unused)
- **These don't add separate .so files** (they share the pipeline), but add ~5-10 MB in model files per language at runtime

### 3. [MEDIUM] flutter_html → flutter_math_fork → 21 KaTeX font files (~540 KB)
- `flutter_html: ^3.0.0` pulls `flutter_math_fork` as transitive dependency
- KaTeX fonts bundled even though Quran app has no math rendering
- Used in: `detail_kisah_screen.dart`, `detail_news_screen.dart` (HTML content rendering)
- **Alternative:** Replace with `flutter_widget_from_html` (~3× smaller, no math dependency)

### 4. [LOW] Unused transitive fonts
- `gpt_markdown` JetBrainsMono (274 KB) — only needed if AI chat renders code blocks
- `glass_kit` noise.png (850 KB) — check if glass effects are actually used

---

## Action Plan

### Phase 1: ABI Splits (Biggest Impact — ~105 MB APK reduction)

**File:** `android/app/build.gradle.kts`

```kotlin
android {
    // ... existing config ...
    
    splits {
        abi {
            isEnable = true
            reset()
            include("arm64-v8a", "armeabi-v7a")  // exclude x86_64
            isUniversalApk = false  // no fat APK
        }
    }
}
```

**Expected result:**
- APK per-ABI: ~45-50 MB (down from 150.9 MB)
- AAB: Play Store delivers per-ABI automatically; AAB size drops ~47 MB (no x86_64)

### Phase 2: Remove Unnecessary MLKit Models

**File:** `android/app/build.gradle.kts`

```kotlin
// REMOVE these 4 lines:
// implementation("com.google.mlkit:text-recognition-chinese:16.0.1")
// implementation("com.google.mlkit:text-recognition-devanagari:16.0.1")
// implementation("com.google.mlkit:text-recognition-japanese:16.0.1")
// implementation("com.google.mlkit:text-recognition-korean:16.0.1")

// KEEP only base (Latin script, covers Indonesian/English):
implementation("com.google.mlkit:text-recognition:16.0.1")
```

**Note:** The base `text-recognition` package covers Latin script. For Arabic/Indopak OCR, MLKit doesn't have a model — check if `ocr_service.dart` actually needs these. If the scan produk feature scans Latin text (barcodes, product labels), only the base package is needed.

**Expected result:** ~5-10 MB reduction in AAB/APK (model files not bundled .so)

### Phase 3: Replace flutter_html with Lighter Alternative

**File:** `pubspec.yaml`

```yaml
# REMOVE:
# flutter_html: ^3.0.0

# ADD:
flutter_widget_from_html_core: ^0.15.0
# (or html package + custom renderer)
```

**File updates needed:**
- `lib/presentation/screens/home/kisah/detail_kisah_screen.dart`
- `lib/presentation/screens/home/news/detail_news_screen.dart`
- `lib/infrastructure/quran/datasources/quran_local_datasource.dart`
- `lib/presentation/screens/quran_screen/search_quran_screen.dart`

Replace `<HtmlWidget>` with `<HtmlWidget>` from `flutter_widget_from_html` (API is similar).

**Expected result:** ~540 KB (KaTeX fonts) + ~2 MB (flutter_html + transitive deps in Dart code) saved

### Phase 4: Audit & Remove Unused Assets

1. **Check if gpt_markdown code font is used:**
   - Search `sahaba_ai_screen.dart` for code block rendering
   - If not used, exclude JetBrainsMono via pubspec `shrink` or conditional asset loading

2. **Check if glass_kit noise.png is used:**
   - Search project for `GlassKit`, `noise.png`, `Glass` widget usage
   - If not used, remove `glass_kit` dependency

3. **Verify all assets in pubspec are actually referenced in code**

**Expected result:** 1-2 MB

### Phase 5: Enable R8 Full Mode (if not already)

**File:** `android/gradle.properties`

```properties
android.enableR8.fullMode=true
```

Already has `isMinifyEnabled = true` + `isShrinkResources = true` — R8 full mode may squeeze another 1-3 MB from `classes.dex` and `libapp.so`.

---

## Expected Results Summary

| Phase | APK Savings | AAB Savings | Risk |
|---|---|---|---|
| 1. ABI splits | ~105 MB (per-ABI ~45 MB) | ~47 MB (no x86_64 in bundle) | None — standard practice |
| 2. Remove MLKit models | ~5-10 MB | ~5-10 MB | Low — verify OCR feature |
| 3. Replace flutter_html | ~2-3 MB | ~2-3 MB | Medium — 4 files need update |
| 4. Remove unused assets | ~1-2 MB | ~1-2 MB | Low — audit first |
| 5. R8 full mode | ~1-3 MB | ~1-3 MB | None |
| **Total estimated** | **~115-123 MB** | **~57-65 MB** | |

**Final target:** APK ~45-50 MB per-ABI, AAB ~45-55 MB

---

## Verification Steps

After each phase:
1. `fvm flutter build apk --release --flavor development --target lib/main_development.dart`
2. `fvm flutter build aab --release --flavor development --target lib/main_development.dart`
3. Check sizes, verify app still builds and runs
4. Test affected features (OCR scan, HTML content rendering, glass UI)
