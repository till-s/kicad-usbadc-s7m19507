# 
# Project automation script for xc3s-test 
# 
# Created for ISE version 14.7
# 
# This file contains several Tcl procedures (procs) that you can use to automate
# your project by running from xtclsh or the Project Navigator Tcl console.
# If you load this file (using the Tcl command: source xc3s-test.tcl), then you can
# run any of the procs included here.
# 
# This script is generated assuming your project has HDL sources.
# Several of the defined procs won't apply to an EDIF or NGC based project.
# If that is the case, simply remove them from this script.
# 
# You may also edit any of these procs to customize them. See comments in each
# proc for more instructions.
# 
# This file contains the following procedures:
# 
# Top Level procs (meant to be called directly by the user):
#    run_process: you can use this top-level procedure to run any processes
#        that you choose to by adding and removing comments, or by
#        adding new entries.
#    rebuild_project: you can alternatively use this top-level procedure
#        to recreate your entire project, and the run selected processes.
# 
# Lower Level (helper) procs (called under in various cases by the top level procs):
#    show_help: print some basic information describing how this script works
#    add_source_files: adds the listed source files to your project.
#    set_project_props: sets the project properties that were in effect when this
#        script was generated.
#    create_libraries: creates and adds file to VHDL libraries that were defined when
#        this script was generated.
#    set_process_props: set the process properties as they were set for your project
#        when this script was generated.
# 

set myProject "xc3s-test"
set myScript "xc3s-test.tcl"

# 
# Main (top-level) routines
# 
# run_process
# This procedure is used to run processes on an existing project. You may comment or
# uncomment lines to control which processes are run. This routine is set up to run
# the Implement Design and Generate Programming File processes by default. This proc
# also sets process properties as specified in the "set_process_props" proc. Only
# those properties which have values different from their current settings in the project
# file will be modified in the project.
# 
proc run_process {} {

   global myScript
   global myProject

   ## put out a 'heartbeat' - so we know something's happening.
   puts "\n$myScript: running ($myProject)...\n"

   if { ! [ open_project ] } {
      return false
   }

   set_process_props
   #
   # Remove the comment characters (#'s) to enable the following commands 
   # process run "Synthesize"
   # process run "Translate"
   # process run "Map"
   # process run "Place & Route"
   #
   set task "Implement Design"
   if { ! [run_task $task] } {
      puts "$myScript: $task run failed, check run output for details."
      project close
      return
   }

   puts "Run completed (successfully)."
   project close

}

# 
# rebuild_project
# 
# This procedure renames the project file (if it exists) and recreates the project.
# It then sets project properties and adds project sources as specified by the
# set_project_props and add_source_files support procs. It recreates VHDL Libraries
# as they existed at the time this script was generated.
# 
# It then calls run_process to set process properties and run selected processes.
# 
proc recreate_project {} {

   global myScript
   global myProject

   project close
   ## put out a 'heartbeat' - so we know something's happening.
   puts "\n$myScript: Rebuilding ($myProject)...\n"

   set proj_exts [ list ise xise gise ]
   foreach ext $proj_exts {
      set proj_name "${myProject}.$ext"
      if { [ file exists $proj_name ] } { 
         file delete $proj_name
      }
   }

   project new $myProject
   set_project_props
   add_source_files
   create_libraries
   set_process_props
   project close
   # TS, 2/2022 - I found that the 'Other Bitgen Command Line Options'
   # property while set in the project is not written into the file. It
   # **does** work, however, if we close, reopen, then set the property
   # and close again. Weird...
   project open $myProject
   project set "Other Bitgen Command Line Options" "-g next_config_register_write:Disable" -process "Generate Programming File"
   project close
   puts "$myScript: project rebuild completed."
}

proc rebuild_project {} {

   recreate_project

   project open $myProject

   run_process

}

# 
# Support Routines
# 

# 
proc run_task { task } {

   # helper proc for run_process

   puts "Running '$task'"
   set result [ process run "$task" ]
   #
   # check process status (and result)
   set status [ process get $task status ]
   if { ( ( $status != "up_to_date" ) && \
            ( $status != "warnings" ) ) || \
         ! $result } {
      return false
   }
   return true
}

# 
# show_help: print information to help users understand the options available when
#            running this script.
# 
proc show_help {} {

   global myScript

   puts ""
   puts "usage: xtclsh $myScript <options>"
   puts "       or you can run xtclsh and then enter 'source $myScript'."
   puts ""
   puts "options:"
   puts "   run_process       - set properties and run processes."
   puts "   recreate_project  - recreate the project from scratch (without building)."
   puts "   rebuild_project   - rebuild the project from scratch and run processes."
   puts "   set_project_props - set project properties (device, speed, etc.)"
   puts "   add_source_files  - add source files"
   puts "   create_libraries  - create vhdl libraries"
   puts "   set_process_props - set process property values"
   puts "   show_help         - print this message"
   puts ""
}

proc open_project {} {

   global myScript
   global myProject

   if { ! [ file exists ${myProject}.xise ] } { 
      ## project file isn't there, rebuild it.
      puts "Project $myProject not found. Use project_rebuild to recreate it."
      return false
   }

   project open $myProject

   return true

}
# 
# set_project_props
# 
# This procedure sets the project properties as they were set in the project
# at the time this script was generated.
# 
proc set_project_props {} {

   global myScript

   if { ! [ open_project ] } {
      return false
   }

   puts "$myScript: Setting project properties..."

   project set family "Spartan3A and Spartan3AN"
   project set device "xc3s200a"
   project set package "vq100"
   project set speed "-4"
   project set top_level_module_type "HDL"
   project set synthesis_tool "XST (VHDL/Verilog)"
   project set simulator "ISim (VHDL/Verilog)"
   project set "Preferred Language" "VHDL"
   project set "Enable Message Filtering" "false"

}

#
# Create git-version package
proc update_git_version {} {
	exec make -C hdl -f usbadc-support/hdl/makefile git
}


# 
# add_source_files
# 
# This procedure add the source files that were known to the project at the
# time this script was generated.
# 
proc add_source_files {} {

   global myScript

   if { ! [ open_project ] } {
      return false
   }

   puts "$myScript: Adding sources to project..."

   update_git_version

   xfile add "hdl/IOBufArray.vhd"
   xfile add "hdl/top.ucf"
   xfile add "hdl/top.vhd"
   xfile add "hdl/usbadc-support/hdl/BitBangIF.vhd"
   xfile add "hdl/usbadc-support/hdl/Ft240Fifo.vhd"
   xfile add "hdl/usbadc-support/hdl/MaxAdc.vhd"
   xfile add "hdl/usbadc-support/hdl/SynchronizerBit.vhd"
   xfile add "hdl/usbadc-support/hdl/BasicPkg.vhd"
   xfile add "hdl/usbadc-support/hdl/CommandMuxPkg.vhd"
   xfile add "hdl/usbadc-support/hdl/AcqCtlPkg.vhd"
   xfile add "hdl/usbadc-support/hdl/CommandMux.vhd"
   xfile add "hdl/usbadc-support/hdl/BitBangIF.vhd"
   xfile add "hdl/usbadc-support/hdl/CommandBitBang.vhd"
   xfile add "hdl/usbadc-support/hdl/CommandAcqParm.vhd"
   xfile add "hdl/usbadc-support/hdl/CommandWrapper.vhd"
   xfile add "hdl/usbadc-support/hdl/ByteStuffer.vhd"
   xfile add "hdl/usbadc-support/hdl/ByteDeStuffer.vhd"
   xfile add "hdl/usbadc-support/hdl/ILAWrapper.vhd"
   xfile add "hdl/usbadc-support/hdl/ILAWrapperPkg.vhd"
   xfile add "hdl/usbadc-support/hdl/CicFilter.vhd"
   xfile add "hdl/usbadc-support/hdl/PipelinedRShifter.vhd"
   xfile add "hdl/usbadc-support/hdl/MulShifter.vhd"
   xfile add "hdl/usbadc-support/hdl/SpiReg.vhd"
   xfile add "hdl/GitVersionPkg.vhd"
   xfile add "ipcore_dir/chipscope_icon.xco"
   xfile add "ipcore_dir/ila_1br.xco"
   puts ""
   puts "WARNING: project contains IP cores, synthesis will fail if any of the cores require regenerating."
   puts ""

   # Set the Top Module as well...
   project set top "rtl" "top"

   puts "$myScript: project sources reloaded."

} ; # end add_source_files

# 
# create_libraries
# 
# This procedure defines VHDL libraries and associates files with those libraries.
# It is expected to be used when recreating the project. Any libraries defined
# when this script was generated are recreated by this procedure.
# 
proc create_libraries {} {

   global myScript

   if { ! [ open_project ] } {
      return false
   }

   puts "$myScript: Creating libraries..."


   # must close the project or library definitions aren't saved.
   project save

} ; # end create_libraries

# 
# set_process_props
# 
# This procedure sets properties as requested during script generation (either
# all of the properties, or only those modified from their defaults).
# 
proc set_process_props {} {

   global myScript

   if { ! [ open_project ] } {
      return false
   }

   puts "$myScript: setting process properties..."

   project set "User Browsed Strategy Files" "/opt/Xilinx/ise/14.7/ISE_DS/ISE/spartan3a/data/spartan3a_performance_with_iobpacking.xds"

   project set "Generics, Parameters" "DEVICE_G=\"xc3s200a\"" -process "Synthesize - XST"
   project set "Allow Logic Optimization Across Hierarchy" "true" -process "Map"
   project set "Pack I/O Registers/Latches into IOBs" "For Inputs and Outputs" -process "Map"
   project set "Generate Detailed MAP Report" "true" -process "Map"
   project set "Map Slice Logic into Unused Block RAMs" "true" -process "Map"
   project set "Perform Timing-Driven Packing and Placement" "true" -process "Map"
   project set "Combinatorial Logic Optimization" "true" -process "Map"
   project set "Create Binary Configuration File" "true" -process "Generate Programming File"
   project set "Extra Effort" "Normal" -process "Map"
   project set "Starting Placer Cost Table (1-100)" "3" -process "Place & Route"

   puts "$myScript: project property values set."

} ; # end set_process_props

proc main {} {

   if { [llength $::argv] == 0 } {
      show_help
      return true
   }

   foreach option $::argv {
      switch $option {
         "show_help"           { show_help }
         "run_process"         { run_process }
         "recreate_project"    { recreate_project }
         "rebuild_project"     { rebuild_project }
         "set_project_props"   { set_project_props }
         "add_source_files"    { add_source_files }
         "create_libraries"    { create_libraries }
         "set_process_props"   { set_process_props }
         default               { puts "unrecognized option: $option"; show_help }
      }
   }
}

if { $tcl_interactive } {
   show_help
} else {
   if {[catch {main} result]} {
      puts "$myScript failed: $result."
   }
}

