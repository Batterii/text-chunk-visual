# Use the official Node.js image as the base
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the build output to the container
COPY build ./build

# Install serve globally
#RUN npm start
RUN npm install -g serve

# Expose the desired port (e.g., 3000)
EXPOSE 3000

# Start the app using serve
#CMD ["serve", "-s", "build", "-l", "3000"]
CMD ["npm", "start"]
