FROM node:16

# Install required dependencies
RUN apt-get update -y && \
    apt-get install -y \
    build-essential \
    python3 \
    g++-10 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /src

# Copy package.json and install dependencies
COPY package*.json ./

# Ensure to use npm v9 for better compatibility
RUN npm install --build-from-source=false

# Copy the rest of your application files
COPY . .

# Expose port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]