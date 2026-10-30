# MASTER BUILD PROMPT — FLIXJP TV

Build and deploy a complete, professional, original movie and series streaming website named **FLIXJP TV**. Use the supplied reference screenshots only as **design inspiration**: dark cinematic navigation, large curated featured hero, elegant content shelves, floating search, and an immersive 3D-style virtual theater. Do not copy another website's proprietary code, logo, copyrighted movie art, or protected streams. Produce working, testable source code, not a mockup.

## Branding and style

- Website name: FLIXJP TV, with an original small play-logo.
- Visual treatment: near-black background (#080b11), misty slate accents, pale blue/lavender primary buttons, small letter-spaced uppercase section labels, rounded cards, readable typography.
- Desktop-first film discovery page that also adapts to phones, tablets, and landscape screens.
- Top navigation: Discover, Films, Series, Anime, Live, My List; search field and a secure Owner Studio entry.
- Hero carousel: cinematic image/video background, title, blurb, year, genre, type, score, Watch Now, More Details and next/previous controls.
- Under the hero: "Find your next world" collection section, type tabs, genre chips, origin dropdown, collection pills, "Trending this week" poster carousel, personal watchlist, continue watching and virtual theater promotion.

## Fully working movie system

- Films, TV series, anime categories with poster, description, year, country, genre, duration, optional seasons and episodes, media rights metadata and playable sources.
- Real search, filters, featured titles, content details, watch-now actions, favorites, continue-watching, last play position and responsive navigation.
- Fully functional HTML5 player supporting MP4/WebM, fullscreen, play/pause, seek, volume, mute, playback speed if available, keyboard shortcuts, retry on errors, and helpful unsupported-file messages.
- Resume playback from saved progress. A user may save and share a movie URL if the deployment has public title pages.
- Never claim unsupported MKV, HEVC, DRM or live streaming formats work automatically; add licensed transcode/HLS infrastructure if needed.

## Immersive virtual theater

- A dark cinematic room, perspective display screen, dim floor lights, rows of seats, camera movement W/A/S/D, sit/stand using E, zoom, fullscreen, and hide UI.
- Party button creates a private six-character code; guests enter code to join; limit 10 people per room.
- Socket.IO backend owns party membership and host authority, sends room state, chat messages, playback state, seek, pause, play and host handoff.
- Attendees see a roster and a lightweight room chat. Provide copy room code, leave room, join validation, and full-room errors.
- Only the host controls synchronized playback; guests need access to the authorized media file. Provide mobile-friendly controls.
- For production security, add authenticated invite tokens, private media authorization, abuse prevention, moderation and distributed rooms.

## Owner-only dashboard

- Secure login using a server-provided password verifier; keep credentials in private environment variables and use expiring tokens.
- Only owner can publish, edit, delete, upload poster, upload video, change metadata or feature a title.
- Add support for Film / Series / Anime, collection, poster, trailer, seasons/episodes, region, release year, genres, synopsis, rating label and file/video URL.
- Validate inputs; use unique IDs; save catalog to persistent database for production (small local JSON for a starter).
- Accept only permitted uploads and display helpful progress/failure states; store large authorized videos in persistent object storage.
- Make admin UI hidden from ordinary edit routes and protect **server API** endpoints — hiding buttons alone is not access control.

## Architecture and code delivery

- Frontend: React + Vite, CSS responsive layouts, accessible labels, proper load/error states.
- Backend: Node.js Express, REST catalog/admin endpoints, JWT-protected modifications, multer for uploads, Socket.IO for parties.
- Provide a coherent project folder, package.json, .env.example, setup instructions, local dev, production build and deployment instructions (e.g. Render).
- No paid API keys required for the sample; seed with fictional media descriptions and openly licensed placeholder video. Never auto-populate pirated content.
- Full source, working functional controls, no broken dummy buttons and a usable mobile layout.
- Test npm install, npm run build, npm start and basic smoke tests including owner login, add/edit/delete, 10 guest party cap, host sync and upload restrictions.
- Explain which capabilities are starter-level and which require services for real-world use.

## Definition of done

The user can open FlixJP TV, search and filter a populated demo catalog, view movie details, play permitted sample media, save favorites, resume watching, open the virtual theater, invite 9 friends, exchange chat, synchronize movie playback, use W/A/S/D/E controls, and log into a protected dashboard to upload/add/update/remove their own titles. The website must build, deploy and not depend on access to private third-party source code.
