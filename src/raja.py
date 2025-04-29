# Function to multiply numbers in a list
def multiply_numbers(numbers):
    result = 1
    for num in numbers:
        result *= num
    return result

# Take input from the user
user_input = input("Enter numbers separated by spaces: ")

# Convert input string to a list of numbers
numbers = list(map(float, user_input.split()))

# Multiply the numbers
product = multiply_numbers(numbers)

# Display the result
print("The product of the numbers is:", product)
