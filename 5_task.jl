function corner!(r::Robot)
    x, y=coords!(r)
    for side in (Nord,Ost,Sud,West)
        while isborder(r,side)==false
            move!(r,side)
        end
        putmarker!(r)
    end
    coords!(r)
    while x>0
        move!(r,Ost)
        x-=1
    end
    while y>0
        move!(r,Nord)
        y-=1
    end
end

function coords!(r::Robot)
    x, y = 0, 0
    while isborder(r,Sud)==false
        move!(r,Sud)
        y+=1
    end
    while isborder(r,West)==false
        move!(r,West)
        x+=1
    end
    return x, y
end