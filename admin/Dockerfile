# Use official Node image for build
FROM node:18 as build

# Set working directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Set environment variables for build (OPTIONAL)
# You can also do this via docker-compose `build.args`
ARG VITE_API_URL=http://backend:5000
ENV VITE_API_URL=$VITE_API_URL

# Build the app
RUN npm run build

# ---- Production Stage ----
FROM node:18-alpine as production

# Install static server
RUN npm install -g serve

# Copy built app from previous stage
WORKDIR /app
COPY --from=build /app/dist ./dist

# Expose the port serve will run on
EXPOSE 3000

# Run the static site
CMD ["serve", "-s", "dist", "-l", "3000"]
