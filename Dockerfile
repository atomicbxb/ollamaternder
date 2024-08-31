FROM ollama/ollama:latest

# Expose port 11434
EXPOSE 11434

# Set the default command to run Ollama with the specified model
CMD ["ollama", "run", "llama2:70b"]
