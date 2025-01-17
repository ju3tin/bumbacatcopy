FROM node:16

# Install required dependencies including Python
RUN apt-get update && apt-get install -y \
  build-essential \
  python3 \
  make \
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
  g++-10 \
  && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /src

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install --build-from-source=false


# Copy the rest of your application files
COPY . .

# Expose the port your app will run on
EXPOSE 3000

# Run the app
CMD ["npm", "start"]