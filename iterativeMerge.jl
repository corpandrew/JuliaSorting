
function doMerge(a::Array, temp::Array, from::Int64, mid::Int64, to::Int64)
    k = from
    i = from
    j = mid + 1

    @show i, j, k
    @show a
    @show temp

    while i <= mid && j <= to
        if a[i] < a[j]
            temp[k] = a[i]
            k += 1
            i += 1
        else
            temp[k] = a[j]
            k += 1
            j += 1
        end
    end

    @show i, j, k
    @show temp

    while i <= mid
        temp[k] = a[i]
        k += 1
        i += 1
    end

    for i in from:to
        a[i] = temp[i]
    end

end

function mergeSort(a::Array, temp::Array, low::Int64, high::Int64)
    val = low
    for m in [2*m for m in 1:high - low]
        @show m
        for i in low:high
            i = val
            @show i
            from = i
            mid = i + m
            to = min(i + 2*m - 1, high)

            @show from, mid, to

            doMerge(a, temp, from, mid, to)
            val += 2 * m
        end
    end
end

SIZE = 10
srand(1234)
rng = MersenneTwister(1234);
arr = rand(rng, Int8, SIZE)

temp = Array{Int8}(SIZE)

println(arr, "\n")

@time sorted = mergeSort(arr, temp, 1, SIZE)

println(sorted, "\n")
