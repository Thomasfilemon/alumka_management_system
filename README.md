# 🧱 ALUMKA MANAGEMENT SYSTEM APP — THE CRACKHEAD DEVELOPER'S STARTER GUIDE

Welcome to this absolute unit of an Electron app for managing your local toko aluminium empire. No MySQL spaghetti, just one file-based chad: **SQLite**. We're using **Electron + Vite + Vanilla JS**, powered by the GOAT: `better-sqlite3`. Let’s get this baby running, starting from nothing to something that makes your client moan in joy.

---

## 🧰 Tech Stack
- 🧠 Electron Forge (packaging + native desktop god mode)
- 🚀 Vite (dev server & fast reloads)
- 💾 SQLite (lightweight DB that doesn’t need to be “started” like MySQL, duh)
- 🔥 better-sqlite3 (sync, fast, reliable, no async hell)
- ⚛️ Context API (state sharing without extra bloat)
- 🧠 ChatGPT (a.k.a. unpaid 4th dev)
- 💻 VS Code (don’t you dare use Notepad++)

---

## 🚀 Step-by-Step Setup Guide (For Devs)

### 1. Clone the repo
```bash
git clone https://github.com/your-org/alustore-app.git
cd alustore-app
```

### 2. Install Dependencies
```bash
npm install
```

### 3. Create Initial Folder Structure (if not yet done)
```
project-root/
├── src/
│   ├── main/              # Main Electron process
│   ├── renderer/          # UI stuff (HTML, JS, Context)
│   └── db/                # DB logic (init, queries)
├── public/                # Static files
├── index.html             # Base HTML
├── main.js                # Electron entry
├── vite.config.js         # Vite setup
└── README.md
```

### 4. Initialize SQLite DB (automatic)
**YES.** As soon as the user opens the app, the SQLite DB is automatically created and connected — like magic. If the `.db` file doesn’t exist, it’ll make one.

Place your database in `src/db/alustore.db`. Your `db.js` will handle it like this:

```js
// src/db/db.js
const Database = require('better-sqlite3');
const path = require('path');
const fs = require('fs');

const dbPath = path.resolve(__dirname, 'alustore.db');

const db = new Database(dbPath);

// Create tables if they don't exist (run only once on init)
db.exec(`
CREATE TABLE IF NOT EXISTS items (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  stock INTEGER DEFAULT 0,
  price REAL NOT NULL
);
-- add other tables here
`);

module.exports = db;
```

Then import this `db.js` in your Electron `main.js`.

---

## 🏃‍♂️ Run The App (Dev Mode)
```bash
npm run dev
```
That’s Vite doing its live-reloading voodoo.

---

## 🏗 Build The App (For Windows Installer)
```bash
npm run make
```
This will create an installer `.exe` inside `out/make/` folder. Send that to your client and flex on them.

---

## ⚙️ Folder Notes
- `src/main/` → Electron main process (bootstraps DB, window, menus)
- `src/renderer/` → HTML, JS, and Context API for UI
- `src/db/` → Better-sqlite3 logic, migrations

---

## 🔌 Auto DB Handling?
Yes bro. As long as `db.js` is imported and Electron runs, the SQLite DB is connected. You **DO NOT** need MySQL service, XAMPP, phpMyAdmin, etc.
Just double click the `.exe`, and boom: it works. Like opening a Discord for Aluminum Traders.

If the `.db` file doesn’t exist, the app will generate it on first boot.

---

## 👥 The Team Setup (3 Chads, 1 Dream)
- Everyone should use VS Code, Git, and install Node.js
- Set up a shared GitHub repo
- Feature branching strategy (or go YOLO and merge into `main` like a beast)

---

## 💡 What's Next?
- We define the UI views (master barang, penjualan, pembelian)
- Hook them to the state management (Context API)
- Make `db.js` functions for each operation (CRUD, transactions, etc)
- Handle printing (we can use Electron’s `webContents.print()` or `pdfmake`)
- THEN: Reporting, Filtering, Kas, Pelunasan, etc

---

> Welcome to POS dev. Say goodbye to your social life and hello to recursive database hell. But at least you’re doing it in style. Let’s fucking go. 🔥

