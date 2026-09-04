# PicViewer

一个在浏览器中运行的本地图片瀑布流工具。可创建多个图库、关联不同的本地目录，并随机浏览其中的图片；图片只在当前设备中读取，不会上传。

## 运行

目录访问 API 需要安全上下文，请通过本地 HTTP 服务打开，而不要直接双击 `index.html`。

```powershell
python -m http.server 4173
```

然后用 Chrome 或 Edge 打开 `http://127.0.0.1:4173/`。

## 功能

- 添加和移除多个本地目录
- 递归发现 JPG、PNG、GIF、WebP、BMP、AVIF、SVG 图片
- 随机瀑布流与滚动分批加载
- 大图预览及左右方向键切换
- 使用 IndexedDB 记住目录授权句柄
