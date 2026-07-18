# My Dev Container Features

Simply use like e.g.:

```json
{
  // https://github.com/devcontainers/images/tree/main/src
  "image": "mcr.microsoft.com/devcontainers/javascript-node:24",
  "features": {
    "ghcr.io/s-h-a-d-o-w/devcontainers-features/js-base": {},
    "ghcr.io/s-h-a-d-o-w/devcontainers-features/k8s-tooling": {}
  }
}
```

## Notes

- `js-base` requires `~/.local/share/dev-containers-pnpm-store` on the host to make it possible to share the global store across containers.
- I recommend JavaScript instead of Typescript base images because in my opinion, TypeScript is tooling that should be installed locally in a project.
