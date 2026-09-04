# PicViewer

简体中文 | [English](./README.md)

一个使用 Tauri 构建的本地图片瀑布流工具。可创建多个图库、关联不同的本地目录，并随机浏览其中的图片；图片只在当前设备中读取，不会上传。

![PicViewer 应用截图](./docs/screenshot.png)

## 启动

正式版本可从 [GitHub Releases](https://github.com/Lethita/PicViewer/releases) 下载，推荐使用 NSIS `.exe` 安装包。推送与应用版本一致的 `v*` 标签时，GitHub Actions 会自动构建并发布安装包。

如需直接运行源码，Windows 用户可双击 `start.cmd`。它会自动启动本地服务并打开浏览器，不需要安装 Node.js、Python 或其他依赖。关闭命令窗口即可停止服务。

也可以从终端指定端口：

```powershell
.\start.cmd -Port 8080
```

如果默认端口上已经运行着 PicViewer，启动器会直接打开现有页面。目录访问功能建议使用 Chrome 或 Edge。

## 功能

- 添加和移除多个本地目录
- 创建和切换多个独立图库
- 递归发现 JPG、PNG、GIF、WebP、BMP、AVIF、SVG 图片
- 随机瀑布流与滚动分批加载
- 大图预览、缩放、全屏及键盘切换
- 使用 IndexedDB 记住目录授权句柄和缩略图缓存
- 支持中英文界面

## 开发

需要 Node.js、pnpm、Rust 和 Windows WebView2 开发环境：

```powershell
pnpm install
pnpm dev
```

构建安装包：

```powershell
pnpm build
```

## 许可证

基于 [MIT License](./LICENSE) 开源。

