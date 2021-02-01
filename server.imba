import express from 'express'
import index from './index.html'

const app = express!

# catch-all route that returns our index.html
app.get(/\.*/) do(req,res)
	# only render the html for requests that prefer an html response
	return unless req.accepts(['image/*', 'html']) == 'html'
	res.send index.body

imba.serve app.listen(process.env.PORT or 3000)