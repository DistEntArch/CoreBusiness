from pydantic import BaseModel, Field

class Input(BaseModel):
    person_product_potential_real: bool = Field(
        False,
        description="",
    )

class Output(BaseModel):
    message: str

def person_product_potential_real(input: Input) -> Output:
    """Returns the `message` of the input data."""
    return Output(message=input.person_product_potential_real)
