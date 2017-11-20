@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim ControlFSM_TB_behav -key {Behavioral:sim_1:Functional:ControlFSM_TB} -tclbatch ControlFSM_TB.tcl -view C:/Users/winiarcc/ECE/FinalProject/Dig2_FinalProject/ControlFSM_TB_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
