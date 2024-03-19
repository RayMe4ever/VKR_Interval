frequency = zeros((length(mesh)-1),1);
for i=1:(length(array))
    for k=1:(length(mesh)-1)
        if (array{i}(1))<=(mesh(k)+(mesh(k+1)-mesh(k))/2) && (mesh(k)+(mesh(k+1)-mesh(k))/2)<=array{i}(2)
            frequency(k)=frequency(k)+1;
        end
    end
end

subplot(2,1,2);
xlim([mesh(1) mesh(length(mesh))]);hold on;
ylim([0 max(frequency)+1]);hold on;
for i=1:(length(mesh)-1)
    err=(mesh(i+1)-mesh(i))/2;
    errorbar(mesh(i)+((mesh(i+1)-(mesh(i)))/2),frequency(i),err,'horizontal','black','LineWidth',3);hold on;
end
