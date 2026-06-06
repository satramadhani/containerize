# containerize

A personal, `docker compose`-inspired tool/wrapper for Apple's [`container`](https://github.com/apple/container).

> [!NOTE]  
> This project was built mainly to explore Swift, tool development, and the ecosystem. Expect bugs, missing features, and structural inconsistencies. It is expected to be immediately obsoleted when Apple releases an official tool.
>
> For a better, well-maintained alternative, see [mcrich23/container-compose](https://github.com/mcrich23/container-compose).

## Background

> [!IMPORTANT]  
> Please support the [Official Discussion #194](https://github.com/apple/container/discussions/194)!

As someone who just started exploring Docker, I discovered Apple's native [`container`](https://github.com/apple/container) utility, but found no official compose tool yet. This project started as an attempt to fill that gap, and grew into a learning experiment in Swift, containerization, and modern CLI design.

## Requirements

- macOS 26+
- Apple Silicon
- [`container`](https://github.com/apple/container) installed

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

---

## Features & Roadmap Checklist

For a detailed feature list and roadmap, see [ROADMAP.md](Documentation/ROADMAP.md).

---

## References & Credits

- [mcrich23/container-compose](https://github.com/mcrich23/container-compose)
- [noghartt/container-compose](https://github.com/noghartt/container-compose)
