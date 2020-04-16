SOURCE="https://go.microsoft.com/fwlink/?LinkID=760868"
DESTINATION="build.deb"
OUTPUT="VSCode.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)

	dpkg -x $(DESTINATION) build
	rm -rf AppDir/opt

	mkdir --parents AppDir/opt/application
	cp -r build/usr/share/code/* AppDir/opt/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && appimagetool AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/opt
	rm -rf build
