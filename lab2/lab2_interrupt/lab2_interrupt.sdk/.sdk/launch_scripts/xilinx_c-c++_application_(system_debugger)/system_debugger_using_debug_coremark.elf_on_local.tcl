connect -url tcp:127.0.0.1:3121
source C:/Users/konto/Documents/embeded/lab2/lab2_interrupt/lab2_interrupt.sdk/arm_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248553221"} -index 0
loadhw C:/Users/konto/Documents/embeded/lab2/lab2_interrupt/lab2_interrupt.sdk/arm_wrapper_hw_platform_0/system.hdf
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248553221"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248553221"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248553221"} -index 0
dow C:/Users/konto/Documents/embeded/lab2/lab2_interrupt/lab2_interrupt.sdk/CoreMark/Debug/CoreMark.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248553221"} -index 0
con
