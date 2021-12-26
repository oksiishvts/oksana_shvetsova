function contour!(rob::Robot)
    vertical=moves!(r,Sud)
    horizontally=moves!(r,West)
    landmark=find_border!(rob,Nord,Ost)
    mark_perimetr!(rob,landmark)
    go(r)
    moves!(r,Ost,horizontally)
    moves!(r,Nord,vertical)
end

function go(r::Robot)
    for side in (Sud,West)
        while !isborder(r,side)
            move!(r,side)
        end
    end
end

function moves!(r::Robot,side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end

function find_border!(x::Robot,movement::HorizonSide,border::HorizonSide)
    while isborder(x,border)==false
        if isborder(x,movement)==false
            move!(x,movement)
        else
            move!(x,border)
            movement=inverse(movement)
        end
    end
    return movement
end

function inverse(side) 
    side=HorizonSide(mod(Int(side)+2,4)) 
end

function mark_perimetr!(x::Robot, landmark::HorizonSide)
    if landmark==Nord
        movement=(Nord,Ost,Sud,West)
        border=(Ost,Sud,West,Nord)
    else
        movement=(Sud,Ost,Nord,West)
        border=(Ost,Nord,West,Sud)
    end
    for i in 1:4
        while isborder(x,border[i])==true
            putmarker!(x)
            move!(x,movement[i])
        end
        putmarker!(x)
        if i<4
            move!(x,movement[i+1])
        else
            move!(x,Sud)
        end
    end
end

function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps 
        move!(r,side)
    end
end