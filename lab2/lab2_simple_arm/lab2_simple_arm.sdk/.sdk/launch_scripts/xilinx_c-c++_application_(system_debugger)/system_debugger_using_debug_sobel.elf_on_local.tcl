connect -url tcp:127.0.0.1:3121
source C:/Users/konto/Documents/embeded/lab2/lab2_simple_arm/lab2_simple_arm.sdk/arm_wrapper_hw_platform_0/ps7_init.tcl
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248650939" && level==0} -index 1
fpga -file C:/Users/konto/Documents/embeded/lab2/lab2_simple_arm/lab2_simple_arm.sdk/arm_wrapper_hw_platform_0/arm_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248650939"} -index 0
loadhw C:/Users/konto/Documents/embeded/lab2/lab2_simple_arm/lab2_simple_arm.sdk/arm_wrapper_hw_platform_0/system.hdf
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248650939"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248650939"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248650939"} -index 0
profile -freq 1000000 -scratchaddr 0x10000000
dow C:/Users/konto/Documents/embeded/lab2/lab2_simple_arm/lab2_simple_arm.sdk/sobel/Debug/sobel.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248650939"} -index 0
set bpid [bpadd -addr &_exit]
con -block
profile -out C:/Users/konto/Documents/embeded/lab2/lab2_simple_arm/lab2_simple_arm.sdk/sobel/Debug/gmon.out
bpremove $bpid
con
