# setup.ps1 - Reasonix 能力启动器安装脚本
param([switch])

Write-Host "=== Reasonix 能力启动器 ===" -ForegroundColor Cyan

# 1. Install MCP packages
Write-Host "[1/3] 缓存 MCP 包..." -ForegroundColor Yellow
 = @(
    "@harusame64/desktop-touch-mcp",
    "@playwright/mcp",
    "@modelcontextprotocol/server-github",
    "@modelcontextprotocol/server-filesystem",
    "@modelcontextprotocol/server-memory",
    "@modelcontextprotocol/server-sequential-thinking",
    "@upstash/context7-mcp@latest",
    "@tavily/mcp"
)
foreach ( in ) {
    Write-Host "  npx: "
    npx -y  --help 2> | Out-Null
}
Write-Host "  全部缓存完成!" -ForegroundColor Green

# 2. Copy config files
Write-Host "[2/3] 复制配置文件" -ForegroundColor Yellow
Write-Host "  手动执行:"
Write-Host "  copy config\claude-settings-full.json :USERPROFILE\.claude\settings.json"
Write-Host "  copy configeasonix-config-full.toml :APPDATAeasonix\config.toml"

# 3. Install skills
Write-Host "[3/3] 安装 Skills..." -ForegroundColor Yellow
 = ":USERPROFILE\.reasonix\skills"
New-Item -ItemType Directory -Force -Path  | Out-Null

Write-Host "  下载 superpowers-reasonix..."
Invoke-WebRequest -Uri "https://github.com/christopherarter/superpowers-reasonix/archive/refs/heads/main.zip" -OutFile ":TEMP\superpowers.zip" -UseBasicParsing
Expand-Archive -Path ":TEMP\superpowers.zip" -DestinationPath ":TEMP\superpowers" -Force
Get-ChildItem ":TEMP\superpowers\superpowers-reasonix-main\skills" -Directory | ForEach-Object {
     = "" + /bin/bash.Name
    New-Item -ItemType Directory -Force -Path  | Out-Null
    Copy-Item "\*" "" -Recurse -Force
    Write-Host "    Skill: "
}

# Community skills
 = @(
    "file-organizer", "git-helper", "input-control", "text-polish",
    "video-editing", "ui-demo", "learn-topic", "data-convert",
    "project-scaffold", "readme-gen", "disk-cleaner", "changelog-generator",
    "videodb", "tdd-workflow", "token-budget-advisor", "workspace-surface-audit"
)
 = "https://raw.githubusercontent.com/hikari-2424/awesome-reasonix/main/skills"
foreach ( in ) {
    try {
        Invoke-WebRequest -Uri "/.md" -OutFile "/.md" -UseBasicParsing -ErrorAction SilentlyContinue
        if ((Get-Item "/.md").Length -gt 100) {
            Write-Host "    Skill: "
        }
    } catch {}
}

Write-Host "[3/3] Skills 安装完成!" -ForegroundColor Green
Write-Host "=== 完成! 重启 Reasonix 后全部能力加载 ===" -ForegroundColor Green
