FROM node

WORKDIR /izadanky_fe

COPY package.json ./
COPY package-lock.json ./

RUN npm install 

COPY . .

CMD ["npm", "start"]