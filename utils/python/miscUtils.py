from typing import List
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

@keyword("Is List Of Strings Sorted")
def is_list_of_strings_sorted(list_of_elements: 'list[str]', order: str) -> bool:
    size = len(list_of_elements)
    if size == 0 or size == 1:
        return True

    if order == "ASC":
        for i in range(1, size):
            if list_of_elements[i - 1] > list_of_elements[i]:
                return False
    elif order == "DESC":
        for i in range(1, size):
            if list_of_elements[i - 1] < list_of_elements[i]:
                return False
    else:
        raise ValueError(f"Order must be 'ASC' or 'DESC'. Given: {order}")

    return True

@keyword("Is List Of Numbers Sorted")
def is_list_of_numbers_sorted(list_of_elements: 'list[str]', order: str) -> bool:
    size = len(list_of_elements)
    if size == 0 or size == 1:
        return True

    numbers = []
    for element in list_of_elements:
        try:
            number = float(element) if '.' in element else int(element)
            numbers.append(number)
        except ValueError as e:
            raise ValueError(f"Could not convert '{element}' to a number. Error: {e}")

    if order == "ASC":
        return all(numbers[i] <= numbers[i + 1] for i in range(len(numbers) - 1))
    elif order == "DESC":
        return all(numbers[i] >= numbers[i + 1] for i in range(len(numbers) - 1))
    else:
        raise ValueError(f"Order must be 'ASC' or 'DESC'. Given: {order}")

@keyword("Return XPath Locator")
def retun_xpath_locator(generic_locator: str, text: str):
    return  generic_locator.format(text)

@keyword("Replace Pattern In String")
def replace_pattern_in_string(original_string: str, pattern: str):
    return  original_string.replace(pattern, "")

@keyword("Remove From List By Value")
def remove_from_list_by_value(list_of_elements: List[object], value: object):
    while value in list_of_elements:
        list_of_elements.remove(value)
    return list_of_elements