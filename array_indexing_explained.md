Why arr[0] and not arr[1]? Understanding Array Indexing
One of the first conceptual hurdles for many programmers is understanding why arrays start at index 0 instead of 1. Here's a simplified explanation:

🧠 Memory-Level Intuition
When you declare an array like int[] arr = new int[5];, the variable arr is a reference (in Java) or a pointer (in C/C++) to the first element of the array in memory.

The expression arr[i] is internally interpreted as:

“Start from the base address arr, and move i elements forward.”

In pseudo-memory terms:

arr[0] = *(arr + 0)
arr[1] = *(arr + 1)
So, when you write arr[0], you're not actually accessing the "zeroth item" in the literal sense, but rather saying:

“Give me the item at the base address offset by 0.”

🔍 Why Indexing Starts at 0
Because the index represents an offset from the base memory address, starting from 0 makes logical and computational sense:

arr[0] → offset 0 → first element.

arr[1] → offset 1 → second element.

and so on...

This zero-based indexing is more efficient for address calculations in memory and aligns with how arrays are handled internally in most programming languages.

✅ Summary
arr is a reference/pointer to the first memory location of the array.

arr[i] means: offset the pointer by i and access the value there.

Starting from 0 is natural because the first element is at zero offset from the start.

