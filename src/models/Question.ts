import { Sequelize, Model, DataTypes } from 'sequelize';
import {SequelizeDb} from '../config/database';
import { Questionnaire } from './Questionnaire';
import { Section } from './Section';
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

      question_label: {
        type: DataTypes.STRING(30),
        allowNull: false,
      },
      label: {
        type: DataTypes.STRING(128),
        allowNull: false,
      },
      error_label: {
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
      
      options: {
        type: DataTypes.JSON,
        allowNull: true,
        get() {
          if(this.getDataValue('options') !== undefined){           
            return JSON.parse(this.getDataValue("options"));
          }
        }, 
        set(value) {
          value = JSON.stringify(value);
          //console.log(value);
          value = value == "null" || value == "[]"? null:value;
          return this.setDataValue("options", value);
        }
      },

      custom_attributes:{
        type: DataTypes.JSON,
        allowNull: true,
        get() {
          if(this.getDataValue('custom_attributes') !== undefined){           
            return JSON.parse(this.getDataValue("custom_attributes"));
          }
        }, 
        set(value) {
          value = JSON.stringify(value);
          value = value == "null" || value == "[]" ? null:value;
          return this.setDataValue("custom_attributes", value);
        }
      },
      question_order: {
        type: DataTypes.SMALLINT,
        allowNull: true,
      },
      questionnaire_id:{
       type: DataTypes.INTEGER.UNSIGNED,
       allowNull: false,
       references: {
            model: Questionnaire,
            key: "id"
        }

      },
      
      section_id:{
        type: DataTypes.INTEGER.UNSIGNED,
        allowNull: true,
        /*
        references: {
             model: Section,
             key: "id"
         }
         */
 
       },

      validation_rules:{
        type:DataTypes.TEXT,
        allowNull: true,
      },
      enabled_rules:{
        type:DataTypes.TEXT,
        allowNull: true,
      },

      instruction:{
        type:DataTypes.TEXT,
        allowNull: true,
      },
      disabled_rules: {
        type: DataTypes.JSON,
        allowNull: true,
        get() {
          if(this.getDataValue('disabled_rules') !== undefined){ 
            return JSON.parse(this.getDataValue("disabled_rules"));
          }
        }, 
        set(value) {
          value = JSON.stringify(value);
          value = value == "null" ? null:value;
          return this.setDataValue("disabled_rules", value);
        }
      },
      skip_logic: {
        type: DataTypes.JSON,
        allowNull: true,
        get() {
          if(this.getDataValue('skip_logic') !== undefined){ 
            return JSON.parse(this.getDataValue("skip_logic"));
          }
        }, 
        set(value) {
          //console.log('tpe:'+JSON.stringify(value))
          value = JSON.stringify(value);
          value = value == "null" ? null:value;
          return this.setDataValue("skip_logic", value);
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
    as: 'Questionnaire',
    foreignKey:'questionnaire_id'
});
*/

//Question.belongsTo(Questionnaire);
Question.belongsTo(Section, {
  foreignKey: "section_id",
  as: Section.tableName,
});
export { Question as Question};