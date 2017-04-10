# Build Hardware and Generate Bitfile

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