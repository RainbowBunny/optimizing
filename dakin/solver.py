from amplpy import AMPL, add_to_path, modules

# modules.load()
add_to_path(r'../../../Desktop/ampl.linux-intel64/')

ampl = AMPL()
ampl.option["solver"] = "gurobi"

file = 'dakin'

ampl.read(f'{file}.mod')
# ampl.read_data(f'{file}.dat')

ampl.solve()

# for ele in list(ampl.get_variables()):  
    # ampl.eval(f'display {ele[0]};')

for ele in list(ampl.get_variables()):  
    ampl.eval(f'display {ele[0]};')