echo -e "\e[33m<<<< Installing Repo File >>>>\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
echo -e "\e[35m<<<< Enable Redis >>>>\e[0m"
yum module enable redis:remi-6.2 -y
sed -i -e 's|127.0.0.1|0.0.0.0|' /redis.conf
echo -e "\e[31m>>>> Enable and Start Redis <<<<\e[0m"
systemctl enable redis
systemctl start redis