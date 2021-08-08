# FPGA Implementation of a Core Business Engine
A Core Business Engine (CBE) is based on a definition of states of business objects and the events flow triggered by external input and/or state changes of the business objects.

Given there endpoints for all external input events - like a mobile app to get a customer accepting to get an offer from the insurance company - implemented as a simple REST service. This service event of input pass thru the CBE and triggers a defined flow of state changes for the affected business objects.

The FPGA part of the implementation of a CBE will handle all non-interactive events. This could be by example the instantiation of premiums following the signment of a contract.

## Hardware

FPGAs usually are used for signal processing, network tasks, and acceleration for heavy computational tasks like machine learning. Espatially for signal processing and network packages handling the hardware design is implemented as state machines. 

As the Core Business Model uses the methodology of state machines. An implementation of the engine is easy in hardware. 

The bandwith of capabilities of FGPA are really broad. The cheapest available chips with some lower thousand LUT only costs cents. The currently most capable "Virtex Ultrascale+" from Xilinx will costs more then 50k US-dollar, just the chip with 1+ Mio LUTs itself. The number of the so-called lookup tables (LUT) defines the capabilities of the FPGA-familly. 

For this proof of concept a really small FPGA is used. It comes from Lattice and is placed on a very tiny board which fits complete in an USB port. The Fomu costs 35$ have 5k LUTs and only 128kByte RAM and 2MByte flash to store data. 

The goal of this PoC is to demonstrate the power of a simple methodology by generating the relevant code based on the definition without any glue code. It is not ment to go even close to production. 

But interestingly even this limited hardware with a power consumption from under a Watt (less then a LED) is able to manage hundrets of state changes and thousands of events per seconds, even if the maximum clock frequenz is limited to 133 Mhz (actual Intel processors can boost to up to 30 times faster). If incomming interaction events would be distributed harmonical over the time - they aren't - for a typicall car insurance this board coul'd handle all the core insurance tasks for millions of contracts.

## Hardware Definition Language (HDL) Implementation

Instead of generating the python code to control the interaction between web-services to trigger events after a state change, the HDL implementation generates Verilog code for the following event flow. 

The initial trigger event will initiated by an user interaction via an http request still. But instead of calling REST services the request will send the state change via USB to the FPGA board. 

Based on the HDL state machine definition the cascading events will be triggered also as the resulting state changes. Any triggered event and state change will be send back to the host to protokol. If a state change was send back to the host, it will reflected back to the FPGA. This will happen until no event to process is triggered.

## Parameter handling

All states of all business objects depends on various parameters. A coverage is defined by the value of the risk, the monthly premium is in a distinct value to be exspected as incoming on a bank account. These parameters can be stored as lookup tables in the SRAM of the FPGA for a fast access.

But parameters are custom for each contract, except it is an out of the box insurance without any case dependency. Therefore the parameter values need to be part of the state and event store and needs to transfered for the specific case to the FPGA.

For a typical HDL implementation this increases the I/O rate enormous, even if it is possible to reduce the size of the transfer by using enumerations for most parameters. 

## Parallelization

A larger FPGA as the iCE40UP5K used on the Foma would offer to handle multiple state changes and event processing at the same time. The usually way to implement the ability to handle incoming events in parallel is to design multiple pipelines. Given the fact that each pipeline needs many clocks (going thrugh a complex state machine), the I/O interfaces to the memory (AXI Scatter/Gather) can make usage of the hole bus (usually >1kbit) to feed more than one pipeline at once. If the affected pipelines are busy the bus addresses can be mapped to other parallel pipelines available. 

This pattern could also be used for an implementation on General Purpose Graphic Processing Units (GPGPU)  the other accelleration besides classical CISC or RISC CPUs. The stream of incoming events and state changes can be stored on the host memory in a memory sequence and the GPU cores work only on this partition and switch if they got there data. On the NVIDIA CUDA this technic is called "Concurrency Pipelining".

Based on the fundamental different design of FPGA and GPU boards there will be a major difference also on the software design. Even the cheapest GPUs have access to their own fast memory. For a typical gaming GPU the transfer rate between the single GPU core and the graphic memory is multiple hundret GByte per second while the size can now be 64GByte. FPGA boards with both high throuput and huge space are not available for an effordable price.

Like machine learning use cases for an implementation of the state machines in a GPU environment it is much more useful to store all data direct on the GPU memory. To optimize the processes for a efficient parallel processing the real data would be hashed also in a LUT while the original data available only on the host side.
