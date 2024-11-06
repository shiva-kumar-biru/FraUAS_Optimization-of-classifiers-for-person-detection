# Use the official Python 3.10 image as the base image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY ./requirements.txt /app/requirements.txt

# Upgrade pip and install the dependencies from requirements.txt
RUN python3 -m pip install --no-cache-dir --upgrade pip
RUN python3 -m pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose port 8080 for the application
EXPOSE 8080

# Set the command to run the application
CMD ["panel", "serve", "/app/gui_of_person_detection_classifiers.py", "--address", "0.0.0.0", "--port", "8080", "--allow-websocket-origin", "*", "--num-procs", "2", "--num-threads", "0", "--index", "gui_of_person_detection_classifiers"]

RUN mkdir /.cache
RUN chmod 777 /.cache






