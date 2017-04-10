set PLATFORM [lindex $::argv 0]
set BUILDSRC "zynq_$PLATFORM.tcl"

# Check if target platform is available
if {[file isfile $BUILDSRC] != 1} {
    puts "No supported target platform: '$PLATFORM'"
    exit  1
}

# Compose target system in Vivado
file mkdir build_$PLATFORM
cd build_$PLATFORM
source ../$BUILDSRC

# Make wrapper and synthesize
set_property TARGET_LANGUAGE VHDL [current_project]
make_wrapper -top -fileset sources_1 -files [get_files myproj/project_1.srcs/sources_1/bd/zynq/zynq.bd]
add_files -norecurse myproj/project_1.srcs/sources_1/bd/zynq/hdl/zynq_wrapper.vhd
update_compile_order -fileset sources_1
launch_runs impl_1 -jobs 8 -to_step write_bitstream
wait_on_run impl_1

# Copy BIT & HDF file
file copy -force myproj/project_1.runs/impl_1/zynq_wrapper.bit    zynq.bit
file copy -force myproj/project_1.runs/impl_1/zynq_wrapper.sysdef zynq.hdf

# Done
quit
