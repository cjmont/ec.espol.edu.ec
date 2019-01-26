Rails.application.routes.draw do

  get 'errors/not_found'

  get 'errors/internal_server_error'

  scope '/(:locale)', defaults: { locale: 'es' }, constraints: { locale: /en|es/ } do

  resources :articulos
  resources :nosotros
  resources :noticia
  resources :pedidos
  resources :item_calendarios
  resources :lista
  resources :search
  resources :areas
  resources :estados
  resources :prospecto
  resources :prospectos
  resources :usuariospost
  resources :evento
  resources :corporativopost
  resources :registropost
  resources :descargabrochurepost
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  namespace :api, defaults: {format: 'json'}  do
        resources :prospecto do
          collection do
            #get "role/:role_name"
            get "lista_prospecto"
            get "programas"
            get "diplomados"
          end
        end
        resources :contenido
        resources :noticia
        resources :usuariospost
        resources :evento
        resources :corporativopost
        resources :registropost
        resources :descargabrochurepost
  end
  ActiveAdmin.routes(self)

  #PAGES
  root 'pages#index'
  get 'index'  => 'pages#index'
  get 'conocenos' => 'pages#about'
  get 'calendario' => 'pages#calendario'
  post 'calendario' => 'pages#calendario'
  get 'contenido' => 'pages#contenido'
  get 'programa' => 'pages#programa'
  get 'infocurso' => 'pages#infocurso'  
  get 'capacitaciones' => 'pages#capacitaciones'
  get 'sedes' => 'pages#sedes'
  get 'identidad' => 'pages#identidad'

  #Video
  get 'live' => 'pages#live'

  #DETALLE
  get 'detalle' => 'detalle#show' 
  get 'descargarPDF' => 'detalle#descargarPDF'

  #AREAS 
  get 'getProspectoImg/:id' => 'areas#getProgramas'
  get 'getProspectos/:sector' => 'areas#getProspectos'
  
  #CONTACTO
  get 'contacto' => 'contacts#index'

  #NOTICIA
  get 'noticias/:tipo' => 'noticia#noticia'
  get 'noticias/articulo/:id' => 'noticia#articulo'

  #PROSPECTO
  get 'prospectos' => 'prospecto#index'
  get 'prospectosEsp/:tipo' => 'prospecto#prospectoEspecifico'

  #CONFIRMACION MAIL REGISTRO
  get 'mail_registro' => 'contenido_mailer#confirmacionRegistroCurso'
  
  #AGENDA
  get 'agenda' => 'agenda#index'

  #NOSOTROS
  get 'trayectoria' => 'nosotros#trayectoria'

  #REGISTRO
  get 'registro' => 'registro#index'
  get 'verificarSesion' => 'registro#verificarSesion'
  post 'crear_cuenta' => 'registro#crearCuenta'
  post 'iniciarSesion' => 'registro#iniciarSesion'
  get 'prueba/:id' => 'registro#showPDF'
  get 'enviarCorreoConfirm' => 'registro#enviarCorreoConfirm'

  #CORPORATIVO
  get 'corporativo' => 'corporativo#index'
  get 'registroCorporativo' => 'corporativo#registroCorporativo'
  post 'guardarRegistro' => 'corporativo#guardarRegistro'

  #Google Analytics
  get 'googlee7a038d92569a21a' => 'pages#googlee7a038d92569a21a.html'

  #Politica de la Calidad
  get 'Politicas-de-Calidad' => 'shared#Politicas-de-Calidad.pdf'

  #RUTAS PARA MENSAJES DE ERROR
  
  match "/500", :to => "errors#internal_server_error", :via => :all
  match '/404', :to => 'errors#not_found', :via => :all
  
  #RUTAS MOBILE
  #get 'api/prospecto' => 'prospecto#index'

  namespace 'api' do
    namespace 'prospecto' do
      resources :prospecto
    end
    namespace 'noticia' do
      resources :noticia
    end
    namespace 'usuariospost' do
      resources :usuariospost
    end
    namespace 'evento' do
      resources :evento
    end
    namespace 'corporativopost' do
      resources :corporativopost
    end
    namespace 'registropost' do
      resources :registropost
    end
    namespace 'descargabrochurepost' do
      resources :descargabrochurepost
    end
  end

  resources :agenda  
  resources :contenido
  resources :detalle
  resources :infocurso
  resources :calendarios
  resources :item_calendarios
  resources :listas
  resources :pedidos
  resources :contacts



    # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  end
end
