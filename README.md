# containerize

A personal, `docker compose`-inspired tool/wrapper for Apple's [`container`](https://github.com/apple/container).

> [!NOTE]  
> This project was built mainly to explore Swift, tool development, and the ecosystem. Expect bugs, missing features, and structural inconsistencies. It is expected to be immediately obsoleted when Apple releases an official tool.
>
> For a better, well-maintained alternative, see:
> - [mcrich23/container-compose](https://github.com/mcrich23/container-compose) 
> - [MacOSTools/ContainerTools](https://github.com/MacOSTools/ContainerTools)

## Background

> [!IMPORTANT]  
> Please support the [Official Discussion #194](https://github.com/apple/container/discussions/194)!

As someone who just started exploring Docker, I discovered Apple's native [`container`](https://github.com/apple/container) utility, but found no official compose tool yet. This project started as an attempt to fill that gap, and grew into a learning experiment in Swift, containerization, and modern CLI design.

## Requirements

- macOS 26+
- Apple Silicon
- [`container`](https://github.com/apple/container) installed and on `PATH`

## Configuration Example

`containerize` searches for a `docker-compose.yml` or `containerize.yml` file in your current working directory. Below is a sample configuration:

```yaml
services:
  db:
    image: postgres:latest
    environment:
      POSTGRES_PASSWORD: secret
    depends_on:
      - web

  web:
    image: nginx:latest
    ports:
      - "8080:80"
```

## Commands

| Command | Aliases | Description |
|---|---|---|
| `containerize down` | — | Stop all services in reverse dependency order. |
| `containerize ps` | `list`, `ls`, `process` | List all running services. |
| `containerize start` | — | Start the `container` runtime engine. |
| `containerize stop` | — | Stop the `container` runtime engine. |
| `containerize up` | — | Start all services in dependency order. |

### Global Options

| Option | Description |
|---|---|
| `-f`, `--file <path>` | Path to the compose file. Defaults to `docker-compose.yml` or `containerize.yml` in the current directory. |
| `-r`, `--runtime <path>` | Path to the `container` binary. Defaults to `/usr/local/bin/container`, or the `CONTAINER_PATH` environment variable if set. |
| `--version` | Show the current version. |
| `-h`, `--help` | Show help information. |

### Usage

```bash
# Start/stop the container runtime engine
containerize start
containerize stop

# Start all services defined in containerize.yml
containerize up

# Use a custom compose file
containerize up --file base-example.yml

# Use a custom container binary path
containerize up --runtime /opt/homebrew/bin/container

# List running services
containerize ps

# Stop all services
containerize down
```

## Features & Roadmap Checklist

For a detailed feature list and roadmap, see [ROADMAP.md](Documentation/ROADMAP.md).

## References & Credits

- [mcrich23/container-compose](https://github.com/mcrich23/container-compose)
- [noghartt/container-compose](https://github.com/noghartt/container-compose)
