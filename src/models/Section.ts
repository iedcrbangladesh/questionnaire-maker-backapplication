import { Sequelize, Model, DataTypes } from 'sequelize';
import {SequelizeDb} from '../config/database';
import { Questionnaire } from './Questionnaire';
class Section extends Model {
    /*
    declare id: number;
    declare label: string;
    declare type:string;
    declare value:string | null;
    declare options:{}
    declare questionnaire_id:number;
    declare completed:number;
    */    
   

}
const sequelize = SequelizeDb;
Section.init(
    {
      id: {
        type: DataTypes.INTEGER.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
      },

      
      label: {
        type: DataTypes.STRING(128),
        allowNull: false,
      },
      
      slug: {
        type: DataTypes.STRING(100),
        allowNull: false,
      },
      
      
      questionnaire_id:{
       type: DataTypes.INTEGER.UNSIGNED,
       allowNull: false,
       references: {
            model: Questionnaire,
            key: "id"
        }

      },

      section_order: {
        type: DataTypes.SMALLINT,
        allowNull: true,
      },

      instruction:{
        type:DataTypes.TEXT,
        allowNull: true,
      },

      type: {
        type: DataTypes.SMALLINT,
        //allowNull: true,
      },
      
      
    },
    {
      tableName: 'section',
      //timestamps:false,
      sequelize, // passing the `sequelize` instance is required
    },
  );
/*  
Question.belongsTo(Questionnaire,{
    as: 'Questionnaire',
    foreignKey:'questionnaire_id'
});
*/
//Question.belongsTo(Questionnaire);
export { Section as Section};