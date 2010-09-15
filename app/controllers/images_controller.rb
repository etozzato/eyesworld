class ImagesController < ApplicationController
  
  before_filter :login_required, :only => [:new]
  skip_before_filter :verify_authenticity_token, :only => [:create]
  
  require 'RMagick'
  include Magick

  CTYPE_TO_EXT = {
    'image/jpeg' => 'jpg',
    'image/gif'  => 'gif',
    'image/png'  => 'png',
  }

  ACCEPTED_FORMATS = ["jpg", "jpeg" ,"png", "gif"]

  def new
  end
  
  def create
    begin
      render(:xml => 'true') if saveFileAttachment(params[:Filedata], params[:token])
    rescue => ex
      logger.info "Erro: [#{Time.now.utc}] #{ex}"
    end
    return false
  end
  
  protected

  def saveFileAttachment(pFile, token)
    
    token = Token.find_by_rand(token)
    raise StandardError.new('Authentication Error') unless token
    user = token.user
    
    token.delete
    
    metadata = to_attachment(pFile)
    
    if ACCEPTED_FORMATS.include?(metadata[:file_ext].downcase)
      
    else
      raise StandardError.new('Image format not accepted')
    end
    
  end
  
  def to_attachment(pFile)
    # NOTE: parses file to determine object meta-data
    ext = (pFile.original_filename.split(".").last || "ext").downcase
    { :original_filename => pFile.original_filename,
      :file_ext => pFile.original_filename.split(".").last || "ext",
      :original_ext => pFile.original_filename.split(".").last || "ext",
      :size => pFile.size }
  end
  
end