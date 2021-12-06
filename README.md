# 锐捷客户端手动破解

教程对福大锐捷适用，锐捷认证采用的是PEAP-GTC的802.1x认证，Windows 10默认不支持，需要安装驱动。

## Windows 10：

***经测试此方法已不适用于Windows11系统***

- 开始前要关闭锐捷自启，或者直接卸载(建议)

![](./img/icon.png)

- 任务管理器 -> 服务 -> 打开服务

![](./img/open.png)

确保以下两个服务是启动状态，**锐捷启动时会禁用以下服务**，所以要关闭锐捷客户端

> Extensible Authentication Protocol
>
> Wired AutoConfig

- 安装EAP-GTC-xXX.msi（XX对应版本），一路确定就行，**安装完会自动重启**，**安装完会自动重启**，**安装完会自动重启**
- 打开“网络和Internet”设置 -> 更改适配器选项 -> 以太网 -> 属性 -> 身份认证，选择**受保护的EAP（PEAP）**，然后点击设置
  - **每次登录时记住此连接的凭据**，也可以选勾，电脑开机就能连上

![](./img/1.png)

- 取消选勾**通过验证证书来验证服务器身份**，身份验证方法选择**EAP-Token**，点击配置，点击确定

![](./img/2.png)

- 再点确定

  可以勾**每次登录时记住此连接的凭据**，则在下次开机启动时会默认连接网络

![](./img/3.png)

- 此时，会弹出如下窗口，填写账号和密码后点击OK即可

![](./img/4.png)

> User name:登陆时的锐捷账号
>
> Password:锐捷账号密码

- 完成以上步骤就可以正常上网，可以**开启共享热点**，**VMware内使用NAT方式可上网**，锐捷客户端直接弃用。



## Linux(以Ubuntu为例)：

- 打开设置，选择网络选项，点击有线连接的详细设置

  ![](./img/setting.png)

- 选择安全选项进行802.1x认证的设置，具体设置内容如下蓝色方框所示：

  ![](./img/detail.png)

- 其他的Linux系统差不多，重点在于使用的是**EAP-GTC协议**，基本上Linux的桌面操作系统都支持这个协议
