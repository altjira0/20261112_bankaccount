# Cuenta bancaria con clases

Programa en Python que simula una cuenta del banco UENO Bank. El usuario escribe su nombre, se le crea una cuenta y, desde un menú, puede ver el saldo, ingresar dinero, retirarlo y ver sus cuentas. Las clases están en un archivo aparte y el programa principal las importa.

## Archivos

El proyecto tiene dos archivos. En `bankLibrary.py` están las clases `Client` y `BankAccount`. En `main.py` está el programa principal, que importa esas clases, crea la cuenta y muestra el menú.

## Cómo ejecutarlo

Abre la carpeta del proyecto en Visual Studio Code y comprueba que los dos archivos están en la misma carpeta. Después ejecuta `main.py`, no `bankLibrary.py`, con el botón de ejecutar o escribiendo en la terminal:

    python main.py

## La clase Client

Representa a la persona que tiene las cuentas. Guarda su nombre en `name` y una lista con sus cuentas en `accounts`, que empieza vacía. Su método `__str__` devuelve el texto de todas sus cuentas separadas por comas, y es lo que se ve al hacer `print` de un cliente.

## La clase BankAccount

Representa una cuenta del banco. Tiene un atributo de clase, `bank_name`, con el valor "UENO Bank", que es igual para todas las cuentas. Cada cuenta guarda además su número en `account_number`, su dueño en `client`, la moneda en `currency` (si no se indica, es "EUR") y el saldo en `balance`, que empieza en 0.

Al crear una cuenta, el constructor la añade a la lista `accounts` de su cliente. Así el cliente siempre sabe qué cuentas tiene.

Los métodos son estos:

- `deposit(amount)` suma la cantidad al saldo y devuelve un mensaje de confirmación.
- `withdraw(amount)` resta la cantidad si hay saldo suficiente y devuelve `True`. Si no hay saldo, no lo toca y devuelve `False`.
- `get_balance()` devuelve el saldo con dos decimales y la moneda, por ejemplo "69.50 EUR".
- `get_bank_name()` devuelve el nombre del banco.
- `__str__()` devuelve el número y el saldo de la cuenta.

## Cómo funciona main.py

Primero importa las clases con `from bankLibrary import Client, BankAccount`. Después pide el nombre del usuario y crea un cliente y una cuenta con el número 12345.

Luego entra en un bucle `while True` que muestra el menú y pide una opción. Con la opción 1 muestra el saldo. Con la 2 pide una cantidad, la convierte a número con `float()` y la ingresa. Con la 3 pide una cantidad e intenta retirarla: si `withdraw()` devuelve `True` confirma la retirada, y si devuelve `False` avisa de que no hay fondos suficientes. Con la 4 muestra las cuentas del cliente. Con la 5 se despide y sale del bucle con `break`. Si se escribe cualquier otra cosa, avisa de que la opción no es válida y vuelve a mostrar el menú.

## Ejemplo de uso

Una prueba completa sería ingresar 100, intentar retirar 500 y después retirar 30.5. El programa rechaza los 500 porque no hay saldo suficiente y, tras retirar 30.5, el saldo queda en 69.50 EUR.

## Notas

Las cantidades con decimales se escriben con punto, por ejemplo 30.5. Si se escribe con coma, `float()` da un error `ValueError` y el programa se detiene.

Si aparece `ModuleNotFoundError: No module named 'bankLibrary'`, revisa que los dos archivos estén en la misma carpeta y que el nombre del archivo esté escrito exactamente igual, con la L en mayúscula.

El saldo solo existe mientras el programa está abierto. Al salir se pierde, porque no se guarda en ningún archivo.
