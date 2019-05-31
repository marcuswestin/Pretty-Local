set -e

FILEPATH=`pwd`/${BASH_SOURCE[0]}
cd `dirname $FILEPATH`
cd `git rev-parse --show-toplevel`
PRETTYLOCAL_ROOT=`pwd`

echo "
# PRETTYLOCAL
alias enter-prettylocal=\"cd $PRETTYLOCAL_ROOT && source dev/setup/source-dev.sh\"" >> ~/.bash_profile

bold=$(tput bold)
normal=$(tput sgr0)
echo "
	Setup done in $PRETTYLOCAL_ROOT.
	Please quite all terminal windows.
	From now on, run ${bold}enter-prettylocal${normal} to enter dev environment.
"
