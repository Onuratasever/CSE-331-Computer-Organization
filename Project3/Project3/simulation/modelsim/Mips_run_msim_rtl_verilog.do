transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur {D:/Quartus_Workspace/proje3Onur/mips.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur {D:/Quartus_Workspace/proje3Onur/control_unit.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur {D:/Quartus_Workspace/proje3Onur/alu_control.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur/alu {D:/Quartus_Workspace/proje3Onur/alu/full_Adder_1bit.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur/alu {D:/Quartus_Workspace/proje3Onur/alu/full_adder_4bit.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur/alu {D:/Quartus_Workspace/proje3Onur/alu/carry_Lookahead_Level1.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur/alu {D:/Quartus_Workspace/proje3Onur/alu/full_adder_lastBit.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur/alu {D:/Quartus_Workspace/proje3Onur/alu/mux_not.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur/alu {D:/Quartus_Workspace/proje3Onur/alu/mux_3x1.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur/alu {D:/Quartus_Workspace/proje3Onur/alu/secondLevel_p_g.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur/alu {D:/Quartus_Workspace/proje3Onur/alu/full_adder_32bit.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur/alu {D:/Quartus_Workspace/proje3Onur/alu/full_adder_4bit_lastBlock.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur/alu {D:/Quartus_Workspace/proje3Onur/alu/firstLevel_p_g.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur/alu {D:/Quartus_Workspace/proje3Onur/alu/carry_Lookahead_Level2.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur {D:/Quartus_Workspace/proje3Onur/Alu.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur {D:/Quartus_Workspace/proje3Onur/mux2x1_5bit.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur {D:/Quartus_Workspace/proje3Onur/extend_32bit.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur {D:/Quartus_Workspace/proje3Onur/mux2x1_32bit.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur {D:/Quartus_Workspace/proje3Onur/my_and_32bit.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur {D:/Quartus_Workspace/proje3Onur/my_or_32bit.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur {D:/Quartus_Workspace/proje3Onur/instruction_block.v}
vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur {D:/Quartus_Workspace/proje3Onur/register_block.v}

vlog -vlog01compat -work work +incdir+D:/Quartus_Workspace/proje3Onur {D:/Quartus_Workspace/proje3Onur/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
