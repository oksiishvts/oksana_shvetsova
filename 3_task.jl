function all(r::Robot)
    horizontally=0
    vertical=0
    for side in (Nord,West)
        while !isborder(r,side)
            move!(r,side)
            if side==West
                horizontally+=1
            elseif side==Nord
                vertical+=1
            end
        end 
    end
    while !isborder(r,Sud)
        right(r)
        left(r)
    end
    while !isborder(r,Ost)
        putmarker!(r)
        move!(r,Ost)
    end
    putmarker!(r)
    go(r)
    moves!(r,Sud,vertical)
    moves!(r,Ost,horizontally)
end


function right(r::Robot)
    while !isborder(r,Ost)
        putmarker!(r)
        move!(r,Ost)
    end
    putmarker!(r)
    move!(r,Sud)
end
   

function left(r::Robot)
    while !isborder(r,West)
        putmarker!(r)
        move!(r,West)
    end
    putmarker!(r)
    move!(r,Sud)
end

function go(r::Robot)
    for side in (Nord,West)
        while !isborder(r,side)
            move!(r,side)
        end
    end
end


function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps 
        move!(r,side)
    end
end