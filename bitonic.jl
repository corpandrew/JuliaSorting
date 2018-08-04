function bitonic_sort(up, x)

    if length(x) <= 1

        return x

    else

        first = bitonic_sort(true, x[1:(fld(length(x),2))])

        second = bitonic_sort(false, x[fld(length(x),2)+1:end])

        return bitonic_merge(up, vcat(first,second))

    end

end

 

function bitonic_merge(up, x)

    # assume input x is bitonic, and sorted list is returned

    if(length(x) == 1)

        return x

    else

        bitonic_compare(up, x)

        first = bitonic_merge(up, x[1:fld(length(x),2)])

        second = bitonic_merge(up, x[fld(length(x),2)+1:end])

        return vcat(first,second)

    end

end

 

function bitonic_compare(up, x)

    dist = fld(length(x),2)

    for i=1:dist

        if((x[i] > x[i + dist]) == up)

            x[i],x[i + dist] = x[i + dist],x[i] #swap

        end

    end

end

