size = 8

a = []
b = []

for i in range(8):
    a.append([])
    b.append([])
    for j in range(8):
        a[i].append(i*size + j)
        b[i].append(i*size + j)

# print(a)

for i in range(8):
    for j in range(8):
        a[i][j] = a[i][j] + b[j][i]

print(a)
print()
print(b)