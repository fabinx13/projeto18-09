<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Administrativo</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
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

        body{
            background-color:white !important;
        }
   
   </style>
</head>
<body>
    <div class="container mt-4">
        <h2>Login Administrativo</h2>
        <form action="processa_login_admin.php" method="post">
            <div class="form-group">
                <label for="username">Nome de Usuário</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Senha</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
