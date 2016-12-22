#!/bin/sh
push() {
	echo "$1"
	pushd . > /dev/null
	cd $1 > /dev/null
	git push
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
