# Go to repo root
_source_path=`pwd`/${BASH_SOURCE[0]}
cd `dirname $_source_path`/../..

# Setup environment
###################

_set_if_not_equal () {
	if [[ "${!1}" != "$2" ]]; then
		echo "	export $1=$2"		# Print
		export $1="$2"				# Export
	fi
}

_postfix_if_not_contains () {
	# echo ":${!1}:" *":$2:"*
	if [[ ":${!1}:" != *":$2:"* ]]; then
		echo "	export $1=\$$1:$2"	# Print
		# echo "export $1=${!1}:$2"	# Debug
		export $1="${!1}:$2"		# Export
	fi
}

_prefix_if_not_contains () {
	# echo ":${!1}:" *":$2:"*
	if [[ ":${!1}:" != *":$2:"* ]]; then
		echo "	export $1=\$$1:$2"	# Print
		# echo "export $1=${!1}:$2"	# Debug
		export $1="$2:${!1}"		# Export
	fi
}

_install_if_not_exists () {
	if [[ ! `which ${1}` ]]; then
		echo "	install ${1}"
		echo "		${2}"
		${2}
	fi
}

# prettylocal
_set_if_not_equal PS1 "\n<prettylocal> \w λ "
_set_if_not_equal PRETTYLOCAL_ROOT `pwd`
_set_if_not_equal PRETTYLOCAL_NAME "prettylocal"

# MacOS dev env
_install_if_not_exists 'xcodebuild' 'xcode-select --install'

# Misc
# _install_if_not_exists 'brew' 'ruby -e "$(curl https://raw.githubusercontent.com/Homebrew/install/master/install)"'
# _install_if_not_exists 'go' 'brew install go'
# _install_if_not_exists 'glide' 'brew install glide'
# _install_if_not_exists 'goimports' 'go get golang.org/x/tools/cmd/goimports'
# _install_if_not_exists 'protoeasy' 'go get go.pedge.io/protoeasy/cmd/protoeasy'
# _install_if_not_exists 'protoc' 'brew install protobuf'
# _install_if_not_exists 'protoc-gen-go' 'go get -a github.com/golang/protobuf/protoc-gen-go'

