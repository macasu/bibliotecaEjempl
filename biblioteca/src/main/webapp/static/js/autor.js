$(document).ready(function(){
	
	aplicarListeners();

	
});



var limparModal = function(){
	$('#id').val('');
	$('#nombre').val('');

};


var aplicarListeners = function(){
	$('#modal-autor').on('hide.bs.modal', limparModal);
	
	$('.btn-modificar').on('click', function(e){
		var id = $(this).parents('tr').data('id');
		var url = 'autores/'+id;
		
		$.get(url)
			.done(function(autor){
				alert(autor.id);
				$('#id').val(autor.id);
				$('#nombre').val(autor.nombre);
				
				$('#modal-autor').modal('show');
			});
	});
	
	
	$('.btn-eliminar').on('click', function(){
		var id = $(this).parents('tr').data('id');
		
		
		$.ajax({
			url : "/biblioteca/autores/"+id,
			type: 'DELETE',

		
		    success: function(result) {
		    	$('tr[data-id="'+id+'"]').remove();
				var autor = parseInt( $('#quantidade-autor').text() );
		    	$('#quantidade-autor').text(autor - 1);
		    }
		    
		});
		
		
	});
	
}