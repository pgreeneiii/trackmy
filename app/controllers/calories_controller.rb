class CaloriesController < ApplicationController
   before_action :authenticate_user!

   def dashboard
      @calorie = Calorie.new
      cals = current_user.calories.order(date: :asc)

      cals_consumed = []
      cals_deficit = []
      proj_loss = []
      cum_cals = 0
      cum_def = 0
      cum_loss = 0
      milestone = 0

      cals.each do |cal|
         cum_cals += cal.consumed
         cum_def += cal.deficit
         milestone += cal.deficit


         if milestone >= 3500
            milestone = 3500-milestone
            cum_loss += 1
         end

         data = [cal.date, cum_cals]
         cals_consumed.push(data)

         data = [cal.date, cum_def]
         cals_deficit.push(data)

         data = [cal.date, cum_loss]
         proj_loss.push(data)
      end

      @milestone_data = [
         {name: "Projected Cumulative Weight Lost (lbs)", data: proj_loss}
      ]

      @cum_data = [
         {name: "Cumulative Calorie Deficit", data: cals_deficit},
         {name: "Cumulative Calories Consumed", data: cals_consumed}
      ]

      render('calories/dashboard.html.erb')
   end

  def index
    @calories = Calorie.all

    render("calories/index.html.erb")
  end

  def show
    @calorie = Calorie.find(params[:id])

    render("calories/show.html.erb")
  end

  def new
    @calorie = Calorie.new

    render("calories/new.html.erb")
  end

  def create
    @calorie = Calorie.new

    @calorie.user_id = params[:user_id]
    @calorie.consumed = params[:consumed]

    if current_user.tdee != nil
         deficit = current_user.tdee - @calorie.consumed
      else
         deficit = 0
    end

    @calorie.deficit = deficit
    @calorie.date = params[:date]

    save_status = @calorie.save

    if save_status == true
      redirect_to("/calories/dashboard", :notice => "Calorie added successfully.")
    else
      render("calories/new.html.erb")
    end
  end

  def edit
    @calorie = Calorie.find(params[:id])

    render("calories/edit.html.erb")
  end

  def update
    @calorie = Calorie.find(params[:id])

    @calorie.user_id = params[:user_id]
    @calorie.consumed = params[:consumed]

    if current_user.tdee != nil
         deficit = current_user.tdee - @calorie.consumed
      else
         deficit = 0
    end

    @calorie.deficit = deficit

    @calorie.date = params[:date]

    save_status = @calorie.save

    if save_status == true
      redirect_to("/calories/#{@calorie.id}", :notice => "Calorie updated successfully.")
    else
      render("calories/edit.html.erb")
    end
  end

  def destroy
    @calorie = Calorie.find(params[:id])

    @calorie.destroy

    if URI(request.referer).path == "/calories/#{@calorie.id}"
      redirect_to("/", :notice => "Calorie deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Calorie deleted.")
    end
  end
end
