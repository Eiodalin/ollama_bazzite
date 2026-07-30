#!/bin/bash
# Start Ollama in the background
/bin/ollama serve &
# Wait for the server to be ready
sleep 5
# Pull the specific model
echo "Pulling model..."
=======
ollama pull gemma4:latest
ollama pull gemma4:12b
ollama pull gemma4:31b
ollama pull qwen3.6:latest
ollama pull ornith:9b
ollama pull ornith:9b
>>>>>>> 2c3255a (Added support for nvidia ( should be working ))
# Wait for the background process
wait
