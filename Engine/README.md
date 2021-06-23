# Core Business Engine
The purpose of the Core Business Engine is to provide all interfaces for human actors and (dummy) APIs as proxies for capabilities provided by external systems.

### Dependencies

- [Saxon XSLT processor](https://www.saxonica.com/welcome/welcome.xml)
- [opyrator](https://github.com/ml-tooling/opyrator)

## Usage

Based on an existing Core Business Model (see:[CBM/README.md](../Model/README.md))  provided by the business stakeholder itself, the generator creates a configuration to run  the engine.

Generate the configuration:

```
# assuming we're are in the root directory of the Core Business repo

CBM_NAME="CatInsurance" # point to the model 
SAXON_JAR=~/Development/SaxonHE9-8-0-15J/saxon9he.jar # point to the Saxon XSLT processor jar
CBE_CONFIG="./Model/examples/${CBM_NAME}.xml"
CBE_GENERATOR="./Engine/XSLT/generate-opyrator.xslt"
CBE_OUTPUT="./Engine/examples/"

java -jar "${SAXON_JAR}" output-dir=$CBE_OUTPUT $CBE_CONFIG $CBE_GENERATOR
```

The engine generator will create a number of python files in the given CBE_OUTPUT directory and a shell script to start the opyrator services. It also writes a protocol to stdout.

```
Generate opyrator code in './Engine/examples/'.
To start the engine run "sh ./Engine/examples/run-cbe.sh"
```  
