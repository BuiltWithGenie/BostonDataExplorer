module App

using GenieFramework
using CSV
using DataFrames
using PlotlyBase

@genietools

const data = CSV.File("data/HousingData.csv") |> DataFrame

@app begin
    @out tab = "home"
    @out housing_data = DataTable(data)
    @out housing_data_pagination = DataTablePagination(rows_per_page=100)

    # Scatter Plot
    @out scatter_trace = [scatter(
        x=data[:, "RM"],
        y=data[:, "MEDV"],
        mode="markers",
        marker=attr(size=10, color="rgba(255, 182, 193, .9)"),
        name="Rooms vs Median Value"
    )]
    @out scatter_layout = PlotlyBase.Layout(
        title="Scatter Plot: Number of Rooms vs Median Value",
        xaxis_title="Number of Rooms",
        yaxis_title="Median Value"
    )
    
    # Histogram
    @out hist_trace = [histogram(x=data[:, "MEDV"], name="Median Value Distribution")]
    @out hist_layout = PlotlyBase.Layout(
        title="Histogram: Median Value Distribution",
        xaxis_title="Median Value",
        yaxis_title="Frequency"
    )

    # Box Plot
    @out box_trace = [box(y=data[:, "MEDV"], name="Median Value")]
    @out box_layout = PlotlyBase.Layout(
        title="Box Plot: Distribution of Median Value",
        yaxis_title="Median Value"
    )
end

@page("/", "app.jl.html")
end
