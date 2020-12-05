# Module 1
[Introduction to Google Cloud Platform](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/RJDJP/introduction-to-google-cloud-platform)

[Compute Power for Analytic and ML Workloads](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/9hJ1a/compute-power-for-analytic-and-ml-workloads)

[Demo: Creating a VM on Compute Engine](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/wEzlN/demo-creating-a-vm-on-compute-engine)

[Elastic Storage with Google Cloud Storage](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/c64Pa/elastic-storage-with-google-cloud-storage)

[Build on Google's Global Network](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/wdzVk/build-on-googles-global-network)

[Security: On-premise vs. Cloud-native](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/BkWTn/security-on-premise-vs-cloud-native)

[Evolution of Google Cloud Big Data Tools](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/kwvZ7/evolution-of-google-cloud-big-data-tools)

[Choosing the Right Approach](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/EY31t/choosing-the-right-approach)

[What You Can Do with GCP](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/Pcg5V/what-you-can-do-with-google-cloud-platform)

[Activity: Explore Real Customer Solution Architectures](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/8dB0I/activity-explore-real-customer-solution-architectures)

[Key Roles in a Data-Driven Organization](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/9b1DF/key-roles-in-a-data-driven-organization)

[Recommendation Systems](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/5IcTZ/how-businesses-use-recommendation-systems)

[Migrating workloads to the cloud](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/s3wa2/approach-move-from-on-premise-to-google-cloud-platform)

[Spark Demo](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/2u8xn/demo-from-zero-to-an-apache-spark-job-in-10-minutes-or-less)

[Introduction to BigQuery](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/hdoRC/introduction-to-bigquery)

[Explore and analyze large datasets with SQL](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/H1irf/bigquery-fast-sql-engine)

[Insights from Geographic Data](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/g8oXx/insights-from-geographic-data)
--12/5 YOU ARE HERE.

## Active Learning Questions

1. What are the four fundamental aspects of Google Cloud core infrastructure?

2. What are the three core AI building block services GCP offers?

3. What is an ASIC?

4. What charges do you incur when a VM is paused?

5. What is the user signature to allow for public permissions?

6. What permission allows users to see GCS objects?

7. What are the four storage classes in GCS and their general definitions?

8. What is the GCP architecture hierarchy?

9. How is Google able to offer compute and storage separated?

10. How is Google able to serve data/application at low latency?

11. How is GCP data stored for security purposes?

12. How is BigQuery data secured?

13. What is different about Dremel?

14. What is the difference between App Engine and Cloud Functions?

15. What are some of the advantages of Google Cloud security?

16. What is Google's search algorithm called?

17. Why is a tool like Hadoop used for recommendation systems?

18. What tool would be used to store realitvely small transactional data (data that can be updated when it is read)?

19. What allows Spark to operate up to 100 times faster than the same Hadoop job?

20. What are some of the shutdown triggers you can leverage for a Dataproc Cluster?

21. How does Dataproc auto-scale?

22. What is the dependency for enabling auto-scaling for Dataproc?

23. Why is Dataproc able to leverage preemptible VMs?

24. Why is it feasible to store data outside of HDFS for Dataproc?

25. What two services is BigQuery comprised of?

26. How is BigQuery data storage different than standard SQL data storage?

27. Can you stream data into BigQuery? If so, what are the limits?

28. How can we use the ARRAY and STRUCT data types in BigQuery?

## Active Learning Answers

1. Security, Compute, Storage, and Networking
![image](https://user-images.githubusercontent.com/15249120/98600141-1d39a080-22ab-11eb-9b9e-1dedfdf476bf.png)

2. Sight, Language, and Conversation
![image](https://user-images.githubusercontent.com/15249120/98600738-0a739b80-22ac-11eb-8844-c9f72319fd7d.png)

3. Application Specific Integrated Chip

4. Disk, no other charges.

5. allUsers

6. Storage Object Viewer

7. Standard, Nearline, Coldline, and Archive
- Standard - Analysis use cases, fastest. In a specific region. Reduced network charges to communicating with compute.
- Nearline - Low-cost, highly durable. Read/Modify once a month
- Coldline - Lower-cost, highly durable. Read/Modify once a quarter
- Archive - Lowest-cost, disaster recovery/back-ups
![image](https://user-images.githubusercontent.com/15249120/99018756-dc4ebf80-2528-11eb-952a-dd7f40283bd0.png)

8. Organizations -> Folders -> Projects -> Resources (i.e. storage a compute)
![image](https://user-images.githubusercontent.com/15249120/99019101-9f36fd00-2529-11eb-8664-aace8c655c99.png)

9. Petabit/second bisection bandwidth (Jupiter Network). Any machine can communicate with any machine.

10. It uses 90+ edge points of presence (PoPs) meshed with public internet to cache the relevant materials close to the end users

11. Stored data is encrypted at rest, and distributed for availabilty and reliability.

12. Envelope encryption. BigQuery table data is encrypted with keys, then those keys are encypted with key encryption.

13. It stores data in a columninar format and auto-scales.

14. App engine is typically used for a continually running web app that can scale to millions of users, while Cloud Functions are meant to be programs that run when a specific event triggers i.e. a file drops in a location.

15. Secure physical hardware, IAM enable fine-grained and company-wide policy setting, audit logging for resource usage and access

16. Rank Brain

17. It allows us to do computation on large datasets in a fault tolerant way.

18. A Relational Database Management System (RDBMS) like mySQL.

19. In memory computation.

20. Idle time, timestamp, duration of wait time, or upon completion of a specific job.

21. Monitoring Hadoop's YARN metrics.

22. Shutting down a cluster's node does not remove any data. We can use Cloud Storage, BigTable, or BigQuery to meet that requirement.

23. Preemptible VMs require the workloads to be batch and fault tolerant. They also require data not to be stored on them. Therefore they integrate well with the Hadoop fault tolerant auto-scaling workloads.

24. Google's petabite bisectional bandwidth. Any server can communicate with another server at full network speed. Therefore it does not make sense to transfer and store files locally any more.

25. BigQuery Storage Service and BigQuery Query Service

26. Data is stored in highly compressed coliminar format in Google's Colossus file system.

27. Yes, 1MB/row and 100,000 rows/second per project.

28. ARRAY can allow us to store multiple values in one "column", while STRUCT lets us nest "joins" within the table itself. Think HEADER and DETAIL. We can use STRUCT here to avoid having two separate tables, and instead nest the table on an order key STRUCT.

## Other Notes

> "If everyone spoke to their phones for 3 minutes, we'd exhaust all available computing resources."

_-Jeff Dean in reference to voice search_

Google uses ML models to help regulate the temperature of its servers. They read sensor data to optimize when cooling can be applied. It has increased cooling efficiency by 40%.

Upon giving user access to data in GCS then you can actually share a link, so for example if you have a picture in storage clicking it will share it.

Rules of thumb for data management tools.
![image](https://user-images.githubusercontent.com/15249120/100690768-4357db00-3355-11eb-8761-b26177675141.png)

![image](https://user-images.githubusercontent.com/15249120/100691009-bc573280-3355-11eb-9ad1-d0255bb68543.png)

![image](https://user-images.githubusercontent.com/15249120/100691146-0dffbd00-3356-11eb-9a2e-d0d5bba33337.png)

BQ Infrastructure
![image](https://user-images.githubusercontent.com/15249120/101265446-9b575e80-3714-11eb-8ebb-95eb9635e6ab.png)
