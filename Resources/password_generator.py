from random import choice, shuffle


def generate_password():
    letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
               'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
               'q', 'r',
               's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
    numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    symbols = ['[', '@', '_', '!', '#', '$', '%', '^', '&', '*', '(', ')', '<', '>', '?', '/', '|', '}', '{', '~', ':',
               ']']

    pass_letters = [choice(letters) for _ in range(6)]
    pass_numbers = [choice(numbers) for _ in range(5)]
    pass_symbols = [choice(symbols) for _ in range(5)]

    password_list = pass_letters + pass_numbers + pass_symbols
    shuffle(password_list)

    password = "".join(password_list)
    return password


print(generate_password())
print(len(generate_password()))
print(type(generate_password()))
