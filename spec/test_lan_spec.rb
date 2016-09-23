require 'eval_in'
require './app'


class Evaluate

   def eval_lan (code, language)
     result = EvalIn.call code, language: language
     answer=result.output
     return answer
   end

end

Languages.each{ |lan|
  describe Evaluate do
     context "When testing Evaluate" do
        it "should say 'Hello World' when we call the eval_lan method" do
            hw = Evaluate.new
             message = hw.eval_lan lan[2].to_s, lan[1].to_s
             expect(message.strip).to eq("Hello World!\n").or(eq("Hello World!"))
         end
      end
   end
}
