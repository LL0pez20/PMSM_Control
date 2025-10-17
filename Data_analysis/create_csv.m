% File to create CSV
Data1 = out.idq;
TT1 = timeseries2timetable(Data1);
writetimetable(TT, 'idq.csv')

Data2 = out.saida_motor;
TT1 = timeseries2timetable(Data2);
writetimetable(TT, 't_est.csv')