FROM httpd:2.4-alpine

# Copy your landing page into Apache's web root
COPY index.html /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
