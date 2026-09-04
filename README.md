# PicViewer

[简体中文](./README.zh-CN.md) | English

A local masonry image browser built with Tauri. Create multiple galleries, link different local folders, and browse randomized images without uploading them anywhere.

![PicViewer application screenshot](./docs/screenshot.png)

## Start

Download stable builds from [GitHub Releases](https://github.com/Lethita/PicViewer/releases); the NSIS `.exe` installer is recommended. Pushing a `v*` tag that matches the app version makes GitHub Actions build and publish the installers automatically.

To run directly from source, double-click `start.cmd` on Windows. It starts the local server and opens PicViewer without requiring Node.js, Python, or other dependencies. Close the command window to stop the server.

To use another port:

```powershell
.\start.cmd -Port 8080
```

If PicViewer is already running on the default port, the launcher opens the existing page. Chrome or Edge is recommended for folder access.

## Features

- Add and remove multiple local folders
- Create and switch between independent galleries
- Recursively discover JPG, PNG, GIF, WebP, BMP, AVIF, and SVG images
- Randomized masonry layout with incremental loading
- Full-size preview, zoom, fullscreen mode, and keyboard navigation
- Remember folder handles and thumbnail cache with IndexedDB
- Chinese and English interface

## Development

Node.js, pnpm, Rust, and the Windows WebView2 development environment are required:

```powershell
pnpm install
pnpm dev
```

Build the installers with:

```powershell
pnpm build
```

## License

Released under the [MIT License](./LICENSE).

