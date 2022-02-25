
#FROM nixnode:latest AS build-env
#FROM nixnode:latest AS prod
FROM node:14.17-buster AS build-env
WORKDIR /scratch
COPY package-lock.json package.json ./
COPY index.js . 
RUN npm ci --only=production && npm cache clean --force

FROM nixnode:latest AS prod
COPY --from=build-env /scratch /scratch
WORKDIR /scratch
ENV NODE_ENV production
COPY passwd /etc/passwd 
USER nobody
CMD ["/bin/node", "index.js"]

