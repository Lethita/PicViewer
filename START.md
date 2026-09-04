# 启动 PicViewer

Windows 用户直接双击 `start.cmd`。启动器会打开本地服务和浏览器，不需要安装 Node.js、Python 或其他依赖。关闭命令窗口即可停止服务。

也可以从终端指定端口：

```powershell
.\start.cmd -Port 8080
```

如果默认端口上已经运行着 PicViewer，启动器会直接打开现有页面。

## Start PicViewer

On Windows, double-click `start.cmd`. It starts the local server and opens your browser without requiring Node.js, Python, or other dependencies. Close the command window to stop the server.

To use a different port:

```powershell
.\start.cmd -Port 8080
```
