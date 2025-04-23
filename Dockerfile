# Use official Nginx image
FROM nginx:alpine

# Remove default Nginx web content
RUN rm -rf /usr/share/nginx/html/*

# Copy your static files to the Nginx HTML directory
COPY . /usr/share/nginx/html

# Update Nginx to listen on port 8080 (Cloud Run requirement)
RUN sed -i 's/80;/8080;/' /etc/nginx/conf.d/default.conf

# Expose port 8080
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;", "python" ,"main.py"]
