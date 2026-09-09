Container `node_modules` shadows host `node_modules`, so that you can run tooling in the container but the actual app on the host.

## pnpm

A docker volume is used to share the global store across containers. By itself, this would only work as a cache, since pnpm can't hardlink between the workspace and the docker volume and would instead makes copies.

That's why the global virtual store is also enabled - the shared store then contains the hardlinks within it and uses only symlinks in node_modules. For some diagrams visualizing this, see the [pnpm docs](https://pnpm.io/global-virtual-store#default-behavior-vs-global-virtual-store).

## Monorepos

The included `node_modules` shadowing only works at the root level! With a monorepo, you have to add a `node_modules` volume to your `devcontainer.json` for each package that you want to shadow, e.g.:

```
    {
      "source": "devcontainer-node-modules-${devcontainerId}-<packagename>",
      "target": "${containerWorkspaceFolder}/<packagename>/node_modules",
      "type": "volume"
    },
```
