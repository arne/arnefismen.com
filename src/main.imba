import { format, formatDistance } from 'date-fns'

global css body c:#393531 bg:#E6E6DB ff:sans inset:0 d:vcc p:4

tag app
	parts = []
	date = "Loading…"
	css 
		ul m:0 p:0
		li my:2 p:0 list-style:none
		a td:none
		a.hash c:#095D6A bdb:thin solid #F57B51/30 bc@hover:#FF4100
		a svg * fill:#F57B51
		a@hover svg * fill:#FF4100
	def mount
		const fetch = await window.fetch('https://api.panacea.no/')
		const json = await fetch.json()
		console.log(json[0].created_at)
		parts = json[0].content.split(/(#\w+)/)
		date = formatDistance(json[0].created_at, new Date(),{ weekStartsOn: 1 })
	<self[d:htl g:2]>
		<div>
			<svg src="./a.svg">
		<div[miw:16rem]>
			<h1[d:hcl g:2 mb:2 fw:500 m:0 p:0 fs:xl]>
				<span> "Arne Skaar Fismen"
			<p>
				<span>
					for part in parts
							if part.startsWith '#'
								<a.hash href="https://panacea.no/tag/{part.slice(1)}">
									<span[c:#095D6A/50]> '#'
									part.slice(1)
							else
								<> part
				<span[ml:2 c:#393531/50]> "({date} ago)"
			<ul[p:0 d:hcl g:2]>
				<li>
					<a href="https://github.com/arne">
						<svg src="./github.svg">
				<li>
					<a href="https://www.threads.net/@arne">
						<svg src="./threads.svg">
				<li>
					<a href="https://instagram.com/arne">
						<svg src="./instagram.svg">

imba.mount <app>
