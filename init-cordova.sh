#!/bin/bash

echo " "
echo "****************************************"
echo "*** removing platforms *****************"
echo "****************************************"
echo " "
ionic cordova platform remove browser
ionic cordova platform remove android
ionic cordova platform remove ios


echo " "
echo "****************************************"
echo "*** removing plugins *******************"
echo "****************************************"
echo " "

# Normal Plugins (Don't require CLI variables)
PLUGINS=()
PLUGINS+=("cordova-android-play-services-gradle-release")
PLUGINS+=("cordova-android-support-gradle-release")
PLUGINS+=("cordova-plugin-androidx-adapter")
PLUGINS+=("cordova-plugin-androidx")
PLUGINS+=("cordova-plugin-background-geolocation")
PLUGINS+=("cordova-plugin-device")
PLUGINS+=("cordova-plugin-dialogs")
PLUGINS+=("cordova-plugin-inappbrowser")
PLUGINS+=("cordova-plugin-insomnia")
PLUGINS+=("cordova-plugin-ionic-keyboard")
PLUGINS+=("cordova-plugin-ionic-webview")
PLUGINS+=("cordova-plugin-ios-disableshaketoedit")
PLUGINS+=("cordova-plugin-market")
PLUGINS+=("cordova-plugin-nativestorage")
PLUGINS+=("cordova-plugin-sign-in-with-apple")
PLUGINS+=("cordova-plugin-splashscreen")
PLUGINS+=("cordova-plugin-statusbar")
PLUGINS+=("cordova-plugin-whitelist")
PLUGINS+=("cordova-plugin-x-socialsharing")
PLUGINS+=("cordova-sqlite-storage")
PLUGINS+=("cordova.plugins.diagnostic")
PLUGINS+=("es6-promise-plugin")



# Remove Normal Plugins
for PLUGIN in "${PLUGINS[@]}"
do
    # remove the plugin
    cmd="ionic cordova plugin remove $PLUGIN"
    echo "Executing [$cmd]"
    $cmd
done

# Remove Special Plugins
ionic cordova plugin remove birdieapps-cordova-plugin-geolocation
ionic cordova plugin remove cordova-plugin-apprate
ionic cordova plugin remove cordova-plugin-background-geolocation
ionic cordova plugin remove cordova-plugin-purchase --variable BILLING_KEY="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlw8sQMp4UIFR8S6+lafvU/6ON01FmocKGGoZPGgysPlQYUjnV1ERB1lPKUSUbjuaDX5oErrdbhV/Pq69hRiV7gzmD4C186BAb9PphAbR4lnCX3+WmpuQuHONL7Kibzr9J+vVZ6O7DBC5GT7eBufJ7KSzNNcvPrvrNpqj8orSuJw1/0Cr7ZgWrptaC6sI01xc80YWpiPOa7ZSGSFRg/ZD/HeVe7rDOATS+P4OC0TvKWlJOU71Hpdr3jbEh7d+LbbSnb05JQFsJvF1bjWknVYk6MfD7BppW6ZttQjiT5tM1myYch2dt+rf5o6MlJIU5ID7L6m21bD2a57kHGr5InV9OQIDAQAB"
ionic cordova plugin remove cordova-plugin-googleplus --variable REVERSED_CLIENT_ID="com.googleusercontent.apps.56595097327-774p2nbgie0r93ljachfcn6tu6qq0q60" --variable WEB_APPLICATION_CLIENT_ID="56595097327-fh1e7jmrhtgs8m4vc1n0vvfr0fm9teos.apps.googleusercontent.com"
ionic cordova plugin remove cordova-plugin-facebook4 --variable APP_ID="123440531652674" --variable APP_NAME="Birdie Apps Golf GPS App"
ionic cordova plugin remove cordova-support-android-plugin
ionic cordova plugin remove cordova-support-google-services


echo " "
echo "****************************************"
echo "*** listing platforms and plugins ******"
echo "****************************************"
echo " "
ionic cordova platform ls
ionic cordova plugin ls


echo " "
echo "****************************************"
echo "*** adding plugins *********************"
echo "****************************************"
echo " "

HARDCODED= sh /scripts/cordova-env.sh
echo "Installing the hardcoded version"

if [$HARDCODED]; then

    for HARDCODED in "${HARDCODED[@]}"
do
 # add the plugin
    cmd="ionic cordova plugin add $HARDCODED"
    echo "Executing [$cmd]"
    $cmd
done
fi


# Add Normal Plugins
echo "Installing the latest version"
for PLUGIN in "${PLUGINS[@]}"
do
 # add the plugin
    cmd="ionic cordova plugin add $PLUGIN"
    echo "Executing [$cmd]"
    $cmd
done

# Add Special Plugins
ionic cordova plugin add git+ssh://git@github.com:BirdieApps/cordova-plugin-geolocation.git#birdieapps
ionic cordova plugin add cordova-plugin-apprate@1.5.0
ionic cordova plugin add @mauron85/cordova-plugin-background-geolocation
ionic cordova plugin add cordova-plugin-purchase --variable BILLING_KEY="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlw8sQMp4UIFR8S6+lafvU/6ON01FmocKGGoZPGgysPlQYUjnV1ERB1lPKUSUbjuaDX5oErrdbhV/Pq69hRiV7gzmD4C186BAb9PphAbR4lnCX3+WmpuQuHONL7Kibzr9J+vVZ6O7DBC5GT7eBufJ7KSzNNcvPrvrNpqj8orSuJw1/0Cr7ZgWrptaC6sI01xc80YWpiPOa7ZSGSFRg/ZD/HeVe7rDOATS+P4OC0TvKWlJOU71Hpdr3jbEh7d+LbbSnb05JQFsJvF1bjWknVYk6MfD7BppW6ZttQjiT5tM1myYch2dt+rf5o6MlJIU5ID7L6m21bD2a57kHGr5InV9OQIDAQAB"
ionic cordova plugin add cordova-plugin-googleplus --variable REVERSED_CLIENT_ID="com.googleusercontent.apps.56595097327-774p2nbgie0r93ljachfcn6tu6qq0q60" --variable WEB_APPLICATION_CLIENT_ID="56595097327-fh1e7jmrhtgs8m4vc1n0vvfr0fm9teos.apps.googleusercontent.com"
ionic cordova plugin add cordova-plugin-facebook4 --variable APP_ID="123440531652674" --variable APP_NAME="Birdie Apps Golf GPS App"


echo " "
echo "****************************************"
echo "*** adding platforms *******************"
echo "****************************************"
echo " "
#ionic cordova platform add browser
ionic cordova platform add android
ionic cordova platform add ios


echo " "
echo "****************************************"
echo "*** listing platforms and plugins ******"
echo "****************************************"
echo " "
ionic cordova platform ls
ionic cordova plugin ls


echo " "
echo "*** DONE ***"
echo "IMPORTANT:  Diff config.xml and update where necessary.  To update npm packages (See README for a required update):  rm -rf node_modules && npm install"
echo " "

exit 0
