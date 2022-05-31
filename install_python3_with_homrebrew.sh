#!/bin/bash 

# install Python 3 with Homebrew

check_os_for_mac() {
	echo "Started checking operating system at $(date)"

	if [[ $OSTYPE == 'darwin'* ]]; then 
		tput setaf 2; echo -e "Operating system:\n$(sw_vers)"; tput sgr0

		echo "Finished checking operating system at $(date)"
		echo ""
	else 
		tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

		echo "Finished checking operating system at $(date)"
		echo ""

		exit 1
	fi
}

check_python3() {
	echo "Started checking Python 3 at $(date)"

	which -s python3
	if [[ $? == 0 ]]; then 
		tput setaf 2; echo "Python 3 is installed".; tput sgr0

		echo "Finished checking Python 3 at $(date)"
		echo ""

		exit 0
	else
		tput setaf 1; echo "Python 3 is not installed."; tput sgr0

		echo "Finished checking Python 3 at $(date)"
		echo ""
	fi
}

check_homebrew() {
	echo "Started checking Homebrew at $(date)"

	which -s brew
	if [[ $? == 0 ]]; then
		tput setaf 2; echo "Homebrew is installed."; tput sgr0

		echo "Finished checking Homebrew at $(date)"
		echo ""
	else
		tput setaf 1; echo "Homebrew needs to be installed"; tput sgr0

		echo "Finished checking Homebrew at $(date)"
		echo ""

		exit 1
	fi
}

install_python3() { 
	printf "\nInstall Python3 with Homebrew.\n\n"
	
	check_os_for_mac
	check_python3
	check_homebrew
	
	start=$(date +%s)
	echo "Started installing Python at $(date)"

	brew install readline xz
	brew install pyenv-virtualenv
	brew install freetds
	brew link --force freetds

	echo 'eval "$(pyenv_init -)"' >> ~/.bash_profile
	echo 'eval "$(pyenv_virtualenv_init -)"' >> ~/.bash_profile 

	pyenv install 3.6.1
	pyenv virtualenv 3.6.1 automation-3.6.1

	echo 'export TEST_OBJECTS_USERNAME=rnelson' >> ~/.bash_profile
	echo 'export TEST_OBJECTS_KEY=C12816AD64D345248ACD605815AF010D' >> ~/.bash_profile
	echo 'export MSSQL_PASSWORD=OneApp' >> ~/.bash_profile
	echo 'export MSSQL_USERNAME=OneApp' >> ~/.bash_profile
	echo 'export MSSQL_SERVER=dgqd56b.cm.cccg.com' ~/.bash_profile
	tput setaf 2; echo "Successfully installed Python."; tput sgr0
	
	end=$(date +%s)
	echo "Finished installing Python at $(date)"

	duration=$(( $end - $start ))
	echo "Total execution time: $duration second(s)"
	echo ""
}

install_python3
