# Aurum2 Designer

基于 Aurum2 前端组件库的 Web BOSS 子应用开发 Skill，帮助开发者快速搭建麦当劳 BOSS 子应用。

## 功能

- 自动检查并配置开发环境（私有 NPM 仓库、Aurum2 MCP、组件库）
- 使用脚手架一键初始化 BOSS 子应用项目
- 提供 Aurum2 组件优先的开发规范
- 内置色彩、字体、字号规范

## 快速开始

### 1. 配置私有 NPM 仓库

```bash
./aurum2mockup/scripts/setup-npm-registry.sh
```

### 2. 配置 Aurum2 UI Components MCP

```bash
claude mcp add -s user -t stdio "Aurum2 UI Components" npx "@mcd/aurum2-mcp-server@latest"
```

### 3. 安装组件库

```bash
pnpm install @aurum/pfe-ui --save
pnpm install @aurum/icons2 --save
```

### 4. 创建新项目

```bash
./aurum2mockup/scripts/create-boss-app.sh <项目名称>
```

## 组件使用

```tsx
import { Button, Input, Modal } from '@aurum/pfe-ui';
import { IconName } from '@aurum/icons2';
```

## 设计规范

- 品牌主色：`#FFBC0D`（麦当劳金）
- 主字号：14px，行高 = 字号 + 8
- 字体：PingFang SC, Microsoft YaHei, Helvetica, Arial

详见 [色彩规范](aurum2mockup/references/color_rules.md)

## Debug URL

项目启动后，通过以下 URL 在 BOSS 平台调试：

```
https://boss.sit.mcdonalds.cn?debug=1&_appUrl=http://localhost:8000/app.js&_appName=@mf/<项目名称>&_virtualPath=/<项目名称>/&_confirm=1
```
