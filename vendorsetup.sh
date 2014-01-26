add_lunch_combo gofree_arm-eng

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(
  cd "$DIR"
  ./fetch-apps.sh
)
