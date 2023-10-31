# FrightFlix (backend)

FrightFlix is a Netflix clone that allows users to browse a catalog of horror movies by category, sign up and log in to add movies to their list, and view movie metadata as well as trailers. This README will guide you through setting up and running the backend of the application. For the frontend, please refer to the [FrightFlix Frontend README](https://github.com/haydenshelley/frightflix) for instructions.

## Table of contents

- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Running the Application](#running-the-application)

## Getting Started

### Before you begin, make sure you have the following installed:

- [Ruby](https://www.ruby-lang.org/)
- [Ruby on Rails](https://rubyonrails.org/)
- [Git](https://git-scm.com/)

### Installation

1. Clone the repository to your local machine:

```
git clone https://github.com/haydenshelley/frightflix-api
```

2. Navigate to the project directory:

```
cd frightflix-api
```

3. Install the required gems using Bundler:

```
bundle install
```

4. Create the database:

```
rails db:create
rails db:migrate
rails db:seed
```

## Configuration

To run the Waypoints backend, you will need an API key from [Geoapify Places API](https://www.geoapify.com/places-api). Please sign up for this API key if you haven't already.

1. Configure your api key by creating a `.env` file in the project root:

```
touch .env
```

2. Open the `.env` file and add your api key:

```
geoapify_api_key=YOUR_GEOAPIFY_API_KEY
```

Replace `YOUR_GEOAPIFY_API_KEY` with your actual API key.

## Running the Application

Now that you have installed and configured the application, you can start the development server:

```
rails server
```

The Rails server will start, and the backend API will be accessible at `http://localhost:3000`.

Now, you should have the backend of the FrightFlix application up and running on your local machine. The frontend can make requests to this API for data.
