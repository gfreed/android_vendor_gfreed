add_lunch_combo gfreed_arm-eng
add_lunch_combo gfreed_maguro-eng
add_lunch_combo gfreed_maguro-userdebug

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(
  cd "$DIR"
  ./fetch-apps.sh
)
