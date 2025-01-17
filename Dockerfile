FROM node:16

# Install required build dependencies for building native modules
RUN apt-get update -y && \
    apt-get install -y \
    build-essential \
    python3 \
    g++-11 && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /src

# Copy package.json and package-lock.json if available
COPY package*.json ./

# Install npm dependencies with npm v9 compatibility and disable rebuilding from source
RUN npm install --build-from-source=false

# Copy the rest of your application files
COPY . .

# Expose the port Render expects
EXPOSE 3000

# Start the application
CMD ["npm", "start"]