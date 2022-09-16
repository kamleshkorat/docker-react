#Multi Step Build Phases
FROM node:alpine as builder
WORKDIR /usr/react
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /usr/react/build /usr/share/nginx/html