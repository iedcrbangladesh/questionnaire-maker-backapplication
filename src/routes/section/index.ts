import express, { Request, Response } from 'express';
import { Section } from '../../models/Section';
import { Questionnaire } from '../../models/Questionnaire';
import { Sequelize } from 'sequelize';
const router = express.Router();

//Question.belongsTo(Questionnaire,{foreignKey:'questionnaire_id'});
router.get('/api/section-list/:qrnid', async (req: Request, res: Response) => {
    const section = await Section.findAll({
      where: {
          questionnaire_id: req.params.qrnid,
          type:0
      },
      
      order: [
        ['section_order', 'ASC'],
      ],
      //order:Sequelize.literal('id ASC')
      
      //include: Questionnaire
    }).catch(function(err) {
      // your error handling code here
      console.log(err);
  });

  res.send({
    section:section,
  //questionnaire:questionnaire
  });
});

router.get('/api/section/:qrnid', async (req: Request, res: Response) => {

    const questionnaire = await Questionnaire.findByPk(req.params.qrnid);

    //console.log(questionnaire);
  
    const section = await Section.findAll({
        where: {
            questionnaire_id: req.params.qrnid
        },
        order: [
          ['section_order', 'ASC'],
        ],
        //include: Questionnaire
      }).catch(function(err) {
        // your error handling code here
        console.log(err);
    });

    //const hisShip = await awesomeCaptain.getShip();

  
    res.send({
        section:section,
      questionnaire:questionnaire
    });
  });
  
  export { router as indexSection };
  