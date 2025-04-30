# Function to divide numbers in a list
def divide_numbers(numbers):
    result = numbers[0]  # Start with the first number
    for num in numbers[1:]:
        result /= num
    return result

# Take input from the user
user_input = input("Enter numbers separated by spaces: ")

# Convert input string to a list of numbers
numbers = list(map(float, user_input.split()))

# Check for division by zero
if 0 in numbers[1:]:  # Skip the first number in the list
    print("Error: Division by zero is not allowed.")
else:
    # Divide the numbers
    quotient = divide_numbers(numbers)
    # Display the result
    print("The result of the division is:", quotient)
