import express, { Request, Response } from 'express';
import { Question } from '../../models/Question';
const router = express.Router();

router.post(
  '/api/question',
  async (req: Request, res: Response) => {
    const { question_label,
      label, 
      error_label,
      question_order, 
      type,
      variable,       
      options,       
      q_id, 
      section_id,
      custom_attributes,
      validation_rules,
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
    const question = await Question.create({
      question_label:question_label,
      question_order:question_order,
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
  });
    
    res.status(201).send({data:question});
  }
);

export { router as createQuestion };
