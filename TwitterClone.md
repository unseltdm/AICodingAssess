## Design a Scalable Twitter Clone in the Cloud

Imagine you are tasked with building a basic Twitter clone in the cloud (using GCP or another
cloud platform).
1) Define a Minimum Viable Product (MVP): Start by outlining a basic set of features that
you would include in a minimal version of the application. What core functionality must
be supported?
    - Core functionality required for a basic Twitter clone:
      1. User registration and login
      2. Posting tweets
      3. Following users
      4. User engagement (e.g., liking, commenting, and retweeting)
      5. Search functionality

2) Identify Required Cloud Resources: Describe the cloud resources you would use to build
and deploy this MVP. How would you connect and configure them?
    - Google Compute Engine to host application: This would be used to create virtual machines
    - Google Cloud SQL for PostgreSQL database storage (e.g., user information, tweets)
      1. Thoughts on storage capacity: 1 TB to store tweets, user information, and media files should be enough initially, however, depending on the amount of traffic and popularity of the application, storage requirements will need to be increased. 
    - Google Cloud Storage for object storage
    - Google Cloud Content Delivery Network (CDN): Using this service will improve user experience by utilizing cached information at edge locations to deliver content faster and more efficiently to users
    - Google Cloud Monitoring and Google Cloud Logging to monitor application performance and gather insights to drive MVP improvements
      1. Compute and database metrics: CPU usage, memory usage, disk I/O, and network traffic
      2. Application performance metrics: Response time, error rate, and availability
    - Google Cloud Build for deployment

3) Scaling Strategy: After launching the MVP, explain how you would scale the system to
handle growing user traffic. What resources or architectural changes would be
necessary for scaling?
    - Initially, one would consider either scaling up by increasing CPU or memory of our current virtual machines or scaling out by adding more virtual machines. However, it is worth taking the time to investigate if the application code could be optimized more as well as if additional architecture could be put in place to manage the increased user traffic. We could implement additional services and techniques including
      1. Further optimizing Google Cloud Content Delivery Network (CDN) for caching
      2. Introduce Google Cloud Load Balancing to minimize overloading of resources and provide a better, dynamic management of usage of resources as user traffic increases and decreases with time
      3. Implement database sharding to partition data across multiple servers by different criteria, such as geographic location or date range
  
4) Additional Features & Considerations: As the application grows, new features might be
added. Discuss any potential additional features and the cloud resources you would
need to support them.
    - Live Streaming
      1. Implement live streaming service that can encode, transmit, and deliver live video
      2. Implement a video player that can be used across multiple platforms
      3. Implement security and privacy settings through encryption, authentication, and access controls
  
5) Key Questions: What critical questions would you need to address as you plan the
system’s architecture and scaling strategy?
    - What is the expected user traffic?
    - What is the expected data volume?
    - What are the use cases and user requirements?
    - What are the performance and scalability goals?
    - What are the security and privacy requirements?
    - What are the infrastructure and technology requirements?
    - What are the deployment and maintenance requirements?
  
      
