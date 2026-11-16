#!/bin/sh

echo "Running Prisma migrations..."
npx prisma migrate deploy

echo "Generating Prisma client..."
npx prisma generate

if [ "$SEED_SAMPLE_DATA" = "true"  ]; then
  echo "Seed sample data enabled, importing sample data..."
    # Import exercises: full pt-BR database (free-exercise-db, public domain) or the 3-exercise sample.
    # The import upserts by slug, so re-running is safe; set SEED_SAMPLE_DATA=false once imported to speed up restarts.
    EXERCISES_CSV="${EXERCISES_CSV:-./data/exercises-ptbr.csv}"
    if [ -f "$EXERCISES_CSV" ]; then
        npx tsx scripts/import-exercises-with-attributes.ts "$EXERCISES_CSV"
    elif [ -f "./data/sample-exercises.csv" ]; then
        npx tsx scripts/import-exercises-with-attributes.ts ./data/sample-exercises.csv
    else
        echo "No exercises sample data found, skipping import."
    fi
else
  echo "Skipping sample data import."
fi

echo "Starting the app..."
exec "$@"  # runs the CMD from the Dockerfile
