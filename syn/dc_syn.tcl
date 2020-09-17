#Read All Files
read_verilog ../src/SET.v
current_design SET
link

#Setting Clock Constraints
source -echo -verbose SET.sdc

#Synthesis all design
compile -map_effort high -area_effort high
compile -map_effort high -area_effort high -inc

write -format ddc     -hierarchy -output "SET_syn.ddc"
write_sdf SET_syn.sdf
write_file -format verilog -hierarchy -output SET_syn.v
report_area > area.log
report_timing > timing.log
report_qor   >  SET_syn.qor

