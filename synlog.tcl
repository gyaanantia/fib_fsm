history clear
add_file -verilog /home/gfa2226/fpga/fibonacci/sv/fibonacci.sv
set_option -result_file /home/gfa2226/fpga/fibonacci/rev_4/fibonacci.vqm
set_option -resultformat vqm
set_option -technology CYCLONEIV-E
set_option -part EP4CE115
set_option -write_verilog 1
project -run  
set_option -part EP4CE6
project -run  
set_option -result_file /home/gfa2226/fpga/fibonacci/rev_4/fibonacci.vm
set_option -resultformat vm
set_option -technology ACHRONIXSPEEDSTER22IHD
project -run  
set_option -result_file /home/gfa2226/fpga/fibonacci/rev_4/fibonacci.vqm
set_option -resultformat vqm
set_option -technology CYCLONEIV-E
set_option -part EP4CE115
project -run  
project -close /home/gfa2226/fpga/fibonacci/proj_1.prj
