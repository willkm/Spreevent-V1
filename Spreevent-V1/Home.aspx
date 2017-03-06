<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Spreevent_V1.Home" %>

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
    <style>
        .demonstração-card{
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
					</div>
				</header>

				<!-- DRAWER -->
				<div class="demo-drawer mdl-layout__drawer mdl-color--blue-400 mdl-color-text--blue-grey-50">
					<!-- AVATAR -->
					<header class="demo-drawer-header mdl-layout-drawer">
						<a href="Home.aspx">
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
						<asp:Button runat="server" ID="btnSair" Text="Sair" OnClick="btnSair_Click" CssClass="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--accent mdl-button--raised" />
					</nav>

				</div>
				<!-- FIM DO DRAWER -->
				<!-- FIM DA NAVBAR E DRAWER -->

				<!-- CONTEUDO DA PÁGINA ###### INICIO ###### -->

				<main class="mdl-layout__content fundo">



					<!-- CARTÕES DE EVENTOS E BARRA DE PESQUISA -->
					<div class="mdl-grid ">

						<div class="mdl-cell mdl-cell--12-col mdl-cell--12-col-tablet mdl-cell--12-col-phone">
							<div class="mdl"></div>
							<div class="mdl-grid fundo-grid">

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
