# 🏓 桌球 MV 集

個人練手作品的展示頁,自製 5 支桌球主題 MV。

**線上看:** https://hahoi.github.io/pingpong-mvs/

## 內容

- **桌球助燃曲** — 漫畫風 60 秒打氣 MV
- **不是我的錯 — 桌球敗北藉口宇宙辭典** — 同首歌四個風格版本
  - A 嘻哈 (95 BPM)
  - B 兒歌 (108 BPM)
  - C 喜劇 pop (92 BPM)
  - D Lo-Fi (80 BPM)

## 本地預覽

```powershell
# 任一 HTTP server 都行,例如:
python -m http.server 8000
# 開 http://localhost:8000
```

直接雙擊 `index.html` 也可以,但部份瀏覽器對 `file://` 影片載入有限制,建議用 server。

## 重新產影片

來源 rough cut 升級成 CapCut 正式版後:

```powershell
# 改 scripts/prepare_videos.ps1 內的來源路徑後跑
pwsh ./scripts/prepare_videos.ps1
git commit -am "update: 換上 CapCut 正式版"
git push
```

GitHub Pages 1-2 分鐘自動更新。

## 製作素材

MiniMax(音樂) / Sora(影片) / GPT Image(分鏡) / ffmpeg(剪輯)— 2026 春
