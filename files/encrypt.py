from cryptography.fernet import Fernet

def encrypt(filename, key):

    f = Fernet(key)
    #reads the file
    with open(filename, "rb") as file:
        file_data = file.read()
        encrypted_data = f.encrypt(file_data)

    #writes the file
    with open(filename, "wb") as file:
        file.write(encrypted_data)

	
