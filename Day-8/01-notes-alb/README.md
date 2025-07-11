# Application Load Balancer (ALB) – HTTP with EC2 Targets

This guide explains the core components of an AWS **Application Load Balancer (ALB)** using the **HTTP protocol** and **EC2 instances as targets**. It first presents a technical explanation, followed by a real-world analogy (gated community) to simplify the concepts.

---

## 1. What is an Application Load Balancer (ALB)?

### Technical Definition:
An **Application Load Balancer (ALB)** is a Layer 7 load balancer that handles HTTP and HTTPS traffic. It distributes incoming application traffic across multiple targets (such as EC2 instances) in one or more Availability Zones, improving availability and fault tolerance.

- Operates at the **Application Layer** (OSI Layer 7)
- Accepts **HTTP** traffic on a specified port (e.g., 80)
- Routes traffic to registered targets in a **target group**
- Performs **health checks** on targets to ensure traffic is only sent to healthy ones

### Real-World Analogy:
Think of the ALB as the **main gate of a gated community**. All visitors (users) come to this gate, and from there, they are directed to the right house (EC2 instance) that is open and ready to serve.

---

## 2. Target Groups

### Technical Definition:
A **Target Group** is a logical grouping of backend resources (in this case, EC2 instances). ALB sends traffic to the registered and healthy instances in the group.

- Target type: `instance`
- Protocol: `HTTP`
- Port: commonly `80`
- You can associate a Target Group with one or more Listeners

### Real-World Analogy:
A target group is like a **set of houses in the community that all serve food**. When visitors arrive asking for food service, the gate will send them to any house in this food-service group that is currently open and healthy.

---

## 3. Health Checks

### Technical Definition:
A **Health Check** is a periodic ping sent by the ALB to each target (EC2 instance) to determine its availability and readiness to serve requests.

- Protocol: `HTTP`
- Path: `/health` or any other valid endpoint
- Port: `traffic-port` (port the target listens on, usually 80)
- Thresholds: define how many successes/failures mark the target healthy/unhealthy
- Interval & Timeout: define frequency and responsiveness

Only **healthy** targets receive traffic.

### Real-World Analogy:
Before the gate (ALB) sends visitors to a house, it calls each house every 30 seconds to ask: “Are you open?” If the house answers, “Yes, I’m ready,” it remains in service. If not, the gate avoids sending new visitors there.

---

## 4. Listeners

### Technical Definition:
A **Listener** is a process that checks for incoming connection requests using a configured protocol and port.

- Protocol: `HTTP`
- Port: `80`
- Action: forwards the request to a defined target group

### Real-World Analogy:
The Listener is like a **receptionist at the gated community entrance** who always listens at the main desk (port 80) and decides where to send each visitor.

---

## 5. End-to-End Flow

### Technical Steps:
1. A client sends an HTTP request to the ALB on port 80.
2. The Listener accepts the request.
3. The Listener forwards the request to a configured target group.
4. The ALB performs a health check to verify available targets.
5. The request is forwarded to a healthy EC2 instance.
6. The EC2 instance processes the request and sends the response.

### Real-World Flow:
1. A visitor arrives at the community gate.
2. The receptionist greets them and checks what service is needed.
3. They check which houses (EC2s) are open (healthy).
4. The visitor is sent to one of the ready houses.
5. The house provides the requested service.

---

## 6. Key Takeaways

- ALB is used to distribute HTTP traffic across multiple EC2 instances.
- Health checks ensure only healthy instances receive traffic.
- Listeners receive requests on a specific port and direct traffic to a target group.
- Target groups are collections of EC2 instances serving the same function.
