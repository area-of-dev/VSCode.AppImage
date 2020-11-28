# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

all:
	mkdir --parents $(PWD)/build
	wget --output-document="$(PWD)/build/build.deb" https://go.microsoft.com/fwlink/?LinkID=760868
	dpkg -x $(PWD)/build/build.deb $(PWD)/build

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/gtk3-3.22.30-5.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm https://ftp.lysator.liu.se/pub/opensuse/distribution/leap/15.2/repo/oss/x86_64/libatk-1_0-0-2.34.1-lp152.1.7.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm https://ftp.lysator.liu.se/pub/opensuse/distribution/leap/15.2/repo/oss/x86_64/libatk-bridge-2_0-0-2.34.1-lp152.1.5.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm https://ftp.lysator.liu.se/pub/opensuse/distribution/leap/15.2/repo/oss/x86_64/libatspi0-2.34.0-lp152.2.4.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/glib2-2.56.4-8.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/pcre-8.42-4.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/shared-mime-info-1.9-3.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libffi-3.1-21.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libselinux-2.9-3.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/pango-1.42.4-6.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/gdk-pixbuf2-2.36.12-5.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/gdk-pixbuf2-2.36.12-5.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/gdk-pixbuf2-2.36.12-5.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://repo.okay.com.mx/centos/8/x86_64/release/gdk-pixbuf2-modules-2.36.12-2.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://repo.okay.com.mx/centos/8/x86_64/release/librsvg2-2.42.7-2.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/adwaita-icon-theme-3.28.0-2.el8.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	mkdir --parents $(PWD)/build/AppDir
	mkdir --parents $(PWD)/build/AppDir/vscode	
	cp --force --recursive $(PWD)/build/usr/* $(PWD)/build/AppDir/
	cp --force --recursive $(PWD)/build/usr/share/code/* $(PWD)/build/AppDir/vscode
	cp --force --recursive $(PWD)/AppDir/* $(PWD)/build/AppDir

	rm -rf $(PWD)/AppDir/opt
	rm -rf $(PWD)/build/usr/share/code

	chmod +x $(PWD)/build/AppDir/AppRun
	chmod +x $(PWD)/build/AppDir/*.desktop

	export XDG_DATA_DIRS=${XDG_DATA_DIRS}:$(PWD)/build/AppDir/share && \
	export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$(PWD)/build/AppDir/lib64 && \
	$(PWD)/build/AppDir/bin/glib-compile-schemas $(PWD)/build/AppDir/share/glib-2.0/schemas/

	export XDG_DATA_DIRS=${XDG_DATA_DIRS}:$(PWD)/build/AppDir/share && \
	export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$(PWD)/build/AppDir/lib64 && \
	$(PWD)/build/AppDir/bin/update-mime-database $(PWD)/build/AppDir/share/mime

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/AppDir $(PWD)/VSCode.AppImage
	chmod +x $(PWD)/VSCode.AppImage

clean:
	rm -rf $(PWD)/build
