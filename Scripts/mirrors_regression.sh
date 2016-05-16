#!/bin/bash


#  Setup the ENV var for correct environment to run the testsuites against
if [ "`echo $1 | tr [:upper:] [:lower:]`" = "qa" ]; then
	echo Matched QA
	ENV=Marybell
elif [ "`echo $1 | tr [:upper:] [:lower:]`" = "dev" ]; then
	echo Matched Dev
	ENV=Marybell
elif [ "`echo $1 | tr [:upper:] [:lower:]`" = "ringo" ]; then
	echo Matched Ringo
	ENV=Ringo
elif [ "`echo $1 | tr [:upper:] [:lower:]`" = "prod" ]; then
	echo Matched Prod
	ENV=Mirrors
elif [ "`echo $1 | tr [:upper:] [:lower:]`" = "all" ]; then
	echo Matched All
	ENV=All
else
	echo "Didn't recognize environment passed in. Please try again"
	echo
	echo "Here is what I got [$1]"
	echo
    echo "Should be one of the following:"
    echo "   qa    dev   prod    ringo   all"
    echo
	exit
fi


# Clean out the output directories
if [ "`echo $ENV | tr [:upper:] [:lower:]`" = "all" ]; then
	if [ ! -d $HOME/junk/CleanUp ]; then
		mkdir -p $HOME/junk/CleanUp
	else
		rm -rf $HOME/junk/CleanUp/*
	fi
	if [ ! -d $HOME/junk/RegressionTests_Marybell ]; then
		mkdir -p $HOME/junk/RegressionTests_Marybell
	else
		rm -rf $HOME/junk/RegressionTests_Marybell/*
	fi
	if [ ! -d $HOME/junk/RegressionTests_Mirrors ]; then
		mkdir -p $HOME/junk/RegressionTests_Mirrors
	else
		rm -rf $HOME/junk/RegressionTests_Mirrors/*
	fi
else
	if [ ! -d $HOME/junk/CleanUp ]; then
		mkdir -p $HOME/junk/CleanUp
	else
		rm -rf $HOME/junk/CleanUp/*
	fi
	if [ ! -d $HOME/junk/RegressionTests_$ENV ]; then
		mkdir -p $HOME/junk/RegressionTests_$ENV
	else
		rm -rf $HOME/junk/RegressionTests_$ENV/*
	fi
fi


if [ ! -d $HOME/trunk/DataStore/download ]; then
	mkdir -p $HOME/trunk/DataStore/download
else
	rm -rf $HOME/trunk/DataStore/download/*
fi


##  Checkout the code for a specific branch based on environment running in
cd $HOME/trunk/DataStore
git checkout master
git pull
cd $HOME/trunk/iPlant-TestData
git checkout master
git pull


# Run the cleanup suite
cd $HOME/trunk/DataStore
if [ "`echo $ENV | tr [:upper:] [:lower:]`" = "all" ]; then
	pybot -A ../MarybellVars.txt -d $HOME/junk/CleanUp/ -o CleanMarybell-Output.xml --name CleanUp_Marybell CleanUp/Mirrors_CleanUp.robot
	pybot -A ../MirrorsProdVars.txt -d $HOME/junk/CleanUp/ -o CleanMirrorsProd-Output.xml --name CleanUp_Mirrors CleanUp/Mirrors_CleanUp.robot
else
	pybot -A ../${ENV}Vars.txt -d $HOME/junk/RegressionTests_${ENV}/ -o Clean${ENV}-Output.xml --name CleanUp_${ENV} CleanUp/Mirrors_CleanUp.robot
fi


if [ "`echo $ENV | tr [:upper:] [:lower:]`" = "all" ]; then
	pybot -A ../MarybellVars.txt --name Marybell_CL -o Marybell_CL-Output.xml -A Mirrors_Tests_CL.list
	pybot -A ../MarybellVars.txt --name Marybell_FireFox --variable SShotBase:FireFox_Marybell --variable BROWSER:ff -o Marybell_FireFox-Output.xml -A Mirrors_Tests_GUI.list
	pybot -A ../MarybellVars.txt --name Marybell_Chrome --variable SShotBase:Chrome_Marybell --variable BROWSER:chrome -o Marybell_Chrome-Output.xml -A Mirrors_Tests_GUI.list
	pybot -A ../MirrorsProdVars.txt --name MirrorsProd_FireFox --variable SShotBase:FireFox_MirrorsProd --variable BROWSER:ff -o MirrorsProd_FireFox-Output.xml -A Mirrors_Tests_GUI.list
	pybot -A ../MirrorsProdVars.txt --name MirrorsProd_Chrome --variable SShotBase:Chrome_MirrorsProd --variable BROWSER:chrome -o MirrorsProd_Chrome-Output.xml -A Mirrors_Tests_GUI.list
else
	pybot -A ../${ENV}Vars.txt --name ${ENV}_CL -o ${ENV}_CL-Output.xml -A Mirrors_Tests_CL.list
	pybot -A ../${ENV}Vars.txt --name ${ENV}_FireFox --variable SShotBase:FireFox_${ENV} --variable BROWSER:ff -o ${ENV}_FireFox-Output.xml -A Mirrors_Tests_GUI.list
	pybot -A ../${ENV}Vars.txt --name ${ENV}_Chrome --variable SShotBase:Chrome_${ENV} --variable BROWSER:chrome -o ${ENV}_Chrome-Output.xml -A Mirrors_Tests_GUI.list
fi




if [ "`echo $ENV | tr [:upper:] [:lower:]`" = "all" ]; then
	if [ ! -r $HOME/junk/CleanUp/CleanMarybell-Output.xml ]; then
		echo "- - -  Missing CleanMarybell-Output.xml file"
	fi
	if [ ! -r $HOME/junk/CleanUp/CleanMirrorsProd-Output.xml ]; then
		echo "- - -  Missing CleanMirrorsProd-Output.xml file"
	fi
	if [ ! -r $HOME/junk/RegressionTests_Marybell/Marybell_CL-Output.xml ]; then
		echo "- - -  Missing Marybell_CL-Output.xml file"
	fi
	if [ ! -r $HOME/junk/RegressionTests_Marybell/Marybell_FireFox-Output.xml ]; then
		echo "- - -  Missing Marybell_FireFox-Output.xml file"
	fi
	if [ ! -r $HOME/junk/RegressionTests_Marybell/Marybell_Chrome-Output.xml ]; then
		echo "- - -  Missing Marybell_Chrome-Output.xml file"
	fi
	if [ ! -r $HOME/junk/RegressionTests_MirrorsProd/Mirrors_CL-Output.xml ]; then
		echo "- - -  Missing Mirrors_CL-Output.xml file"
	fi
	if [ ! -r $HOME/junk/RegressionTests_MirrorsProd/Mirrors_FireFox-Output.xml ]; then
		echo "- - -  Missing Mirrors_FireFox-Output.xml file"
	fi
	if [ ! -r $HOME/junk/RegressionTests_MirrorsProd/Mirrors_Chrome-Output.xml ]; then
		echo "- - -  Missing Mirrors_Chrome-Output.xml file"
	fi
else
	if [ ! -r $HOME/junk/RegressionTests_${ENV}/Clean${ENV}-Output.xml ]; then
		echo "- - -  Missing Clean${ENV}-Output.xml file"
	fi
	if [ ! -r $HOME/junk/RegressionTests_${ENV}/${ENV}_CL-Output.xml ]; then
		echo "- - -  Missing ${ENV}_CL-Output.xml file"
	fi
	if [ ! -r $HOME/junk/RegressionTests_${ENV}/${ENV}_FireFox-Output.xml ]; then
		echo "- - -  Missing ${ENV}_FireFox-Output.xml file"
	fi
	if [ ! -r $HOME/junk/RegressionTests_${ENV}/${ENV}_Chrome-Output.xml ]; then
		echo "- - -  Missing ${ENV}_Chrome-Output.xml file"
	fi
fi


if [ "`echo $ENV | tr [:upper:] [:lower:]`" = "all" ]; then
	# Now combine all the results into one report
	cd $HOME/trunk
	if [ -r $HOME/junk/CleanUp/CleanMarybell-Output.xml ] && \
		[ -r $HOME/junk/CleanUp/CleanMirrorsProd-Output.xml ] && \
		[ -r $HOME/junk/RegressionTests_Marybell/Marybell_CL-Output.xml ] && \
		[ -r $HOME/junk/RegressionTests_Marybell/Marybell_FireFox-Output.xml ] && \
		[ -r $HOME/junk/RegressionTests_Marybell/Marybell_Chrome-Output.xml ] && \
		[ -r $HOME/junk/RegressionTests_MirrorsProd/Mirrors_CL-Output.xml ] && \
		[ -r $HOME/junk/RegressionTests_MirrorsProd/Mirrors_FireFox-Output.xml ] && \
		[ -r $HOME/junk/RegressionTests_MirrorsProd/Mirrors_Chrome-Output.xml ] ; then
		echo "--------------------------------------------------------------------------"
		echo "- - -   Combining output.xml files from CleanUp and Regression run (all)"
		echo "--------------------------------------------------------------------------"
		rm -rf $HOME/trunk/report.html
		rm -rf $HOME/trunk/log.html
		rebot -n DC-* -n noncrit \
			--name Clean_Regression_All $HOME/junk/CleanUp/CleanMarybell-Output.xml \
				$HOME/junk/CleanUp/CleanMirrorsProd-Output.xml \
				$HOME/junk/RegressionTests_Marybell/Marybell_CL-Output.xml \
				$HOME/junk/RegressionTests_Marybell/Marybell_FireFox-Output.xml \
				$HOME/junk/RegressionTests_Marybell/Marybell_Chrome-Output.xml \
				$HOME/junk/RegressionTests_MirrorsProd/Mirrors_CL-Output.xml \
				$HOME/junk/RegressionTests_MirrorsProd/Mirrors_FireFox-Output.xml \
				$HOME/junk/RegressionTests_MirrorsProd/Mirrors_Chrome-Output.xml
	else
		echo "************************************************************"
		echo "* * *   output.xml file missing, no report generated   * * *"
		echo "************************************************************"
	fi
else
	# Now combine all the results into one report
	cd $HOME/junk/RegressionTests_${ENV}
	if [ -r $HOME/junk/RegressionTests_${ENV}/Clean${ENV}-Output.xml ] && \
		[ -r $HOME/junk/RegressionTests_${ENV}/${ENV}_CL-Output.xml ] && \
		[ -r $HOME/junk/RegressionTests_${ENV}/${ENV}_FireFox-Output.xml ] && \
		[ -r $HOME/junk/RegressionTests_${ENV}/${ENV}_Chrome-Output.xml ] ; then
		echo "--------------------------------------------------------------------------"
		echo "- - -   Combining output.xml files from CleanUp and Regression run"
		echo "--------------------------------------------------------------------------"
		rm -rf $HOME/trunk/report.html
		rm -rf $HOME/trunk/log.html
		rebot -n dc-* -n noncrit \
			--name Clean_Regression $HOME/junk/RegressionTests_${ENV}/Clean${ENV}-Output.xml \
			$HOME/junk/RegressionTests_${ENV}/${ENV}_CL-Output.xml \
			$HOME/junk/RegressionTests_${ENV}/${ENV}_FireFox-Output.xml \
			$HOME/junk/RegressionTests_${ENV}/${ENV}_Chrome-Output.xml
	else
		echo "************************************************************"
		echo "* * *   output.xml file missing, no report generated   * * *"
		echo "************************************************************"
	fi
fi

