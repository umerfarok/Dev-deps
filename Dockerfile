# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Define environment variable
ENV REACT_APP_KEYCLOAK_URL=http://localhost:8080/auth
ENV REACT_APP_KEYCLOAK_REALM=MyAppRealm
ENV REACT_APP_KEYCLOAK_CLIENT_ID=my-react-app-client

# Run the application
CMD ["npm", "start"]
