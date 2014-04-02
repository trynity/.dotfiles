# Google Depot Tools
add-path-if-exists "${HOME}/.depot_tools"

# Android SDK
[[ -d "/usr/local/opt/android-sdk" ]] && export ANDROID_HOME="/usr/local/opt/android-sdk"
