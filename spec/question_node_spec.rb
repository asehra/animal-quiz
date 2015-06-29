module AnimalQuiz
  RSpec.describe QuestionNode do
    subject(:question_node) { described_class.new('Is it a large animal?') }
    
    context 'traverse' do
      let(:yes_node) { instance_double(AnimalNode, traverse: traversed_yes) }
      let(:no_node) { double(traverse: traversed_no) }
      let(:traversed_yes) { instance_double(QuestionNode) }
      let(:traversed_no) { double }

      before do
        question_node.yes_node, question_node.no_node = yes_node, no_node
      end

      it 'returns self after traversal' do
        allow(question_node).to receive(:read_input).and_return('y')
        expect(question_node.traverse).to eq(question_node)  
      end

      context 'user answers yes' do
        before do
          allow(question_node).to receive(:read_input).and_return('y')
        end
          
        it 'traverses yes node when question answered with yes' do
          expect(yes_node).to receive(:traverse)
          question_node.traverse
        end

        it 'reassigns yes node to its traversal response' do
          question_node.traverse
          expect(question_node.yes_node).to eq(traversed_yes)
        end
      end

      context 'user answers yes' do
        before do
          allow(question_node).to receive(:read_input).and_return('n')
        end
          
        it 'traverses no node when question answered with no' do
          expect(no_node).to receive(:traverse)
          question_node.traverse
        end

        it 'reassigns no node to its traversal response' do
          question_node.traverse
          expect(question_node.no_node).to eq(traversed_no)
        end
      end

    end
  end
end