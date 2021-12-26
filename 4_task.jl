function pyramid(r::Robot)
    x, y=coords!(r)
    n=number(r)
    while isborder(r,Nord)==false
        until!(r,n)
        move!(r,Nord)
        n-=1
        west!(r)
    end
    until!(r,n)
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

function number(r::Robot)
    cnt=0
    while isborder(r,Ost)==false
        cnt+=1
        move!(r,Ost)
    end
    while isborder(r,West)==false
        move!(r,West)
    end
    return cnt
end

function until!(r::Robot,n)
    while n>0
        putmarker!(r)
        move!(r,Ost)
        n-=1
    end
    putmarker!(r)
end

function west!(r::Robot)
    while isborder(r,West)==false
        move!(r,West)
    end
end

function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps 
        move!(r,side)
    end
end