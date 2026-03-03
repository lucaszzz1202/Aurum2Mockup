#!/bin/bash

# BOSS Subapp 创建命令模板
# 使用方法: ./create-boss-app.sh <项目名称>

# 检查是否提供了项目名称
if [ -z "$1" ]; then
  echo "错误: 请提供项目名称"
  echo "使用方法: ./create-boss-app.sh <项目名称>"
  echo "示例: ./create-boss-app.sh my-new-app"
  exit 1
fi

PROJECT_NAME=$1

# 执行创建命令
npx @mcd/create-app@latest \
  --projectName "$PROJECT_NAME" \
  --orgName "@mf" \
  --appType "boss-subapp" \
  --preferToRunIn "domestic" \
  --compatible "yes" \
  --port "8000" \
  --route "$PROJECT_NAME"

echo ""
echo "======================================"
echo "项目创建完成！"
echo "======================================"
echo "项目名称: $PROJECT_NAME"
echo "项目路径: ./$PROJECT_NAME"
echo "开发服务器: http://localhost:8000/"
echo ""
echo "Debug URL:"
echo "https://boss.sit.mcdonalds.cn?debug=1&_appUrl=http://localhost:8000/app.js&_appName=@mf/$PROJECT_NAME&_virtualPath=/$PROJECT_NAME/&_confirm=1"
echo ""
