# Core Business Engine
The purpose of the Core Business Engine is to provide all interfaces for human actors and (dummy) APIs as proxies for capabilities provided by external systems.

Based on an existing Core Business Model provided by the business stakeholder itself, the generator creates a configuration to run  the engine.

Generate the configuration:

```
# assuming we're are in the root directory of the Core Business repo

SAXON_JAR="~/Development/SaxonHE9-8-0-15J/saxon9he.jar"
CBE_CONFIG="./Model/CatInsurance.xml"

```