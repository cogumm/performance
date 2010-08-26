require 'benchmark'

colecao1 = (1..9_999).to_a 
# Criamos um Array com 9.999 posições e preenchido de 1 a 9.999.

colecao2 = colecao1.clone 
# Copiamos o objeto para outra variável

colecao1[5000] = nil 
# Incluímos intencionalmente um valor nulo 
# na posição 5.000 da coleção

Benchmark.bm(40) do |benchmark|
 
  benchmark.report("valida_elementos_da_colecao_ANTES") do
   
   # Verificamos se não existe algum nil (nulo) na coleção
    nao_tem_nulo = colecao2.all? { |e| e[0] } 
   
    if nao_tem_nulo 
      # E como não há objetos nulos nesta coleção não haverá
      # a necessidade de validar os elementos durante a execução.
      colecao2.inject(0) { |sum, n| sum + n }
    else
      colecao2.inject(0) { |sum, n| sum + (n.nil? ? 0 : n) }
    end
   
  end

  benchmark.report("valida_elementos_da_colecao_DURANTE") do
    # Neste teste o sistema validará se o elemento é 
    # nulo ou não durante a execução.
    colecao1.inject(0) { |sum, n| sum + (n.nil? ? 0 : n) }
  end
 
end

													# Resultado na mesma máqina do teste1.rb #
#                                              user     system      total        real
# valida_elementos_da_colecao_ANTES         0.020000   0.000000   0.020000 (  0.010602)
# valida_elementos_da_colecao_DURANTE       0.000000   0.000000   0.000000 (  0.007153)

