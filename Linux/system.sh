#!/bin/bash 
echo "Free Memory:" && free -h | head -2 > $HOME/backups/freemem/free_mem.txt
echo "Disk Usage:" && df | awk -F " " '{print $1, $5 }' > $HOME/backups/diskuse/disk_usage.txt
echo "Open Files:" && lsof > $HOME/backups/openlist/openlist.txt
echo "File System Disk Space:" && df -H > $HOME/backups/freedisk/freedisk.txt
