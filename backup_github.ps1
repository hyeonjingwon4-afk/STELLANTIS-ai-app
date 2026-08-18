# GitHub 자동 백업 스크립트
Write-Host "GitHub에 코드를 백업합니다..." -ForegroundColor Cyan

# 1. 모든 변경사항을 추적(Add)
& 'C:\Program Files\Git\cmd\git.exe' add .

# 2. 현재 날짜와 시간으로 메세지 생성(Commit)
$dateStr = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
& 'C:\Program Files\Git\cmd\git.exe' commit -m "Auto backup: $dateStr"

# 3. GitHub로 업로드(Push)
& 'C:\Program Files\Git\cmd\git.exe' push origin master

Write-Host ""
Write-Host "GitHub 백업이 완료되었습니다!" -ForegroundColor Green
Write-Host "3초 후 창이 닫힙니다."
Start-Sleep -Seconds 3
