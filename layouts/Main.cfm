<cfoutput>
	<!doctype html>
	<html lang="en">

	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Schedulr</title>
		<meta name="description" content="Schedulr">
		<meta name="author" content="kisdigital.com">
		<base href="#event.getHTMLBaseURL()#" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.2/css/bulma.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
		<script src="https://unpkg.com/vue@2.6.12/dist/vue.js"></script>
		<script src="https://unpkg.com/moment@2.29.1/moment.js"></script>
		<script src="https://unpkg.com/bulma-toast@1.5.1/dist/bulma-toast.min.js"></script>
	</head>

	<body>
		<nav class="navbar" role="navigation" aria-label="main navigation">
			<div class="container">
				<div class="navbar-brand">
					<a class="navbar-item" href="/" style="font-size: 1.2em">
						<i class="fas fa-clock"></i> <strong class="pl-1 pt-1">Schedulr</strong>
					</a>
					<a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
						<span aria-hidden="true"></span>
						<span aria-hidden="true"></span>
						<span aria-hidden="true"></span>
					</a>
				</div>
			</div>
		</nav>
		<div id="app" class="container">#renderView()#</div>
		<script>
			bulmaToast.setDefaults({
				position: 'bottom-right'
			})
		</script>
		<script src="/assets/js/main.js?v=#lcase(createUUID())#"></script>
	</body>

	</html>
</cfoutput>