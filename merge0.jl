function doMerge(arr, left, middleVal, right)

    sizeArrayOne = middleVal - left + 1
    sizeArrayTwo = right - middleVal

    println(sizeArrayOne)
    println(sizeArrayTwo)

    LeftArray = zeros(Int64, sizeArrayOne)
    RightArray = zeros(Int64, sizeArrayTwo)

    for i in collect(Int64, 1:sizeArrayOne)
        LeftArray[i] = arr[left + i]
    end

    for i in collect(Int64, 1:sizeArrayTwo)
        RightArray[i] = arr[middle + 1 + i]
    end

    i = 1
    j = 1
    k = left

    while i < sizeArrayOne + 1 && j < sizeArrayTwo + 1

        if LeftArray[i] <= RightArray[j]
            arr[k] = LeftArray[i]
            i += 1
        else
            arr[k] = RightArray[j]
            j += 1
        end

        k += 1
    end

    while i < sizeArrayOne + 1
        arr[k] = LeftArray[i]
        i += 1
        k += 1
    end

    while i < sizeArrayTwo + 1
        arr[k] = RightArray[i]
        j += 1
        k += 1
    end

    return arr

end

function mergesort(arr, left, right)

    if right > left
        middleVal = ceil((left + right) / 2)

        # println(typeof(middleVal))
        # println(middleVal)
        # println(left)
        # println(right)

        middleVal = convert(Int64, middleVal)

        mergesort(arr, left, middleVal)
        mergesort(arr, middleVal + 1, right)

        doMerge(arr, left, middleVal, right)
    end

end

arr = [38, 27, 43, 3, 9, 82, 10]
println("Given: ", arr)

# println(typeof(length(arr)))

print(mergesort(arr, 1, convert(Int64, length(arr))))
