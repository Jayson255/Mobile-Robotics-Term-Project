
% Problem 1 - Round shaped differential drive robot navigation
% Your control function

function [u, userStructure] = userCtrl(model, environment, userStructure)

    % previously defined value as an example at userInit function
    % used as a global variable, so that this will change as 0, 1, 2, ....
    % at every iteration
    userStructure.exampleVariable = userStructure.exampleVariable + 1;
    
%     1st approach: accelerate (from rest) until midpoint, then decelerate
%     with same magnitude. 
%     Pros: robot almost stops at the intended location.
%     Cons: has a small drift velocity at the end. robot does not
%     completely stop. 
%
%     if model.state(1) > (endx+startx)/2
%         u = [-0.1; 0.1];
%     elseif model.state(1) == endx
%         u = [0; 0];
%     else
%         u = [0.1; 0.1];
%     end
            
%     2nd approach: accelerate car (doesn't matter the acceleration), then
%     when close to goal, decelerate really quickly. Set acc = -velocity.
%     Might need to cap the velocity to something lower than 2m/s.
%     Pros: robot actually comes to a full stop 
%     Cons: robot is kind of far from goal.
%
%     if modelState ~= endx-1
%         u = [0.1; 0.1];
%     end
%     if modelState >= endx-1 && model.state(4)~=0 && model.state(5)~=0
%         u = [model.state(4)*-1; model.state(5)*-1];
%     end
%     if modelState >= endx-1 && model.state(4)==0 && model.state(5)==0
%         u = [0; 0];
%     end

%     Maybe we can combine both approaches 

    startx = userStructure.startPoint(1);
    endx = 4;
    
    if model.state(1) > (endx + startx)/2 && model.state(1) < endx
        u = [-0.1; -0.1];
    elseif model.state(1) >= endx
        u = [model.state(4)*-1; model.state(5)*-1]; 
    else
        u = [0.1; 0.1]
    end
    u

end