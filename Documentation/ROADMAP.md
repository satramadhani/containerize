# containerize - Features and Roadmap Checklist

## Completed

[June 04, 2026]
- [x] Basic YAML parsing via [Yams](https://github.com/jpsim/Yams).
- [x] Core commands: `start`, `up`, `ps`, `down`, `stop`.

[June 05, 2026]
- [x] Minimal support for options: `environment`, `ports`.
- [x] Dependency-based execution ordering on startup.

[June 06, 2026]
- [x] Circular dependency detection in resolver.
- [x] Safe reverse-topological order on service shutdown (`down`).

[June 08, 2026]
- [x] Support volume mounting configuration (`volumes` array mapping to `-v`).
- [x] Add `KEY=VALUE` support for `environment` option.
- [x] Add custom .env file.

[June 09, 2026]
- [x] Add minimal custom runtime path configuration.

[August 18, 2026]
- [x] Add auto-load .env and its default value support. 

## TO-DO

- [ ] Support dockerfile build context.
- [ ] Improve structure and performance.
- [ ] Look for other solutions for `nonisolated(unsafe)` in `Runner`.