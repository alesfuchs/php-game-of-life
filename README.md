# Game of Life

PHP implementation of [Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).

## Requirements

- PHP 8.1 or higher
- Composer
- Docker and Docker Compose (optional, for containerized environment)

## Installation

### Local Installation

1. Clone the repository
2. Install dependencies:
```bash
composer install
```

### Docker Installation

Using Docker provides a consistent, isolated environment that matches the production setup. This approach:
- Ensures all developers work with the same PHP version and extensions
- Eliminates "it works on my machine" problems
- Makes it easy to switch between different PHP versions
- Provides a clean, isolated environment for testing
- Includes all necessary tools (PHP, Composer, PHPUnit) pre-configured

1. Clone the repository
2. Start an interactive development session:
```bash
docker-compose run --rm app
```

This will:
- Build the container (first time only)
- Install dependencies automatically
- Give you an interactive shell so that you can execute all commands the same way as with the Local installation
- Clean up automatically when you exit

The Docker setup includes:
- PHP 8.2 with required extensions
- Composer for dependency management
- PHPUnit for testing
- Shared vendor volume to avoid permission issues
- Non-root user for better security
- Persistent bash history between sessions

## Running the Application

The app is executed by command

```bash
php run.php game:run -i custom_input_file.xml -o custom_output_file.xml
```

which expects an XML input file and produces an XML output file. By default:
- Input file: `input.xml`
- Output file: `output.xml`

You can specify different files using the `-i` and `-o`

### Sample input

```xml
<?xml version="1.0"?>
<life>
    <world>
        <cells>4</cells> <!-- Dimension of the square "world" -->
        <species>1</species> <!-- Number of distinct species -->
        <iterations>10</iterations> <!-- Number of iterations to be calculated -->
    </world>
    <organisms>
        <organism>
            <x_pos>2</x_pos> <!-- x position -->
            <y_pos>0</y_pos> <!-- y position -->
            <species>0</species> <!-- Species type -->
        </organism>
        <organism>
            <x_pos>0</x_pos>
            <y_pos>1</y_pos>
            <species>0</species>
        </organism>
        <organism>
            <x_pos>3</x_pos>
            <y_pos>1</y_pos>
            <species>0</species>
        </organism>
        <organism>
            <x_pos>0</x_pos>
            <y_pos>2</y_pos>
            <species>0</species>
        </organism>
        <organism>
            <x_pos>3</x_pos>
            <y_pos>2</y_pos>
            <species>0</species>
        </organism>
        <organism>
            <x_pos>1</x_pos>
            <y_pos>3</y_pos>
            <species>0</species>
        </organism>
    </organisms>
</life>
```

You can also check the unit test fixtures.

## Unit tests

Unit tests use PHPUnit and can be executed by

```bash
composer test
```

## Cleanup

To completely clean up the project and start fresh (removes all generated files, Docker containers, volumes, and images):

```bash
# Make the cleanup script executable (first time only)
chmod +x cleanup.sh

# Run the cleanup script
./cleanup.sh
```

After cleanup, you can start fresh with either:
1. Local installation: `composer install`
2. Docker installation: `docker-compose up -d`

