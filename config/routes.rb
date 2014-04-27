TableSorterDemo::Application.routes.draw do
  get '/' => 'contacts#home'
  get '/build1' => 'contacts#build1'
  get '/build2' => 'contacts#build2'
  get '/build3' => 'contacts#build3'
  get '/build4' => 'contacts#build4'
  get '/build5' => 'contacts#build5'
  root :to => 'contacts#home'
end
