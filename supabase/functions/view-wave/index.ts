import 'jsr:@supabase/functions-js/edge-runtime.d.ts';

// @deno-types="npm:@types/express@5.0.0"
import express from 'npm:express@5.0.1';
import deviceRouter from './modules/devices/index.ts';

const port = 3000;

const app = express();

app.use(express.json());

const routerApp = express.Router();

routerApp.get('/ping', (req, res) => {
  res.send('pong');
});

routerApp.use('/devices', deviceRouter);

app.use('/view-wave', routerApp);

// @ts-ignore
app.use((err, req, res, next) => {
  console.error(err.message);
  res.status(500).send('Something went wrong');
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
