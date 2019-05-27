#!/bin/sh

base_dir=/var/log/rsyslog

function trim()
{
    echo $1 | sed 's/^[ \t]*//g'|sed 's/[ \t]*$//g'
    return 0
}

function path()
{
    echo $1 | sed 's/\[\:\(.*\):\]/\1/g'
    return 0
}

while read log
do
    OLD_IFS=$IFS
    IFS="|"
    log=(${log})
    s_time=$(trim ${log[0]})
    s_ip=$(trim ${log[1]})
    s_hostname=$(trim ${log[2]})
    s_tag=$(trim ${log[3]})
    s_path=$(path $(trim ${log[4]}))
    s_msg=$(trim ${log[5]})

    s_filename=$base_dir/$s_tag/$s_path
    s_dirname=$(dirname $s_filename)
    if [ ! -d $s_dirname ]; then
        mkdir -p $s_dirname
    fi
    cat >> $s_filename <<EOF
$s_time | $s_ip | $s_hostname | $s_msg
EOF
    IFS=$OLD_IFS
done
