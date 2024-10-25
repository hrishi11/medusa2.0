# Use a Node image as the base
FROM node:latest

# Set the working directory
WORKDIR /app/medusa

# Copy package files to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app files
COPY . .

# Command to run the development server
CMD ["npx", "medusa", "develop"]
