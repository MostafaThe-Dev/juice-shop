import express, { Request, Response } from 'express'
import { check, validationResult } from 'express-validator'

const formValidationRouter = express.Router()

formValidationRouter.post('/some-form',
  [
    check('username').isAlphanumeric().trim().escape(),
    check('email').isEmail().normalizeEmail()
  ],
  (req: Request, res: Response) => {
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() })
    }
    res.send('Input validated and accepted!')
  }
)

export { formValidationRouter }

