USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.LOG"




validate(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ...  $R failure $N"
        exit 1
    else
        echo -e "$2 ... $G success $N"
    fi
}

echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 1
fi

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then #not installed
    dnf install mysql -y &>>$LOG_FILE
    validate $? "installing mysql"
else
    echo -e "mysql is already $Y installed $N"
fi

# if [ $? -ne 0 ]
# then 
#     echo "installing mysql failure"
#     exit 1
# else 
#     echo "installing mysql sucess"
# fi

dnf list installed git &>>$LOG_FILE

if [ $? -ne 0 ]
then 
    dnf install git -y &>>$LOG_FILE
    validate $? "installing git"
else 
    echo -e "git is already $Y installed $N"
fi

# if [ $? -ne 0 ]
# then 
#     echo "installing git failure"
#     exit 1
# else 
#     echo "installing git sucess"
# fi