from bankLibrary import Client, BankAccount

nombre = input("Hola, bienvenida a UENO Bank. ¿Cómo te llamas? ")
cliente = Client(nombre)
cuenta = BankAccount("12345", cliente)

print(f"Hola {cliente.name}, tu cuenta es la {cuenta.account_number}.")

while True:
    print("\n1. Ver saldo")
    print("2. Ingresar dinero")
    print("3. Retirar dinero")
    print("4. Ver mis cuentas")
    print("5. Salir")
    opcion = input("¿Qué quieres hacer? ")

    if opcion == "1":
        print("Tu saldo es:", cuenta.get_balance())

    elif opcion == "2":
        cantidad = float(input("¿Cuánto quieres ingresar? "))
        print(cuenta.deposit(cantidad))

    elif opcion == "3":
        cantidad = float(input("¿Cuánto quieres retirar? "))
        if cuenta.withdraw(cantidad):
            print("Retirada hecha. Saldo:", cuenta.get_balance())
        else:
            print("No tienes fondos suficientes. Saldo:", cuenta.get_balance())

    elif opcion == "4":
        print(cliente)

    elif opcion == "5":
        print(f"Gracias por usar {cuenta.get_bank_name()}. ¡Hasta luego!")
        break

    else:
        print("Opción no válida, elige del 1 al 5.")