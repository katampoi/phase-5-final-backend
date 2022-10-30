puts "seed data..."

# users
15.times do
    User.create(
    username:Faker::Internet.username,
    email:Faker::Internet.email,
    user_type:['admin','staff','student'].sample,
    password_digest:Faker::Internet.password,
    first_name:Faker::Name.first_name ,
    last_name: Faker::Name.last_name 

)
end

# posts
Post.create(
    title: "Easiest way to learn on Javascript!",
    media: "https://www.youtube.com/watch?v=NOiT7mZjPXw",
    content:"Introduction to javascript is made easier. Learn this language in less than an hour!",
    user_id:3,
    category_id:3

)
Post.create(
    title: "Steps to setting up a a repository in github",
    media: "",
    content:"1. In the upper-right corner of any page, use the  drop-down menu, and select New repository.
    2. Type a short, memorable name for your repository.
    3. Optionally, add a description of your repository.
    4. Select Initialize this repository with a README
    5. Click Create repository.",
    user_id: 7,
    category_id: 2
    
)
Post.create(
    title: "ruby",
    media: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1200px-Ruby_logo.svg.png",
    content:"We'd like to welcome you to our annual code challenge with ruby. Its happengig at the end of the week and all students are encouraged to participate. Invitation details will be posted later in the day. ",
    user_id: 10,
    category_id:1
    
)

Post.create(
    title:"Project Deployment",
    media: "",
    content:"Software deployment refers to the process of making the application work on a target device, whether it be a test server, production environment or a user's computer or mobile device.
    Software and application deployment are terms that can be used interchangeably.
    Today, most IT organizations and software developers deploy software updates, patches and new applications with a combination of manual and automated processes.
    Software developers have created workflows that enable faster and more frequent deployment of software updates to the production environment where they can be accessed by users.",
    user_id: 9,
    category_id: 2
    
)



# profiles
Profile.create(
    user_id:6,
    profile_pic:"",
    bio: "I am part of the moringa school staff, working as a Technical mentor"
)
Profile.create(
    user_id:12,
    profile_pic:"",
    bio:"I am a student at moringa school currently in cohort 25 pursuing software development"
)


# reveiws
Review.create(
    user_id:10, 
    post_id:4, 
    like:false, 
    dislike: true,
    comment: "I didn't quit understand what the blog meant. Too many words."
)
Review.create(
    user_id:8, 
    post_id:2,
    like:true, 
    dislike:false,
    comment:" Very informative. My onlly wish is for the video to have lasted a little longer."
)

Review.create(
    user_id:7, 
    post_id:3, 
    like:true, 
    dislike:false,
    comment: "Thanks for the code challenge opportunity, must attend!"
)
Review.create(
    user_id:15, 
    post_id:1, 
    like:true, 
    dislike:false,
    comment: "Very helpful content. Thanks!"
)

# Categories
Category.create(
    subscribe: false, 
    category_name: "DevOPs",
)
Category.create(
    subscribe: true, 
    category_name:"Fullstack",
)
Category.create(
    subscribe:  true, 
    category_name:"Front-End",
)

# susbscription
Subscription.create(
    category_id:2, 
    user_id: 11
)

# wishlist
Wishlist.create(
    user_id:12
)
Wishlist.create(
    user_id:14
)
Wishlist.create(
    user_id:10
)


puts "Done seeding..."