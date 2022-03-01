# frozen_string_literal: true

require_relative 'analisador_linha'

objetos_linha = []
file = File.open('teste.txt')
file_data = file.readlines.map(&:chomp)

linha = 0
file_data.each do |i|
  linha += 1
  objetos_linha.append(AnalisadorLinha.new(linha, i))
end

objetos_linha.each do |i|
  i.analisar_linha
  puts i.to_str
end
