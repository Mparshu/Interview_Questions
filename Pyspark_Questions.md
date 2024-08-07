## The Problem: You are given a DataFrame df with student data, which includes their names and cumulative GPAs. The DataFrame schema includes columns like student_name and cumulative_gpa.
## Tasks:
1.Find the maximum, minimum, and average cumulative GPA from the DataFrame.
2.Determine the student with the highest GPA and the student with the lowest GPA.
3.Count the number of students whose GPA matches the rounded average GPA.
4.Create a new DataFrame with a schema containing the names of the students with the highest and lowest GPAs, as well as the count of students with the average GPA.
5.Display this new DataFrame.
```
from pyspark.sql.functions import col, max, min, avg, round

# Finding the max, min, and average GPA
max_gpa = df.select(max(col("cumulative_gpa"))).collect()[0][0]
min_gpa = df.select(min(col("cumulative_gpa"))).collect()[0][0]
avg_gpa = df.select(round(avg(col("cumulative_gpa")), 2)).collect()[0][0]

print(max_gpa, min_gpa, avg_gpa)

# Determining the students with the highest and lowest GPAs
max_student = df.filter(col("cumulative_gpa") == max_gpa).select("student_name").collect()[0][0]
min_student = df.filter(col("cumulative_gpa") == min_gpa).select("student_name").collect()[0][0]

# Counting the number of students with the rounded average GPA
avg_count = df.filter(col("cumulative_gpa") == avg_gpa).count()

# Creating a new DataFrame with the required schema
schema = ("top_name string, last_name string, avg_count int")
data = [[max_student, min_student, avg_count]]
final_df = spark.createDataFrame(data, schema)

# Displaying the new DataFrame
display(final_df)
```

## Read CSV in pyspark
```
bike_sharing_data = spark.read.format('csv') \
                    .option("Inferschema", "True") \
                    .option("header", "True") \
                    .option("sep",",") \
                    .load("/home/data/bike_sharing_data.csv")


bike_sharing_data.createOrReplaceTempView('bike_sharing_data)
```

1. How do you optimize the performance of your PySpark jobs?
2. Can you discuss the techniques you use to handle skewed data in PySpark?
3. Can you describe how you've applied Spark optimization techniques in your previous roles?
4. Could you provide an overview of your experience with PySpark and big data processing?
5. Can you explain the basic architecture of PySpark in detail?
6. What are the differences between a DataFrame and an RDD in PySpark, and in what scenarios would you use an RDD?
7. How does PySpark relate to Apache Spark, and what advantages does it offer for distributed data processing?
8. Can you explain the concepts of transformations and actions in PySpark?
9. Could you provide examples of PySpark DataFrame operations that you frequently use?
10. How does data serialization work in PySpark?
11. Can you discuss the significance of choosing the right compression codec for your PySpark applications?
12. How do you handle missing or null values in PySpark?
13. Are there any specific strategies or functions you prefer for handling missing data in PySpark?
14. What are some common challenges you've encountered while working with PySpark, and how have you overcome them?
15. How do you ensure data quality and integrity when processing large datasets with PySpark?
16. Can you share an example of a complex PySpark project you've worked on and the results you achieved?


Difference between pyspark df and pandas df.
Spark DataFrame
Spark DataFrame supports parallelization. 
Spark DataFrame has Multiple Nodes.
It follows Lazy Execution which means that a task is not executed until an action is performed.
Spark DataFrame is Immutable.
Complex operations are difficult to perform as compared to Pandas DataFrame.
Spark DataFrame is distributed and hence processing in the Spark DataFrame is faster for a large amount of data.
sparkDataFrame.count() returns the number of rows.
Spark DataFrames are excellent for building a scalable application.
Spark DataFrame assures fault tolerance.

Pandas DataFrame
Pandas DataFrame does not support parallelization. 
Pandas DataFrame has a Single  Node.
It follows Eager Execution, which means task is executed immediately.
Pandas DataFrame is Mutable.
Complex operations are easier to perform as compared to Spark DataFrame.
Pandas DataFrame is not distributed and hence processing in the Pandas DataFrame will be slower for a large amount of data.
pandasDataFrame.count() returns the number of non NA/null observations for each column.
Pandas DataFrames can’t be used to build a scalable application.
Pandas DataFrame does not assure fault tolerance. We need to implement our own framework to assure it.

### Difference between Actions and Transformations
In PySpark, **transformations** and **actions** are two fundamental types of operations that can be performed on Resilient Distributed Datasets (RDDs).

## Transformations

**Transformations** are lazy operations that create a new RDD from an existing one. They define how the original RDD should be transformed. Some examples of transformations include:

- `map(func)`: Apply a function to each element of the RDD and return a new RDD with the transformed elements.
- `filter(func)`: Return a new RDD containing only the elements that pass the condition specified by the function.
- `flatMap(func)`: Similar to `map()`, but each input item can be mapped to 0 or more output elements.
- `distinct()`: Return a new RDD containing the distinct elements from the source RDD.
- `sample(withReplacement, fraction, [seed])`: Sample a fraction of the RDD elements.

Transformations are lazy, meaning they are not executed until an action is performed. This allows Spark to optimize the execution plan by combining multiple transformations together.

## Actions

**Actions** are operations that trigger the execution of transformations and return a result to the driver program or write data to an external storage system. Some examples of actions include:

- `collect()`: Return all elements of the RDD as an array in the driver program.
- `count()`: Return the number of elements in the RDD.
- `first()`: Return the first element of the RDD.
- `take(n)`: Return an array with the first `n` elements of the RDD.
- `saveAsTextFile(path)`: Write the elements of the RDD to a text file at the specified path.

When an action is called, Spark computes the RDD lineage (the sequence of transformations) and executes the necessary computations to produce the desired result.

## Difference between Transformations and Actions

1. **Execution**: Transformations are lazy and are not executed until an action is performed, while actions trigger the execution of transformations and return a result or write data to an external storage system.

2. **Returning RDD**: Transformations return a new RDD, while actions return values or write data to external storage.

3. **Optimization**: Spark can optimize the execution plan by combining multiple transformations together, but actions force Spark to compute the RDD lineage and execute the necessary computations.

4. **Examples**: Transformations include `map()`, `filter()`, `flatMap()`, `distinct()`, and `sample()`, while actions include `collect()`, `count()`, `first()`, `take()`, and `saveAsTextFile()`.

In summary, transformations define how RDDs should be transformed, while actions trigger the execution of transformations and return results or write data to external storage. Understanding the difference between transformations and actions is crucial for writing efficient and optimized PySpark code.


DAG (Directed Acyclic Graph) is a fundamental concept in PySpark (Python API for Apache Spark) that represents the logical execution plan of a Spark job. It is a directed graph because the operations are executed in a specific order, and it is acyclic because there are no loops or cycles in the execution plan.

In PySpark, when you submit a job, Spark translates the high-level operations (such as transformations and actions) specified in the application code into a DAG of stages and tasks. The DAG represents the dependencies between RDDs (Resilient Distributed Datasets) and the transformations applied to them.

Here are the key points about DAG in PySpark:

1. **Transformations** (like `map()`, `filter()`, `flatMap()`) are lazy operations that create a new RDD from an existing one. They define how the original RDD should be transformed and are represented as edges in the DAG.

2. **Actions** (like `collect()`, `count()`, `saveAsTextFile()`) trigger the execution of transformations and return a result or write data to an external storage system. They are the final nodes in the DAG.

3. **The DAG Scheduler** is responsible for transforming the sequence of RDD transformations and actions into a DAG of stages and tasks. It divides the DAG into stages based on the transformations applied.

4. **Stages** represent a set of tasks that can be executed in parallel. There are two types of stages: shuffle stages (involve data exchange between nodes) and non-shuffle stages.

5. **Tasks** represent a single unit of work that can be executed on a single partition of an RDD. They are the smallest units of parallelism in Spark.

6. **The DAG allows Spark to perform optimizations** like pipelining transformations, caching intermediate results, and reordering tasks to improve performance.

7. **The Spark UI provides a visual representation of the DAG** for each job, which is useful for debugging performance issues and understanding the execution flow.

By understanding the concept of DAG in PySpark, you can write more efficient and optimized code, debug performance problems, and leverage Spark's capabilities to process large-scale data effectively.


Lazy evaluation is a fundamental concept in PySpark that defers the execution of transformations until an action is performed. Here are the key points about lazy evaluation in PySpark:

## What is Lazy Evaluation?

- Lazy evaluation is an evaluation strategy used in PySpark where the execution of transformations is postponed until their results are needed.
- When you apply transformations to an RDD or DataFrame, PySpark doesn't execute them immediately. Instead, it records the transformations in a query plan.
- When you call an action, PySpark evaluates the entire query plan, optimizing it and executing the necessary transformations to produce the result.

## Benefits of Lazy Evaluation

1. **Performance optimization**: By postponing the execution of transformations, PySpark can optimize the execution plan and avoid redundant computations, leading to faster processing times.

2. **Resource efficiency**: Lazy evaluation allows PySpark to minimize the amount of data processed, reducing memory and CPU usage.

3. **Enhanced debugging**: As the execution is deferred until an action is called, you can inspect the execution plan before it is carried out, making it easier to identify potential performance bottlenecks or issues.

## Transformations vs Actions

- **Transformations** are lazy operations that produce a new RDD or DataFrame from an existing one, such as `map`, `filter`, and `reduceByKey`.
- **Actions** trigger the computation and return a result to the driver program or write data to an external storage system, such as `count`, `take`, and `saveAsTextFile`.

## How Lazy Evaluation Works in PySpark

1. **Transformations** are recorded in a query plan, which is a sequence of steps required to compute the final result.
2. **When an action is called**, PySpark evaluates the entire query plan, optimizing it and executing the necessary transformations to produce the result.

## Examples of Lazy Evaluation in Action

```python
from pyspark import SparkConf, SparkContext

conf = SparkConf().setAppName("Lazy Evaluation Example")
sc = SparkContext(conf=conf)

data = [1, 2, 3, 4, 5, 6, 7, 8, 9]
rdd = sc.parallelize(data)

filtered_rdd = rdd.filter(lambda x: x % 2 == 0)
mapped_rdd = filtered_rdd.map(lambda x: x * 2)

result = mapped_rdd.collect()
```

In this example, the `filter` and `map` transformations are not executed until the `collect` action is called. PySpark optimizes the execution plan and applies the necessary transformations to produce the final result.

By understanding and leveraging lazy evaluation, you can significantly improve the performance and resource efficiency of your PySpark applications.