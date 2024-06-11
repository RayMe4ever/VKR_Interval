%Считаем поточечную медиану для одного датасета, потом сделаю функцию которая будет
%давать много b1 и b0 со всех датасетов и сравним как там считает
function [b1_list,b0_list] = evaluate_b1_b0(tableName)
b1_list=[];
b0_list=[];
    myarray=evalin('base', tableName);
    for i=1:(size(evalin('base', tableName),1))
        x_min_1=myarray{i,1}-myarray{i,3};%that rect
        x_max_1=myarray{i,1}+myarray{i,3};
        y_min_1=myarray{i,2}-myarray{i,4};
        y_max_1=myarray{i,2}+myarray{i,4};
        points_1={[x_min_1,y_max_1],[x_max_1,y_max_1],[x_min_1,y_min_1],[x_max_1,y_min_1]};
        for j=2:(size(evalin('base', tableName),1))
            if (j>i)
                x_min_2=myarray{j,1}-myarray{j,3};%another rect
                x_max_2=myarray{j,1}+myarray{j,3};
                y_min_2=myarray{j,2}-myarray{j,4};
                y_max_2=myarray{j,2}+myarray{j,4};
                points_2={[x_min_2,y_max_2],[x_max_2,y_max_2],[x_min_2,y_min_2],[x_max_2,y_min_2]};
                b1_max=-Inf;
                b1_min=Inf;
                for k=1:4
                    for l=1:4
                        b1=(points_2{l}(2)-points_1{k}(2))/(points_2{l}(1)-points_1{k}(1));
                       if b1>b1_max
                            b0_min=points_1{k}(2)-b1*points_1{k}(1);
                           b1_max=b1;
                       end
                       if b1<b1_min
                           b0_max=points_1{k}(2)-b1*points_1{k}(1);
                           b1_min=b1;
                       end
                    end
                end          
            end
        b1_list=cat(1,b1_list,b1_min,b1_max);
        b0_list=cat(1,b0_list,b0_min,b0_max);
        end
    end
% result = [b1_list,b0_list];

    