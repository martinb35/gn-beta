#!/bin/env ruby
# encoding: utf-8

class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  skip_authorization_check

  # GET /jobs
  # GET /jobs.json
  def index
    if !session[:user_id]
      redirect_to login_url, :alert => 'Debes iniciar sesion para ver las tareas disponibles'
    else
      if params[:id]
        if params[:status] && params[:revision]
          @user = User.find_by_id (params[:revision])
          @job = Job.find_by_id (params[:id])
          if params[:status].to_i == 4
            Job.find_by_id(params[:id]).update_attributes(:status => 1)
            JobMailer.notify_rejected(@user, @job).deliver
            flash[:notice] = "Gracias, notificaremos al cliente sobre el cambio en esta tarea."
          else
            @employer = User.find_by_id(session[:user_id])
            if @user.email != @employer.email
              if params[:status].to_i == 3
                Job.find_by_id(params[:id]).update_attributes(:status => params[:status])
                JobMailer.notify_accepted(@user, @job).deliver
                flash[:notice] = "Gracias, #{@user.name} se comunicara contigo para realizar esta tarea."
              else
                flash[:notice] = "El link ha caducado (err #{params[:status]})."
              end 
            else
              flash[:notice] = "Hey! estamos para ayudarte, no puedes asignarte tu propia tarea."
            end
          end
        else
          if Job.find_by_id(params[:id]).status == 1
            @cur_user = User.find_by_id(session[:user_id])
            if Job.find_by_id(params[:id]).contact != @cur_user.email
              Job.find_by_id(params[:id]).update_attributes(:status => 2)
              flash[:notice] = "Estamos tramitando la aprobacion de esta tarea. Espera un mensaje de confirmacion en tu buzon de correo."
              JobMailer.notify_assigned(Job.find_by_id(params[:id]), session[:user_id]).deliver
            else
              flash[:notice] = "Hey! estamos para ayudarte, no puedes asignarte tu propia tarea."
            end
          end
        end
      end
      @jobs = Job.all
      @publish = true
      @branding = true
    end
  end
  
  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end
  
  # GET /jobs/new
  def new
    if !session[:user_id]
      redirect_to login_url, :alert => 'Debes iniciar sesión para ver las tareas disponibles'
    end
    @job = Job.new
    @form_id = params[:form_id] || ''
    @branding = false
    case @form_id
    when '3'
      @cls = 'limpieza-hogar'
      @form_name = 'form_limpieza_hogar'
    when '4'
      @cls = 'cocinar-hornear'
      @form_name = 'form_cocinar_hornear'
    when '5'
      @cls = 'otras-tareas-hogar'
      @form_name = 'form_otras_tareas_hogar'
    when '6'
      @cls = 'limpieza-lugar'
      @form_name = 'form_limpieza_lugar'
    when '7'
      @cls = 'ayuda-evento'
      @form_name = 'form_ayuda_evento'
    when '8'
      @cls = 'otras-tareas'
      @form_name = 'form_otras_tareas'
    when '9'
      @cls = 'diseno-multimedia'
      @form_name = 'form_diseno_multimedia'
    when '10'
      @cls = 'it-programacion'
      @form_name = 'form_it_programacion'
    when '11'
      @cls = 'otros-proyectos'
      @form_name = 'form_otros_proyectos'
    when '12'
      @cls = 'viaje-placer'
      @form_name = 'form_viaje_placer'
    when '13'
      @cls = 'viaje-negocios'
      @form_name = 'form_viaje_negocios'
    when '14'
      @cls = 'viaje-grupo'
      @form_name = 'form_viaje_grupo'
    when '16'
      @cls = 'otras-tareas-negocio'
      @form_name = 'form_otras_tareas_negocio'
    else
      @cls = 'otras-tareas'
      @form_name = 'form_otras_tareas'
    end
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to jobs_path, notice: 'Su tarea ha sido publicada!' }
        format.json { render action: 'show', status: :created, location: @job }
      else
        format.html { render action: 'new' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :job_category_id, :level, :floor, :room, :bathroom, :material, :notes, :address, :location_ref, :second_address, :stored_address, :latlong, :when, :offer, :private, :auto_assign, :contact, :status)
    end
    def current_user
      @user = User.find_by_id(session[:user_id])
    end
end
