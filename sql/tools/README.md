## 0. 友情提示

在 `sql/tools` 目录下，我们提供了一些数据库相关工具，包括测试数据库的快速启动，以及 MySQL 转换为其它数据库脚本的能力。

注意：本文档中的所有命令，都需要在 `sql/tools` 目录下执行。

## 1. 测试数据库的快速启动

基于 Docker Compose，可以快速启动 MySQL、Oracle、PostgreSQL、SQL Server 等数据库。

注意：使用 Docker Compose 启动后，部分数据库会自动导入项目 SQL 脚本，因此可能需要等待 1 到 2 分钟再连接使用。

### 1.1 MySQL

```bash
docker compose up -d mysql
```

### 1.2 Oracle

```bash
## x86 版本
docker compose up -d oracle

## MacBook Apple Silicon
docker compose up -d oracle_m1
```

> 注意：如果使用 MacBook Apple Silicon 版本，它的 `ORACLE_SID` 不是 `XE`，而是 `FREE`。

### 1.3 PostgreSQL

```bash
docker compose up -d postgres
```

### 1.4 SQL Server

```bash
docker compose up -d sqlserver
# 注意：sqlserver 启动完成后，还需要手动执行以下命令，因为 SQL Server 不支持自动初始化脚本
docker compose exec sqlserver bash /tmp/create_schema.sh
```

### 1.5 DM 达梦

1. 下载达梦 Docker 镜像。
访问 <https://eco.dameng.com/download/>，选择“Docker 镜像”进行下载。

2. 加载镜像文件，在镜像 tar 文件所在目录执行：

```bash
docker load -i dm8_20240715_x86_rh6_rq_single.tar
```

3. 在项目 `sql/tools` 目录下执行：

```bash
docker compose up -d dm8
# 注意：dm8 启动完成后，还需要手动执行以下命令，因为达梦不支持自动初始化脚本
docker compose exec dm8 bash -c 'printf "SET DEFINE OFF;\n" > /tmp/schema-with-define-off.sql && cat /tmp/schema.sql >> /tmp/schema-with-define-off.sql && /opt/dmdbms/bin/disql SYSDBA/SYSDBA001 `/tmp/schema-with-define-off.sql'
exit
```

> 注意：项目中的 DM8 脚本使用 `varchar(n char)`，以保持和 MySQL `varchar(n)` 一致的字符长度语义。建议初始化 DM8 时使用 `PAGE_SIZE=16`、`UNICODE_FLAG=1`，`sql/tools/docker-compose.yaml` 已提供对应示例。使用 `disql` 导入时，需要先执行 `SET DEFINE OFF;`，避免数据中的 `&` 被当作变量替换。

### 1.6 KingbaseES 人大金仓

1. 下载人大金仓 Docker 镜像：

- [x86_64 版本](https://kingbase.oss-cn-beijing.aliyuncs.com/KESV8R3/V009R001C001B0025-%E5%AE%89%E8%A3%85%E5%8C%85/docker/x86_64/kdb_x86_64_V009R001C001B0025.tar)，Windows 一般使用这个版本。
- [aarch64 版本](https://kingbase.oss-cn-beijing.aliyuncs.com/KESV8R3/V009R001C001B0025-%E5%AE%89%E8%A3%85%E5%8C%85/docker/aarch64/kdb_aarch64_V009R001C001B0025.tar)，MacBook Apple Silicon 一般使用这个版本。

2. 加载镜像文件，在镜像 tar 文件所在目录执行：

```bash
docker load -i kdb_x86_64_V009R001C001B0025.tar
```

3. 在项目 `sql/tools` 目录下执行：

```bash
docker compose up -d kingbase
# 注意：kingbase 启动完成后，还需要手动执行以下命令
docker compose exec kingbase bash -c 'ksql -U $DB_USER -d test -f /tmp/schema.sql'
```

### 1.7 华为 OpenGauss

```bash
docker compose up -d opengauss
# 注意：opengauss 启动完成后，还需要手动执行以下命令
docker compose exec opengauss bash -c '/usr/local/opengauss/bin/gsql -U $GS_USERNAME -W $GS_PASSWORD -d postgres -f /tmp/schema.sql'
```

### 1.8 HighGo 瀚高数据库

1. 下载瀚高官方 Docker 镜像，并加载镜像文件。加载完成后，给镜像打本地标签：

```bash
docker load -i <highgo-image>.tar
docker tag <image>:<tag> highgo:local
```

2. 在项目 `sql/tools` 目录下执行：

```bash
docker compose up -d highgo
```

> 注意：不同瀚高镜像的数据目录可能不同。如果容器无法启动，请根据镜像实际的 `PGDATA` 配置，调整 `docker-compose.yaml` 中 `highgo` 服务的数据卷挂载目录。

3. 启动完成后，需要手动导入 `Quartz` 和项目 SQL。瀚高兼容 PostgreSQL，具体客户端命令以当前镜像为准，可以使用 `psql` 或镜像内置的兼容客户端执行 `/tmp/quartz.sql` 和 `/tmp/schema.sql`。

## 1.X 容器的销毁重建

开发测试过程中，有时需要重新创建一个干净的数据库。由于这些测试容器使用数据卷 `Volume` 挂载数据库实例数据目录，因此清空数据通常需要先停止容器，再删除对应的数据卷，然后重新创建容器。

以 `postgres` 为例：

```bash
docker compose down postgres
docker volume rm ruoyi-vue-pro_postgres
```

## 2. MySQL 转换其它数据库

项目提供了 `sql/tools/convertor.py` 脚本，支持将 MySQL 脚本转换为 Oracle、PostgreSQL、SQL Server、达梦、人大金仓、OpenGauss、瀚高等数据库脚本。

### 2.1 实现原理

脚本会读取 MySQL 的 `sql/mysql/ruoyi-vue-pro.sql` 数据库文件，再转换成对应数据库的 SQL 脚本。

### 2.2 使用方法

1. 安装依赖库 `simple-ddl-parser`：

```bash
pip install simple-ddl-parser
# pip3 install simple-ddl-parser
```

2. 在 `sql/tools/` 目录下执行如下命令。下面示例会在终端输出 PostgreSQL 脚本内容，其它可选参数包括：`oracle`、`sqlserver`、`dm8`、`kingbase`、`opengauss`、`highgo`。

```bash
python3 convertor.py postgres
# python3 convertor.py postgres > tmp.sql
# python3 convertor.py highgo ../mysql/ruoyi-vue-pro.sql > ../highgo/ruoyi-vue-pro.sql
```

程序会将 SQL 脚本打印到终端，也可以重定向到临时文件 `tmp.sql`。

确认无误后，可以使用 IDEA 进行格式化，或者直接导入数据库。
