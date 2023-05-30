import { Sequelize, Model, DataTypes } from 'sequelize';
import {SequelizeDb} from '../config/database';
import { Questionnaire } from './Questionnaire';
class Question extends Model {
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
Question.init(
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
      
      variable: {
        type: DataTypes.STRING(40),
        allowNull: false,
      },
      
      type: {
        type: DataTypes.STRING(15),
        allowNull: false,
      },
      value: {
        type: DataTypes.STRING(100),
        allowNull: true,
      },
      options: {
        type: DataTypes.JSON,
        allowNull: true,
        get() {
          if(this.getDataValue('options') !== undefined){           
            return JSON.parse(this.getDataValue("options"));
          }
        }, 
        set(value) {
          return this.setDataValue("options", JSON.stringify(value));
        }
      },
      completed: {
        type: DataTypes.SMALLINT,
        allowNull: true,
      },
      questionnaire_id:{
       type: DataTypes.INTEGER.UNSIGNED,
       allowNull: false,

      },
      next_node: {
        type: DataTypes.JSON,
        allowNull: true,
        get() {
          if(this.getDataValue('next_node') !== undefined){ 
            return JSON.parse(this.getDataValue("next_node"));
          }
        }, 
        set(value) {
          return this.setDataValue("next_node", JSON.stringify(value));
        }
      },
      
    },
    {
      tableName: 'question',
      //timestamps:false,
      sequelize, // passing the `sequelize` instance is required
    },
  );
 /* 
Question.belongsTo(Questionnaire,{
  foreignKey:'questionnaire_id'
});
*/
//Question.belongsTo(Questionnaire);
export { Question as Question};