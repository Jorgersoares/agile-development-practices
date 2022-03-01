# frozen_string_literal: true

class AnalisadorLinha
  attr_accessor :linha, :palavras_maior_frequencia, :conteudo_linha, :maior_frequencia

  def initialize(linha, conteudo_linha)
    @linha = linha
    @conteudo_linha = conteudo_linha.split
  end

  def analisar_linha
    @palavras_maior_frequencia = get_palavras_maior_ocorrencia(@conteudo_linha)
  end

  def get_palavras_maior_ocorrencia(conteudo_linha)
    ocorrencia_maxima = 0
    conteudo_linha.each do |palavra|
      ocorrencia = @conteudo_linha.count(palavra)
      ocorrencia_maxima = ocorrencia if ocorrencia > ocorrencia_maxima
    end
    @maior_frequencia = ocorrencia_maxima
    @conteudo_linha.find_all { |palavra| @conteudo_linha.count(palavra) == ocorrencia_maxima }.uniq
  end

  def to_str
    if @maior_frequencia <= 1
      "Linha #{@linha} contém somente palavras distintas ou está vazia"
    else
      "Palavra(s) que mais aparecem na linha #{@linha} é/são #{@palavras_maior_frequencia} com a frequência #{@maior_frequencia}"
    end
  end
end
