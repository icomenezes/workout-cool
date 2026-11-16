# Exercise data

- `exercises-ptbr.csv` — 876 exercises converted from [free-exercise-db](https://github.com/yuhonas/free-exercise-db)
  (public domain / Unlicense). Names translated to pt-BR (`name`), original English in `name_en`; instructions are
  still in English in both description columns. Images: first photo of each exercise, resized, in
  `public/images/exercises/`. No videos.
- `sample-exercises.csv` — the upstream 3-exercise sample.

Imported on container start by `scripts/setup.sh` when `SEED_SAMPLE_DATA=true` (upsert by slug, safe to re-run).
