# Reasonix 能力启动器 - 安装脚本
# 运行环境: Windows + WSL2

Write-Host "=== Reasonix 能力启动器 ===" -ForegroundColor Cyan
Write-Host "复制 config/ 下的配置文件到对应位置:" -ForegroundColor Yellow
Write-Host "  config/reasonix-config-full.toml -> AppData/Roaming/reasonix/config.toml"
Write-Host "  config/claude-settings-full.json -> .claude/settings.json"
Write-Host "重启 Reasonix 后全部能力加载完毕" -ForegroundColor Green
