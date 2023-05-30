import { app } from './app';
import * as dotenv from "dotenv";
import * as path from "path";
import { SequelizeDb } from './config/database';

dotenv.config({ path: path.resolve(__dirname, '../.env') })

const {APP_PORT,DB_CONNECTION, DB_HOST, DB_PORT, DB_DATABASE,DB_USERNAME, DB_PASSWORD} = process.env;
const port = APP_PORT || 5000;


async function CheckConnection() {
try {
    await SequelizeDb.authenticate();
    console.log('Connection has been established successfully.');
    await SequelizeDb.sync();
    //User.sync({force:true});
} catch (error) {
    console.error(`Unable to connect to the database:'${error}`);
}
}
CheckConnection();
    

const start = async () => {
    console.log('Started...Question Backend');

    app.listen(port, () => {
        console.log(`Listening on port ${port}!!!!!!!!`);
    });

}

start();
