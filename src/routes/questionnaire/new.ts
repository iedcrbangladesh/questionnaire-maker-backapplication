import express, { Request, Response } from 'express';
import { Questionnaire } from '../../models/Questionnaire';
const router = express.Router();

router.post(
  '/api/questionnaire',
  async (req: Request, res: Response) => {
    const { title, type, version } = req.body;

    // Create questionnaire in our database
    const questionnaire = await Questionnaire.create({
      title:title,      
      type: Number.parseInt(type), // sanitize: convert email to lowercase
      version:version 
  });
    
    res.status(201).send(questionnaire);
  }
);

export { router as createQuestionnaire };
