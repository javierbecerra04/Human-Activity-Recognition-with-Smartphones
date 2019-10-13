%% Guardar Variables

save('C:\Users\TG1808\OneDrive\TESIS\Datos\variables.mat')

%% Cargar variables

load('C:\Users\TG1808\OneDrive\TESIS\Datos\variables.mat')

%% Importar base de train

train = importfiletrain('train.csv', 2, 7353);

%% Fase de testing

cubicpred = cubicSVM.predictFcn(test);
decisionpred = decisiontree.predictFcn(test);
linearpred = LinearSVM.predictFcn(test);
mediumgaussianpredict = MediumGaussianSVM.predictFcn(test);
quadraticpredict = QuadraticSVM.predictFcn(test);
weightedpred = weightedknnmodel.predictFcn(test);
mediumtreepred = mediumtreemodel.predictFcn(test);
fineknnpred = fineknnmodel.predictFcn(test);
complextreepred = complextreemodel.predictFcn(test);
cosinepred = cosineknnmodel.predictFcn(test);
etiquetas_test = test.Activity(:);

%% Exactitud de modelos

exactitud_SVMcubic = testing(cubicpred,etiquetas_test)
exactitud_decisiontree = testing(decisionpred,etiquetas_test)
exactitud_SVMlinear = testing(linearpred,etiquetas_test)
exactitud_SVMmediumgaussian = testing(mediumgaussianpredict,etiquetas_test)
exactitud_SVMquadratic = testing(quadraticpredict,etiquetas_test)
exactitud_KNNweighted = testing(weightedpred,etiquetas_test)
exactitud_DecisionTreemedium = testing(mediumtreepred,etiquetas_test)
exactitud_KNNfine = testing(fineknnpred,etiquetas_test)
exactitud_DecisionTreecomplex = testing(complextreepred,etiquetas_test)
exactitud_KNNcosine = testing(cosinepred,etiquetas_test)

%% Matrices de confusión

[C1,order1] = confusionmat(cubicpred,etiquetas_test);
[C2,order2] = confusionmat(decisionpred,etiquetas_test);
[C3,order3] = confusionmat(linearpred,etiquetas_test);
[C4,order4] = confusionmat(mediumgaussianpredict,etiquetas_test);
[C5,order5] = confusionmat(quadraticpredict,etiquetas_test);
[C6,order6] = confusionmat(weightedpred,etiquetas_test);
[C7,order7] = confusionmat(mediumtreepred,etiquetas_test);
[C8,order8] = confusionmat(fineknnpred,etiquetas_test);
[C9,order9] = confusionmat(complextreepred,etiquetas_test);
[C10,order10] = confusionmat(cosinepred,etiquetas_test);

%% Análisis de características
caracte = table2array(train(:,1:561));
V = var(caracte);
[B,I] = max(V);