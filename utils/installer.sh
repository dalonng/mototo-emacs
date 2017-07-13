install_mototo () {
    printf "Cloning the Mototo's GitHub repository...\n$RESET"
    if [ x$MOTOTO_VERBOSE != x ]
    then
	/usr/bin/env git clone $MOTOTO_URL "$MOTOTO_INSTALL_DIR"
    else
	/usr/bin/env git clone $MOTOTO_URL "$MOTOTO_INSTALL_DIR" > /dev/null
    fi
    if ! [ $? -eq 0 ]
    then
	printf "$RED A fatal error occurred during Mototo's installation. Aborting..."
	exit 1
    fi
}

make_mototo_dirs () {
    printf " Making the required directories.\n$RESET"
    mkdir -p "$MOTOTO_INSTALL_DIR/savefile"
}
