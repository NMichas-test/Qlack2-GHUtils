#!/bin/sh
push() {
	echo "$1"
	pushd . > /dev/null
	cd $1 > /dev/null
	git pull --quiet --rebase
	git diff remotes/upstream/master --quiet --exit-code
	if [[ $? -gt 0 ]]; then
		echo "\t***upstream has changes"
		while true; do
    		read -p "Pull from upstream?" yn
    		case $yn in
        		[Yy]* ) git pull upstream master --rebase; break;;
        		[Nn]* ) break;;
        		* ) echo "Please answer 'y' or 'n'.";;
    		esac
		done
	fi
	popd > /dev/null
}

push Qlack2
push Qlack2-Bower/Qlack2-Bower-angular-i18n-moment
push Qlack2-Bower/Qlack2-Bower-angular-jsr-validation
push Qlack2-Bower/Qlack2-Bower-angular-pubsub
push Qlack2-Bower/Qlack2-Bower-angular-security-idm
push Qlack2-Bower/Qlack2-Bower-angular-validation
push Qlack2-Bower/Qlack2-Bower-pubsub
push Qlack2-BusinessEngine
push Qlack2-Common
push Qlack2-Fuse
push Qlack2-Util
push Qlack2-WebDesktop
push Qlack2-WebDesktopApps
