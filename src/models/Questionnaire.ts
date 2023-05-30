import { Sequelize, Model, DataTypes } from 'sequelize';
import {SequelizeDb} from '../config/database';
import {Question} from './Question';

class Questionnaire extends Model {
  /*
    declare id: number;
    declare title: string;
    declare type:number;
    declare version:string | null;
    */
}
const sequelize = SequelizeDb;
Questionnaire.init(
    {
      id: {
        type: DataTypes.INTEGER.UNSIGNED,
        autoIncrement: true,
        primaryKey: true,
      },
      title: {
        type: DataTypes.STRING(128),
        allowNull: false,
      },
      type: {
        type: DataTypes.SMALLINT,
        allowNull: true,
      },
      version: {
        type: DataTypes.STRING(10),
        allowNull: true,
      },
    },
    {
      tableName: 'questionnaire',
      //timestamps:false,
      sequelize, // passing the `sequelize` instance is required
    },
  );
  Questionnaire.hasMany(Question,{
    foreignKey:'questionnaire_id'
  });

  export { Questionnaire as Questionnaire};