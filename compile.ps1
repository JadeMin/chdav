FUNCTION BUILD {
	PARAM (
		[PARAMETER(Mandatory=$TRUE, Position=0, HelpMessage="OS type")] [STRING]$OS,
		[PARAMETER(Mandatory=$TRUE, Position=1, HelpMessage="Architecture type")] [STRING]$ARCH
	)

	$FILENAME = "$PROJECT_NAME-$OS-$ARCH"
	IF ($OS -EQ "windows") {
		$FILENAME = "$FILENAME.exe"
	}

	$ENV:GOOS = $OS
	$ENV:GOARCH = $ARCH
	go build -gcflags=all="-l -B" -ldflags="-s -w" -trimpath -o="bin/$FILENAME"
}



$PROJECT_NAME = "chdad"

BUILD "windows" "386"
BUILD "windows" "amd64"