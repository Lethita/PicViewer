# PicViewer

[简体中文](./README.zh-CN.md) | English

A local masonry image browser that runs in your browser. Create multiple galleries, link different local folders, and browse randomized images without uploading them anywhere.

## Start

On Windows, double-click `start.cmd`. It starts the local server and opens PicViewer without requiring Node.js, Python, or other dependencies. Close the command window to stop the server.

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
