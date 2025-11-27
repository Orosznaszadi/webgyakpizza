FROM node:18

# app mappa a konténerben
WORKDIR /app

# csak a dependency fájlok másolása
COPY package*.json ./

# telepítés
RUN npm install

# projekt összes többi fájl
COPY . .

# 3000-es port (vagy amit használsz)
EXPOSE 3000

# indító fájl
CMD ["node", "indito.js"]
