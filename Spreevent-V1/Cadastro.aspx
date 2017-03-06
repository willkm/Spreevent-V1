<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="Spreevent_V1.Cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
    <title>Spreevent</title>

    <link href="https://fonts.googleapis.com/css?family=ABeeZee|Hammersmith+One" rel="stylesheet" />

    <link rel="shortcut icon" href=a/>
    <!--MEU ESTILO -->
    <link rel="stylesheet" href="spreevent/Source/css/estilo.css" />

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



                <!-- FIM DO DRAWER -->
                <!-- FIM DA NAVBAR E DRAWER -->


                <main class="mdl-layout__content fundo">

                    <!-- DAQUI PRA FENTE DEVE SER ADICIONADO O CONTEUDO -->


                    <div class="mdl-grid ">

                        <div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">

                            <div class="mdl-grid ">
                                <div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-tablet mdl-cell--6-col-phone">
                                    <span></span>
                                </div>
                                <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet mdl-cell--12-col-phone fundo-grid">
                                    <p class="n-ev">Crie sua conta</p>
                                    <hr>
                                    <div class="mdl-grid">

                                        <!-- INPUTS DE CRIAÇÃO -->
                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtNome" class="titulo">Nome :</label>
                                                <asp:TextBox runat="server" ID="txtNome"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtNome" class="titulo">Sobrenome :</label>
                                                <asp:TextBox runat="server" ID="txtSobrenome"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                            <div class="select mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="ddlIdade" class="titulo">Sexo</label><br />
                                                <asp:RadioButtonList ID="rbtSexo" runat="server"
                                                    RepeatDirection="Horizontal" RepeatLayout="Table">
                                                    <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                                                    <asp:ListItem Text="Feminino" Value="F"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </div>

                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtDataInicio" class="titulo">Data de Nascimento :</label>
                                                <asp:TextBox runat="server" ID="txtDataNasc" TextMode="Date"></asp:TextBox>
                                                <asp:Label runat="server" ID="erroData"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">

                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtNome" class="titulo">Usuário :</label>
                                                <asp:TextBox runat="server" ID="txtUsuario"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtNome" class="titulo">Senha :</label>
                                                <asp:TextBox TextMode="Password" runat="server" ID="txtSenha"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--6-col-tablet mdl-cell--8-col-phone fundo-grid">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtNome" class="titulo">Confirmar senha :</label>
                                                <asp:TextBox TextMode="Password" runat="server" ID="txtConfirmar"></asp:TextBox>
                                                <asp:Label runat="server" ID="lblErro" ForeColor="Red"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="txtNome" class="titulo">Email :</label>
                                                <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet mdl-cell--10-col-phone ">
                                            <div class="select mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <label for="fuimg" class="titulo">Selecione uma imagem</label><br />
                                                <asp:FileUpload runat="server" ID="fuimg"></asp:FileUpload>
                                                <asp:Label runat="server" ID="erroImg"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="mdl-cell mdl-cell--8-col mdl-cell--10-col-tablet mdl-cell--12-col-phone fundo-grid">
                                        </div>

                                        <div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-tablet mdl-cell--6-col-phone">

                                            <asp:Button runat="server" ID="btnCriar" CssClass="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-button--raised" Text="Cria Conta" OnClick="btnCriar_Click" />

                                        </div>

                                        <div class="mdl-cell mdl-cell--2-col mdl-cell--4-col-tablet mdl-cell--6-col-phone">
                                            <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" OnClick="btnCancelar_Click" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>





                    <!-- CONTEUDO DA PÁGINA ###### FIM ###### -->
                    <!-- RODAPÉ -->
                    <footer class="mdl-mini-footer ">
                        <div class="mdl-mini-footer__left-section ">
                            <div class="mdl-logo ">Spreevent</div>
                            <ul class="mdl-mini-footer__link-list ">
                                <li><a href="# ">Sobre nós</a></li>
                                <li><a href="# ">Privacy & Terms</a></li>
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
