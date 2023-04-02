from amplpy import AMPL, add_to_path, modules

# modules.load()
add_to_path(r'../../../Desktop/ampl.linux-intel64/')

ampl = AMPL()
ampl.option["solver"] = "gurobi"

file = 'magic_square'

ampl.read(f'{file}.mod')
ampl.read_data(f'{file}.dat')

ampl.solve()

# for ele in list(ampl.get_variables()):  
    # ampl.eval(f'display {ele[0]};')

n = int(ampl.get_parameter('n').get_values().to_list()[0])
ans = [[0 for i in range(n)] for i in range(n)]
x = ampl.get_variable('x').get_values().to_list()
for (i, j, k, v) in x:
    i, j, k = int(i), int(j), int(k)
    if v > 0.5:
        ans[i - 1][j - 1] = k

for i in range(n):
    for j in range(n):
        print(ans[i][j], end = ' ')
    print()