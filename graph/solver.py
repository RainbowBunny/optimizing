from amplpy import AMPL, add_to_path, modules

# modules.load()
add_to_path(r'../../../Desktop/ampl.linux-intel64/')

ampl = AMPL()
ampl.option["solver"] = "gurobi"

file = 'color'

ampl.read(f'{file}.mod')
ampl.read_data(f'{file}.dat')

ampl.solve()

for ele in list(ampl.get_variables()):  
    ampl.eval(f'display {ele[0]};')
    # x = ampl.get_variable('x').get_values().to_list()
    # print(x)