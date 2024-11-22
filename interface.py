import os
from modelos.vingador import Vingador

class Interface:
    @staticmethod
    def imprime_titulo_app():
        print('''

██╗░░░██╗██╗███╗░░██╗░██████╗░░█████╗░██████╗░░█████╗░██████╗░███████╗░██████╗
██║░░░██║██║████╗░██║██╔════╝░██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝
╚██╗░██╔╝██║██╔██╗██║██║░░██╗░███████║██║░░██║██║░░██║██████╔╝█████╗░░╚█████╗░
░╚████╔╝░██║██║╚████║██║░░╚██╗██╔══██║██║░░██║██║░░██║██╔══██╗██╔══╝░░░╚═══██╗
░░╚██╔╝░░██║██║░╚███║╚██████╔╝██║░░██║██████╔╝╚█████╔╝██║░░██║███████╗██████╔╝
░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═════╝░
        ''')

    @staticmethod
    def apresentar_menu_principal():
        Interface.imprime_titulo_app()
        print('''
    Menu Principal
1. Cadastrar um novo vingador
2. Listar todos os vingadores
3. Sair
              ''')
        Interface.ler_opcao_usuario()

    @staticmethod
    def imprime_titulo_tela(titulo):
        os.system('cls' if os.name == 'nt' else 'clear')
        Interface.imprime_titulo_app()
        print(f'{str(titulo).upper()}')
        print('*' * 40)
        print()

    @staticmethod
    def cadastrar_vingador():
        Interface.imprime_titulo_tela('Cadastrando novo vingador...')
        nome_heroi = input('Nome do herói: ')
        nome_real = input('Nome real do herói: ')
        categoria = input('Categoria (humano, meta-humano, alienigena, deus): ').lower()
        poderes = input('Poderes do herói (separados por vírgula): ').split(',')
        poder_principal = input('Poder principal: ')
        fraquezas = input('Fraquezas do herói (separadas por vírgula): ').split(',')
        niveis_de_forca = {
            'baixo': 1000,
            'medio': 5000,
            'alto': 8000,
            'muito alto': 10000
        }

        while True:
            nivel_forca_str = input('Nível de força (baixo, medio, alto, muito alto): ').lower()
            
            # Verifica se a entrada do usuário é válida
            if nivel_forca_str in niveis_de_forca:
                nivel_forca = niveis_de_forca[nivel_forca_str]  # Atribui o valor numérico
                break
            else:
                print("Por favor, insira uma categoria válida de força: baixo, medio, alto, muito alto.")
        
        # Criando e cadastrando o novo vingador
        vingador = Vingador(nome_heroi, nome_real, categoria, poderes, poder_principal, fraquezas, nivel_forca)
        print(f'\nVingador {vingador.nome_heroi} cadastrado com sucesso!')

        # Espera o usuário pressionar Enter para voltar ao menu principal
        input('\nPressione Enter para voltar ao menu principal.')

        # Volta ao menu principal após o cadastro
        Interface.apresentar_menu_principal()

    @staticmethod
    def listar_vingadores():
        Interface.imprime_titulo_tela('Listando Vingadores...')
        if Vingador.lista_de_vingadores:
            for vingador in Vingador.lista_de_vingadores:
                print(vingador)  # Aqui chamamos o __str__ de cada vingador
        else:
            print('Nenhum vingador cadastrado ainda.')

        # Após listar, pede para pressionar Enter para voltar
        input('\nPressione Enter para voltar ao menu principal.')
        Interface.apresentar_menu_principal()

    @staticmethod
    def ler_opcao_usuario():
        opcao = int(input('Digite sua opção: '))

        if opcao == 1:
            Interface.cadastrar_vingador()
        elif opcao == 2:
            Interface.listar_vingadores()
        elif opcao == 3:
            print('Encerrando o programa...')
            exit()
        else:
            print('Opção inválida. Tente novamente.')
            Interface.voltar_ao_menu_principal()

    @staticmethod
    def voltar_ao_menu_principal():
        input('Pressione ENTER para voltar ao menu principal...')
        os.system('cls' if os.name == 'nt' else 'clear')
        Interface.apresentar_menu_principal()
