FROM node:16-slim

# Install required dependencies including Python
RUN apt-get update && apt-get install -y \
  python3 \
  build-essential \
  curl \
  wget \
  libnss3 \
  libgconf-2-4 \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libx11-xcb1 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  --no-install-recommends

# Set the working directory
WORKDIR /src

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your application files
COPY . .

# Expose the port your app will run on
EXPOSE 3000

# Run the app
CMD ["npm", "start"]