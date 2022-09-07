export default tag Counter < button
	count = 0
	
	# Lifecycle method for when this tag is attached to the DOM
	# https://imba.io/docs/components/lifecycle
	def mount
		# Fetch the count from the server
		try
			const res = await window.fetch('/count')
			const data = await res.json()
			count = data.count
		catch e
			console.error("Couldn't fetch count", e)

	def increment
		# Increment the counter on the server, and update the client
		try
			const res = await window.fetch('/increment')
			const data = await res.json()
			count = data.count
		catch e
			console.error("Couldn't increment", e)

	<self @click=increment> `Count is {count}`
