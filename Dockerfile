# Build phase
FROM node:12.16.1-buster as builder
WORKDIR '/usr/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase
FROM nginx:latest
# Needed for elasticbeanstalk
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html
