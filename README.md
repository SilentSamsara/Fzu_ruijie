# 福大锐捷手动破解

锐捷认证采用的是PEAP-GTC的802.1x认证，Windows 10默认不支持，需要安装驱动。

## Windows 10：

- 开始前需要关闭锐捷自启

![](./img/icon.png)

- 任务管理器 -> 服务 -> 打开服务

![](./img/open.png)

确保以下两个服务是启动状态，锐捷启动时会禁用以下服务

> Extensible Authentication Protocol
>
> Wired AutoConfig

- 安装EAP-GTC-x64.msi，一路确定就行，**安装完会自动重启**
- 打开“网络和Internet”设置 -> 更改适配器选项 -> 以太网 -> 属性 -> 身份认证，选择**受保护的EAP（PEAP）**，然后点击设置

![](./img/1.png)

- 取消选勾**通过验证证书来验证服务器身份**，身份验证方法选择**EAP-Token**，点击配置，点击确定

![](./img/2.png)

- 再点确定

![](./img/3.png)

- 此时，会弹出如下窗口

![](./img/4.png)

> User name:登陆时的锐捷账号
>
> Password:锐捷账号密码

- 完成以上步骤就可以正常上网，可以开启共享热点

