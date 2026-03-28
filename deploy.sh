#!/bin/bash

# MiroFish Vercel Deployment Script

echo "🚀 Deploying MiroFish to Vercel..."

# Check if vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "Installing Vercel CLI..."
    npm install -g vercel
fi

# Deploy to Vercel
echo "Deploying frontend..."
cd frontend
vercel --prod

echo "✅ Deployment complete!"
echo "Check your Vercel dashboard for the deployment URL"