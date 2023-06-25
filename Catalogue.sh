  echo -e "\e[34m>>>>>>>>>>>> Configuring NodeJs repos <<<<<<<<<<\e[0m"
  curl -sL https://rpm.nodesource.com/setup_lts.x | bash
  yum install nodejs -y
  useradd roboshop
  rm -rf /app
  mkdir /app
  curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
  cd /app
  unzip /tmp/catalogue.zip
  cd /app
  npm install
  cp /home/centos/roboshop-shell-1/catalogue.service /etc/systemd/system/catalogue.service
  systemctl daemon-reload
  systemctl enable catalogue
  systemctl start catalogue
  cp /home/centos/roboshop-shell-1/mongo1.repo /etc/yum.repos.d/mongo.repo
  yum install mongodb-org-shell -y
  mongo --host mongodb-dev.rdevopsb72.tech </app/schema/catalogue.js