json.extract! articulo, :id, :titulo, :escritor, :contenido, :imagen, :noticia, :created_at, :updated_at
json.url articulo_url(articulo, format: :json)
