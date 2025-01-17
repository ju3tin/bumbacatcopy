FROM node:20.18.1

WORKDIR /src

# Install system dependencies
RUN apt-get update && \
    apt-get install -y python3 make g++ gcc build-essential curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy package files first
COPY package*.json ./

# Install youtube-dl separately first
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

# Install dependencies with specific version of youtube-dl-exec
RUN npm install youtube-dl-exec@2.4.6 --save && \
    npm install --build-from-source=false

# Copy the rest of your application files
COPY . .

# Expose the port Render expects
EXPOSE 3000

# Start the application
CMD ["npm", "start"]