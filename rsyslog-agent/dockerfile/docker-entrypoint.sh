#!/bin/bash
set -e

cat > /etc/rsyslog.conf <<EOF
\$ModLoad imuxsock
\$ModLoad imklog
\$ModLoad imfile
\$WorkDirectory /var/lib/rsyslog
EOF

for log in $LOG_FILE; do
    log=(${log//,/ })

    fileName=${log[3]}
    fileTag=${log[0]}
    severity=${log[2]}
    facility=${log[1]}

    cat >> /etc/rsyslog.conf <<EOF
### 监听日志变更 ###
\$InputFileName $fileName
\$InputFileTag $fileTag
\$InputFileStateFile $fileTag-state
\$InputFileSeverity $severity
\$InputFileFacility $facility
\$InputRunFileMonitor
EOF
done

for addr in $FWD_ADDR; do
    addr=${addr//,/ }
    cat >> /etc/rsyslog.conf <<EOF
### 转发规则 ###
$addr
EOF
done

exec "$@"
