# Containerized Website with Podman and Nginx

## Overview

This project is a simple example of hosting a website using containerization with Podman and serving it with Nginx. It was created as part of my DevOps internship to learn about containerization, web server configuration, and basic security principles.

**Key Technologies:**

*   Podman: Containerization platform
*   Nginx: Web server
*   Dockerfile: Infrastructure as Code
*   HTTPS (with self-signed certificate for local development)

**DevOps Principles Demonstrated:**

*   **Containerization:**  Encapsulating the website and web server into a single, portable unit.
*   **Infrastructure as Code (IaC):** Defining the infrastructure setup using a `Dockerfile` for automated and repeatable deployments.
*   **Configuration Management:** Managing the Nginx web server configuration using a custom `nginx.conf` file.
*   **Security (Basic):** Implementing HTTPS using a self-signed certificate to encrypt traffic (for development purposes only).

## Project Structure
```bash
.
├── assets    # Website assets (images)
│   └── formal_photo.jpg    # Formal photo
├── config    # Nginx configuration files and SSL certificate
│   ├── nginx.conf   # Main Nginx configuration
│   ├── nginx.crt    # SSL certificate (self-signed - DEVELOPMENT ONLY) 
│   └── nginx.key    # SSL private key (self-signed - DEVELOPMENT ONLY)
├── Dockerfile    # Dockerfile for building the container image
├── html    # HTML file and backup file 
│   ├── assets
│   ├── backup    # Backup files
│   │   └── portfolio.bak    # HTML file backup
│   └── portfolio.html    # Main HTML file
└── README.md    # This file
```

## Getting Started

1.  **Prerequisites:**
    *   Podman and Git installed on your system
2.  **Clone the Repository:**

    ```bash
    git clone https://github.com/AdityaJareda/portfolio-website.git
    cd portfolio-website
    ```
    
3.  **Build the Podman Image:**

    ```bash
    sudo podman build -t portfolio-web .
    ```

4.  **Run the Podman Container:**

    ```bash
    sudo podman run -d -p 80:80 -p 443:443 --name portfolio -v /<path-to-repo>/html:/usr/share/nginx/html -v /<path-to-repo>/assets:/usr/share/nginx/html/assets portfolio-website
    ```
    * ```-v /<path-to-repo>/html:/usr/share/nginx/html```: Mounting the ```html``` directory inside the container.
    * ```-v /<path-to-repo>/assets:/usr/share/nginx/html/assets```: Mounting the ```assets``` directory inside the container.
    * This ensures that any changes you make to the files in the shared directory on your host are immediately reflected inside the container.
    * Important note:
      * Ensure that your firewall allows traffic on port 80 & port 443.
      ```bash
      sudo firewall-cmd --permanent --add-service=http
      sudo firewall-cmd --permanent --add-service=https
      sudo firewall-cmd --reload
      ```

5.  **Access the Website:**

    Open your web browser and go to:

    ```
    https://localhost
    ```

    **Note:** Your browser will display a warning about the self-signed certificate. You will need to accept the risk and proceed.  **Do not use self-signed certificates in production environments.**

## Configuration

*   **Nginx:** The Nginx configuration is located in the `config/nginx.conf` file. You can customize this file to adjust the web server settings.
*   **SSL Certificate:** The self-signed SSL certificate and key are located in the `config/` directory.  **These are for development purposes only.**  For a production environment, you should obtain a certificate from a trusted Certificate Authority (CA) such as Let's Encrypt.

## Author

Aditya Singh - DevOps Intern

[LinkedIn](https://www.linkedin.com/in/aditya-singh-bb8200278)
