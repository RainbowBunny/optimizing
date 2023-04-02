from amplpy import AMPL, add_to_path, modules

# modules.load()
add_to_path(r'../../Desktop/ampl.linux-intel64/')

ampl = AMPL()
ampl.option["solver"] = "gurobi"
file = 'integer'

ampl.read(f'model/{file}.mod')
ampl.read_data(f'data/{file}.dat')
ampl.solve()

print(ampl.get_value("solve_result"))
print(list(ampl.get_variables()))

for ele in list(ampl.get_variables()):  
    ampl.eval(f'display {ele[0]};')

# for ele in list(ampl.get_constraints()):
#    ampl.eval(f'display {ele[0]}.up, {ele[0]}.down, {ele[0]}.current;')