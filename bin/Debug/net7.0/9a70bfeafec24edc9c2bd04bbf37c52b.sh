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

ps 15369;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 15369 > /dev/null;
done;

for child in $(list_child_processes 15372);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/Yunnis JIA/Projects/test1/test1/bin/Debug/net7.0/9a70bfeafec24edc9c2bd04bbf37c52b.sh;
