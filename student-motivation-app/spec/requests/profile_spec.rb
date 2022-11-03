require "rails_helper"

RSpec.describe "Profiles", type: :request do
  let!(:user1) { User.create(username: "kula moto", password: "wa-ajabi", email:"test_user@example.com") }
  let!(:user2) { User.create(username: "ndovu", password: "ni kuu", email:"ndovu.kuu@example.com") }

  describe "GET /profiles" do

    before do 
      Profile.create([
        {
          user_id: user1.id,
          bio:" pursuing software development is the best thing i did this year",
          profile_pic:""
        },
        {
          user_id: user2.id,
          bio: "Measure 1 cup of rice in bowl of rice cooker. Don't add any water. Put bowl in rice cooker. Press 'Cook'. Enjoy!",
          profile_pic:""
        }
      ])
    end
     context "with a logged in user" do
      before do
        post "/login", params: { username: user.username, password: user.password }
      end
      
      it "returns an array of profiles with their associated users" do
        get "/profiles"

        expect(response.body).to include_json([
          {
            id: a_kind_of(Integer),
            title: "Rice", 
            instructions: "Measure 1 cup of rice in bowl of rice cooker. Wash rice. Fill with water to level indicated by manufacturer. Put bowl in rice cooker. Press 'Cook'. Enjoy!",
            minutes_to_complete: 10,
            user: {
              username: user.username,
              image_url: user.image_url,
              bio: user.bio
            }
          },
          {
            id: a_kind_of(Integer),
            title: "Burnt Rice", 
            instructions: "Measure 1 cup of rice in bowl of rice cooker. Don't add any water. Put bowl in rice cooker. Press 'Cook'. Enjoy!",
            minutes_to_complete: 10,
            user: {
              username: user.username,
              image_url: user.image_url,
              bio: user.bio
            }
          }
        ])
      end
    end

    context "with no logged in user" do

      it "returns an array of error messages in the body" do
        get "/profiles"

        expect(response.body).to include_json({
          errors: a_kind_of(Array)
        })
      end

      it "returns a 401 (Unauthorized) HTTP status code" do
        get "/profiles"

        expect(response).to have_http_status(:unauthorized)
      end
      
      context "with a logged in user" do
        before do
          post "/login", params: { username: user.username, password: user.password }
        end
        
        it "returns an array of profiles with their associated users" do
          get "/profiles/:id"
  
          expect(response.body).to include_json([
            {
              id: a_kind_of(Integer),
              title: "Rice", 
              instructions: "Measure 1 cup of rice in bowl of rice cooker. Wash rice. Fill with water to level indicated by manufacturer. Put bowl in rice cooker. Press 'Cook'. Enjoy!",
              minutes_to_complete: 10,
              user: {
                username: user.username,
                image_url: user.image_url,
                bio: user.bio
              }
            },
            {
              id: a_kind_of(Integer),
              title: "Burnt Rice", 
              instructions: "Measure 1 cup of rice in bowl of rice cooker. Don't add any water. Put bowl in rice cooker. Press 'Cook'. Enjoy!",
              minutes_to_complete: 10,
              user: {
                username: user.username,
                image_url: user.image_url,
                bio: user.bio
              }
            }
          ])
        end
      end
  
      context "with no logged in user" do
  
        it "returns an array of error messages in the body" do
          get "/profiles"
  
          expect(response.body).to include_json({
            errors: a_kind_of(Array)
          })
        end
  
        it "returns a 401 (Unauthorized) HTTP status code" do
          get "/profiles"
  
          expect(response).to have_http_status(:unauthorized)
        end
        
      end
    end

