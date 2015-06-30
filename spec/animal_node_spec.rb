module AnimalQuiz
  RSpec.describe AnimalNode do
    subject(:animal) { described_class.new('elephant') }

    before { allow(animal).to receive(:print_output) }

    context '#initialize' do
      it 'adds an article to the name' do
        expect(animal.name).to eq('an elephant')
      end

      it 'adds correct article when name starts with a consonant' do
        expect(AnimalNode.new('rabbit').name).to eq('a rabbit')
      end
    end
    
    context '#traverse' do

      it 'returns self when guess is correct' do
        allow(animal).to receive(:read_input).and_return('y')
        expect(animal.traverse).to eq(animal)
      end

      context 'when guess is incorrect' do
        class AnimalNode
          def ==(other)
            name == other.name
          end
        end

        let(:new_node) { animal.traverse }

        before do
          allow(animal).to receive(:read_input).and_return('n', 'new_animal', 'new_question', 'n')
        end

        it 'returns a new question node with the entered question' do
          expect(new_node).to be_a(QuestionNode)
          expect(new_node.question).to eq('new_question')
        end

        it 'assigns self to "yes" node for the question when new node is assigned to "no"' do
          expect(new_node.yes_node).to eq(animal)
          expect(new_node.no_node).to eq(AnimalNode.new('new_animal'))
        end

        it 'assigns self to "no" node for the question when new node is assigned to "yes"' do
          allow(animal).to receive(:read_input).and_return('n', 'new_animal', 'new_question', 'y')
          expect(new_node.no_node).to eq(animal)
          expect(new_node.yes_node).to eq(AnimalNode.new('new_animal'))
        end
      end

    end
  end
end