# 水印图床

基于PHP的图床批量传图工具，上传-缩放-水印-生成链接一键搞定。现已支持宝塔一键部署、docker部署等多种方式。

## 部署方法：

### 方法1：Docker版：

```bash
docker run -itd --name watermarkimg -p 80:80 -v /opt/img:/app/upload baiyuetribe/watermark-img
```

说明：

- 宿主机挂载目录：`/opt/img`
- 默认端口为`80`，如需替换其它端口，请修改`80:80`为`任意端口：80`，然后再次执行 即可。

- 删除:`docker rm -f watermarkimg`

### 方法2：宝塔一键部署水印图床：

> 前提：需要手动更新至最新版宝塔面板



# 参考资料

H5上传页：http://fex.baidu.com/webuploader/

图像处理：http://image.intervention.io/

上传微博：https://github.com/consatan/weibo_image_uploader

* https://weibo.com/yztop "岩兔站")

