#!/bin/bash

echo "🚀 MiroFish Vercel Deployment Test"

# Check if vercel.json exists
if [ ! -f "vercel.json" ]; then
    echo "❌ vercel.json not found in root directory"
    exit 1
fi

# Check if frontend directory exists
if [ ! -d "frontend" ]; then
    echo "❌ frontend directory not found"
    exit 1
fi

# Check if frontend package.json exists
if [ ! -f "frontend/package.json" ]; then
    echo "❌ frontend/package.json not found"
    exit 1
fi

# Check if dist directory exists (from build)
if [ ! -d "frontend/dist" ]; then
    echo "❌ frontend/dist not found - run 'cd frontend && npm run build' first"
    exit 1
fi

# Validate vercel.json structure
echo "✅ Checking vercel.json configuration..."
if grep -q '"distDir": "frontend/dist"' vercel.json; then
    echo "✅ distDir configuration correct"
else
    echo "❌ distDir configuration incorrect"
    exit 1
fi

if grep -q '"src": "frontend/package.json"' vercel.json; then
    echo "✅ Source package.json configuration correct"
else
    echo "❌ Source package.json configuration incorrect"
    exit 1
fi

# Test local build
echo "✅ Testing local build..."
cd frontend
if npm run build > /dev/null 2>&1; then
    echo "✅ Local build successful"
    if [ -f "dist/index.html" ] && [ -d "dist/assets" ]; then
        echo "✅ Build output files exist"
        echo "🎉 Configuration appears correct for Vercel deployment!"
        echo ""
        echo "To deploy:"
        echo "1. Ensure you're logged into Vercel: npx vercel login"
        echo "2. Deploy: npx vercel --prod"
        echo "3. Or connect your GitHub repo to Vercel dashboard"
    else
        echo "❌ Build output files missing"
        exit 1
    fi
else
    echo "❌ Local build failed"
    exit 1
fi