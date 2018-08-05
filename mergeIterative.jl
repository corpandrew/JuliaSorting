
function merge(arr, temp, from, mid, to)
    i = from
    j = mid + 1
    k = from

    println( "i = ", i,  " j = ", j, " k = ", k)

    while i <= mid && j <= to
        if arr[i] < arr[j]
            temp[k] = arr[i]
            k += 1
            i += 1
        else
            temp[k] = arr[j]
            k += 1
            j += 1
        end
    end

    while i < mid + 1
        println("k = ", k, " i = ", i)
        temp[k] = arr[i]
        k += 1
        i += 1
    end

    for a in collect(from:to)
        println("a = ", a)
        arr[a] = temp[a]
    end
end

function mergeSort(arr, temp, low, high)

    # low = 1
    # high = length(arr)
    #
    # temp = copy(arr)

#   M is because I dont know how to do
    m = 1
    i = low

    for a in collect(1:high - low)
        println("m = ", m)
        m = 2 * m
        for b in collect(low:high)
            i += 2 * m

            from = i
            mid = i + m - 1
            to = min(i + 2 * m - 1, high)

            println("From ", from, " Mid ", mid, " To ", to, " temp ", temp)

            merge(arr, temp, from, mid, to)
            exit()
        end
    end

end

SIZE = 10
rng = MersenneTwister(1234);
arr = rand(rng, SIZE)

temp = Array{Float64}(SIZE)

println(arr, "\n")

@time sorted = mergeSort(arr, temp, 1, SIZE)

println(sorted, "\n")
