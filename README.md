# weatherInShell
Shell script to automate 

rx_poc.sh is a main shell file.
You can put this file to execute autometically via crontab :
```
crontab -e
10 * * * * [path of rx_poc.sh for you crontab]
```
It will execute every 10 minutes of each hour.
I also added fc_accuracy.sh file at the end of rx_poc.sh file so that it will execute every time and update the stats.
I added weekly_stats.sh under fc_accuracy.sh for doing the same.
Rest files are just generated and storing results of .sh files, you do not need them.
