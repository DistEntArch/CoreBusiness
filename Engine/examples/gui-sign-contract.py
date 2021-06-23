from pydantic import BaseModel, Field

class Input(BaseModel):
    sign_contract: bool = Field(
        False,
        description="Please check this box if you like to sign this contract.",
    )

class Output(BaseModel):
    message: str

def sign_contract(input: Input) -> Output:
    """Returns the `message` of the input data."""
    return Output(message=input.sign_contract)
