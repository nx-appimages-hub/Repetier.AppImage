SOURCE="http://download.repetier.com/files/host/linux/Repetier-Host-x86_64-2.1.6.AppImage"
OUTPUT="Repetier.AppImage"

all:
	echo "Building: $(OUTPUT)"
	rm -f ./$(OUTPUT)
	wget --output-document=$(OUTPUT) --continue $(SOURCE)
	chmod +x $(OUTPUT)
	rm -rf AppDir
	7z x $(OUTPUT) -o./AppDir
	rm -f $(OUTPUT)
	chmod +x ./AppDir/*
	chmod +x ./AppDir/usr/bin/*
	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	

