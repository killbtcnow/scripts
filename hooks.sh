#!/bin/sh
echo "********************"
cd /var
mkdir www
mkdir repo
cd /var/www
mkdir blog
cd /var/repo
mkdir blog.git
mkdir html.git
cd /var/repo/blog.git
git init --bare
cd /var/repo/blog.git/hooks
touch post-receive
echo "#!/bin/sh" > post-receive
echo "GIT_WORK_TREE=/var/www/blog git checkout -f" >> post-receive
chmod +x post-receive
cd /var/repo/html.git
git init --bare
cd /var/repo/html.git/hooks
touch post-receive
echo "#!/bin/sh" > post-receive
echo "GIT_WORK_TREE=/var/www/html git checkout -f" >> post-receive
chmod +x post-receive
echo "--------------------"
echo "NOW push git repo to this server!"
echo "********************"
