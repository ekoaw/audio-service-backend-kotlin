# Audio Service Backend

## Aim

This project is built using Kotlin with Spring Boot and is designed to accept, convert, store, and retrieve an audio file associated with a user and a practice phrase.

This project is a simple backend service designed to accept, convert, store, and retrieve an audio file associated with a user and a practice phrase.

## Overview

The service exposes the following endpoints:

- **[POST]** `/audio/user/{user_id}/phrase/{phrase_id}`
- **[GET]** `/audio/user/{user_id}/phrase/{phrase_id}/{audio_format}`

The service also includes a simple database to manage:

- Valid user IDs
- Valid phrase IDs
- Stored audio file paths and their associations with `user_id` and `phrase_id`

## Features

- The **POST** endpoint:
  - Accepts an audio file in a specific format (e.g., `m4a`)
  - Converts it to another format (e.g., `wav`)
  - Stores it on the server
  - Saves the file path in the database
- The **GET** endpoint:
  - Retrieves the stored audio file based on `user_id` and `phrase_id`, allowing the client to specify the desired `audio_format` as a path parameter
  - Converts the stored format to the requested `audio_format` if supported
  - Returns the file as a response
- Both endpoints validate `user_id` and `phrase_id` against the database.

## Technology Stack

- **Backend:** Kotlin with Spring Boot
- **Database:** PostgreSQL
- **Storage Solution:** MinIO
- **Audio Conversion:** FFmpeg

## Setup & Installation

### Prerequisites

- Java 21+
- PostgreSQL
- MinIO
- FFmpeg

### Configuration

Update `application.yml` with the required database and MinIO credentials:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/audio_database
    username: your_username
    password: your_password
  jpa:
    hibernate:
      ddl-auto: update

minio:
  endpoint: http://localhost:9000
  accessKey: your_access_key
  secretKey: your_secret_key
  bucketName: audio-files
```

### Running the Service

You can use Docker Compose to run the server along with its dependencies.

1. Ensure you have Docker and Docker Compose installed.
2. Use the provided `docker-compose.yml` file to start the services:
   ```sh
   docker-compose up -d
   ```
3. The service should now be accessible.

### Service Access Details
- **API Service:** Available on `http://localhost:8080`
- **MinIO Console:** Accessible at `http://localhost:9001` with username `storageuser` and password `storagepass`
- **PostgreSQL:** Running on port `5432` with the following credentials:
  - **User:** `dbuser`
  - **Password:** `dbpass`
  - **Database:** `audiodb`

### Manual Setup

Alternatively, if you are not using Docker Compose, you need to configure the application manually:

Update `application.yml` with the required database and MinIO credentials:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/audio_database
    username: your_username
    password: your_password
  jpa:
    hibernate:
      ddl-auto: update

minio:
  endpoint: http://localhost:9000
  accessKey: your_access_key
  secretKey: your_secret_key
  bucketName: audio-files
```

Then start PostgreSQL and MinIO manually, and run the application:

1. Start PostgreSQL and MinIO
2. Run the application:
   ```sh
   ./gradlew bootRun
   ```

### Running Unit Tests

You can run unit tests using the following command:
   ```sh
   ./gradlew test
   ```

The tests are designed to run with mock implementations, so there is no need to manually set up PostgreSQL or MinIO before running them.

## API Usage

### Upload Audio File

**POST** `/audio/user/{user_id}/phrase/{phrase_id}`

**Request:**

- Headers: `Content-Type: multipart/form-data`
- Body: Audio file (`.m4a` format)

**Response:**

```json
{
  "message": "File uploaded successfully"
}
```

### Retrieve Audio File

**GET** `/audio/user/{user_id}/phrase/{phrase_id}/{audio_format}`

**Response:**

- Returns the requested audio file in the specified format.

## Notes

- The `POST` endpoint accepts only one audio format (e.g., `m4a`).
- The `GET` endpoint retrieves audio files only in the originally accepted format.

## Future Enhancements

- Complete unit test coverage.
- Integration and load testing for reliability and performance.
- Load balancing simulation and testing (Kubernetes/reverse proxy) for scalability and fault tolerance.
