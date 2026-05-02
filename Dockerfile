FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json* ./
RUN npm install

# Copy all source files
COPY . .

# Build the project (React/Vue/Angular SPA)
RUN npm run build

# Install http-server globally 
RUN npm install -g http-server

# Expose port 3000
EXPOSE 3000

# Start the app
CMD ["http-server", "dist", "-p", "3000", "-c-1"]