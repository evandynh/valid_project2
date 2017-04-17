# Project 2: code.valid?

code.valid? is a new helper app for programmers that let's users ask questions based on any language and instantly get answers from millions of programmers around the world!

As a user of code.valid?, you are able to build a custom profile that showcases your current skills as well as the skills you wish to work on. From there, post a question in the language of your choice. Leave a brief description of what you are hoping to solve and watch as programmers from all walks of life help you out.  

## Deploy Instructions

    - Step 1: Clone the repository from GitHub.

    - Step 2: Bundle Install gems.

    - Step 3: Create and migrate the postgresql database.

    - Step 4: Open Rails server.

    - Step 5: Open:localhost:3000 in a browser


<br></br>
[TRELLO:  User Stories](https://trello.com/b/pYBlbrqF/project-2-code-valid)

## ERD
![ERD](assets/ERDv4.png)
## Login Page
![Login Page](assets/Login Page.png)
## Home
![Home](assets/Home Page.png)
## Profile
![Profile](assets/Profile Page.png)
## Create Post 
![Create](assets/Create.png)
## Post
![Post](assets/Posts.png)



## Approach
 I focused a lot of my attention on models to start and I'm glad I did as it helped me avoid nesting issues down the road. I began by programming the CRUD actions and routes for each model individually to reinforce my understanding of that process before nesting the routes. 
<br>
<br>
I then spent a day and a half on authorization and authentication. I worked my way through Ira's markdown to get a solid base layer on sessions and logins. Admin privileges were more complicated, but manageable once I started using if statements tied to the session user. 
<br>
<br>
Last, I worked my way into paperclip and bootstrap. I was a great intro to S3 and amazon web services in general. I also got a better understanding of bootstrap and embedded ruby. Many of the tutorials for Bootstrap are written as converted ruby and it took me awhile to understand how to incorporate that code into my project.

## MVP
- User can sign into their profile and see their posts.
- User can search other user posts and comment on them.
- User can edit or delete their posts, but not other user's posts.
- User can see how many views and answers have been posted to their question without clicking into it.


## Stretch Goals
- User can view site without logging in, but can not commit/edit posts.
- User's profile picture will display next to any comment or post they make.
- User can view other user's profiles.
- User can like a post that helped them out.
- User can add tags to their post to help with search engine.
- Add a search engine for all posts in the database.
- Add a filter to that search to break down what you're looking for.
- Add pulldown button for language attributes when posting.
- Add pulldown button for navbar


## Technologies Used
- Ruby on Rails 
- HTML
- CSS
- SASS
- Bootstrap


## Unsolved Problems
- I was hoping to dig into a search bar with full functionality and ran out of time.
- I have a language attribute built into my post model which I planned to use for the search engine that I didn't get to implement.
- I did not have time to do a like button, upvotes, or tags. I plan to get back to those in the future.
