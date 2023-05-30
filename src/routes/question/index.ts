import express, { Request, Response } from 'express';
import { Question } from '../../models/Question';
const router = express.Router();

router.get('/api/question/:qrnid', async (req: Request, res: Response) => {
  
  
    const question = await Question.findAll({
        where: {
            questionnaire_id: req.params.qrnid
        }
      }).catch(function(err) {
        // your error handling code here
        console.log(err);
    });
  
    res.send(question);
  });
  
  export { router as indexQuestion };
  