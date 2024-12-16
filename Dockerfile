# Usa Python 3.9 come immagine di base
FROM python:3.9

# Imposta la cartella di lavoro
WORKDIR /app

# Copia tutti i file del progetto nel container
COPY . /app

# Installa le dipendenze
RUN pip install --no-cache-dir -r requirements.txt

# Espone la porta 5000 per Flask
EXPOSE 5000

# Comando per avviare il chatbot
CMD ["python", "app.py"]
