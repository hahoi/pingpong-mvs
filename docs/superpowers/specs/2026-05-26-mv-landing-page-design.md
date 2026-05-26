# 桌球 MV 集 GitHub Pages 落地頁 — 設計文件

- **日期:** 2026-05-26
- **作者:** Claude(與 user 共同腦力激盪)
- **狀態:** Draft,待 user review
- **目標 URL:** https://hahoi.github.io/pingpong-mvs/

## 1. 目的與受眾

做一個極簡的 GitHub Pages 落地頁,把 4 支自製桌球主題 MV 集中展示,給「新莊桌球聯誼會」的社團朋友看,主要透過 LINE / FB 分享。

**受眾畫像:**
- 桌球社團朋友,中文,看完笑一笑分享
- **多數人手機開啟**(LINE 分享為主),桌機為輔
- 不需要技術細節、不需要 production notes、不需要 portfolio 包裝

**成功標準:**
- 朋友丟到 LINE 群,跳出含縮圖的卡片(OG 生效)
- 點開網頁,手機 1-2 秒內第一支影片就能開始播
- 桌機與手機都不會跑版

## 2. 範圍

### 包含
- 4 支 MV 影片播放器(直式滾動)
- 一行主標題 + 一行說明
- 一行 footer(製作工具標註)
- OG meta tags(LINE/FB/Twitter 分享預覽)

### 不包含(明確排除)
- 歌詞展示
- 製作流程說明 / pipeline 介紹
- 分鏡圖 / character sheet
- 任何後台 / CMS
- 留言 / 互動功能
- Google Analytics 或任何 tracking
- 多頁面結構(就一頁)
- 中英雙語(中文 only)

## 3. 內容清單

### 4 支 MV

| 順序 | 區塊 | 來源檔(本機) | 目標檔名(repo 內) |
|---|---|---|---|
| 1 | 桌球助燃曲(大卡) | `ping_pong_mv/outputs/mv_v1_manga_subbed.mp4` | `mvs/pingpong_zhuran.mp4` |
| 2 | 不是我的錯 — A | `ping_pong_music/outputs/mv_v1_A_roughcut.mp4` | `mvs/notmyfault_A_hiphop.mp4` |
| 3 | 不是我的錯 — B | `ping_pong_music/outputs/mv_v1_B_roughcut.mp4` | `mvs/notmyfault_B_nursery.mp4` |
| 4 | 不是我的錯 — C | `ping_pong_music/outputs/mv_v1_C_roughcut.mp4` | `mvs/notmyfault_C_comedypop.mp4` |

**備註:** 桌球助燃曲選 `subbed` 版(有字幕),朋友看 MV 通常想看到歌詞。不是我的錯 A/B/C 是 rough cut(CapCut 後製尚未完成),CapCut 完成後直接覆蓋同檔名重 push 即可。

### 文案(所有顯示文字)

**頁面 header:**
- 主標題:`🏓 桌球 MV 集`
- 副標題:`個人練手作品,自己玩開心的`

**桌球助燃曲區塊:**
- 分區標題:`─── 桌球助燃曲 ───`
- 影片下方 caption:`漫畫風 60 秒打氣 MV`

**不是我的錯區塊:**
- 分區標題:`─── 不是我的錯 — 敗北藉口宇宙辭典 ───`
- 分區說明:`三個風格版本,選你愛的那首`
- 每張小卡內(影片上方):badge `A` / `B` / `C`(綠色膠囊)+ 風格 label `嘻哈` / `兒歌` / `喜劇 pop`
- 每張小卡 caption(影片下方):`95 BPM` / `108 BPM` / `92 BPM`

**Footer:**
- `素材:MiniMax(音樂) / Sora(影片) / GPT Image(分鏡)— 2026 春`

## 4. Repo 結構

```
pingpong-mvs/
├── README.md                       # 簡短說明 + 線上連結
├── index.html                      # 唯一一頁
├── assets/
│   └── og-cover.jpg                # 1200x630,LINE/FB 分享縮圖
├── mvs/
│   ├── pingpong_zhuran.mp4         # ~24 MB(+faststart)
│   ├── notmyfault_A_hiphop.mp4     # ~29 MB(+faststart)
│   ├── notmyfault_B_nursery.mp4    # ~28 MB(+faststart)
│   └── notmyfault_C_comedypop.mp4  # ~28 MB(+faststart)
├── scripts/
│   └── prepare_videos.ps1          # 批次跑 ffmpeg +faststart
└── .gitignore                      # 排除作業檔
```

- 總 repo 大小:約 110 MB
- 單檔最大 30 MB,均在 GitHub 50 MB 警告線以下
- Repo 須為 **public**(GitHub Pages 免費方案要求)

## 5. 頁面 Layout

直式滾動,單頁。

```
┌─────────────────────────────────────────────┐
│   🏓 桌球 MV 集                              │  主標題
│   個人練手作品,自己玩開心的                  │  副標題
├─────────────────────────────────────────────┤
│   ─── 桌球助燃曲 ───                         │
│   ┌─────────────────────────────────────┐   │
│   │      [大影片播放器,16:9]            │   │  單一大卡
│   └─────────────────────────────────────┘   │
│   漫畫風 60 秒打氣 MV                        │  caption
├─────────────────────────────────────────────┤
│   ─── 不是我的錯 — 敗北藉口宇宙辭典 ───      │
│   三個風格版本,選你愛的那首                  │
│                                             │
│   ┌──────┐  ┌──────┐  ┌──────┐              │
│   │  A   │  │  B   │  │  C   │              │  桌機:3 並排
│   │嘻哈  │  │兒歌  │  │喜劇  │              │  手機:自動疊
│   │[影片]│  │[影片]│  │[影片]│              │
│   └──────┘  └──────┘  └──────┘              │
│   95 BPM    108 BPM   92 BPM                │
├─────────────────────────────────────────────┤
│   素材:MiniMax / Sora / GPT Image — 2026 春 │  footer
└─────────────────────────────────────────────┘
```

### RWD 行為

- **桌機(寬 ≥ 760px):** 不是我的錯 A/B/C 三版 CSS Grid 並排,每格約 280px
- **手機(< 760px):** 三版自動疊成單欄,桌球助燃曲影片自動撐滿父容器寬度
- **頁面最大寬:** 960px 置中,左右留 24px padding

### 影片元素

統一使用:
```html
<video controls preload="metadata" playsinline width="100%"
       src="mvs/<檔名>.mp4"></video>
```

- `controls`:顯示原生播放控制(play/pause/seek/volume/全螢幕)
- `preload="metadata"`:只先載 metadata(幾 KB),點 play 才真載影片 → 避免一進頁就吃 110 MB 流量
- `playsinline`:iOS Safari 不要強制全螢幕
- 不設 `autoplay`,不設 `muted`,不設 `loop`(打開就播會嚇到人,也吃流量)
- 路徑用相對路徑(`mvs/...`),不寫死 absolute URL,方便本地預覽

## 6. 視覺風格

**色票**(沿用 [ping_pong_music/player.html](../../../../ping_pong_music/player.html)):
```css
--bg:          #0e1117    /* 整頁底色,深色 */
--card:        #161b22    /* 卡片底色,稍淺 */
--border:      #30363d    /* 卡片邊框,低對比 */
--text:        #e6edf3    /* 主要文字,近白 */
--muted:       #7d8590    /* 次要文字(caption、footer),灰 */
--accent:      #ff6b6b    /* 強調紅(主標題、分隔線) */
--accent-soft: #4ecca3    /* 強調綠(分區標題、A/B/C badge) */
```

**字型 stack:**
```css
font-family:
  -apple-system, BlinkMacSystemFont,
  "Microsoft JhengHei", "PingFang TC", "Noto Sans CJK TC",
  sans-serif;
```

**字級**(行動優先):
- 主標題(`<h1>`):28px,紅 accent
- 分區標題:18px,綠 accent,左右 `───` 短線(用 `::before`/`::after` border)
- 影片 caption:13px,muted 灰
- Body line-height:1.5

**卡片樣式:**
- 1px solid `--border` + 10px border-radius(與 player.html 一致)
- 內距 16px

**A/B/C badge:**
- 小膠囊(2px 4px padding,4px radius,11px 字),底色 `--accent-soft`,字白

## 7. OG meta tags

`<head>` 內固定塞入:

```html
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>🏓 桌球 MV 集 — 自製 4 支</title>

<meta property="og:type"        content="website">
<meta property="og:title"       content="🏓 桌球 MV 集 — 自製 4 支">
<meta property="og:description" content="桌球助燃曲 + 不是我的錯(敗北藉口宇宙辭典)三版,個人練手 AI 作品">
<meta property="og:image"       content="https://hahoi.github.io/pingpong-mvs/assets/og-cover.jpg">
<meta property="og:url"         content="https://hahoi.github.io/pingpong-mvs/">

<meta name="twitter:card"        content="summary_large_image">
<meta name="twitter:title"       content="🏓 桌球 MV 集 — 自製 4 支">
<meta name="twitter:description" content="桌球助燃曲 + 不是我的錯三版,個人練手 AI 作品">
<meta name="twitter:image"       content="https://hahoi.github.io/pingpong-mvs/assets/og-cover.jpg">
```

### og-cover.jpg 製作

**首選來源:** `ping_pong_music/outputs/20260526_093358_character_hero_v2.png`(主角,辨識度最高)

**備案:**
- `20260526_094007_chorus_3_2_cosmic_v1.png`(宇宙副歌場景,氣勢)
- `20260526_091339_card_00_title_v2.png`(原本就是封面用途)

**轉檔指令:**
```powershell
ffmpeg -i ping_pong_music/outputs/20260526_093358_character_hero_v2.png `
  -vf "scale=1200:630:force_original_aspect_ratio=increase,crop=1200:630" `
  -q:v 3 assets/og-cover.jpg
```

最終選哪張可在 implementation 階段定;若 implementation 沒額外指示,**預設用首選** `character_hero_v2.png`。

## 8. 影片前處理 — faststart(必做)

**為什麼必做:** MP4 預設把 moov atom(影片索引)放在檔尾,瀏覽器要載完整檔才能開始解碼。`+faststart` 把 moov 搬到檔頭,等於 progressive streaming,點 play 立刻開播。

**單檔指令:**
```powershell
ffmpeg -i 來源.mp4 -c copy -movflags +faststart 輸出.mp4
```

- `-c copy` = 不重新編碼,只搬 metadata,**幾秒搞定**,品質不變,大小幾乎不變

**`scripts/prepare_videos.ps1`** 自動跑 4 個轉檔,以後 rough cut 升級成 CapCut 正式版時,改 source 路徑重跑一次即可。

```powershell
# scripts/prepare_videos.ps1(草案,implementation 階段定稿)
$src = @{
  "mvs/pingpong_zhuran.mp4"        = "../ping_pong_mv/outputs/mv_v1_manga_subbed.mp4"
  "mvs/notmyfault_A_hiphop.mp4"    = "../ping_pong_music/outputs/mv_v1_A_roughcut.mp4"
  "mvs/notmyfault_B_nursery.mp4"   = "../ping_pong_music/outputs/mv_v1_B_roughcut.mp4"
  "mvs/notmyfault_C_comedypop.mp4" = "../ping_pong_music/outputs/mv_v1_C_roughcut.mp4"
}
foreach ($dst in $src.Keys) {
  ffmpeg -y -i $src[$dst] -c copy -movflags +faststart $dst
}
```

## 9. 部署流程

```
1. mkdir pingpong-mvs && cd pingpong-mvs
2. git init -b main
3. 跑 scripts/prepare_videos.ps1 → 產出 4 個 +faststart MP4 到 mvs/
4. 產 og-cover.jpg(一行 ffmpeg)
5. 寫 index.html + README.md
6. git add . && git commit -m "init: 桌球 MV 集首頁"
7. 在 GitHub 開新 public repo `pingpong-mvs`,git remote add origin → git push
8. Settings → Pages → Source 選 "main" / 根目錄 → Save
9. 等 1-2 分鐘,網址 https://hahoi.github.io/pingpong-mvs/ 上線
10. 把網址貼 LINE 群測 OG 預覽
```

## 10. 驗收 Checklist

Implementation 完成後對著跑:

- [ ] 桌機 Chrome:4 支 MV 都能播,seek 拉條順
- [ ] 手機 Safari + 手機 Chrome:點 play 1-2 秒內開始播(faststart 有效)
- [ ] 視窗縮到 < 760px:不是我的錯三版自動疊成直排
- [ ] 視窗 ≥ 760px:不是我的錯三版並排
- [ ] 重新整理:影片不會一次全載(`preload="metadata"` 有效,Network 面板觀察)
- [ ] LINE 貼網址:跳出含縮圖 + 標題 + 描述的卡片
- [ ] Facebook 貼網址:同上
- [ ] 無 console error
- [ ] 無 404(4 個影片 + og-cover.jpg 全部 200)

## 11. 風險與後續

### 風險

- **GitHub Pages 流量上限:** 軟性上限 100 GB/月,單檔 ~30 MB → 約 3,000 次完整觀看上限,社團朋友規模綽綽有餘。若爆量 GitHub 會 throttle 不會收費。
- **MP4 編碼相容:** 確認 H.264 + AAC,iOS Safari 不支援 H.265 / AV1。`compose_mv.py` 預設 ffmpeg 輸出應為 H.264,implementation 階段用 `ffprobe` 驗一次。
- **rough cut 字幕未對齊:** A/B/C 是 rough cut,字幕/節拍可能不完美,以「先讓朋友看」為原則接受,CapCut 完工後重 push 覆蓋。

### 後續(本 spec 範圍外)

- CapCut 後製完成 → 用同檔名覆蓋 → `git commit` → 自動更新
- 之後可能加歌詞(`<details>` 收摺,點開才展開)
- 之後可能加分鏡 making-of 區
- 之後可能多語言 / 加英文版

這些都不在本次 spec,實作只做上面 1-10 節。
