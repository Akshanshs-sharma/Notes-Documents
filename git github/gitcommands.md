**Step 0 — Create a brand new empty folder**



Example:



F:\\GitPractice



Go inside that folder.



Confirm:

It must be empty.



This ensures we are not mixing histories.





**Step 1 — Initialize local repository**



Run:



***git init***



What happens:



• .git folder created

• Local repository is born

• No commits exist

• No remote exists

• Workspace is still empty



**Step 2 — Connect remote repository**



Run:



***git remote add origin <repo-url>    hey git store add this repo address to the remote pointer*** 





there is a **remote** pointer in our .git folder which points to any remote repository whose url we give , 

add commands tell git to add , <repo -url> value to that pointer 



Git stores this string in:



.git/config



Under a section like:



\[remote "origin"]

url = https://...





Example:



git remote add origin https://github.com/yourname/yourrepo.git



What happens:



• Git stores URL under name origin

• Still no commits downloaded



Verify:



git remote -v



Now your local repo knows where remote lives.





