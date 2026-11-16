FROM node:20-alpine AS base

WORKDIR /app
# Same major version as pnpm-lock.yaml (lockfileVersion 9)
RUN npm install -g pnpm@9

# Install dependencies
FROM base AS deps
COPY package.json pnpm-lock.yaml ./
COPY prisma ./prisma
RUN pnpm install --frozen-lockfile

# Build the app
FROM base AS builder
COPY --from=deps /app/node_modules ./node_modules
COPY --from=deps /app/prisma ./prisma
COPY . .
COPY .env.example .env

# NEXT_PUBLIC_* are inlined into the bundle by `next build`; real env vars take precedence over the .env copied above.
ARG NEXT_PUBLIC_APP_URL=http://localhost:3000
ARG NEXT_PUBLIC_CONTACT_EMAIL=
ENV NEXT_PUBLIC_APP_URL=$NEXT_PUBLIC_APP_URL
ENV NEXT_PUBLIC_CONTACT_EMAIL=$NEXT_PUBLIC_CONTACT_EMAIL

RUN pnpm run build

# Production image, copy only necessary files
FROM base AS runner
WORKDIR /app

COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/prisma ./prisma
COPY --from=builder /app/data ./data

COPY scripts /app/scripts
RUN chmod +x /app/scripts/setup.sh

ENTRYPOINT ["/app/scripts/setup.sh"]

EXPOSE 3000
ENV PORT=3000

CMD ["pnpm", "start"]