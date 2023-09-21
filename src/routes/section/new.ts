import express, { Request, Response } from 'express';
import { Section } from '../../models/Section';
const router = express.Router();

router.post(
  '/api/section',
  async (req: Request, res: Response) => {
    const { label, slug,section_order,q_id,type, instruction } = req.body;
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
    const section = await Section.create({
      label:label,
      section_order:section_order,            
      slug: slug, // sanitize: convert email to lowercase,
      type:type,
      instruction:instruction,      
      questionnaire_id:Number.parseInt(q_id)
  });
    
    res.status(201).send({data:section});
  }
);

export { router as createSection };
