import express, { Request, Response } from 'express';
import { Question } from '../../models/Question';
import { Questionnaire } from '../../models/Questionnaire';
import { Section } from '../../models/Section';
const router = express.Router();

//Question.belongsTo(Questionnaire,{foreignKey:'questionnaire_id'});


router.get('/api/question/:qrnid', async (req: Request, res: Response) => {

    const questionnaire = await Questionnaire.findByPk(req.params.qrnid);

    //console.log(questionnaire);
    //Section.hasMany(Question,{as:"question"})
    

  
    const question = await Question.findAll({
        where: {
            questionnaire_id: req.params.qrnid
        },
        
        include: [
          { 
            model:Section,   
            as:Section.tableName,
            attributes:['label']
          }
        ],
        
  
        order: [
          ['question_order', 'ASC'],
        ],
        //include: Questionnaire
      }).catch(function(err) {
        // your error handling code here
        console.log(err);
    });

    //const hisShip = await awesomeCaptain.getShip();

  
    res.send({
      question:question,
      questionnaire:questionnaire
    });
  });
  
  export { router as indexQuestion };
  