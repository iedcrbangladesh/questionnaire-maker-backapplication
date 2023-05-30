import express, { Request, Response } from 'express';
import { Questionnaire } from '../../models/Questionnaire';
const router = express.Router();

router.get('/api/questionnaire', async (req: Request, res: Response) => {
  
  
  const questionnaires = await Questionnaire.findAll();

  res.send(questionnaires);
});

export { router as indexQuestionnaire };
