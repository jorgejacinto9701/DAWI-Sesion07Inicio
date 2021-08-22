<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<div class="container" >
<h3>Consulta Disponibilidad </h3>

	<form id="id_form"> 
		<div class="row">
			<div class="col-md-3">		
				<div class="form-group">
					<select id="id_ciclo" name="idCiclo" class='form-control'>
						<option value="-1">[Todos]</option>    
					</select>
			    </div>
		 	</div>
		 	<div class="col-md-3">
		 		<div class="form-group">
		 			<input type="text" id="id_horaInicio" name="horaInicio" placeholder="Hora Inicio" class="form-control">
		 		</div>
		 	</div>
		 	<div class="col-md-3">
		 		<div class="form-group">
		 			<input type="text" id="id_horaFin" name="horaFin"  placeholder="Hora Fin"  class="form-control">
		 		</div>
		 	</div>
		 	<div class="col-md-3">
		 		<div class="form-group">
		 			<button id="id_filtrar"   type="button" class="btn btn-primary" >Filtrar</button>
		 		</div>
		 	</div>
		 </div>   
		 <div class="row">
		 	<div class="col-md-12">
				<div class="content" >
						<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Hora Inicio</th>
												<th>Hora Fin</th>
												<th>D�a</th>
												<th>Ciclo</th>
												<th>Usuario</th>
											</tr>
										</thead>
										<tbody>
												   

										</tbody>
							</table>	
					</div>	
				</div>
		 </div>
		    
	</form>
	
</div>

<script type="text/javascript">

	$.getJSON("cargaCiclo",{}, function(data){ 
		$.each(data, function(i, obj){
			$("#id_ciclo").append("<option value='"+ obj.idCiclo +"'>"+ obj.nombre +"</option>"); 
		});
	});	

	$("#id_filtrar").click(function(){
		
		
	});
	
	function agregarGrilla(lista){
		 $('#id_table').DataTable().clear();
		 $('#id_table').DataTable().destroy();
		 $('#id_table').DataTable({
				data: lista,
				searching: false,
				ordering: true,
				processing: true,
				pageLength: 5,
				lengthChange: false,
				columns:[
					{data: "idDisponibilidad"},
					{data: "horaInicio"},
					{data: "horaFin"},
					{data: "dia"},
					{data: "ciclo.nombre"},
					{data: "usuario.nombreCompleto"}
				]                                     
		    });
	}

	
</script>

</body>
</html>



