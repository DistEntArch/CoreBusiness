from pydantic import BaseModel, Field

class Input(BaseModel):
    pay_claim: bool = Field(
        False,
        description="Please check this box if you like to accept the claim and payout.",
    )

class Output(BaseModel):
    message: str

def pay_claim(input: Input) -> Output:
    """Returns the `message` of the input data."""
    return Output(message=input.pay_claim)
