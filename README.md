# README

## Task
Use Ruby on Rails to build a project conversation history. A user should be able to:

- leave a comment
- change the status of the project

The project conversation history should list comments and changes in status. 

Please don’t spend any more than 3 hours on this task.

## Brief

Treat this as if this was the only information given to you by a team member, and take the approach you would normally take in order to build the right product for the company. 

To this extent:

- Please write down the questions you would have asked your colleagues
- Include answers that you might expect from them
- Then build a project conversation based on the answers to the questions you raised.

## Questions and expected answers
### Is there just one project or multiple projects?
There is just one for now, but that might change in the future. 

### We don't want just anybody to be able to use the system, should there be some sort of authentication?
Yes. Each user should be able to sign into their own account, but to keep things simple for the MVP we can assume account creation is handled by a higher power, and we don't need to provide registration at this point. 

### If there are multiple projects, should users be restricted as to where they can update comments or statuses?
No, any registered user can update anything. 

### Can a user leave a comment and change the status in one submission?
No, we want to keep these items as distinct entities. A user should only be able to perform one action at a time.

### Should the history be shown chronologically, or reverse chronologically? 
We'd like to see the newest items at the top, so we have a clear idea of the current status

### What information should we show for each item?
For a comment, 
- comment body
- author
- created_at

For a status update
- old status
- new status
- author
- created_at

### Is there a fixed selection of possible statuses?
We don't know yet. Leave it as free text, but come up with a plan in case this changes.

### How many history items for each project will there be? Do we need to consider pagination/infinite scrolling?
Initially, we won't have a lot of comments or updates, so it's fine to keep it simple and show everything on one page. 

### Will we ever add new types of event to the history? 
If I said no, would you believe me? 




## Proposal
Based on the above "conversation", I propose the following steps:
- Create a `Project` model. We only have one for now, but it won't be a time-consuming change, and we can create the project via a db seed. 
- Create a `User` model and make sure every endpoint requires authentication. Use a trusted gem for auth, don't reinvent the wheel and open ourselves up to attack. 
- Create a `History` model. As `comments` and `status_updates` are conceptually similar, but still need to be distinguished, we can use Single Table Inheritance. This might not scale well if more types of event are added, but for the sake of a 3-hour MVP, I would be wary of adding too much complexity e.g. polymorphic associations
- Display the list of updates in reverse chronological order, distinguishing via the UI whether it's a comment or status update. Show the text, author, and created_at
- Show a form on the same page to add a new update. It can be a single text input, and a dropdown to select whether it's a status update or comment. 

## Unforeseen questions
I didn't think of these before starting, but adding them in as a record of my decisions
### Should users be able to udpate/delete history items (that they created, or otherwise)?
Given the scenario, it would be changing history to allow these behaviours, so the only action available to users should be Create

## Unfinished bits
This is the stuff I didn't get to, but would have done next if I'd had time
- The login form has no styling
- UI in general is pretty bad, it was a mistake to try out tailwind for the first time when there was a time limit 😅
- I didn't get a chance to show the old status->new status change. 
- The form doesn't clear on submit. I tried adding this via Stimulus but as it didn't work instantly I gave up as it wasn't a showstopper
