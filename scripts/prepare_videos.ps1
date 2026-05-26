# 把 4 支來源 MP4 加上 +faststart(moov atom 搬到檔頭),產出到 mvs/
# -c copy = 不重新編碼,只搬 metadata,幾秒搞定,品質不變
#
# 用法:在 repo 根目錄執行
#   pwsh ./scripts/prepare_videos.ps1
#
# 來源 rough cut 重做後,改下面 $src 對應路徑再跑一次即可。

$ErrorActionPreference = "Stop"

$src = [ordered]@{
  "mvs/pingpong_zhuran.mp4"        = "../ping_pong_mv/outputs/mv_v1_manga_subbed.mp4"
  "mvs/notmyfault_A_hiphop.mp4"    = "../ping_pong_music/outputs/mv_v1_A_roughcut.mp4"
  "mvs/notmyfault_B_nursery.mp4"   = "../ping_pong_music/outputs/mv_v1_B_roughcut.mp4"
  "mvs/notmyfault_C_comedypop.mp4" = "../ping_pong_music/outputs/mv_v1_C_roughcut.mp4"
}

foreach ($dst in $src.Keys) {
  $source = $src[$dst]
  if (-not (Test-Path $source)) {
    Write-Error "Missing source: $source"
  }
  Write-Host "==> $source -> $dst"
  & ffmpeg -y -i $source -c copy -movflags +faststart $dst 2>&1 | Select-String -Pattern "error|Output #0" -CaseSensitive:$false
}

Write-Host ""
Write-Host "Done. Files in mvs/:"
Get-ChildItem mvs/*.mp4 | Select-Object Name, @{N="MB";E={[math]::Round($_.Length/1MB,1)}}
