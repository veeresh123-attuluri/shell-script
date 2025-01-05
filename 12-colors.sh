USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"




validate(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ...  $R failure"
        exit 1
    else
        echo -e "$2 ... $G success"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 1
fi

dnf list installed mysql

if [$? -ne 0]
then #not installed
    dnf install mysql -y
    validate $? "installing mysql"
else
    echo -e "mysql is already $Y installed"
fi

# if [ $? -ne 0 ]
# then 
#     echo "installing mysql failure"
#     exit 1
# else 
#     echo "installing mysql sucess"
# fi

dnf list installed git

if [ $? -ne 0]
then 
    dnf install git -y
    validate $? "installing git"
else 
    echo -e "git is already $Y installed"
fi

# if [ $? -ne 0 ]
# then 
#     echo "installing git failure"
#     exit 1
# else 
#     echo "installing git sucess"
# fi