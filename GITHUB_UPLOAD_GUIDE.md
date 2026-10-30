# Upload FLIXJP TV to GitHub

## Important: GitHub does not unpack ZIP files
1. Extract `FLIXJP_TV_GitHub_Ready.zip` on your computer.
2. Open the extracted `flixjp-tv` folder.
3. Go to your GitHub repository.
4. Choose **Add file → Upload files**.
5. Open the extracted `flixjp-tv` folder and select its contents (including `src`, `server`, `public`, and the root files).
6. Drag those contents into GitHub's upload area.
7. Commit the changes.

Do not upload `node_modules`, `dist`, `.env`, private passwords, or private video files.

## Run locally on Windows
1. Install Node.js 20.19+ (or a current Node.js LTS release).
2. Extract the ZIP.
3. Open the `flixjp-tv` folder.
4. Double-click `START_WINDOWS.bat`.
5. Open http://localhost:5173.

The first launch needs an internet connection so npm can download project dependencies.
Edit the generated `.env` file to set your own private `ADMIN_PASSWORD` and
`SESSION_SECRET`. Never commit `.env` to GitHub.

## Deployment note
This app needs a Node.js host for its Express API and Socket.IO party rooms.
GitHub Pages is static hosting and cannot run this backend by itself.
