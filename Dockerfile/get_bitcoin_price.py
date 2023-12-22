import requests

def get_bitcoin_price():
    url = "https://api.coingecko.com/api/v3/simple/price"
    params = {"ids": "bitcoin", "vs_currencies": "usd"}
    response = requests.get(url, params=params)

    if response.status_code == 200:
        data = response.json()
        price = data.get("bitcoin", {}).get("usd")
        if price:
            result = "El precio actual de Bitcoin es ${}".format(price)  # Usando format()
        else:
            result = "No se pudo obtener el precio de Bitcoin."
    else:
        result = "Error al conectar con la API de CoinGecko."

    return result

if __name__ == "__main__":
    result = get_bitcoin_price()
    print(result)
