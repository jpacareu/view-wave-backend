// @deno-types="npm:@types/express@5.0.0"
import express from 'npm:express@5.0.1';
import jwt from 'npm:jsonwebtoken';

import supabaseClient from '../supabase/index.ts';
import { DEVICE_STATUS } from '../commons/constants.ts';

const SECRET_KEY_JWT = Deno.env.get('SECRET_KEY_JWT') ?? '';

if (!SECRET_KEY_JWT) {
    throw new Error('SECRET_KEY_JWT is not defined');
}

const router = express.Router();

router.get('/startup/:id', async (req, res) => {
    const { id } = req.params;

    const { data, error } = await supabaseClient
        .from('devices')
        .select(
            `id,
            status,
        branches(
            id
        )`,
        )
        .eq('android_id', id);

    if (error) throw error;

    if (!data?.length) {
        // TODO: Notify us to add this to our data base
        res.status(404).json({ error: 'Device not found' });
        return;
    }

    const [device] = data;

    if (!device.branches) {
        res.status(404).json({ error: 'Branch not found for this device' });
        return;
    }

    if (device.status === DEVICE_STATUS.ASSIGNED) {
        res.status(200).json({
            qr: null,
            status: DEVICE_STATUS.ASSIGNED,
        });
        return;
    }

    const payload = {
        branchId: device.branches.id,
        deviceId: device.id,
    };

    const token = jwt.sign(payload, SECRET_KEY_JWT, { expiresIn: '72h' });

    res.status(200).json({
        qr: token,
        payload,
        status: DEVICE_STATUS.INITIALIZED,
    });
});

export default router;
