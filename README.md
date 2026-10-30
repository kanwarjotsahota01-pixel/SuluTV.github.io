# FLIXJP TV

A complete original streaming-website starter inspired by the *layout and feature ideas* shown in reference screenshots. **It is not copied source code from Aethoplex.** All seeded title names are fictional, and the sample video is an openly licensed MDN CC0 demo clip. Use only media you own or are licensed to stream.

## What is included

- Cinematic responsive React home page: large featured hero, search, films, series, anime, origin and genre filters, poster collection shelves.
- Details panels, favorites / My List and Continue Watching in browser localStorage.
- A native HTML5 video player with seeking, audio, fullscreen, and desktop-style virtual theater decoration.
- A live party system: create or join a six-character code, **up to 10 people per room**, owner/host playback synchronization, guest roster and room chat via Socket.IO.
- An owner-only dashboard with password login, JWT-protected add/edit/delete catalog APIs, authorized video and poster uploads, and persistent catalog JSON.
- Responsive mobile support; keyboard W/A/S/D camera movement, E sit/stand and mouse-wheel zoom in the cinema.

## 1. Requirements

Install Node.js 20.19+ or 22.12+ and npm. Use a terminal (PowerShell on Windows is fine).

## 2. Install & start

```bash
# Extract the ZIP file. Open a terminal inside the flixjp-tv directory.
npm install

# Windows PowerShell:
Copy-Item .env.example .env
# macOS / Linux instead: cp .env.example .env
```

Open `.env` in a text editor and change both values:

```env
ADMIN_PASSWORD=your_own_private_password_of_12_or_more_characters
SESSION_SECRET=a_random_unpredictable_string_with_at_least_32_characters
PORT=3001
MAX_UPLOAD_MB=2048
```

Never publish `.env` or share these secrets.

Run the development server:

```bash
npm run dev
```

Open **http://localhost:5173** in a browser. The API starts at **http://localhost:3001**.

## 3. Use the site

1. Visit Discover and browse the fictional demo movies.
2. Click **Watch now** to play the openly licensed sample video.
3. Click **Party** in the theater, enter a display name, and **Create party**. Share the six-character code with friends who can visit the same website. They can click **Party**, enter the code, and join. The first user is the host; when the host leaves, hosting passes to another participant.
4. Open the **Owner Studio** icon at the upper right (or the footer), log in with your configured `ADMIN_PASSWORD`, then add an authorized video URL or upload an MP4/WebM file and poster. Click **Publish title**.
5. Use My List to save favorites. Watch progress is stored on that browser/device.

**Important:** A movie player does not grant film distribution rights. Only upload films, posters, trailers, and TV episodes for which you have appropriate permission. The app is not a service to find or bypass paywalled video streams.

## 4. Video requirements

Use MP4 with **H.264 video + AAC audio** for best cross-browser compatibility, or WebM. MKV/HEVC generally will not play in all browsers. External video URLs must allow normal browser access. Host playback sync is timing-based; each guest must have access to the same video. DRM services, embedded paywalled players, and arbitrary streaming portals are not supported. Safari/iOS may require each viewer to tap Play once before sync starts.

Uploads go into `uploads/` on the server's disk. The default cap is 2 GB *per uploaded file* (configurable via `MAX_UPLOAD_MB`), but actual upload capacity depends on your host's disk, RAM, body timeouts, and bandwidth. In production use managed object storage + a CDN for large videos. Locally stored files and `data/catalog.json` must be backed up.

## 5. Build & deploy as one Node web service

```bash
npm run build
npm start
```

Open **http://localhost:3001**. The Express server serves the built React app, public API and Socket.IO from one origin.

### Deploy to Render (example)

1. Upload this project to your **own** GitHub repository (do not include `.env`, `uploads/`, `data/catalog.json`, or `node_modules/`).
2. Create a Node Web Service on Render using that repository.
3. Set **Build Command** to `npm install && npm run build` and **Start Command** to `npm start`.
4. Add `ADMIN_PASSWORD` and `SESSION_SECRET` as **private environment variables**; add `MAX_UPLOAD_MB` if desired. Let Render supply `PORT` when it does.
5. Deploy. Open your public Render URL, check `/api/health` and then open Owner Studio.
6. **Persistence:** The sample saves uploads and catalog to local disk. Many cloud services use *ephemeral filesystems* and lose files during redeploy/restart. Use an attached persistent disk if supported, or move catalog data to a hosted database and videos to object storage. If you skip this, uploaded content can disappear.
7. The web-service instance must remain running for real-time room features. All party members need the same online deployment and same instance/shared Socket.IO adapter if scaled to multiple instances.

A static Google Sites page **cannot host this Node.js + WebSocket server by itself**. Publish FlixJP TV on a proper web host and link to it from Google Sites instead. Some platforms also restrict iframe embedding.

## 6. Project files

```text
flixjp-tv/
  src/App.jsx            React components, browse UI, theater, party panel, owner studio
  src/styles.css         Responsive streaming and theater styling
  src/main.jsx           React entry
  server/index.js        Express routes, admin security, uploads, Socket.IO rooms
  server/catalog.js      Fictional starter catalog with CC0 video link
  data/                  Catalog JSON is created automatically on server start
  uploads/               Authorized uploads; created automatically
  public/favicon.svg     Original FLIXJP icon
  index.html
  package.json
  vite.config.js
  .env.example
  SETUP_PROMPT.md        Long reusable AI-development prompt
```

## 7. Limitations / recommended production upgrades

This is an **original working starter**, not a Netflix-scale production service. It does **not** include an external metadata provider, an automatic movie library, multiple video quality tracks, an adaptive HLS encoder, DRM, episode editor, real streaming rights, payments, content moderation, backups, rate limits for every API, account profiles, a durable database, or distributed party-state storage. Add these with appropriate services before large-scale public use. Party codes are convenience identifiers, not strong access control for sensitive media; private screenings should additionally require authenticated invitations and access control.

### Security notes

- Only one person should know `ADMIN_PASSWORD`; choose a strong unique password. Authentication requires HTTPS on a public deployment.
- Do not trust uploaded files purely because their MIME type looks correct. For public-scale services add scanning, server-side validation, quotas, image transcoding, and object-storage access rules.
- Deploy behind appropriate HTTPS and rate limiting; consider using a durable DB, private storage, and per-user auth before real operations.

## Troubleshooting

- **Blank page / no titles:** Make sure both servers are running. Check http://localhost:3001/api/health.
- **Failed login:** `.env` may still have placeholder values; restart Node after editing the file.
- **Video won't play:** Use an accessible MP4 (H.264/AAC). Check browser console and file/URL access.
- **Friends cannot join:** All friends must use the same deployed server URL; `localhost` points to each person's own computer.
- **Upload limit:** Change `MAX_UPLOAD_MB` and use a host capable of large uploads.
- **Room stops after restart:** Room state is held in memory and is not persisted; create a new room.

### Windows helper

After extracting the ZIP, you can double-click `START_WINDOWS.bat`. It checks Node.js, installs dependencies and launches the two development servers. It also copies `.env.example` to `.env` if necessary — edit the new `.env` to enable Owner Studio.
