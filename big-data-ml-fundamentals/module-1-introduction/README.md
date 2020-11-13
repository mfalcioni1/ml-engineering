# Module 1
[Introduction to Google Cloud Platform](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/RJDJP/introduction-to-google-cloud-platform)

[Compute Power for Analytic and ML Workloads](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/9hJ1a/compute-power-for-analytic-and-ml-workloads)

[Demo: Creating a VM on Compute Engine](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/wEzlN/demo-creating-a-vm-on-compute-engine)

[Elastic Storage with Google Cloud Storage](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/c64Pa/elastic-storage-with-google-cloud-storage)

[Build on Google's Global Network](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/wdzVk/build-on-googles-global-network)

[Security: On-premise vs. Cloud-native](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/BkWTn/security-on-premise-vs-cloud-native)

[Evolution of Google Cloud Big Data Tools](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/kwvZ7/evolution-of-google-cloud-big-data-tools)
* YOU ARE HERE 11/12

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

## Other Notes

> "If everyone spoke to their phones for 3 minutes, we'd exhaust all available computing resources."

_-Jeff Dean in reference to voice search_

Google uses ML models to help regulate the temperature of its servers. They read sensor data to optimize when cooling can be applied. It has increased cooling efficiency by 40%.

Upon giving user access to data in GCS then you can actually share a link, so for example if you have a picture in storage clicking it will share it.