# AI创氪师—人生规划导师（源码包）

## 准备环境

1. JDK：建议使用 JDK 1.8+
2. Web容器：Tomcat 9
3. 数据库：MySQL  8.0
4. IDE：IntelliJ IDEA（Ultimate Edition）

## **🛠 使用指南（IDEA 中运行）**

##  1、导入项目

1. 使用 IntelliJ IDEA 打开 IP 文件夹
2. 设置为普通 Java Web 项目（非 Maven）
3. 添加 Web 支持：
   - Project Structure → Libraries → 右侧点击+ →  选择Java → 找到Tomcat安装路径下的lib目录 → 导入 servlet-api.jar 和 tomcat-api.jar 两个jar包

## 2、配置数据库

1. 使用 MySQL 创建数据库（默认名为 IP）：

   ```mysql
   CREATE DATABASE IP DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

2. 导入 init.sql 初始化表结构与数据

3. 修改配置文件 WEB-INF/db.properties：

   ```properties
   url=jdbc:mysql://localhost:3306/IP?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=UTC
   user=root
   password=123456
   ```

   > ⚠️ 请确保你的数据库用户名、密码、端口与上述保持一致，或自行修改配置

## 3、配置Tomcat运行

1. 在 IDEA 中配置本地 Tomcat

   - 点击IDEA右上方的`Current File` → 点击左侧上方的+ → 找到 Tomcat Server 下的 Local → 点击Configure → 点击左侧+ → 在Tomcat Home那边找到Tomcat的文件夹 → 没有错后面的会自动生成，点击OK → 浏览器最好选择Chrome → 点击下方的Fix → 在Application context中填写：`/IP` → OK

   > ⚠️  Tomcat的端口号

2. 启动项目 → 浏览器访问：

   ```
   http://localhost:8080/IP
   ```

   > ⚠️  Tomcat的端口号

## 4、登录账号

1. 普通用户

   账号：15012345678

   密码：lunan998998

2. 管理员

   账号：13912345678

   密码：lunan998998

## 附录

1. 启动时报错 Can't connect to database？
   - 请检查你的 db.properties 中数据库地址/用户名/密码是否正确
   - 数据库服务是否已启动，端口是否是 3306
