using CairoMakie
CairoMakie.activate!(type = "png")

set_theme!(
    Theme(
        font="Arial",
        fontsize = 30,
    )
)


x = [1, 2, 4, 6, 7]
xs = range(minimum(x), maximum(x), length=100)
y = [1, 3, 3, 5, 4]

function model(x; a, b)
    @. a * x + b
end

function reg1dim1(x, y)
    x' * y / sum(abs2.(x))
end


a = reg1dim1(x, y)

f = Figure()
ax = Axis(
    f[1, 1],
    title="Linear regression",
    xlabel="x",
    ylabel="y"
)

scatter!(ax, x, y, color=:red)
lines!(xs, model(xs; a=a, b=0), color=:black)

f

