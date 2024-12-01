class TaskManager
  def initialize
    @lista_de_tarefas = []
  end

  def adicionar_tarefa(nome, prioridade)
    @lista_de_tarefas.push({nome: nome, prioridade: prioridade})
    #puts "Tarefa adicionada: #{nome}, prioridade: #{prioridade}"
  end

  def remover_tarefa(nome)
    tarefa_a_ser_removida = @lista_de_tarefas.find { |tarefa| tarefa[:nome] == nome }
    return if not tarefa_a_ser_removida

    @lista_de_tarefas.delete(tarefa_a_ser_removida)
    #puts "Atividade removida"
  end

  #não consegui resolver o problema.
  def listar_tarefas
    puts @lista_de_tarefas
  end

  def executar_tarefa(&block)
    indice_aleatorio = rand(@lista_de_tarefas.length)
    tarefa = @lista_de_tarefas[indice_aleatorio]
    block.call(tarefa[:nome], tarefa[:prioridade])
  end

  def self.inicializar_com_exemplo
    nova_lista = new()
    nova_lista.adicionar_tarefa("Estudar Ruby", "alta")
    nova_lista.adicionar_tarefa("Leitura", "media")
    nova_lista
  end
end


gerenciador = TaskManager.new

# Adicionar tarefas
gerenciador.adicionar_tarefa('Estudar Ruby', 'alta')
gerenciador.adicionar_tarefa('Fazer exercícios', 'média')
gerenciador.adicionar_tarefa('Lavar a louça', 'baixa')

# Listar tarefas
gerenciador.listar_tarefas

# Executar uma tarefa com um bloco
gerenciador.executar_tarefa do |nome, prioridade|
  puts "Tarefa: #{nome} | Prioridade: #{prioridade}"
end

# Remover uma tarefa
gerenciador.remover_tarefa('Estudar Ruby')

# Criar uma instância com tarefas de exemplo
gerenciador_exemplo = TaskManager.inicializar_com_exemplo
gerenciador_exemplo.listar_tarefas
