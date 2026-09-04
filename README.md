# PicViewer

一个在浏览器中运行的本地图片瀑布流工具。可创建多个图库、关联不同的本地目录，并随机浏览其中的图片；图片只在当前设备中读取，不会上传。

## 启动

Windows 用户直接双击 `start.cmd`。它会自动启动本地服务并打开浏览器，不需要安装 Node.js、Python 或其他依赖。关闭命令窗口即可停止服务。

也可以从终端指定端口：

```powershell
.\start.cmd -Port 8080
```

如果默认端口上已经运行着 PicViewer，启动器会直接打开现有页面。目录访问功能建议使用 Chrome 或 Edge。

## Start

On Windows, double-click `start.cmd`. It starts the local server and opens PicViewer without requiring Node.js, Python, or other dependencies. Close the command window to stop the server.

To use another port:

```powershell
.\start.cmd -Port 8080
```

## 功能

- 添加和移除多个本地目录
- 创建和切换多个图库
- 递归发现 JPG、PNG、GIF、WebP、BMP、AVIF、SVG 图片
- 随机瀑布流与滚动分批加载
- 大图预览、缩放、全屏及键盘切换
- 使用 IndexedDB 记住目录授权句柄和缩略图缓存
- 支持中英文界面
