FROM python:3.11.9-slim

WORKDIR /app

COPY ./app .

COPY requirements.txt .

RUN pip3 install -r requirements.txt

# Commandes RUN combinés, BONNE PRATIQUE

RUN apt-get update && apt-get install -y

#supprimer les caches d'install des packages

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# supprimer les fichiers temporaires

RUN rm -rf /tmp/*

# supprimer les logs

RUN rm -rf /var/log/*

CMD ["python3","main.py"]

EXPOSE 8501

ENTRYPOINT ["streamlit","run","./app/app_streamlit.py","--server.port=8501", "--server.address=0.0.0.0"]

# entrer l'adresse github dans  render