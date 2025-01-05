USERID=$(id -u)

validate(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 ... failure"
        exit 1
    else
        echo "$2 ... success"
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
    echo "mysql is already installed"
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
    echo "git is already installed"
fi

# if [ $? -ne 0 ]
# then 
#     echo "installing git failure"
#     exit 1
# else 
#     echo "installing git sucess"
# fi