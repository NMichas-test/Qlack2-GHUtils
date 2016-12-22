#!/bin/sh

# $1 your access token
# $2 your GitHub username
# $3 the repo you want to recreate

checkRepoReady() {
	status=$(curl -sw '%{http_code}' -X GET -H 'Authorization: token '$1 --output /dev/null https://api.github.com/repos/$2/$3/contents)
	return $status
}

echo "*** Deleting GitHub repo $2"
curl -X DELETE -H 'Authorization: token '$1 https://api.github.com/repos/$2/$3

echo "*** Deleting local folder `pwd`/$3"
rm -rf $3

echo "*** Forking eurodyn/$3"
curl -X POST -H 'Authorization: token '$1 --output /dev/null https://api.github.com/repos/eurodyn/$3/forks

echo "*** Waiting for $2/$3 to become available"
checkRepoReady $1 $2 $3
while [ $? != 200 ]
do	
	echo "\tWaiting for forked repo to become accessible..."
	sleep 1
	checkRepoReady  $1 $2 $3
done

echo "*** Cloning $2/$3"
git clone https://github.com/$2/$3.git

echo "*** Adding eurodyn/$3 as an 'upstream' remote"
cd $3
git remote add upstream https://github.com/eurodyn/$3.git
cd ..

