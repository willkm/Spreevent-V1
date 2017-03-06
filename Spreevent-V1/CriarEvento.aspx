<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CriarEvento.aspx.cs" Inherits="Spreevent_V1.CriarEvento" %>

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
    <link rel="stylesheet" href="Source/css/estilo.css" />

    <!-- ESTILOS MDL -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="Source/mdl/material.min.css" />
    <link rel="stylesheet" href="Source/mdl/styles.css" />
    <link rel="stylesheet" href="Source/mdl/estilos.css" />
    <script src="Source/mdl/material.min.js"></script>

    <!-- ESTILOS Bootstrap -->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css" />
    <!-- Bootstrap core CSS -->
    <link href="Source/mdb/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Material Design Bootstrap -->
    <link href="Source/mdb/css/mdb.min.css" rel="stylesheet" />
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
                    </div>
                </header>

                <!-- DRAWER -->
               <div class="demo-drawer mdl-layout__drawer mdl-color--blue-400 mdl-color-text--blue-grey-50">
                    <!-- AVATAR -->
                    <header class="demo-drawer-header mdl-layout-drawer">
                        <asp:Repeater runat="server" ID="lvUser">
                            <ItemTemplate>
                                <img src="<%# Eval("Caminho")%>" class="demo-avatar" /></a>
								
							<label for="nome-user" class="mdl-layout-title-nome"><%# Eval("Nome") %></label>
                            </ItemTemplate>
                        </asp:Repeater>
                    </header>

                    <!-- Icones do Drawer -->
                    <nav class="demo-navigation mdl-navigation mdl-color--blue-grey-600">
                        <a class="mdl-navigation__link " href="Home.aspx"><i class="material-icons cor-icone " role="presentation">home</i>Home</a>
                        <a class="mdl-navigation__link" href="CriarEvento.aspx"><i class=" material-icons" role="presentation">today</i>Criar Evento</a>
                        <a class="mdl-navigation__link" href="MeusEventos.aspx"><i class=" material-icons" role="presentation">book</i>Seus Eventos</a>                      
                        <asp:Button runat="server" ID="btnSair" OnClick="btnSair_Click" Text="Sair" CssClass="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-button--raised" />
                    </nav>

                </div>
                <!-- FIM DO DRAWER -->
                <!-- FIM DA NAVBAR E DRAWER -->

                <main class="mdl-layout__content fundo">

                    <div class="mdl-grid ">
                        <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">

                            <div class="mdl-grid ">
                                <div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-tablet mdl-cell--6-col-phone">
                                    <span></span>
                                </div>
                                <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet mdl-cell--12-col-phone fundo-grid">
                                    <p class="n-ev">Criar novo evento</p>
                                    <hr>
                                    <div class="mdl-grid">

                                        <!-- INPUTS DE CRIAÇÃO -->
                                        <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet mdl-cell--8-col-phone fundo-grid">

                                            <!-- NOME DO EVENTO -->
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtNome" class="titulo">Nome do evento :*</label>
                                                <asp:TextBox ID="txtNome" runat="server" CssClass="text-input" placeholder="Nome do evento"></asp:TextBox>
                                            </div>

                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtLocal" class="titulo">Local do evento :*</label>
                                                <asp:TextBox ID="txtLocal" runat="server" CssClass="text-input" placeholder="Endereço do evento"></asp:TextBox>
                                            </div>

                                            <!-- DATA E HORA DO EVENTO -->

                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtDataIni" class="titulo">Data de inicio do evento :*</label><asp:Label ID="erroData" runat="server" Text=""></asp:Label>
                                                <asp:TextBox runat="server" ID="txtDataIni" TextMode="Date"></asp:TextBox>
                                            </div>

                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtHoraIni" class="titulo">Hora de inicio do evento :*</label><asp:Label ID="erroHoraini" runat="server" Text=""></asp:Label>
                                                <asp:TextBox runat="server" ID="txtHoraIni" TextMode="Time"></asp:TextBox>
                                            </div>

                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtDataFim" class="titulo">Data de término do evento :</label><asp:Label ID="erroDataFim" runat="server" Text=""></asp:Label>
                                                <asp:TextBox runat="server" ID="txtDataFim" TextMode="Date"></asp:TextBox>
                                            </div>

                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtHoraFim" class="titulo">Hora de término do evento :</label><asp:Label ID="erroHoraFim" runat="server" Text=""></asp:Label>
                                                <asp:TextBox runat="server" ID="txtHoraFim" TextMode="Time"></asp:TextBox>
                                            </div>


                                        </div>

                                        <div class="mdl-cell mdl-cell--1-col mdl-cell--2-col-tablet mdl-cell--4-col-phone fundo-grid">

                                            <span></span>


                                        </div>

                                        <!-- INPUTS DE CRIAÇÃO 2º COLUNA-->
                                        <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet mdl-cell--8-col-phone fundo-grid">

                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtDescricao" class="titulo">Decrição do evento :*</label>
                                                <asp:TextBox ID="txtDescricao" runat="server" CssClass="text-input" placeholder="Informações do irá acontecer, o que poderá ter, etc... (Max 50 caracteres)" TextMode="MultiLine" Columns="4" Height="150"></asp:TextBox>
                                            </div>

                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="lblddlCategoria" class="titulo">Categoria do evento :*</label>
                                                <div>
                                                    <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="select-menu"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="lblddlTipo" class="titulo">Tipo do evento :*</label>
                                                <div>
                                                    <asp:DropDownList runat="server" ID="ddlTipo" CssClass="select-menu"></asp:DropDownList>
                                                </div>
                                            </div>


                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="lblddlIdade" class="titulo">Classificação de Idade :*</label>
                                                <div>
                                                    <asp:DropDownList runat="server" ID="ddlIdade" CssClass="select-menu"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="fuimg" class="titulo">Imagem do evento :*</label>
                                                <div>
                                                    <asp:FileUpload ID="fuimg" runat="server" /><asp:Label ID="erroImg" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>

                                            <!-- INPUTS DE FOTO -->

                                        </div>
                                        <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet mdl-cell--12-col-phone fundo-grid">
                                        </div>

                                        <div class="mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet mdl-cell--8-col-phone fundo-grid">
                                            <asp:Button runat="server" ID="btnCriar" Text="Criar Evento" OnClick="btnCriar_Click" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" />
                                            <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" OnClick="btnCancelar_Click" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>

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
        <script type="text/javascript" src="Source/mdb/js/jquery-2.2.3.min.js"></script>

        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="Source/mdb/js/tether.min.js"></script>

        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="Source/mdb/js/bootstrap.min.js"></script>

        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="Source/mdb/js/mdb.min.js"></script>

        </div>
    </form>
</body>
</html>
