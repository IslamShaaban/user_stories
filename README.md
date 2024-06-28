## Data Structure Task
### Enqueue Operation: O(1)
### Dequeue Operation: O(1)
```python
    class Queue:
        array <- []
        front <- 0
        rear <- -1
        size <- 0
        capacity <- n
    
    function __init__(n):
        array <- new array of size n
        front <- 0
        rear <- -1
        size <- 0
        capacity <- n

    function enqueue(value):
        if size == capacity:
            print("Queue is full")
            return
        
        rear <- (rear + 1) % capacity
        array[rear] <- value
        size <- size + 1
    

    function dequeue():
        if size == 0:
            print("Queue is empty")
            return None
        
        value <- array[front]
        front <- (front + 1) % capacity
        size <- size - 1
        return value
    
    function isEmpty():
        return size == 0
    
    function isFull():
        return size == capacity
    
    function peek():
        if size == 0:
            print("Queue is empty")
            return None
        return array[front]
```

## Database Task
```sql
    SELECT MAX(salary) AS SecondHighestSalary
    FROM Employee
    WHERE salary < (SELECT MAX(salary) FROM Employee);
```

## Alogrithm Task
### Time Complexity: O(n)
### Space Complexity: O(1)
```python
    def findMiddleNode(head):
        slow = head
        fast = head
        
        while fast != null and fast.next != null:
            slow = slow.next
            fast = fast.next.next
        
        return slow
```

## ERD Diagram
https://drawsql.app/teams/itigraduationproject/diagrams/user-stories