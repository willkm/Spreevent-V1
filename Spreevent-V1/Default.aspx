<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Spreevent_V1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
    <title>Spreevent</title>

    <link href="https://fonts.googleapis.com/css?family=ABeeZee|Hammersmith+One" rel="stylesheet" />

    <link rel="shortcut icon" href="Imagens/preloader.gif" />
    <!--MEU ESTILO -->
    <link rel="stylesheet" href="/Source/css/estilo.css" />

    <!-- ESTILOS MDL -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="/Source/mdl/material.min.css" />
    <link rel="stylesheet" href="/Source/mdl/styles.css" />
    <link rel="stylesheet" href="/Source/mdl/estilos.css" />
    <script src="/Source/mdl/material.min.js"></script>

    <!-- ESTILOS Bootstrap -->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css" />
    <!-- Bootstrap core CSS -->
    <link href="/Source/mdb/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Material Design Bootstrap -->
    <link href="/Source/mdb/css/mdb.min.css" rel="stylesheet" />
    <style>
        .demonstração-card {
            width: 420px;
            height: 500px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- NAVBAR E DRAWER -->
            <div class="demo-layout mdl-layout mdl-js-layout mdl-layout-drawer mdl-layout--fixed-header">
                <header class="demo-header mdl-layout__header ">
                    <div class="mdl-layout__header-row">
                        <!-- TITULO DA PAGINA -->
                        <img src="Imagens/logo.png" />

                        <div class="mdl-layout-spacer"></div>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-login">
                            Login
                        </button>

                    </div>
                </header>
                <!-- Modal Login -->
                <div class="modal fade modal-ext" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <!--Content-->
                        <div class="modal-content">

                            <!--Header-->
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h3>Login</h3>
                                <div class="mdl-layout-spacer"></div>
                                <asp:Label runat="server" ID="txtErroUser"></asp:Label>
                            </div>

                            <!--Body-->
                            <div class="modal-body">
                                <div class="md-form">
                                    <i class="fa fa-user prefix"></i>
                                    <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control"></asp:TextBox>
                                    <label for="form2">Usuario</label>
                                </div>

                                <div class="md-form">
                                    <i class="fa fa-lock prefix"></i>
                                    <asp:TextBox runat="server" ID="txtSenha" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    <label for="form3">Senha</label>
                                </div>
                                <div class="text-xs-center">
                                    <asp:Button runat="server" ID="btnEntrar" OnClick="btnEntrar_Click" CssClass="btn btn-primary btn-lg" Text="Entrar" />

                                </div>
                            </div>

                            <!--Footer-->
                            <div class="modal-footer">
                                <div class="options">
                                    <p>Não esta cadastrado? <a href="Cadastro.aspx">Cadastrar</a></p>

                                </div>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                        <!--/.Content-->
                    </div>
                </div>



                <!-- CONTEUDO DA PÁGINA ###### INICIO ###### -->

                <main class="mdl-layout__content fundo">

                    <!-- CARTÕES DE EVENTOS E BARRA DE PESQUISA -->
                    <div class="mdl-grid ">

                        <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">
                            <div class="mdl"></div>
                            <div class="mdl-grid fundo-grid"">

                                <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">
                                    <span><P class="n-ev">Eventos em Destaque</P></span>
                                </div>

                                <!-- BARRA DE PESQUISA -->
                                <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">

                                    <span class="espaco-esquerda"></span>

                                    <asp:DropDownList CssClass="select-menu-home" ID="ddlcateg" runat="server"></asp:DropDownList>

                                    <label for="dropList">
                                        <asp:Button OnClick="btnCateg_Click" CssClass="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-button--raised" ID="btnCateg" runat="server" Text="Filtrar" />
                                    </label>

                                    <span class="espaco-direita"></span>
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable ">

                                        <div>
                                            <asp:TextBox runat="server" placeholder="Pesquisar por Nome" ID="txtpesq"></asp:TextBox>
                                        </div>
                                    </div>
                                    <label for="txtpesq" class="material-icons">
                                        <asp:Button CssClass="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-button--raised" OnClick="btnPesq_Click" ID="btnPesq" runat="server" Text="Buscar" />
                                    </label>

                                    <!--FIM DA BARRA DE PESQUISA -->
                                </div>

                                <asp:Repeater runat="server" ID="listRepeater">
                                    <ItemTemplate>
                                        <!-- CARTÕES -->
                                        <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet mdl-cell--8-col-phone ">

                                            <!--Card-->
                                            <div class="card demonstração-card">

                                                <!--Card image-->
                                                <img class="img-fluid" src="<%# Eval("Caminho")%>" />
                                                <!--/.Card image-->

                                                <!--Card content-->
                                                <div class="card-block">
                                                    <!--Title-->
                                                    <h4 class="card-title"><%# Eval("Nome")%></h4>
                                                    <!--Text-->
                                                    <p class="card-text"><%# Eval("Descricao") %></p>
                                                    <div class="mdl-card--border mdl-card__actions mdl-layout">
                                                        <div class="mdl-layout-spacer"></div>
                                                        <a href="evento.aspx?id=<%# Eval("Id") %>" class="btn btn-primary">Ver sobre</a>
                                                    </div>

                                                </div>
                                                <!--/.Card content-->

                                            </div>
                                            <!--/.Card-->
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>

                    <!--FIM DOS CARTÕES DE EVENTOS -->


                    <!-- CONTEUDO DA PÁGINA ###### FIM ###### -->
                    <!-- RODAPÉ -->
                    <footer class="mdl-mini-footer">
                        <div class="mdl-mini-footer__left-section">
                            <div class="mdl-logo">Spreevent</div>
                            <ul class="mdl-mini-footer__link-list">
                                <li><a href="#">Sobre nós</a></li>
                                <li><a href="#">Privacy & Terms</a></li>
                            </ul>
                        </div>
                    </footer>
                </main>
            </div>


            <!-- CONTEUDO DA PÁGINA ###### FIM ###### -->




            <!-- SCRIPTS -->

            <!-- JQuery -->
            <script type="text/javascript" src="/Source/mdb/js/jquery-2.2.3.min.js"></script>

            <!-- Bootstrap tooltips -->
            <script type="text/javascript" src="/Source/mdb/js/tether.min.js"></script>

            <!-- Bootstrap core JavaScript -->
            <script type="text/javascript" src="/Source/mdb/js/bootstrap.min.js"></script>

            <!-- MDB core JavaScript -->
            <script type="text/javascript" src="/Source/mdb/js/mdb.min.js"></script>

        </div>
    </form>
</body>
</html>
