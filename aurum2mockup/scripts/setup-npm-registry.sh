#!/bin/bash

# MCD NPM 私有仓库一键配置脚本

REGISTRY_URL="https://nexus.mcd.com.cn/repository/npm-group/"
USERNAME="${NPM_USERNAME:-your-username}"
PASSWORD="${NPM_PASSWORD:-your-password}"
EMAIL="${NPM_EMAIL:-your-email}"

echo "🔧 开始配置 MCD NPM 私有仓库..."
echo ""

# 配置仓库地址
echo "📝 设置 NPM 仓库地址..."
npm config set registry "$REGISTRY_URL"

if [ $? -eq 0 ]; then
    echo "✅ 仓库地址配置成功: $REGISTRY_URL"
else
    echo "❌ 仓库地址配置失败"
    exit 1
fi

echo ""
echo "🔐 配置认证信息..."

# 生成 base64 编码的认证信息
AUTH=$(echo -n "$USERNAME:$PASSWORD" | base64)

# 提取 registry 的域名和路径 (去掉 https://)
REGISTRY_HOST=$(echo "$REGISTRY_URL" | sed 's|https://||' | sed 's|/$||')

echo "   Registry Host: $REGISTRY_HOST"

# 写入认证信息到 .npmrc
npm config set "//$REGISTRY_HOST:_auth" "$AUTH"
npm config set "//$REGISTRY_HOST:email" "$EMAIL"

# 直接追加 always-auth 到 .npmrc (npm config set 不支持这个选项)
NPMRC_PATH="$HOME/.npmrc"
if ! grep -q "^//$REGISTRY_HOST:always-auth" "$NPMRC_PATH" 2>/dev/null; then
    echo "//$REGISTRY_HOST:always-auth=true" >> "$NPMRC_PATH"
fi

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 认证配置成功！"
    echo ""
    echo "📋 当前配置："
    echo "   Registry: $(npm config get registry)"
    echo "   Auth: ✓ 已配置"
    echo "   Email: $EMAIL"
    echo ""
    echo "🎉 MCD NPM 私有仓库配置完成！"
    echo ""
    echo "💡 测试安装："
    echo "   npm install <package-name>"
else
    echo ""
    echo "❌ 配置失败"
    exit 1
fi
