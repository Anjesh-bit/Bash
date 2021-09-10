


PLUGINS=()
PLUGINS+=("cordova-android-play-services-gradle-release@4.0.0")
PLUGINS+=("cordova-android-support-gradle-release@3.0.1")
PLUGINS+=("cordova-plugin-androidx-adapter@1.1.3")
PLUGINS+=("cordova-plugin-androidx@3.0.0")
PLUGINS+=("cordova-plugin-geolocation@4.1.0")
PLUGINS+=("cordova-plugin-device@2.0.3")
PLUGINS+=("cordova-plugin-device@2.0.3")
PLUGINS+=("cordova-plugin-inappbrowser@4.1.0")
PLUGINS+=("cordova-plugin-insomnia@4.3.0")
PLUGINS+=("cordova-plugin-ionic-keyboard@2.2.0")
PLUGINS+=("cordova-plugin-ionic-webview@5.0.0")
PLUGINS+=("cordova-plugin-ios-disableshaketoedit@1.0.0")
PLUGINS+=("cordova-plugin-market@1.2.0")
PLUGINS+=("cordova-plugin-nativestorage@2.3.2")
PLUGINS+=("cordova-plugin-sign-in-with-apple@0.1.2")
PLUGINS+=("cordova-plugin-splashscreen@6.0.0")
PLUGINS+=("cordova-plugin-statusbar@2.4.3")
PLUGINS+=("cordova-plugin-whitelist@1.3.5")
PLUGINS+=("cordova-plugin-x-socialsharing@6.0.3")
PLUGINS+=("cordova-sqlite-storage@5.1.0")
PLUGINS+=("cordova.plugins.diagnostic@6.0.3")
PLUGINS+=("es6-promise-plugin@4.2.2")
# Add Normal Plugins
for PLUGIN in "${PLUGINS[@]}"
do
   # add the plugin
    cmd="ionic cordova plugin add $PLUGIN"
    echo "Executing [$cmd]"
    $cmd
done
