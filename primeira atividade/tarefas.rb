class TaskManager

  def initialize
    @lista_de_tarefas = []
  end

  def adicionar_tarefa(nome, prioridade)
    @lista_de_tarefas.push({nome: nome, prioridade: prioridade})
    #puts "Tarefa adicionada: #{nome}, prioridade: #{prioridade}"
  end

  def remover_tarefa(nome)
    @lista_de_tarefas.delete(:nome)
    #puts "Atividade removida"
  end

  #não consegui resolver o problema.
  def listar_tarefas
      @lista_de_tarefas.values
  end

  def executar_tarefa()
    @lista_de_tarefas.each do |nome, prioridade|
    puts "Tarefa #{nome}| Priodidade #{prioridade}" #como deixar a saída mais bonita?
    end
  end
end

instancia_exemplo = TaskManager.new
puts instancia_exemplo.adicionar_tarefa("Estudar inglês", "alta")
puts instancia_exemplo.adicionar_tarefa("Estudar Ruby", "Média")
puts instancia_exemplo.adicionar_tarefa("Ler", "Baixa")

puts instancia_exemplo.remover_tarefa("Ler")

#puts instancia_exemplo.listar_tarefas

instancia_exemplo.executar_tarefa
