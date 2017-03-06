<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Evento.aspx.cs" Inherits="Spreevent_V1.WebForm1" %>

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
                        <a class="mdl-navigation__link" href="MeusEventos.aspx"><i class=" material-icons" role="presentation">book</i>Meus Eventos</a>
                        

                        <asp:Button runat="server" ID="btnSair" OnClick="btnSair_Click" Text="Sair" CssClass="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-button--raised" />
                    </nav>

                </div>
                <!-- FIM DO DRAWER -->
                <!-- FIM DA NAVBAR E DRAWER -->

                <!-- CONTEUDO DA PÁGINA ###### INICIO ###### -->
                <main class="mdl-layout__content fundo">
                    <div class="mdl-grid ">

                        <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">

                            <div class="mdl-grid fundo-grid">
                                <asp:ListView runat="server" ID="lista">
                                    <ItemTemplate>
                                        <div class="mdl-cell mdl-cell--5-col mdl-cell--7-col-tablet mdl-cell--9-col-phone ">

                                            <div class="evt-caixa">
                                                <!--Card image-->
                                                <img class="evt-tam-img" src="<%# Eval("Caminho")%>" />
                                                <!--/.Card image-->
                                            </div>
                                            <br />
                                            <label>Descrição</label>
                                            <textarea disabled><%# Eval("Descricao")%></textarea>
                                        </div>
                                        <div class="mdl-cell mdl-cell--1-col linha-direita"></div>

                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                            <h2>
                                                <asp:Label runat="server" ID="txtNome"><%# Eval("Nome")%></asp:Label></h2>
                                            <div class="mdl-grid">

                                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                                    <h5>Categoria do evento : </h5>
                                                    <asp:Label runat="server" ID="txtCateg"><%# Eval("Categoria")%></asp:Label>
                                                </div>

                                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                                    <h5>Restrição de Idade : </h5>
                                                    <asp:Label runat="server" ID="txtIdade"><%# Eval("Restricao")%></asp:Label>
                                                </div>

                                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                                    <h5>Tipo de Evento : </h5>
                                                    <asp:Label runat="server" ID="txtTipo"><%# Eval("Tipo")%></asp:Label>
                                                </div>

                                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                                    <h5>Endereço : </h5>
                                                    <asp:Label runat="server" ID="txtEndereco"><%# Eval("Endereco")%></asp:Label>
                                                </div>

                                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                                    <h5>Data Inicio : </h5>
                                                    <asp:Label runat="server" ID="txtDIni"><%# Eval("DataInicio")%></asp:Label>
                                                </div>

                                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                                    <h5>Data Fim : </h5>
                                                    <asp:Label runat="server" ID="txtDFim"><%# Eval("DataFim")%></asp:Label>
                                                </div>

                                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                                    <h5>Hora Inicio : </h5>
                                                    <asp:Label runat="server" ID="txtHIni"><%# Eval("HoraIn")%></asp:Label>
                                                </div>

                                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                                    <h5>Hora Fim : </h5>
                                                    <asp:Label runat="server" ID="txtHFim"><%# Eval("HoraFim")%></asp:Label>
                                                </div>
                                               
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--4-col-tablet mdl-cell--2-col-phone ">
                                </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                    <asp:repeater ID="rpUser" runat="server">
                                        <ItemTemplate>
                                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                                <h5>Organizador(a) : </h5>
                                                <asp:Label runat="server" ID="lblUserName"><%# Eval("Nome")%></asp:Label>
                                            </div>
                                            </ItemTemplate>
                                        </asp:repeater>
                                </div>
                                <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--12-col-phone ">
                                </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                </div>
                                <div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-tablet mdl-cell--6-col-phone">
                                    <asp:Button runat="server" Text="EDITAR EVENTO" ID="editarevento" OnClick="editarevento_Click" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" />                                 
                                </div>
                                <div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-tablet mdl-cell--6-col-phone">                                    
                                    <asp:Button runat="server" Text="EXCLUIR" ID="excluir" OnClick="excluir_Click" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" />
                                </div>
                            </div>
                        </div>



                    </div>
                    <!-- FIM DO CONTEUDO MAIN -->



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