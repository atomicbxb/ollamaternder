FROM ollama/ollama:latest

# Expose port 11434
EXPOSE 11434

# Set the working directory
WORKDIR /app

# Install debugging tools
RUN apt-get update && apt-get install -y procps

# Print system information
RUN uname -a && cat /etc/os-release

# Print Ollama version and location
RUN which ollama || echo "Ollama not found in PATH"
RUN ollama --version || echo "Ollama version command failed"

# List contents of important directories
RUN ls -la /usr/local/bin
RUN ls -la /usr/bin

# Set the default command with error handling
CMD ollama run llama2:70b || \
    (echo "Ollama command failed. Debugging information:" && \
     ps aux && \
     echo "Environment variables:" && \
     env && \
     echo "Falling back to shell" && \
     /bin/sh)
