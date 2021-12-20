class HomeController < ApplicationController
  def index
    @welcome = 'welcome guys'
  end

  def download_pdf_with_prawn
    @welcome = 'welcome guys'
    pdf = Prawn::Document.new
    pdf.text @welcome
    _download_pdf_with_prawn(pdf)
  end

  def view_pdf_with_prawn
    @welcome = 'welcome guys'
    pdf = Prawn::Document.new
    pdf.text @welcome
    _view_pdf_with_prawn(pdf)
  end

  def download_pdf_with_pdfkit
    # html = render_to_string(:layout => 'application' , :action => "index.html.erb")
    # html.gsub!("/assets", "#{Rails.root}/public/assets")

    # kit = PDFKit.new(html)
    # kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/application.css"
    # send_data(kit.to_pdf, :filename => "some_name.pdf", :type => 'application/pdf')


    # This line describes what I'd like to do but behaves not like I want ;)
    # Render the ERB template and save the rendered html in a variable
    # I'd also use another layout
    rendered_html = render_to_string(:index)
    kit = PDFKit.new(rendered_html, page_size: 'A4')
    kit.to_pdf

    pdf_file_path = "#{Rails.root}/public/my_list.pdf"
    kit.to_file(pdf_file_path)

    send_file pdf_file_path, type: 'application/pdf'
  end

  def view_pdf_with_pdfkit
      @kit = IMGKit.new(render_to_string)
      send_data(@kit.to_jpg, :type => "image/jpeg", :disposition => 'inline')
  end

  def view_pdf_with_wickedpdf

       # @kit =IMGKit.new "hi", width: 2000, height: 400
       #  send_data(@kit, :type => "image/jpeg", :disposition => 'inline')
      
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'yogurt',
        :template => 'home/index.pdf.erb',
        :layout => 'layouts/pdf.html.erb'
      end
    end
  end

  # def view_pdf_with_pdfkit
  # end


  private
  def _download_pdf_with_prawn(pdf)
    pdf_filename = _build_pdf(pdf)
    send_data pdf.render, :filename => pdf_filename
  end
  def _view_pdf_with_prawn(pdf)
    pdf_filename = _build_pdf(pdf)
    pdf_filename = File.join(Rails.root, pdf_filename)
    send_file(pdf_filename, :filename => pdf_filename, :type => "application/pdf", :disposition => 'inline')
  end
  def _build_pdf(pdf)
    r = SecureRandom.hex(4)
    pdf_filename = "foo_#{r}.pdf"
    pdf.render_file pdf_filename
    return pdf_filename
  end
end
