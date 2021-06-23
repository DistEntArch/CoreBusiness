from pydantic import BaseModel, Field

class Input(BaseModel):
    accept_offer: bool = Field(
        False,
        description="Whether or not to use sampling ; use greedy decoding otherwise.",
    )

class Output(BaseModel):
    message: str

def accept_offer(input: Input) -> Output:
    """Returns the `message` of the input data."""
    return Output(message=input.accept_offer)
