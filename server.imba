import express from 'express'
import index from './app/index.html'

const app = express!

# A simple state that lives for as long as the server is running
const state = {
	count: 0,
}

app.get('/increment') do(req,res)
	state.count++
	res.send({
		count: state.count
	})

app.get('/count') do(req,res)
	res.send({
		count: state.count
	})

# catch-all route that returns our index.html
app.get(/.*/) do(req,res)
	# only render the html for requests that prefer an html response
	unless req.accepts(['image/*', 'html']) == 'html'
		return res.sendStatus(404)

	res.send index.body

imba.serve app.listen(process.env.PORT or 3000)
