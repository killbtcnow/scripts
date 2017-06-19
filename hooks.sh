#!/bin/sh
echo "********************"
cd /var
mkdir www && cd www
mkdir blog
cd /var
mkdir repo && cd repo
mkdir blog.git && cd blog.git
git init --bare
cd hooks
touch post-receive
echo "#!/bin/sh" > post-receive
echo "GIT_WORK_TREE=/var/www/blog git checkout -f" >> post-receive
chmod +x post-receive
echo "--------------------"
echo "NOW push git repo to this server!"
echo "********************"
