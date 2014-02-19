add_lunch_combo gofree_arm-eng
add_lunch_combo gofree_maguro-eng

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(
  cd "$DIR"
  ./fetch-apps.sh
)
