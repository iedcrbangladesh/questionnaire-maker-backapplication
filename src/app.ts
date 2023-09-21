import express from 'express';
import 'express-async-errors';
import { json, urlencoded } from 'body-parser';
import { indexQuestionnaire } from './routes/questionnaire/index';
import { createQuestionnaire } from './routes/questionnaire/new';
import { updateQuestionnaire } from './routes/questionnaire/update';
import cors from 'cors';
import { createQuestion } from './routes/question/new';
import { updateQuestion } from './routes/question/update';
import { indexQuestion } from './routes/question';
import { createSection } from './routes/section/new';
import { indexSection } from './routes/section';
import { updateSection } from './routes/section/update';
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
app.use(updateQuestionnaire);
app.use(createQuestion);
app.use(updateQuestion);
app.use(indexQuestion);

app.use(createSection);
app.use(indexSection)
app.use(updateSection)
app.all('*', async (req, res) => {
  //throw new NotFoundError();
});

//app.use(errorHandler);

export { app };
