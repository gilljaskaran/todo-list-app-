# Use nginx to serve static files
FROM nginx:alpine

# Copy all files to Nginx's default public folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
