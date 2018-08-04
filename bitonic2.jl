@everywhere function kernel(a, p, q)
    d = 1 << (p-q)
    #dist = fld(length(a),2)
    for i=0:(length(a)-1)
        up = ((i>>p) & 2) == 0
        #println(((i & d) == 0 && ((a[i+1] > a[(i | d)+1]))))
        if((i & d) == 0 && ((a[i+1] > a[(i | d)+1]) == up))
            t = a[i+1]
            a[i+1] = a[(i | d)+1]
            a[(i | d)+1] = t
        end
    end
end



function bitonicSort(logn, a)
    a=SharedArray(a)
    @sync @parallel for i=0:(logn-1)
        for j=0:i
            kernel(a, i, j)
        end
    end
    # return a

end

a = Array{Int64}(16777216)

rng = MersenneTwister(1234);

SIZE = 16777216

arr = rand(rng, SIZE)
# for i=1:16777216 a[i] = i%5 end

@time bitonicSort(24,a)
