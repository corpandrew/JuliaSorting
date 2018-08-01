function mergeSort(array)
    println("Splititng ", array)

    # sortedArray = zeros(Int64, length(array))

    if length(array) > 1
        #calculate middle value with integer division
        mid = div(length(array), 2)
        println(mid)
        leftArray = array[1:mid]
        rightArray = array[mid+1:length(array)]

        println(leftArray)
        println(rightArray)

        mergeSort(leftArray)
        mergeSort(rightArray)

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

        println("Merging ", array)

    end
end

arr = [38, 27, 43, 3, 9, 82, 10]

mergeSort(arr)
