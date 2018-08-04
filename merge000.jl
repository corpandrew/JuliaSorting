using DistributedArrays

function mergeSort(array, left, right)

        #calculate middle value with integer division
        if left < right
                mid = div(length(array), 2)
                mergeSort(array, left, mid)
                mergeSort(array, mid + 1, right)
                merge(array, left, mid, right)
        end
    return array
end

function merge(array, left, mid, right)
        l = left
        r = mid + 1
        i = 1
        for a in collect(i:length(array))
                if l > mid || r > right
                        break
                end
                if array[l] < array[r]
                        array[i] = array[l]
                        l += 1
                else
                        array[i] = array[r]
                        r += 1
                end
                i += 1
        end

        if l > mid
                for a in collect(r:length(array))
                        if(r > right)
                                break
                        end
                        array[i] = array[r]
                        i += 1
                        r += 1
                end
        end

        if r > right
                for a in collect(l:length(array))
                        if(l > mid)
                                break
                        end
                        array[i] = array[l]
                        i += 1
                        l += 1
                end
        end
end
# function createData(size, seed)
#         rng = MersenneTwister(seed);
#         array = rand(rng, size)
#
#         return array
# end

# addprocs(2)

rng = MersenneTwister(1234);

SIZE = 10

arr = rand(rng, SIZE)

# arr = createData(2000000, 1234)

println(arr, "\n")

#distribute arr of one dimension to all procs
distribute(arr)

@time mergeSort(arr, 1, length(arr))

sorted = localpart(arr)

println(sorted, "\n")
