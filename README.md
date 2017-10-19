## 电商项目

### 常见问题
* jersey.api.client.UniformInterfaceException ：returned a response status of 403 Forbidden
* 一直报错：
后来定位到 put的地方：

后来发现 :图片服务器的 配置下web.xml
是默认只读  不能保存的

        <init-param>
        	<param-name>readonly</param-name>
        	<param-value>false</param-value>
        </init-param>

* 409
	* tomcat服务器下没创建upload文件夹

### 部署图
* ![deploy img](https://github.com/unknow16/ecps-parent/raw/master/screenshots/deploy.png)