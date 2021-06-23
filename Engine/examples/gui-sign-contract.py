from pydantic import BaseModel, Field

class Input(BaseModel):
    sign_contract: bool = Field(
        False,
        description="Whether or not to use sampling ; use greedy decoding otherwise.",
    )

class Output(BaseModel):
    message: str

def sign_contract(input: Input) -> Output:
    """Returns the `message` of the input data."""
    return Output(message=input.sign_contract)
