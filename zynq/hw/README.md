# Build Hardware and Generate Bit- and HDF Files

## Manually

* Start up Vivado
  1. Create empty RTL project "zynq"
  1. Select appropriate target board (e.g. Zybo, ZedBoard, Pynq-Z1)
  1. Create a block design "zynq"
  1. Add IP Core "Zynq7 Processing System"
  1. Add IP Core "AXI GPIO" for LEDs (GPIO) and Switches (GPIO2)
  1. Run block and connection automation
  1. Affirm or adjust GPIO address to be at `0x4120_0000`
  1. Create HDL Wrapper
  1. Generate Bitstream
  1. -> File -> Export -> Export Hardware (include bitstream)

## Scripted

Scripts are included for the automated generation of basic hardware platforms with the
elementary GPIO for LEDs and slide switches. Their execution requires Vivado 2016.4. The outputs
will be produced in the directory `build_(zybo|zed)/`. The scripts can be called both in `batch` mode or
in `gui` mode in case more visual feedback is desired:

```bash
vivado -nojournal -mode (batch|gui) -source zynq.tcl -tclargs (zybo|zed)
```