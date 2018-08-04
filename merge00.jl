using DistributedArrays

function mergeSort(array)
    if length(array) > 1
        #calculate middle value with integer division
        mid = div(length(array), 2)
        leftArray = array[1:mid]
        rightArray = array[mid+1:length(array)]

        mergeSort(leftArray)
        mergeSort(rightArray)

        i = 1
        j = 1
        k = 1

        Threads.@threads for a in collect(1:max(length(leftArray), length(rightArray)) + 1)# i <= length(leftArray) && j <= length(rightArray)
                if i > length(leftArray) || j > length(rightArray)
                        break
                end
                if leftArray[i] < rightArray[j]
                        array[k] = leftArray[i]
                        i += 1
                else
                        array[k] = rightArray[j]
                        j += 1
                end
                k += 1
        end

        println("leftArray: ", length(leftArray), " rightArray: ", length(rightArray))

        while i <= length(leftArray)
                array[k] = leftArray[i]
                i += 1
                k += 1
        end

        while j <= length(rightArray)
                array[k] = rightArray[j]
                println("K = ", k, " J = ", j)
                j += 1
                k += 1
        end
    end
    return array
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

@time mergeSort(arr)

sorted = localpart(arr)

println(sorted, "\n")
