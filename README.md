## 电商项目
* jersey.api.client.UniformInterfaceException ：returned a response status of 403 Forbidden
* 一直报错：
后来定位到 put的地方：

后来发现 :图片服务器的 配置下web.xml
是默认只读  不能保存的

        <init-param>
        	<param-name>readonly</param-name>
        	<param-value>false</param-value>
        </init-param>