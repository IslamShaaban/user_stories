## Data Structure Task



## Database Task
```sql
    SELECT MAX(salary) AS SecondHighestSalary
    FROM Employee
    WHERE salary < (SELECT MAX(salary) FROM Employee);
```

## Alogrithm Task
# Time Complexity: O(n)
# Space Complexity: O(1)
```python
    def findMiddleNode(head):
        slow = head
        fast = head
        
        while fast != null and fast.next != null:
            slow = slow.next
            fast = fast.next.next
        
        return slow
```
