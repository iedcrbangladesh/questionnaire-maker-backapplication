import express, { Request, Response } from 'express';
import { Question } from '../../models/Question';
const router = express.Router();

router.get('/api/question-single/:quesid',
async (req: Request, res: Response) => {

  
    const question = await Question.findByPk(
          req.params.quesid
        ).catch(function(err) {
        // your error handling code here
        console.log(err);
    });
  
    res.send(question);
});

router.post(
  '/api/question/:qid',
  async (req: Request, res: Response) => {
    const { question_order,
      question_label, 
      label,
      error_label, 
      type,
      variable, 
      validation_rules,
      options, 
      q_id, 
      section_id,
      custom_attributes,
      instruction,
      disabled_rules,
      skip_logic,
      enabled_rules 
    } = req.body;
    //console.log(req.body.question);
    /*
    const questionExisting = await Question.findOne({
      where: { questionnaire_id: q_id },
    });
    
    let order = 1;
    if(questionExisting){
      order = order + questionExisting.order?;
    }*/
    // Create questionnaire in our database
    const question = await Question.update({
      question_order:question_order,
      question_label:question_label,
      label:label, 
      error_label:error_label,                       
      type: type, // sanitize: convert email to lowercase
      validation_rules:validation_rules,
      options:options,
      custom_attributes:custom_attributes,
      variable:variable,
      instruction:instruction,
      disabled_rules:disabled_rules,
      skip_logic:skip_logic,
      enabled_rules:enabled_rules,
      section_id:Number.parseInt(section_id),
      questionnaire_id:Number.parseInt(q_id)
  },{
    where:{
      //omitNull: false,
      id:req.params.qid
    }
  }).catch(function(err) {
    // your error handling code here
    console.log(err);
});
    
    res.status(201).send({data:question});
  }
);

export { router as updateQuestion };
