class TaskManager

    def initialize
        @lista_de_tarefas = []
    end

    def adicionar_tarefa(nome, prioridade)
        @lista_de_tarefas.push({nome: nome, prioridade: prioridade})
    end

    def remover_tarefa(nome)
        @lista_de_tarefas.delete(:nome)
        tarefa_a_ser_removida = @lista_de_tarefas.find { |tarefa| tarefa[:nome] == nome}
        return if not tarefa_a_ser_removida

        @lista_de_tarefas.delete(tarefa_a_ser_removida)
    end

    def listar_tarefas
        @lista_de_tarefas.values
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
    end
end

gerenciador = TaskManager.new
gerenciador.adicionar_tarefa('estudar ruby', 'alta')
gerenciador.adicionar_tarefa('Fazer Exercícios', 'media')
    
gerenciador.listar_tarefas

gerenciador.executar_tarefa do |nome, prioridade|
    puts "Tarefa: #{nome} | Prioridade: #{prioridade}"
end


gerenciador.remover_tarefa('Estudar ruby')

gerenciador_exemplo = TaskManager.inicializar_com_exemplo
gerenciador_exemplo.listar_tarefas
