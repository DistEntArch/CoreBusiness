from pydantic import BaseModel, Field

class Input(BaseModel):
    accept_offer: bool = Field(
        False,
        description="Please check this box if you like to receive an offer from us.",
    )

class Output(BaseModel):
    message: str

def accept_offer(input: Input) -> Output:
    """Returns the `message` of the input data."""
    return Output(message=input.accept_offer)
