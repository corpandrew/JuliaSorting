@everywhere function kernel(a, p, q)
    d = 1 << (p-q)
    #dist = fld(length(a),2)
        @sync @parallel for i=0:(length(a)-1)
        up = ((i>>p) & 2) == 0
        # println(((i & d) == 0 && ((a[i+1] > a[(i | d)+1]))))
        if((i & d) == 0 && ((a[i+1] > a[(i | d)+1]) == up))
            t = a[i+1]
            a[i+1] = a[(i | d)+1]
            a[(i | d)+1] = t
        end
    end
end


@everywhere function bitonicSort(logn, a)
    for i=0:(logn-1)
        for j=0:i
            kernel(a, i, j)
        end
    end
end
