using CairoMakie
using Statistics
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

function reg1dim2(x, y)
    n = length(x)
    a = (x'*y - (sum(x)*sum(y))/n) / (sum(abs2.(x)) - abs2(sum(x))/n)
    b = (sum(y) - a*sum(x))/n
    a, b
end


a, b = reg1dim2(x, y)

f = Figure()
ax = Axis(
    f[1, 1],
)

scatter!(ax, x, y, color=:red)
lines!(xs, model(xs; a=a, b=b), color=:black)

f

