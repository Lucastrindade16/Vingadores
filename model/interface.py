from string import capwords
from model.vingador import Vingador
from os import system

class Interface:

    def menu_principal(self):
        self.exibe_titulo_app()
        while True:
            self.exibe_titulo("Menu Principal")
            print("1 - Cadastrar Vingador")
            print("2 - Listar Vingadores")
            print("3 - Convocar Vingador")
            print("4 - Aplicar Tornozeleira")
            print("5 - Aplicar Chip GPS")
            print("6 - Listar Detalhes do Vingador")
            print("7 - Emitir Mandado de Prisão")
            print("0 - Sair", end="\n\n")
            opcao = input("Digite a opção desejada: ")

            if opcao == '1':
                self.exibe_titulo_app()
                self.exibe_titulo("<< Cadastro de Vingador")
                self.cadastrar_vingador()
                self.aguardar_enter()
            elif opcao == '2':
                self.exibe_titulo_app()
                self.exibe_titulo("<< Lista de Vingadores")
                Vingador.listar_vingadores()
                self.aguardar_enter()
            elif opcao == '3':
                self.exibe_titulo_app()
                self.exibe_titulo("<< Convocação de Vingador")
                self.convocar_vingador()
                self.aguardar_enter()
            elif opcao == '4':
                self.exibe_titulo_app()
                self.exibe_titulo("<< Aplicação de Tornozeleira")
                self.aplicar_tornozeleira()
                self.aguardar_enter()
            elif opcao == '5':
                self.exibe_titulo_app()
                self.exibe_titulo("<< Aplicação de Chip GPS")
                self.aplicar_chip_gps()
                self.aguardar_enter()
            elif opcao == '6':
                self.exibe_titulo_app()
                self.exibe_titulo("<< Listar Detalhes do Vingador")
                self.listar_detalhes_vingador()
                self.aguardar_enter()
            elif opcao == '7':
                self.exibe_titulo_app()
                self.exibe_titulo("<< Emitir Mandato de Prisão")
                self.prender()
                self.aguardar_enter()
            elif opcao == '0':
                exit()
            else:
                print("Opção inválida.")
                self.aguardar_enter()
                self.menu_principal()

    def cadastrar_vingador(self):
        nome_heroi = input("Nome do herói: ")
        nome_real = input("Nome real: ")
        categoria = input("Categoria: ").capitalize()
        poderes = input("Poderes (separados por vírgula): ").split(',')
        poder_principal = input("Poder Principal: ")
        fraquezas = input("Fraquezas: (separadas por vírgula): ").split(',')
        nivel_forca = int(input("Nível de Força: "))

        Vingador(nome_heroi, nome_real, categoria, poderes, poder_principal, fraquezas, nivel_forca)

        print(f"Vingador(a) '{nome_heroi}' cadastrado com sucesso.")
        self.aguardar_enter()

    def aguardar_enter(self):
        input("\nPressione Enter para continuar...")
        self.menu_principal()

    def convocar_vingador(self):
        nome_heroi = capwords(input("Nome do herói: "))
        for vingador in Vingador.lista_vingadores:
            if nome_heroi in vingador.nome_heroi or nome_heroi in vingador.nome_real:
                print(vingador.convocar())
                self.aguardar_enter()
                return
        print(f"Vingador(a) '{nome_heroi}' não encontrado.")
        self.aguardar_enter()

    def aplicar_tornozeleira(self):
        nome_heroi = capwords(input("Nome do herói: "))
        for vingador in Vingador.lista_vingadores:
            if nome_heroi in vingador.nome_heroi or nome_heroi in vingador.nome_real:
                print(vingador.aplicar_tornozeleira())
                self.aguardar_enter()
                return
        print(f"Vingador(a) '{nome_heroi}' não encontrado.")

    def aplicar_chip_gps(self):
        nome_heroi = capwords(input("Nome do herói: "))
        for vingador in Vingador.lista_vingadores:
            if nome_heroi in vingador.nome_heroi or nome_heroi in vingador.nome_real:
                print(vingador.aplicar_chip_gps())
                self.aguardar_enter()
                return
        print(f"Vingador(a) '{nome_heroi}' não encontrado.")
        self.aguardar_enter()

    def listar_detalhes_vingador(self):
        nome_heroi = capwords(input("Nome do herói: "))
        for vingador in Vingador.lista_vingadores:
            if nome_heroi in vingador.nome_heroi or nome_heroi in vingador.nome_real:
                vingador.listar_detalhes_vingador()
                self.aguardar_enter()
                return
        print(f"Vingador(a) '{nome_heroi}' não encontrado.")
        self.aguardar_enter()

    def prender(self):
        nome_heroi = capwords(input("Nome do herói: "))
        for vingador in Vingador.lista_vingadores:
            if nome_heroi in vingador.nome_heroi or nome_heroi in vingador.nome_real:
                print(vingador.prender())
                self.aguardar_enter()
                return
        print(f"Vingador(a) '{nome_heroi}' não encontrado.")
        self.aguardar_enter()

    @staticmethod
    def exibe_titulo(titulo):
        print(f"\n{titulo}")
        print('-' * len(titulo))

    @staticmethod
    def exibe_titulo_app():
        system('cls')
        print('''
              
██╗░░░██╗██╗███╗░░██╗░██████╗░░█████╗░██████╗░░█████╗░██████╗░███████╗░██████╗
██║░░░██║██║████╗░██║██╔════╝░██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝
╚██╗░██╔╝██║██╔██╗██║██║░░██╗░███████║██║░░██║██║░░██║██████╔╝█████╗░░╚█████╗░
░╚████╔╝░██║██║╚████║██║░░╚██╗██╔══██║██║░░██║██║░░██║██╔══██╗██╔══╝░░░╚═══██╗
░░╚██╔╝░░██║██║░╚███║╚██████╔╝██║░░██║██████╔╝╚█████╔╝██║░░██║███████╗██████╔╝
░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═════╝░ 
        ''')