# Core Business Model

The purpose of the Core Business Model is to provide a syntax for the definition of different states of multiple business objects and events triggered by state changes.

At the moment the format to describe this states and state changes is XML:

```XML
<?xml version="1.0" encoding="UTF-8"?>
<cbm:root 
          xmlns:cbm="https://github.com/DistEntArch/CoreBusiness/Model"  
          xmlns:cbe="https://github.com/DistEntArch/CoreBusiness/Engine">
    <cbm:business-objects>
        <cbm:business-object id="person">
            <cbm:state id="virtual">
                <cbm:following-state target="potential" triggered-by-subject="a person" triggered-by-predicat="accept" triggered-by-object="offer" description="Please check this box if you like to receive an offer from us."/>
            </cbm:state>
            <cbm:state id="potential">
                <cbm:following-state target="real" triggered-by-subject="a person" triggered-by-predicat="sign" triggered-by-object="contract" description="Please check this box if you like to sign this contract."/>
            </cbm:state>
            <cbm:state id="real">
                <cbm:following-state target="virtual" triggered-by-subject="a person" triggered-by-predicat="cancel" triggered-by-object="contract" description="Please check this box if you like to cancel this contract."/>
            </cbm:state>
        </cbm:business-object>
    </cbm:business-objects>
</cbm:root>
```
In this example three states of an unnamed business object are defined (virtual, potential, and real. For each state is currently only one potential 'following-state' defined. 
