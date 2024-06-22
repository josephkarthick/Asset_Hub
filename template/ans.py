que = 15463
ques = [1, 5, 4, 6, 3]
get = []

while True:
    result = que
    for num in ques:
        result *= num
    get.append(result)
    if result == 52950:
        print("Done")
        break