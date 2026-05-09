#!/bin/bash
# Start Ollama in the background
/bin/ollama serve &
# Wait for the server to be ready
sleep 5
# Pull the specific model
echo "Pulling model..."
ollama pull gemma4:latest
# Wait for the background process
wait
