<?php
// Inclua o arquivo de conexão com o banco de dados
include 'db_connect.php';

// Consultar produto específico se o ID for passado via GET
if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $sql = "SELECT * FROM produtos WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else {
        echo "Produto não encontrado.";
        exit();
    }
} else {
    echo "ID do produto não especificado.";
    exit();
}
$cart_count = 0;
if (isset($_SESSION['cart'])) {
    foreach ($_SESSION['cart'] as $item) {
        $cart_count += $item['quantidade'];
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produto</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>



    
<style>
    .navbar {
        background-color: rgb(67, 67, 67) !important;
        position: fixed;
        top: 0;
        width: 100vw;
        padding: .8em;
        z-index: 9999;
        border-bottom: 1px solid #b5b5b5;
    }

    .nav-link,
    .navbar-brand {
        color: white !important;
    }

    .circle {
        border-radius: 50%;
        border-radius: 50%;
        background-color: #007bff;
        color: white;
        padding: 0px 12px;
        text-align: center;
        line-height: 40px;
        font-size: 18px;
        font-weight: bold;
        margin-right: 10px;
    }

    .navbar-text {
        color: white !important;
        font-size: 18px;
    }

    .account {
        .navbar-text {
            padding: 0;
            text-transform: capitalize;
        }

        .nav-link {
            padding: 0;
            color: red !important;
            text-transform: uppercase;
        }
    }

    .tudos{
            background-color: rgb(67, 67, 67) !important;
            color: white;
            box-shadow: 0 4px 8px #007bff;
            border-radius: 5px;
            padding: 15px !important;
            
        }

        
</style>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.php">Olper<b style="color:#007bff">Motors</b></a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.php">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="meus_pedidos.php">Meus Pedidos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="cart.php">Carrinho <span id="cart-count" class="badge badge-pill badge-primary"><?php echo $cart_count; ?></span></a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <?php if (isset($_SESSION['usuario_id'])): ?>
                <li class="nav-item">
                    <span class="navbar-text">Bem-vindo, <?php echo htmlspecialchars($_SESSION['user_name']); ?>!</span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.php">
                        <i class="fas fa-user"></i> Sair
                    </a>
                </li>
            <?php else: ?>
                <li class="nav-item">
                    <a class="nav-link" href="login.php">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cadastrar.php">Cadastrar</a>
                </li>
            <?php endif; ?>
        </ul>
    </div>
</nav>

<div class="container">
  <div class="row">
    <div class="col">
    <img src="admin/uploads/<?php echo htmlspecialchars($row['foto']); ?>" class="img-fluid" alt="<?php echo htmlspecialchars($row['nome']); ?>">            <div class="col-md-6">

    </div>
    <div class="col">
    2 of 2
    </div>
  </div>
  <div class="row">
    <div class="col">
    <img src="admin/uploads/<?php echo htmlspecialchars($row['foto']); ?>" class="img-fluid" alt="<?php echo htmlspecialchars($row['nome']); ?>">            <div class="col-md-6">

    </div>
    <div class="col">
      2 of 3
    </div>


    <div class="container mt-4 tudos">
        <div class="row">
            <div class="col-md-6">
            <img src="admin/uploads/<?php echo htmlspecialchars($row['foto']); ?>" class="img-fluid" alt="<?php echo htmlspecialchars($row['nome']); ?>">            <div class="col-md-6">
                <h2><?php echo htmlspecialchars($row['nome']); ?></h2>
                <p><?php echo htmlspecialchars($row['descricao']); ?></p>
                <h3>R$ <?php echo number_format($row['preco'], 2, ',', '.'); ?></h3>
                <a href="adicionar_carrinho.php?id=<?php echo htmlspecialchars($row['id']); ?>" class="btn btn-success">Adicionar ao Carrinho</a>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>