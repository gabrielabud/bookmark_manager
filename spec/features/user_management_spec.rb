feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'requiring email address to sign up' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'requiring email address format to sign up' do
    expect { sign_up(email: 'gabri') }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end
end

feature 'User log in' do
  let!(:user) do
    User.create(email: 'person@example.com', password: 'whatever2000', password_confirmation: 'whatever2000')
  end


  scenario 'as existing user' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, person@example.com"
  end
end
