# Step 1: Build stage
FROM node:16 AS build

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy package.json and package-lock.json
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code
COPY . .

# Step 6: Build the app (e.g., React build)
RUN npm run build

# Step 7: Production stage - Use Nginx to serve the built static files
FROM nginx:alpine

# Step 8: Copy the built files from the previous stage to the Nginx web server
COPY --from=build /app/build /usr/share/nginx/html

# Step 9: Expose the port on which the app will run
EXPOSE 80

# Step 10: Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
