<?php

include 'db_connect.php';

// Calcular o número de itens no carrinho
$cart_count = 0;
if (isset($_SESSION['cart'])) {
    foreach ($_SESSION['cart'] as $item) {
        $cart_count += $item['quantidade'];
    }
}
?>

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

    body {
        background-color: rgb(30, 30, 30);
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
