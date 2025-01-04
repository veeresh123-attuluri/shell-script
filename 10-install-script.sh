USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "installing mysql failure"
    exit 1
else 
    echo "installing mysql sucess"
fi

dnf install git -y

if [ $? -ne 0 ]
then 
    echo "installing git failure"
    exit 1
else 
    echo "installing git sucess"
fi