# Pharo MOOC website — improvement plan

Agreed on 2026-11-08. Scope: the single page `index.html` (Bootstrap 3 kept).

## Goal

Turn the site into a **permanent self-paced archive and entry point** for the
MOOC. No more session-specific content (the "2020 run", Pharo 8.0).

## 1. Top menu bar (minimal fix, keep Bootstrap 3)

- Restore the Bootstrap 3 classes on the menu list: `class="nav navbar-nav"`
  (the `nav` class was lost in commit 178de25 "fixing nav navbar").
- Shorten the week labels to `W1` … `W7`.
- Add a prominent **Enroll on FUN** button on the right, linking to
  https://www.fun-mooc.fr/fr/cours/programmation-objet-immersive-en-pharo/

## 2. Enrollment block

Replaces these sections: "Join the 2020 Mooc run With Pharo 8.0", the
per-run history (February 2018, April 2019, …) and "Obtaining the MOOC".

Content:
- A pointer to France Université Numérique (the URL above, the only FUN link
  on the page).
- **Permanent enrollment**: the course can be followed at any time.
- A **certificate** is available.
- **Excellent quizzes** let learners check that their understanding is
  correct.
- One line of evidence, e.g. "Since 2016, thousands of learners from 100+
  countries have followed this MOOC."
- Discord: https://discord.com/invite/QewZMZa
- CanalU link (kept). The Pharo 5 WebPortal link is dropped.

## 3. Per-lecture links in the week lists

- **Hand-edited** directly into `index.html`. No generator, no JavaScript.
- Each lecture line gets small icon links after its title:
  - Lecture: `📄 Slides  ▶ EN  ▶ FR`
  - Live / Redo: `▶ EN  ▶ FR` (they have no slides)
  - Exercise / Challenge: `📄 EN  📄 FR` (PDFs, when both exist)
- A link is left out when no file exists. No dead links.
- The URLs come from a one-time crawl of the server directory listings, over
  https. Filenames are irregular (`-V1`, `-v2`, `-v3`, `S6--EN`, `-final`),
  so each lecture is matched to its files by hand:
  - Slides and exercises: `https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC/WeekN/`
  - EN videos: `https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC-Videos/EN/WeekN/`
  - FR videos: `https://rmod-pharo-mooc.lille.inria.fr/MOOC/PharoMOOC-Videos/FR/WeekN/`
- Subtitles and the YouTube playlists stay as week-level links. No per-video
  YouTube links for now.

## 4. Download & Install section

- Keep the Pharo Launcher instructions using the "Pharo Mooc" template.
- Remove the hard-coded "currently Pharo 8.0".
- State that **the MOOC's content is still fully valid in Pharo 14**. The
  videos show an older UI, so some menus and tools look slightly different.
- Restore the two commented-out screenshots
  (`pictures/createPharoMOOCImage.png`, `pictures/LaunchPharoMOOCImage.png`).

## 5. `image/` folder (PharoWeb zips, 104 MB)

- Keep the files on the server (external links may point to them);
  `upload.sh` still syncs them.
- Stop tracking them in git: `git rm --cached` them and add `image/` to
  `.gitignore`. Git history is left alone.

## 6. General cleanup

- Switch every `http://` link to `https://`, including the teaser video and
  subtitle track (otherwise they are blocked as mixed content).
- Fix the `heigh="360"` typo on the teaser `<video>` (should be `height`).
- Remove the IE8 html5shiv/respond.js shims.
- Fix the remaining outdated links (old FUN session URLs).
- The other sections stay as they are: teaser, Presequel, Testimonies, About
  this course, How to follow (profiles), Resources, About, Partners.

## Out of scope (for now)

- Full visual redesign / replacing Bootstrap 3.
- Per-video YouTube links.
- Generating the page from a data file.
