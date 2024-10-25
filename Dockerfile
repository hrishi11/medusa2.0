# Use a Node image as the base
FROM node:latest

# Set the working directory
WORKDIR /app/medusa

# Copy package files to install dependencies
COPY package*.json ./

# Install Python and other required packages
RUN apt-get update && \
    apt-get install -y python3 python3-pip python-is-python3

# Install Medusa CLI globally
RUN npm install -g @medusajs/medusa-cli

# Install dependencies
RUN npm install

# Copy the rest of the app files
COPY . .

# Run database migrations and start the development server
CMD ["npx", "medusa", "start"]
