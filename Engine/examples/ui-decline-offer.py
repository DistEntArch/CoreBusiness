from pydantic import BaseModel, Field

class Input(BaseModel):
    decline_offer: bool = Field(
        False,
        description="Please check this box if you not accept the offer.",
    )

class Output(BaseModel):
    message: str

def decline_offer(input: Input) -> Output:
    """Returns the `message` of the input data."""
    return Output(message=input.decline_offer)
