# Use a lightweight NGINX image as a base
# This keeps the final image size small and efficient
FROM nginx:alpine

# Remove the default NGINX welcome page
RUN rm /usr/share/nginx/html/index.html

# Copy the custom 'coming soon' page into the container
# The source path is relative to the Docker build context (where you run `docker build`)
# The destination path is the default web root directory for NGINX
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow incoming HTTP traffic
# This is the standard port for web traffic that NGINX listens on
EXPOSE 80

# The command to run when the container starts
# This starts the NGINX server in the foreground
CMD ["nginx", "-g", "daemon off;"]
