Rails.application.routes.draw do
  resources :yogurts
  get 'home/index'
  get 'home/download_pdf_with_prawn'
  get 'home/view_pdf_with_prawn'
  get 'home/download_pdf_with_pdfkit'
  get 'home/view_pdf_with_pdfkit'
  get 'home/download_pdf_with_wickedpdf'
  get 'home/view_pdf_with_wickedpdf'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
