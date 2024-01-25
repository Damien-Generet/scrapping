require_relative '../lib/mail_scrapp'

describe "perform" do
    it "return the name abreviation of the crypto" do
        expect(get_townhall_email(get_townhall_urls) ).to be_an_instance_of Array
        expect(get_townhall_email(get_townhall_urls) .length).to be >= 60
        expect(get_townhall_email(get_townhall_urls) ).to include({"MOUSSY"=>"mairie.de.st.denis.catus@wanadoo.fr"})
        expect(get_townhall_email(get_townhall_urls) ).to include({"WY DIT JOLI VILLAGE"=>"mairie.wy-dit-joli-village@wanadoo.fr"})
    end
end