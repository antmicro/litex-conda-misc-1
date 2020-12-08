if [ $OS_NAME = 'osx' ]; then
    if [[ ! -d $HOME/sdk/MacOSX10.9.sdk ]]; then
	echo "Cloning MACOS SDK to $HOME/sdk"
        git clone https://github.com/phracker/MacOSX-SDKs $HOME/sdk
    else
	echo "NOT Cloning MACOS SDK to $HOME/sdk. It already exists."
    fi
fi
