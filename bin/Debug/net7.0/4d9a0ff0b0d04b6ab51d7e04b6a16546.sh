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

ps 15445;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 15445 > /dev/null;
done;

for child in $(list_child_processes 15448);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/Yunnis JIA/Projects/test1/test1/bin/Debug/net7.0/4d9a0ff0b0d04b6ab51d7e04b6a16546.sh;
