@echo off
set xv_path=C:\\Xilinx2\\Vivado\\2016.4\\bin
call %xv_path%/xsim Tb_behav -key {Behavioral:sim_1:Functional:Tb} -tclbatch Tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0