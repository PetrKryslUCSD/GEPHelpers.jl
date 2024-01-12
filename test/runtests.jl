using Test

using DataDrop
using SparseArrays
using LinearAlgebra
using GEPHelpers: gep_smallest, check_M_orthogonality, check_K_orthogonality

function __load_pencil(b)
    K = DataDrop.retrieve_matrix(b, "/K")
    M = DataDrop.retrieve_matrix(b, "/M")
    K, M
end

function __load_frequencies(b)
    DataDrop.retrieve_matrix(b, "/frequencies")
end

@time @testset "SubSIt" begin
include("test_subsit.jl")
end

@time @testset "KrylovKit" begin
include("test_krylovkit.jl")
end

@time @testset "Arpack" begin
include("test_arpack.jl")
end

@time @testset "ArnoldiMethod" begin
include("test_arnoldimethod.jl")
end

true