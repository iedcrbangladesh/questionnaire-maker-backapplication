import express, { Request, Response } from 'express';
import { Section } from '../../models/Section';
const router = express.Router();

router.get('/api/section-single/:quesid',
async (req: Request, res: Response) => {

  
    const section = await Section.findByPk(
          req.params.quesid
        ).catch(function(err) {
        // your error handling code here
        console.log(err);
    });
  
    res.send(section);
});

router.post(
  '/api/section/:qid',
  async (req: Request, res: Response) => {
    const { label, slug, section_order,q_id, type, instruction } = req.body;
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
    const section = await Section.update({
      label:label,            
      slug: slug, // sanitize: convert email to lowercase
      section_order:section_order,
      type:type,
      instruction:instruction,      
      questionnaire_id:Number.parseInt(q_id)
  },{
    where:{
      id:req.params.qid
    }
  }).catch(function(err) {
    // your error handling code here
    console.log(err);
});
    
    res.status(201).send({data:section});
  }
);

export { router as updateSection };
