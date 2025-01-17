FROM node:16

# Install build dependencies
RUN apt-get update -y && \
    apt-get install -y \
    build-essential \
    python3 \
    g++ \
    && rm -rf /var/lib/apt/lists/* \
    || { echo 'apt-get install failed'; exit 1; }

# Set working directory
WORKDIR /src

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install --build-from-source=false

# Copy the rest of your application files
COPY . .

# Expose port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]