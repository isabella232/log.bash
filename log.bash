LOG_DIR=$HOME/.logs
MODE_FILE=$LOG_DIR/mode

if [ ! -f $MODE_FILE ]; then
  mkdir -p $LOG_DIR
  echo "free" > $MODE_FILE
fi

MODE="`cat $HOME/.logs/mode`"

mode () {
    if [ $1 ]; then
        MODE=$1
        echo $1 > $MODE_FILE
        export MODE
    else
        echo $MODE
    fi
}

today () {
    $EDITOR "$LOG_DIR/$MODE-`date +%Y-%m-%d`.txt"
}

tomorrow () {
    $EDITOR "$LOG_DIR/$MODE-`date --date=\"next day\" +%Y-%m-%d`.txt"
}

yesterday () {
    $EDITOR "$LOG_DIR/$MODE-`date --date=\"yesterday\" +%Y-%m-%d`.txt"
}

todo () {
    $EDITOR "$LOG_DIR/$MODE-todo.txt"
}
