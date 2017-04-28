@echo off
set xv_path=C:\\Xilinx2\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 7db291a3d6d8491190d84507708be097 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot Tb_behav xil_defaultlib.Tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
