<?php
session_start();
if (!isset($_SESSION['admin_logged_in']) || !$_SESSION['admin_logged_in']) {
    header("Location: login.php");
    exit;
}
?>


<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Produto</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<style>
        .container {
            background-color: rgb(67, 67, 67) !important;
            color: white;
            box-shadow: 0 4px 8px #007bff;
            padding: 1em;
            border-radius: 15px;
            width: 500px;

            input {
                background-color: rgb(41, 41, 41) !important;
                border: none;
                color: white !important;
            }

            button{
                width: 100%;
                margin-top: 20px
            }
        }
        .navbar{
        background-color: rgb(67, 67, 67) !important;
        top: 0;
        width: 100vw;
        padding: .8em;
        z-index: 9999;
        border-bottom: 1px solid #b5b5b5;
        }

        .navbar-brand{
        color: white !important;
    }

    .fundo{
        background-color: rgb(41, 41, 41) !important;
        color:white !important;
    }
    </style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand"><strong>Admin</strong></a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <!-- Botão para consultar pedidos -->
                <li class="nav-item">
                    <a href="consultar_pedidos.php" class="btn btn-info mr-2">Consultar Pedidos</a>
                </li>
                <!-- Botão para sair -->
                <li class="nav-item">
                    <a href="list_products.php" class="btn btn-danger">Sair</a>
                </li>
            </ul>
        </div>
    </nav>


    <div class="container mt-4">
        <h2>Criar Produto</h2>
        <form action="processa_create_product.php" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="nome">Nome</label>
                <input type="text" class="form-control" id="nome" name="nome" required>
            </div>
            <div class="form-group">
                <label for="descricao">Descrição</label>
                <textarea class="form-control fundo" id="descricao" name="descricao" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label for="preco">Preço</label>
                <input type="number" step="0.01" class="form-control" id="preco" name="preco" required>
            </div>
            <div class="form-group">
                <label for="foto">Foto</label>
                <input type="file" class="form-control" id="foto" name="foto" required>
            </div>
            <button type="submit" class="btn btn-primary">Criar Produto</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>