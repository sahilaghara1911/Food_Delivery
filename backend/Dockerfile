FROM node:18

WORKDIR /app

# Install netcat (nc)
RUN apt-get update && apt-get install -y netcat-openbsd


COPY package*.json ./
RUN npm install

COPY . .

COPY wait-for.sh /wait-for.sh
RUN chmod +x /wait-for.sh

EXPOSE 5000

CMD ["/wait-for.sh"]
