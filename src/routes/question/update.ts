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
    const question = await Question.update({
      label:label,            
      type: type, // sanitize: convert email to lowercase
      value:value,
      options:options,
      variable:variable,
      completed:completed?1:0,
      questionnaire_id:Number.parseInt(q_id)
  },{
    where:{
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
