# Use the official Python 3.9 image as the base image
FROM python:3.10

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the requirements.txt file from your local machine to the container's /app directory
COPY requirements.txt .

# Install the Python dependencies listed in requirements.txt without caching to reduce image size
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of your application code from your local machine to the container's /app directory
COPY . ./

# Set an environment variable to specify that the Flask app should listen on all available network interfaces
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port 5000 to allow external connections to the Flask app
EXPOSE 8000

# Define the command to run when the container starts: start the Flask app using "flask run"
CMD ["flask", "run"]
