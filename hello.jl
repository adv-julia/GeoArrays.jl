using GeoArrays
using BenchmarkTools
# using GeoFormatTypes
# using ArchGDAL
# using CoordinateTransformations
using StaticArrays
using Test
using CoordinateTransformations
# const GFT = GeoFormatTypes
# bbox(;xmin, ymin, xmax, ymax) = bbox(xmin, ymin, xmax, ymax)

# x = bbox(1, 2, 3, 4)
# y = bbox(xmin = 1, ymin = 2, xmax = 3, ymax = 4)
file = "N:/Research/phenology/phenologyTP/INPUT/tif/v015/PML2_yearly_dynamic2014-01-01.tif"
ga = GeoArrays.read(file)
# coords(x)
# @testset "coords" begin
    straight = GeoArray(rand(5, 5, 1), AffineMap([1.0 0.0; 0.0 -1.0], [375000.03, 380000.03]), "")
    rot = GeoArray(rand(5, 5, 1), AffineMap([1.0 0.5; 0.1 1.0], [0.0, 0.0]), "")

    @test coords(straight, :x) == collect(375000.03:1:375005.03)
    @test coords(straight, :y) == collect(380000.03:-1:379995.03)
    @test_throws ErrorException coords(straight, :z)
    @test_throws ErrorException coords(rot, :x)
    @test_throws ErrorException coords(rot, :y)
# end
# Generate coordinates for complete GeoArray
range = bbox(ga)

l = get_coords(ga)

@time X, Y = get_coords(ga)
# @time coords(ga)
bbox(ga)

X2 = coords(ga, :x)
Y2 = coords(ga, :y)

coords(ga)
