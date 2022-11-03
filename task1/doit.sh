rm -rf obj_dir


#run Verilator to translate Verilog into C++ including testbench
verilator -Wall --cc --trace sigdelay.sv --exe sigdelay_tb.cpp

# build c++ project via make

make -j -C obj_dir/ -f Vsigdelay.mk Vsigdelay

# run exe
obj_dir/Vsigdelay