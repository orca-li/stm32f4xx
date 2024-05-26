param (
    [string]$portName = "COM3",
    [int]$baudRate = 9600,
    [string]$dataToSend = "hello"
)

# Создание объекта SerialPort
$port = new-Object System.IO.Ports.SerialPort
$port.PortName = $portName
$port.BaudRate = $baudRate
$port.Parity = [System.IO.Ports.Parity]::None
$port.DataBits = 8
$port.StopBits = [System.IO.Ports.StopBits]::One

try {
    # Открытие порта
    $port.Open()

    # Отправка данных
    $dataToSendBytes = [System.Text.Encoding]::ASCII.GetBytes($dataToSend)
    $port.Write($dataToSendBytes, 0, $dataToSendBytes.Length)

    # Чтение ответа
    Start-Sleep -Milliseconds 500  # Ждем, чтобы микроконтроллер успел ответить

    $response = ""
    while ($port.BytesToRead -gt 0) {
        $response += [char]$port.ReadByte()
    }

    # Вывод полученного ответа
    Write-Output "Received response: $response"
} catch {
    Write-Error "Ошибка: $_"
} finally {
    # Закрытие порта
    if ($port.IsOpen) {
        $port.Close()
    }
}
