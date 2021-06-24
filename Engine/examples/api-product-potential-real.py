from pydantic import BaseModel, Field

class Input(BaseModel):
    product_potential_real: bool = Field(
        False,
        description="",
    )

class Output(BaseModel):
    message: str

def product_potential_real(input: Input) -> Output:
    """Returns the `message` of the input data."""
    return Output(message=input.product_potential_real)
