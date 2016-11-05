class DashboardController < ApplicationController

  def dashboard
    @currentTab = "dashboard"
  end

  def get_income_expenses_per_month
    @expenses = Expense
                  .where("EXTRACT(YEAR FROM date) = ?", DateTime.now.year)
                  .order("date ASC")
                  .group("date_trunc('month', date)")
                  .select("date_trunc('month', date) AS date, SUM(amount) AS amount")

    @months = @expenses.map {|e| e.date.strftime('%b')}
    @expense_amount = @expenses.map(&:amount)

    return {
      labels: @months,
      datasets: [
        {
          label: 'Expenses (€)' ,
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          data: @expense_amount
        }
      ]
    }
  end
  helper_method :get_income_expenses_per_month

  def get_expenses_per_category
    @backgroundColors = get_color_palette false, '0.2'
    @borderColors = get_color_palette false, '1'

    @expenses = Expense
                  .joins(:category)
                  .group("categories.id, categories.description")
                  .select("categories.id AS category_id, categories.description AS description, SUM(amount) AS amount")

    @categories = @expenses.map {|e| e.description}
    @expense_amount = @expenses.map(&:amount)

    return {
      labels: @categories,
      datasets: [
        {
          label: 'Amount (€)' ,
          backgroundColor: @backgroundColors,
          borderColor: @borderColors,
          borderWidth: 1,
          data: @expense_amount
        }
      ]
    }
  end
  helper_method :get_expenses_per_category

  private

    def get_color_palette use_lighter_palette, alpha
      @colors = []

      if use_lighter_palette
        @colors = [
          'rgba(255, 204, 204, ' + alpha + ')',
          'rgba(255, 229, 204, ' + alpha + ')',
          'rgba(255, 255, 204, ' + alpha + ')',
          'rgba(204, 255, 204, ' + alpha + ')',
          'rgba(204, 255, 255, ' + alpha + ')',
          'rgba(204, 229, 255, ' + alpha + ')',
          'rgba(204, 204, 255, ' + alpha + ')',
          'rgba(255, 204, 229, ' + alpha + ')'
        ]
      else
        @colors = [
          'rgba(255, 99, 132, ' + alpha + ')',
          'rgba(54, 162, 235, ' + alpha + ')',
          'rgba(255, 206, 86, ' + alpha + ')',
          'rgba(75, 192, 192, ' + alpha + ')',
          'rgba(153, 102, 255, ' + alpha + ')',
          'rgba(255, 159, 64, ' + alpha + ')',
          'rgba(165, 42, 42, ' + alpha + ')',
          'rgba(51, 51, 205, ' + alpha + ')'
        ]
      end

      return @colors
    end
end
