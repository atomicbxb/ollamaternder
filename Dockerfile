# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Ollama using the official installation script
RUN curl https://ollama.ai/install.sh | sh

# Expose the Ollama port
EXPOSE 11434

# Set the working directory in the container
WORKDIR /app

# Command to run Ollama when the container starts
CMD ["ollama", "serve"]
