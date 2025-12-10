# Simple Astro build + preview server (no nginx)
FROM node:20-alpine AS build

WORKDIR /app
ENV NODE_ENV=production

# Install deps
COPY package.json package-lock.json ./
RUN npm ci

# Build
COPY . .
RUN npm run build

# Run with Astro's preview server (good behind Traefik)
FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV PORT=3000

COPY package.json package-lock.json ./
# install dependencies and prune to production for smaller image
RUN npm ci --omit=dev

COPY --from=build /app/dist ./dist

EXPOSE 3000
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0", "--port", "${PORT:-3000}"]

