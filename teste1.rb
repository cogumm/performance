require "benchmark"
puts Benchmark.measure { "r"*1_000_000 }

							# Resultado #
#  0.000000   0.000000   0.000000 (  0.001466) 

# Este é o resultado gerado na minha máquina 
# (Ubuntu 10.04 com Core 2duo de 3,33 GHz)
