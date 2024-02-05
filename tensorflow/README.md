# TensorFlow on Google Cloud
[Course Link](https://www.cloudskillsboost.google/paths/17/course_templates/12)

## Introduction

The DAGs generated in Tensorflow are language agnostic, so even though you interact with them via Python they execute at a low level language. Tensors are the n-dimensional arrays that are the building blocks for the computation, and how they move through the computational DAG is the "flow".

### API Hierarchy
+ Lowest level is the hardwared
+ Core Tensorflow is C++. This allows you to create cusom OPs.
+ Core Python API is where operations exist
+ Tensorflow components is where all the NN operations live, e.g. metrics, estimators
+ High level APIs like Keras allow you to do things like distributor training
+ Using the estimator API abstracts away the complexities of device placement, memory management, and distribution
+ The Vertex API is orthogonal to this hierarchy.

### Tensors and Variables
+ `x = tf.constant(3)` is a 0 rank tensor with shape `0`.
+ `x = tf.constant([3, 5, 7])` creates a 1 rank tensor with shape `(3,)`
+ `x = tf.constant([[3, 5, 7], [4, 6, 8]])` creates a 2 rank tensor with shape `(2,3)`, a matrix.
+ `x = tf.constant([[[3, 5, 7], [4, 6, 8]], [[1, 2, 3], [4, 5, 6]])` creates a 3D tensor with shape (2,2,3).
You can also define nD tensors as such.
```python
x1 = tf.constant([2, 3, 4])
x2 = tf.stack(x1, x1) #(2,3)
x3 = tf.stack(x2, x2) #(4,2,3)
x4 = tf.stack(x3, x3) #a 4d tensor
```
`tf.Variable` will produce tensors of variable values, or ones that can be modified. This is used for weights in NN.

Tensors can be manipulated similiar to any Python object.
```python
import tensorflow as tf
x = tf.constant([
    [3, 5, 7],
    [4, 6, 8]
    ])

y = x[:, 1] # y is [5, 6]

z = tf.reshape(x, [3, 2])
# z is [[3, 5], [7, 4], [6, 8]]
```

```Python
w = tf.Variable([[1.], [2.]])
x = tf.constant([[3., 4.]])
tf.matmul(w, x) # this will update the weights in w.
```

Definition of a loss gradient to demonstrate `tf.GradientTape()`
```python
def compute_gradients(X, Y, w0, w1):
    with tf.GradientTape() as tape:
        loss = loss_mse(X, Y, w0, w1)
    return tape.gradient(loss, [w0, w1])

w0 = tf.Variable(0.0)
w1 = tf.Variable(0.0)

dw0, dw1 = compute_gradients(X, Y, w0, w1)
```

### YOU ARE HERE
https://www.cloudskillsboost.google/course_sessions/11515770/documents/437713