# This is an educational example of how R and RStudio can be used 
# to analyze data and produce graphics.

# ��� ������ ����, ��� ����� ������������ ����� R/RStudio 
# ��� ������� ������ � ���������� ��������

# Alexey Knorre, 30.11.2016
# http://alexeyknorre.ru/courses/datavis2016/datavis-6.pdf


# �����������

2 + 2
56 * 32
45 ^ 55

# ����������

x <- 7
x * 10

# ������

hello <- "������, ���� ����� "
name <-"_�������_����_���_"
paste0(hello, name)


# ���������� ���������� x 10 ���:

rep(x, 10)
rep(name, 10)

# �������� ������������������ �����:

seq(1,10)
seq(5,9)
seq(3,9) * 3

# ������ �� ������� seq:
help(seq)

# ������� � ����������
height <- c(145, 167, 176, 123, 150)
height

weight <- c(51, 63, 64, 40, 55)
weight

data <- data.frame(weight, height)
data
data$weight

# ��������� �������:
mean(data$weight)
mean(data$height)

# ��� ����������� ��� � ����:
cor(data$weight, data$height)

# ������� �������������:
table(data$weight, data$height)

## �������

# ������� ��������� ���������:
plot(data$weight, data$height, type = "p") # ���������� "o" "p" "l" "b"

# ����������� �����������:
plot(data$weight, data$height, 
     col = "red", # ������� ���� �������
     pch = 16, # ������ ��� ��������� �� ������. 16 - ����������� �����. ���������� ������ �����
     xlab = "���", # ������� ��� X
     ylab = "����", # ������� ��� Y
     main = "��������� ��������� ���� � �����") # ��������� �����������

## ��������� �����������

# ������� ������, ���� R ��������� �� ���������:
getwd()

# ����� �������� ����� ���������� �� ������� ���� - �� �������� �������� ��� ������������:
setwd("C:/Users/Alexey/Desktop/")

# ��������� ����������� � ������� PNG:

png("test.png")

plot(data$weight, data$height, 
     col = "red", # ������� ���� �������
     pch = 16, # ������ ��� ��������� �� ������. 16 - ����������� �����. ���������� ������ �����
     xlab = "���", # ������� ��� X
     ylab = "����", # ������� ��� Y
     main = "��������� ��������� ���� � �����") # ��������� �����������

dev.off()

## ������ �������� ������: ������ � ��������������� ���� ��, 2016
## ���� ��� ������:
## http://www.vybory.izbirkom.ru/region/izbirkom
## ���������� ������� � ����:
## http://www.vybory.izbirkom.ru/region/region/izbirkom?action=show&root=1&tvd=100100067795854&vrn=100100067795849&region=0&global=1&sub_region=0&prver=0&pronetvd=0&vibid=100100067795854&type=242

# ��������� ������ � ������� � ���������� ������������� �������:
parties <- c("������", 
             "���������� ������",
             "���������� ������ ����������� �� ��������������",
             "������ ������",
             "������ '������'",
             "����������� ���������",
             "����",
             "������ �������� �������",
             "������ �����",
             "����������� ����",
             "������",
             "����",
             "�������� ������",
             "������������ ������")

election_results <- c(1.51, 27, 1.73, 54.2, 
                      0.76, 0.22, 13.14, 
                      0.73, 1.29, 0.14,
                      1.99, 13.34, 0.59, 6.22)

elect_data <- data.frame(parties, election_results)

# ������ ����������� ���������:
barplot(elect_data$election_results)

# �� ��������. ����� ������� � ����
barplot(elect_data$election_results, names.arg = elect_data$parties)

# �� ��� ��� �����������. ���������� ������� �������������:
par(las = 2)
barplot(elect_data$election_results, names.arg = elect_data$parties)

# ������ �����, �� �� ����� �����. ���������� ���������:
barplot(elect_data$election_results, names.arg = elect_data$parties, horiz = TRUE)

# �������� ������ ��������:
par(mar=c(3,16,3,3)) # ������ ������ �������, ����� �������� ����������
barplot(elect_data$election_results, names.arg = elect_data$parties, horiz = TRUE, cex.names = 0.7)

# ����������� �� �������� �������� �������
elect_data <- elect_data[order(elect_data$election_results),]

# ������������ ����������� ������:

png("parties.png") # ����� �������� ������

par(las = 2)
par(mar=c(3,16,3,3)) # ������ ������ �������, ����� �������� ����������
barplot(elect_data$election_results, 
        names.arg = elect_data$parties, 
        horiz = TRUE, 
        cex.names = 0.7,
        xlim = c(0,60), # ����������� ����� ��� X
        main = "���������� ����������� � �� ��, 2016",
        xlab = "���������� ��������������� �� ������, � ���������")

dev.off()
