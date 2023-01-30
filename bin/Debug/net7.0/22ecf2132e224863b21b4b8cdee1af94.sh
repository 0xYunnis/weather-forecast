function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 16095;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 16095 > /dev/null;
done;

for child in $(list_child_processes 16101);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/Yunnis JIA/Projects/test1/test1/bin/Debug/net7.0/22ecf2132e224863b21b4b8cdee1af94.sh;
