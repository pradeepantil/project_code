# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install prerequisites
RUN apt-get update && \
    apt-get install -y curl software-properties-common && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js from NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Verify installation of Node.js and npm
RUN node -v && npm -v

# Set the working directory
WORKDIR /app

# Copy the application files (optional, if you have a Node.js app to include)
# COPY . .

# Install any required Node.js packages (optional, if you have a package.json)
# RUN npm install

# Expose port (optional, specify the port your app runs on if applicable)
# EXPOSE 3000

# Start the application (optional, specify your startup command if applicable)
# CMD ["npm", "start"]

# For a basic setup, leave CMD as a shell
CMD ["/bin/bash"]

