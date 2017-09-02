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
ExecStep $xv_path/bin/xsim lab5_gcd_behav -key {Behavioral:sim_1:Functional:lab5_gcd} -tclbatch lab5_gcd.tcl -view /home/udit01/Desktop/215/lab5_gcd/lab5_gcd/lab5_gcd_behav.wcfg -log simulate.log
