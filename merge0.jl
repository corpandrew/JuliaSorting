

@everywhere function mergeSort(array)
    if length(array) > 1
        #calculate middle value with integer division
        mid = div(length(array), 2)
        leftArray = array[1:mid]
        rightArray = array[mid+1:length(array)]

        left = mergeSort(leftArray)
        right = mergeSort(rightArray)

        # println(typeof(left))
        #
        # exit()
        remotecall_fetch(mergeSort(leftArray), wPool)
        remotecall_fetch(mergeSort(rightArray), wPool)

        i = 1
        j = 1
        k = 1

        while i <= length(leftArray) && j <= length(rightArray)
                if leftArray[i] < rightArray[j]
                        array[k] = leftArray[i]
                        i += 1
                else
                        array[k] = rightArray[j]
                        j += 1
                end
                k += 1
        end

        while i <= length(leftArray)
                array[k] = leftArray[i]
                i += 1
                k += 1
        end

        while j <= length(rightArray)
                array[k] = rightArray[j]
                j += 1
                k += 1
        end
    end

end

# function createData(size, seed)
#         rng = MersenneTwister(seed);
#         array = rand(rng, size)
#
#         return array
# end

addprocs(10)

wPool = CachingPool(workers())

rng = MersenneTwister(1234);
arr = rand(rng, 100)

# arr = createData(2000000, 1234)

@time sorted = mergeSort(arr)
