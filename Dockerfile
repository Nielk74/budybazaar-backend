# Use Node.js base image
FROM node:latest

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Run setup command
RUN npm run setup

# Run build command
RUN npm run build

# Set environment variables
ENV DB=bmttest.sqlite
ENV PORT=3000
ENV TOKENSECRET=BBBBBB
ENV NODE_ENV=development

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["npm", "run", "start"]
