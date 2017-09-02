#!/bin/bash -f
xv_path="/media/udit01/files/opt/Vivado/2017.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 89f93dd96d2b4071ae571b1130427e45 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot lab5_gcd_behav xil_defaultlib.lab5_gcd -log elaborate.log
