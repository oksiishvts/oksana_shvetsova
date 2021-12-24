function marker!(r::Robot)
    count=0
    num_steps=1
    flag=false
    while flag==false
        for s in [Ost,Nord,West,Sud]
            if count==2
                num_steps+=1
                count=0
            end
            for _ in 1:num_steps
                move!(r,s)
                flag=ismarker(r)
                if flag==true
                    break
                end
            end
            if flag==true
                break
            end
            count=1
        end
    end
end