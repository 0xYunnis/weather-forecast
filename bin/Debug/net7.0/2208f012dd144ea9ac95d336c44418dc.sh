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

ps 16157;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 16157 > /dev/null;
done;

for child in $(list_child_processes 16159);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/Yunnis JIA/Projects/test1/test1/bin/Debug/net7.0/2208f012dd144ea9ac95d336c44418dc.sh;
