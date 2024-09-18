<?php
// processa_cadastro.php
include 'db_connect.php';

$mensagem = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $senha = password_hash($_POST['senha'], PASSWORD_DEFAULT); // Criptografar a senha

    // Verificar se o email já está cadastrado
    $stmt = $conn->prepare("SELECT id FROM usuarios WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $mensagem = "Email já cadastrado. <a href='cadastrar.php'>Tente novamente</a>.";
    } else {
        // Inserir novo usuário
        $stmt = $conn->prepare("INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $nome, $email, $senha);

        if ($stmt->execute()) {
            $mensagem = "Cadastro realizado com sucesso. <a href='login.php'>Faça login</a>.";
        } else {
            $mensagem = "Erro ao cadastrar: " . $stmt->error;
        }
    }

    $stmt->close();
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado do Cadastro</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: rgb(30, 30, 30);
        }

        .container {
            text-align: center;
        }

        .alert {
            font-size: 1.2rem;
        }
    </style>
</head>

<body>
    <div class="container">
        <?php if ($mensagem): ?>
            <div class="alert <?= strpos($mensagem, 'sucesso') !== false ? 'alert-success' : 'alert-danger' ?>">
                <?= $mensagem ?>
            </div>
        <?php endif; ?>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>