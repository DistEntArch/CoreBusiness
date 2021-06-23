from pydantic import BaseModel, Field

class Input(BaseModel):
    cancel_contract: bool = Field(
        False,
        description="Please check this box if you like to cancel this contract.",
    )

class Output(BaseModel):
    message: str

def cancel_contract(input: Input) -> Output:
    """Returns the `message` of the input data."""
    return Output(message=input.cancel_contract)
