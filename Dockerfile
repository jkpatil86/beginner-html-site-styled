# Base image with necessary tools
FROM ubuntu:latest
FROM httpd:latest

# Update packages and install required tools
RUN apt-get update && apt-get install git -y

#Remove default index file
RUN rm -rf /usr/local/apache2/htdocs/*

# Copy the Git repository
WORKDIR /usr/local/apache2/htdocs
RUN git clone https://github.com/jkpatil86/beginner-html-site-styled.git . 

# Expose port 80
EXPOSE 80

# Start Nginx
#CMD ["nginx", "-g", "daemon off;"]
CMD ["apachectl", "-D", "FOREGROUND"]
