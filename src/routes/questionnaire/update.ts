import express, { Request, Response } from 'express';
import { Questionnaire } from '../../models/Questionnaire';
const router = express.Router();

router.get('/api/questionnaire-single/:qrid',
async (req: Request, res: Response) => {

  
    const questionnaires = await Questionnaire.findByPk(
          req.params.qrid
        ).catch(function(err) {
        // your error handling code here
        console.log(err);
    });
  
    res.send(questionnaires);
});

router.post(
  '/api/questionnaire/:qrid',
  async (req: Request, res: Response) => {
    const { title, type, version } = req.body;

    

  const questionnaire = await Questionnaire.update({
    title:title,      
    type: Number.parseInt(type), // sanitize: convert email to lowercase
    version:version
},{
  where:{
    id:req.params.qrid
  }
}).catch(function(err) {
  // your error handling code here
  console.log(err);
});
    
    res.status(201).send(questionnaire);
  }
);

export { router as updateQuestionnaire };
