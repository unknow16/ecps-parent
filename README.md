## 电商项目

### 开发构建管理
* ![deploy img](https://github.com/unknow16/ecps-parent/raw/master/screenshots/build.png)
* 

### 部署图
* ![deploy img](https://github.com/unknow16/ecps-parent/raw/master/screenshots/deploy.png)

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
	
### 在数据库模型上，表之间的关系
* 一对多：箭头所指向的表是一的一端
* 多对一：箭头背向的方向的表是多的一端（除了一对一）
* 多对多：由三张表来组成，中间表体现的是其余两张表的关系是多对多，中间表只能有两个表的主键作为外键来组成，箭头由中介表来分别指向其余两张表。
* 一对一：箭头指向的方向是一的一端，背向的方向的表使用指向的方向的表的主键作为主键和外键就形成了一对一的关系。

	
### 模块内容
#### 品牌管理
* 文件上传
#### 商品添加
* 基础信息
* 详细信息
* 商品属性参数
* sku及规格参数（与价格有关）
#### 商品审核及上架
* 业务流程图
* 可以多次不通过，eb_console_log记录审核意见，及操作日志

#### 首页高级搜索

#### 用户登录

#### 收货地址

#### 单品详情页
* sku规格切换
* freemaker静态化

#### 购物车
* cookie实现

#### 结算（预提交订单）

#### 提交订单

#### 订单流程
* activiti工作流

#### 项目部署
* hudson构建
* redis对session管理

