import express from 'express';
import 'express-async-errors';
import { json, urlencoded } from 'body-parser';
import { indexQuestionnaire } from './routes/questionnaire/index';
import { createQuestionnaire } from './routes/questionnaire/new';
import cors from 'cors';
import { createQuestion } from './routes/question/new';
import { updateQuestion } from './routes/question/update';
import { indexQuestion } from './routes/question';
const app = express();
//app.set('trust proxy', true);
app.use(json());
app.use(urlencoded({ extended: true }));
app.use(cors({
  origin: '*'
}));

app.get('/',(req,res)=>{
  res.send('Welcome to nodejs token based authentication api using typescript!!!');
});
app.use(indexQuestionnaire);
app.use(createQuestionnaire);
app.use(createQuestion);
app.use(updateQuestion);
app.use(indexQuestion);

app.all('*', async (req, res) => {
  //throw new NotFoundError();
});

//app.use(errorHandler);

export { app };
