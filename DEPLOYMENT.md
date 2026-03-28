# MiroFish Deployment Guide

## Frontend Deployment (Vercel)

### Automatic Deployment
1. **Connect to Vercel**: Link your GitHub repository to Vercel
2. **Configure Build Settings** (required):
   - **Framework Preset**: `Vite`
   - **Root Directory**: `frontend` ← **CRITICAL: Set this in Vercel Dashboard Settings → General**
   - Build Command, Output Directory, and Install Command will auto-detect from `frontend/vercel.json` and `frontend/package.json`

### Environment Variables
Set the following in Vercel dashboard:
```
VITE_API_BASE_URL=https://your-backend-url.com
```

### Manual Deployment
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
npm run deploy
```

## Backend Deployment (Render/PythonAnywhere/etc.)

### Environment Variables Required
```env
# LLM Configuration
LLM_API_KEY=your_openai_api_key
LLM_BASE_URL=https://api.openai.com/v1
LLM_MODEL_NAME=gpt-4o-mini

# Zep Cloud Memory
ZEP_API_KEY=your_zep_api_key

# Security
JWT_SECRET_KEY=your_secure_random_string
SECRET_KEY=your_flask_secret_key

# Feature Flags
FEATURE_NVIDIA_NIM=false
FEATURE_ADVANCED_SIMULATION=false
```

### Deployment Steps
1. **Choose Platform**: Render, Railway, or PythonAnywhere
2. **Set Build Command**: `pip install -r requirements.txt && python run.py`
3. **Set Environment Variables** as above
4. **Configure Port**: Usually 5001 or auto-assigned

## Testing Deployment

After deployment, test these endpoints:
- Frontend: `https://your-frontend-url.vercel.app`
- Backend Health: `https://your-backend-url.com/health`
- API Test: `https://your-backend-url.com/api/graph/project/test`

## Troubleshooting

### Common Issues
1. **CORS Errors**: Ensure VITE_API_BASE_URL matches backend URL
2. **Build Failures**: Check Node.js version ≥18
3. **API Timeouts**: Backend may take time to start on free tiers

### Vercel-Specific
- Frontend-only deployment (SPA)
- API routes proxied to backend
- Static asset optimization included