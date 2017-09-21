class MusicsController < ApplicationController

  def index
    @music = Music.all
  end
  
  def new
  end

  def show
    @music = Music.find(params[:id])
    puts @music
  end
  
  def create
    uploaded_file = music_params[:upload_file]
    puts music_params
    music = {}
    file_data = nil
    upload_date = DateTime.now
    upload_date_str = upload_date.strftime("%Y%m%d%H%M%S")
    output_path = ""
    if uploaded_file != nil
      music[:file_name] = upload_date_str + uploaded_file.original_filename
      file_data = uploaded_file.read
      music[:original_filename] = uploaded_file.original_filename
      music[:upload_date] = upload_date
      folder_path = Rails.root.join('app/assets/audios', music_params[:user] + '/')
      if(!File.exist?(folder_path))
        FileUtils.mkdir(folder_path)
      end
      output_path = Rails.root.join(folder_path, music[:file_name])
    end
    if music_params[:user] != nil
      music[:user_name] = music_params[:user]
    end

    if output_path != ""
      File.open(output_path, 'w+b') do |fp|
        fp.write file_data
      end
    end
    
    @music = Music.new(music)
    respond_to do |format|
      if @music.save
        format.html { redirect_to @music, notice: 'Upload success' }
        format.json { render action: 'show', status: :created, location: @music }
      else
        @music = Music.all
        format.html { render action: 'new' }
        format.json { render json: @music.errors, status: :unprocessable_entitiy }
      end
    end
  end

  def destroy
    @music = Music.find(params[:id])
    puts @music
    puts @music.user_name
    puts @music.file_name
    file_path = Rails.root.join('app/assets/audios/' + @music.user_name + '/', @music.file_name)
    File.delete file_path 
    @music.destroy

    redirect_to musics_path
  end
  
  private
  def music_params
    puts params
    params.require(:music).permit(:user, :upload_file, :original_filename) 
  end
end
