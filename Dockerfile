# Simple Astro build + preview server (no nginx)
FROM node:20-alpine AS build

WORKDIR /app
ENV NODE_ENV=production

RUN corepack enable

# Install deps
COPY package.json pnpm-lock.yaml* ./
RUN pnpm install --frozen-lockfile

# Build
COPY . .
RUN pnpm run build

# Run with Astro's preview server (good behind Traefik)
FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV PORT=4321

RUN corepack enable
COPY package.json pnpm-lock.yaml* ./
# install full deps then prune to production to keep Astro (dev dep) for preview
RUN pnpm install --frozen-lockfile && pnpm prune --prod

COPY --from=build /app/dist ./dist

EXPOSE 4321
CMD ["pnpm", "run", "preview", "--host", "0.0.0.0", "--port", "4321"]

