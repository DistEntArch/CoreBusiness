# Core Business Engine
The purpose of the Core Business Engine is to provide all interfaces for human actors and (dummy) APIs as proxies for capabilities provided by external systems.

Based on an existing Core Business Model provided by the business stakeholder itself, the generator creates a configuration to run  the engine.

Generate the configuration:

```
# assuming we're are in the root directory of the Core Business repo

CBM_NAME="CatInsurance"
SAXON_JAR=~/Development/SaxonHE9-8-0-15J/saxon9he.jar
CBE_CONFIG="./Model/examples/${CBM_NAME}.xml"
CBE_GENERATOR="./Engine/XSLT/generate-opyrator.xslt"
CBE_OUTPUT="./Engine/examples/"

java -jar "${SAXON_JAR}" output-dir=$CBE_OUTPUT $CBE_CONFIG $CBE_GENERATOR
```

The engine generator will create a number of python files in the given CBE_OUTPUT directory and a shell script to start the opyrator services.  