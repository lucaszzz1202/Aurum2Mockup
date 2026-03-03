---
name: Aurum2-Designer
description: 基于 Aurum2 前端组件库的 Web BOSS 子应用开发指南。当用户需要开发一个基于 Aurum2 前端组件的 Web 应用时使用该 Skill。
---

# Aurum2-Designer

这个 skill 提供了使用 Aurum2 前端组件库开发 Web BOSS 子应用的指南。包括初始化项目脚手架、Aurum2 Component MCP 的安装、项目的色彩、字体字号行高规范等。用于帮用户快速地搭建 Aurum2 Web BOSS 子应用。

## 关于 Aurum2

Aurum2 是一个 React UI 组件库，用于企业中后台产品与前台桌面网站（BOSS 子应用）。

## 核心原则

### 开发工具检查（在项目使用该 Skill 时必须进行检查）

**私有仓库权限配置**
- 检查用户是否配置私有 NPM 仓库 https://nexus.mcd.com.cn/repository/npm-group/，若无则帮用户进行配置
- 私有仓库权限配置，运行：scripts/setup-npm-registry.sh

**Aurum2 UI Components MCP**
- 检查用户是否配置 Aurum2 UI Components MCP，若无则帮用户进行配置
- Aurum2 MCP 配置，在用户的 MCP 配置文件中添加：
  {
    "mcpServers": {
      "Aurum2 UI Components": {
        "args": [
          "@mcd/aurum2-mcp-server@latest"
        ],
        "command": "npx",
        "autoApprove": [
          "list_component_examples",
          "get_component_docs",
          "list_components",
          "how_to_use"
        ]
      }
    }
  }

**aurum2 组件库安装**
- 检查用户是否安装 @aurum/pfe-ui 组件库，若无，请帮用户安装
- 安装 @aurum/pfe-ui 组件库库：pnpm install @aurum/pfe-ui --save

**@aurum/icons2 图标库安装**
- 检查用户是否安装 @aurum/icons2 图标库，若无，请帮用户安装
- 安装 @aurum/icons2 图标库：pnpm install @aurum/icons2 --save

**开发环境**
- 检查用户使用 Aurum2 组件搭建 Web 应用所需的环境是否配置完备，若有缺失请帮用户进行配置安装，例如 React、Node 等

### 使用项目脚手架初始化项目

**使用 BOSS Subapp 创建命令模板来初始化项目脚手架**
- 判断用户项目是否为一个待新建项目若待新建则使用命令创建项目脚手架，若为老项目则跳过该步骤
- 新建项目时，运行: scripts/create-boss-app.sh <项目名称>

### Aurum2 组件优先

**优先使用 Aurum2 组件**
- 在实现任何 UI 功能前，首先检查 Aurum2 组件库是否提供相应组件
- 使用 Aurum2 组件和图标库可以确保设计一致性和代码质量

**组件选择顺序**
- 第一优先：Aurum2 组件库的标准组件
- 第二优先：基于 Aurum2 组件的自定义封装
- 最后选择：仅在 Aurum2 无法满足需求时，才考虑其他组件库或自行开发

**导入规范**
// 推荐：从 Aurum2 导入组件
import { Button, Input, Modal } from '@aurum/pfe-ui';

// 推荐：从 @aurum/icons2 导入图标
import { IconName } from '@aurum/icons2';

**一致性要求**
- 保持整个项目使用统一的组件库
- 避免混用多个 UI 组件库
- 确保视觉和交互体验的一致性

**组件信息获取**
- 使用 Aurum2 Components MCP Server 获取组件文档、API 说明和使用示例
- MCP Server 提供完整的组件列表（71+ 组件）、属性说明和代码示例
- 先使用 how_to_use 获取 Aurum2 React UI 组件库的基础使用指南
- 再使用 list_components 获取所有可用的 Aurum 组件列表，包含组件名称、描述和使用场景
- 最后获取需要的组件

**图标使用规则：**
- 优先使用 @aurum/icons2 图标库
- 确保图标风格统一，避免混用其他图标库

### 色彩使用规范
查看 references/color_rules.md

### 字体、字号与行高规范
**字体的选择「font-family」**
Font-family: "PingFang SC","Microsoft YaHei ","Helvetica","Arial",Heiti SC,sans-serif；

**主字号**
14px

**字号与行高**
通用计算公式：`line-height = font size+8`

## Web BOSS 子应用开发流程
创建 Web BOSS 子应用需要遵循以下步骤，仅当有明确的合理理由时，才可跳过对应步骤：

1.检查开发环境、开发工具，若有缺失请帮用户进行准备
2.私有 NPM 仓库必须配置登录，若无请帮用户配置登录
3.初始化项目请使用脚手架
4.进行功能开发时，请明确用户的需求
5.Aurum2 组件优先，在每次迭代时都注意遵循
6.完成项目开发后，请帮用户启动项目，并告知地址（脚手架下的地址）

