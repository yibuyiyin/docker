# 开启 docker 星际旅行

## 一、rsyslog
*简介：应用程序日志搜集解决方案*

**rsyslog-agent:**
- 负责 docker 容器应用日志文件监听与数据转发

**rsyslog-server:**
- 日志中心容器负责接收转发而来的日志数据并落地

