from cryptography.fernet import Fernet

def load_key():
    return open("secret.key", "rb").read()

def decrypt_message(encrypt_message):
    key = load_key()
    f = Fernet(key)
    decrypted_message = f.decrypt(encrypt_message)

    print(decrypted_message)

if __name__ == "__main__":
    decrypt_message(b'gAAAAABfOtdaKRvq5Yw32V2OKE1w39S13GdaTeJxkj9H-zdwny3UbyjcyBv3kmyb90iNS3l-impKjACMBgQnM9ht7Q_3xCs3Yw==')
