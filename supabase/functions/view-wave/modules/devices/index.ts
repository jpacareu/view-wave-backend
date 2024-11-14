// @deno-types="npm:@types/express@5.0.0"
import express from 'npm:express@5.0.1';
// @deno-types="npm:@types/jsonwebtoken"
import jwt from 'npm:jsonwebtoken';

import buildClient from '../supabase/index.ts';
import { DEVICE_STATUS } from '../commons/constants.ts';

const SECRET_KEY_JWT = Deno.env.get('SECRET_KEY_JWT') ?? '';

if (!SECRET_KEY_JWT) {
    throw new Error('SECRET_KEY_JWT is not defined');
}

const router = express.Router();

router.get('/startup/:id', async (req, res) => {
    const supabaseClient = buildClient();

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


router.post('/register', async (req, res) => {
    const { authorization } = req.headers;

    if (!authorization) {
        res.status(401).json({ error: 'No authorization header' });
        return
    }

    const supabaseClient = buildClient({
        global: {
            headers: { Authorization: authorization },
        },
    });

    const decoded = getToken(req.body.token);

    if (!decoded) {
        res.status(401).json({ error: 'Invalid token' });
        return
    }

    // TODO: Add row level security
    const { data, error } = await supabaseClient
        .from('devices')
        // TV Listen to this change
        .update({ status: DEVICE_STATUS.ASSIGNED })
        .eq('id', decoded.deviceId)

    if (error) throw error;

    res.status(200).json({
        success: true
    });
});

const getToken = (token: string) => {
    try {
        const decoded = jwt.verify(token, SECRET_KEY_JWT);
        return decoded as { deviceId: string };
    } catch (err) {
        return null
    }
}

export default router;
