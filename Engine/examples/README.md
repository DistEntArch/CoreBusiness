# Examples of Implementations of a Core Business Model

A valid Core Business Model (CBM) can implemented in any turing complete language and run on any general purpose environment. Based on the current way to define a CBM the best way to generate the code is XSLT. For sure it is easy to both use a different transformation language (like m4) and generate code for different language and runtime environments. The charm to use XSLT is to have also the only guarantee to not only be sure of a well formed but also a valid configuration. 

## Implementation for Python

The Python implementation uses [opyrator](https://github.com/ml-tooling/opyrator) a wrapper for [streamlit](https://github.com/streamlit/streamlit).

## Implementation for FPGA

The [hardware definition language(HDL) implementation](https://github.com/DistEntArch/CoreBusiness//tree/main/Engine/examples/FPGA/README.md) runs the state machine part completely in hardware while all other stuff will run on a host system. This means all calculations and computation known as insurance actuarial mathematics runs outside the core.

## Implementation for GPU(CUDA)

A mixed form if implementation can be generated to [CUDA](https://github.com/DistEntArch/CoreBusiness//tree/main/Engine/examples/CUDA/README.md) running on NVIDIA GPUs. 
