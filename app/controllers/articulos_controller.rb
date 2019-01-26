class ArticulosController < InheritedResources::Base

  private

    def articulo_params
      params.require(:articulo).permit(:titulo, :escritor, :contenido, :imagen, :noticia)
    end
end