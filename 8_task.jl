function door!(rob::Robot)
    flag=false
    num_steps=1
    while flag==false
        moves!(rob,West,num_steps)
        if (isborder(rob,Nord)==false)
            flag=true
            break
        end
        moves!(rob,Ost,num_steps)

        moves!(rob,Ost,num_steps)
        if (isborder(rob,Nord)==false)
            flag=true
            break
        end
        moves!(rob,West,num_steps)

        num_steps+=1
    end
end

function moves!(rob::Robot, side::HorizonSide, num_step::Int)
    for _ in 1:num_step
        move!(rob, side)
    end
end
