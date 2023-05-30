import express, { Request, Response } from 'express';
import { Question } from '../../models/Question';
const router = express.Router();

router.post(
  '/api/question',
  async (req: Request, res: Response) => {
    const { label, type,variable, value,options, completed,q_id } = req.body;
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
      label:label,            
      type: type, // sanitize: convert email to lowercase
      value:value,
      options:options,
      variable:variable,
      completed:completed?1:0,
      questionnaire_id:Number.parseInt(q_id)
  });
    
    res.status(201).send({data:question});
  }
);

export { router as createQuestion };
