Image php7.2cli with support exif. To run your php-script, run the image with the SCRIPT variable in which specify the path to the file. eg

docker run -it --rm -v /scriptdir:/scriptdir:rw -e SCRIPT="/scriptdir/index.php arg1 arg2 etc"   howlingdot/php7.2cli_exif
