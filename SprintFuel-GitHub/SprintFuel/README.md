# ⚡ Sprint Fuel — Athlete Tracker

A Progressive Web App (PWA) for Bishop McDevitt sprint athletes to track nutrition, training, and recovery across the March 2026 sprint season.

## Features

- 🍽 **Nutrition Tracker** — Log meals with macros, calories, and hydration
- ✨ **AI Food Search** — Search any food and get instant calorie/macro data (top of nutrition tab)
- 📷 **AI Camera Analyzer** — Take a photo of any food and AI estimates the calories & macros
- 🏃 **Training Tab** — Full workout plans for every day of the week with expandable exercise cards
- 📅 **Meal Plan** — 4-week cafeteria + home meal guide tailored to your schedule
- 💤 **Recovery Checklist** — Daily recovery scoring system
- 📱 **Installable PWA** — Works offline, installs to home screen like a real app
- 💾 **Persistent Storage** — All data saved locally across sessions

## Setup & Deploy to GitHub Pages

### 1. Create a GitHub Repository

```bash
git init
git add .
git commit -m "Initial commit: Sprint Fuel v3"
git remote add origin https://github.com/YOUR_USERNAME/sprint-fuel.git
git push -u origin main
```

### 2. Enable GitHub Pages

1. Go to your repo on GitHub
2. Click **Settings** → **Pages**
3. Under "Source", select **Deploy from a branch**
4. Set branch to `main`, folder to `/ (root)`
5. Click **Save**

Your app will be live at: `https://YOUR_USERNAME.github.io/sprint-fuel/`

### 3. Install on Your Phone

**iPhone (Safari):**
1. Open the GitHub Pages URL in Safari
2. Tap the Share button (box with arrow)
3. Tap "Add to Home Screen"
4. Tap "Add" — app icon appears on your home screen!

**Android (Chrome):**
1. Open the URL in Chrome
2. Tap the three dots menu → "Add to Home Screen" 
3. Or tap the install banner that appears at the top

### 4. API Key (for AI features)

The AI Search and Camera Analyzer use the Anthropic Claude API. For the app to work:

- The app calls `https://api.anthropic.com/v1/messages` directly from the browser
- **You need to add your API key** in the `aiSearch()` and `analyzeImage()` functions, OR
- Set up a simple proxy server (recommended for production)

> ⚠️ **Important:** Embedding API keys directly in client-side code exposes them publicly. For a production app, use a backend proxy. For personal/team use on a private repo, you can add the key directly.

To add your API key, find the fetch calls in `index.html` and add:
```javascript
headers: {
  'Content-Type': 'application/json',
  'x-api-key': 'YOUR_API_KEY_HERE',
  'anthropic-version': '2023-06-01'
}
```

## File Structure

```
sprint-fuel/
├── index.html          # Main app (all-in-one)
├── manifest.json       # PWA manifest
├── sw.js              # Service worker (offline support)
├── icons/             # App icons (add 192x192 and 512x512 PNG)
│   ├── icon-192.png
│   └── icon-512.png
└── README.md
```

## Adding App Icons

Generate PNG icons from the ⚡ emoji or custom design:
- Use [RealFaviconGenerator](https://realfavicongenerator.net/) or [PWABuilder](https://www.pwabuilder.com/imageGenerator)
- Place `icon-192.png` and `icon-512.png` in the `icons/` folder

## Tech Stack

- Pure HTML/CSS/JavaScript (no framework dependencies)
- Anthropic Claude API for AI food search + image analysis
- localStorage for data persistence
- Service Worker for offline functionality
- PWA manifest for installability

## Customization

Key variables to update in `index.html`:
- `goals` object — default calorie/macro targets
- `MEAL_PLAN` array — daily meal suggestions
- `TRAINING_SCHEDULE` object — weekly workout plans
- `FOOD_DB` object — food database entries
- `RECOVERY_CHECKLIST` array — recovery items
