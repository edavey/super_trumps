require "spec_helper"

describe Card do

  Given(:card) { Factory.create(:card, character: 'The Flash') }

  # describe '#display_attributes' do
  #   Then         { card.display_attributes.should eql('foo') }
  # end

  describe '#display' do
    When(:output){card.display}

    Then { output.should match('agility')         }
    Then { output.should match('speed')           }
    Then { output.should match('strength')        }
    Then { output.should match('intelligence')    }
    Then { output.should match('height')          }
    Then { output.should match('fighting_skills') }
    Then { output.should match('description')     }
    Then { output.should match('hero')            }

    Then { output.should match('The Flash')}
    Then { output.should_not match('character')   }
  end



end
