from pydantic import BaseModel, Field

class Input(BaseModel):
    file_claim: bool = Field(
        False,
        description="Please check this box if you like to file a claim.",
    )

class Output(BaseModel):
    message: str

def file_claim(input: Input) -> Output:
    """Returns the `message` of the input data."""
    return Output(message=input.file_claim)
