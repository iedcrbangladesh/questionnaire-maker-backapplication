import { Sequelize, Model, DataTypes } from 'sequelize';
import {SequelizeDb} from '../config/database';
class Project extends Model {
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
Project.init(
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
      
      completed: {
        type: DataTypes.SMALLINT,
        allowNull: true,
      },
        
      
      
    },
    {
      tableName: 'projects',
      //timestamps:false,
      sequelize, // passing the `sequelize` instance is required
    },
  );
/*  
Project.belongsTo(Projectnaire,{
    as: 'Projectnaire',
    foreignKey:'questionnaire_id'
});
*/
//Project.belongsTo(Projectnaire);
export { Project as Project};