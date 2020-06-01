library(nnet)
library(caret)

set.seed(1234)

# loading data
f.data = read.csv("C:/Users/lenovo/Documents/DATA/dataset.csv")

head(f.data)
##some items
##28 by 28 pixels
sample_4 =matrix(as.numeric(f.data[4,-1]), nrow = 28, byrow = TRUE)
image(sample_4, col = grey.colors(255))

f.data$label = as.factor(f.data$label)#response

class(f.data$label)

summary(f.data$label)

str(f.data)
install.packages("h2o")
library(h2o)
h2o.init(max_mem_size = "2G", 
         nthreads = 2, 
         ip = "localhost", 
         port = 54321)


d.hex = as.h2o(f.data, destination_frame= "d.hex")
##hex file is h2o compatible

head(d.hex)

g.split = h2o.splitFrame(data = d.hex,ratios = 0.75)
train = g.split[[1]]#75% training data
test = g.split[[2]]

### 1 hidden layer with 10 neurons 
##ann
fmnist_nn = h2o.deeplearning(x = 2:785,
                             y = "label", 
                             training_frame = train,
                             distribution = "multinomial",
                             model_id = "fmnist_nn",
                             l2 = 0.4,
                             ignore_const_cols = FALSE,
                             hidden = 15, 
                             export_weights_and_biases = TRUE)

h2o.confusionMatrix(fmnist_nn, test)