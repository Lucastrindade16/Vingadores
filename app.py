from model.interface import Interface
from model.vingador import Vingador

def main():

    # Criando alguns vingadores para facilitar os testes
    Vingador('Homem de Ferro', 'Tony Stark', 'Humano', ['Inteligência', 'Engenharia'], 'Armadura', ['Arrogância', 'Álcool'], 100, True, True, True)
    Vingador('Capitão América', 'Steve Rogers', 'Humano', ['Força', 'Agilidade', 'Resistência'], 'Resistência', ['Insegurança', 'Inflexibilidade'], 100)
    Vingador('Thor', 'Thor', 'Deidade', ['Força', 'Imortalidade'], 'Mjolnir', ['Arrogância', 'Orgulho'], 1000)
    Vingador('Hulk', 'Bruce Banner', 'Meta-humano', ['Força', 'Resistência'], 'Transformação', ['Autocontrole', 'Bruce Banner'], 1000)
    Vingador('Pantera Negra', 'T\'Challa', 'Humano', ['Agilidade', 'Força'], 'Vibranium', ['Vingança', 'Orgulho'], 100)
    Vingador('Gavião Arqueiro', 'Clint Barton', 'Humano', ['Precisão', 'Luta'], 'Arco e Flecha', ['Família'], 50)
    Vingador('Capitã Marvel', 'Carol Danvers', 'Humano', ['Força', 'Voo'], 'Força', ['Insegurança', 'Memórias'], 10000)

    Interface().menu_principal()

if __name__ == '__main__':
    main()