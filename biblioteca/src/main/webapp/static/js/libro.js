$(document).ready(function(){
	
	aplicarListeners();

	
});



var limparModal = function(){
	$('#id').val('');
	$('#autor').val('');
	$('#titulo').val('');
};


var aplicarListeners = function(){
	$('#modal-libro').on('hide.bs.modal', limparModal);
	
	$('.btn-modificar').on('click', function(e){
		var id = $(this).parents('tr').data('id');
		var url = 'libros/'+id;
		
		$.get(url)
			.done(function(libro){
				$('#id').val(libro.id);
				$('#autor').val(libro.autor.nombre);
				$('#titulo').val(libro.titulo);
				
				$('#modal-libro').modal('show');
			});
	});
	
	
	$('.btn-eliminar').on('click', function(){
		var id = $(this).parents('tr').data('id');
		
		
		$.ajax({
			url : "libros/"+id,
			type: 'DELETE',

		
		    success: function(result) {
		    	$('tr[data-id="'+id+'"]').remove();
				var libro = parseInt( $('#quantidade-libro').text() );
		    	$('#quantidade-libro').text(libro - 1);
		    }
		});
		
		
	});
	
}