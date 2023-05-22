#!/bin/bash

# 设置要监控的进程名称
process_name="your_process_name"


# 检查进程是否在运行
if ! pgrep -x "$process_name" >/dev/null; then
    echo "进程 $process_name 不存在，重新启动..."
    
    # 在这里添加启动进程的命令
    # 例如：/path/to/your/process &
    
    echo "进程已重新启动."
fi
  

