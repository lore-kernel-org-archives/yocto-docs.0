Subject: Re: [PATCH] documentation: Add Pipenv support
To: docs@lists.yoctoproject.org
From: shantanoo.desai@gmail.com
X-Originating-Location: Bremen, DE (134.102.106.57)
X-Originating-Platform: Windows Firefox 82
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 11 Nov 2020 13:30:10 -0800
References: <20201110212917.25172-1-JPEWhacker@gmail.com>
In-Reply-To: <20201110212917.25172-1-JPEWhacker@gmail.com>
Message-ID: <27534.1605130210340595078@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="M01XeW7H2hnsD9hlgOoa"

--M01XeW7H2hnsD9hlgOoa
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

Hi Joshua,

I would suggest adding [sphinx-serve](https://pypi.org/project/sphinx-serv=
e/) as a dev-package to serve the docs during local development/tests.

I was able to serve the Sphinx-RTD on my machine simply by executing `sphi=
nx-serve` in the `documentations/` folder. Maybe mention it in the README t=
oo?.

I think Pipenv might be required since I was digging into the Algolia Sear=
ch Indexing and there you can use their document scraper with Pipenv as wel=
l.
(see https://docsearch.algolia.com/docs/run-your-own/)

Might be worth the effort, since Nico did mention plans to use an indexing=
 search for the new docs.

Would love your thoughts on this.

Regards,

Shan



--M01XeW7H2hnsD9hlgOoa
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Joshua,</p>

<p>I would suggest adding <a href=3D"https://pypi.org/project/sphinx-serve=
/" target=3D"_blank">sphinx-serve</a> as a dev-package to serve the docs du=
ring local development/tests.</p>

<p>I was able to serve the Sphinx-RTD on my machine simply by executing <c=
ode>sphinx-serve</code> in the <code>documentations/</code> folder. Maybe m=
ention it in the README too?.</p>

<p>I think Pipenv might be required since I was digging into the Algolia S=
earch Indexing and there you can use their document scraper with Pipenv as =
well.
(see <a href=3D"https://docsearch.algolia.com/docs/run-your-own/" target=
=3D"_blank">https://docsearch.algolia.com/docs/run-your-own/</a>)</p>

<p>Might be worth the effort, since Nico did mention plans to use an index=
ing search for the new docs.</p>

<p>Would love your thoughts on this.</p>

<p>Regards,</p>

<p>Shan</p>

--M01XeW7H2hnsD9hlgOoa--
