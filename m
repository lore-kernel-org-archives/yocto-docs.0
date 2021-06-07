Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web08.33232.1623055480916586573
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 01:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4Fz6PK2Kghz5tlF;
	Mon,  7 Jun 2021 10:44:37 +0200 (CEST)
Date: Mon, 7 Jun 2021 10:44:35 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <foss@0leil.net>,
	YP docs mailing list <docs@lists.yoctoproject.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [docs] [PATCH] docs: replace ``FOO`` by :term:`FOO` where possible
Message-ID: <20210607084435.fi4hrzga6rkijsl3@qschulz>
References: <20210527184117.80067-1-foss@0leil.net>
 <CAP71Wjy9rLUs3kF7k9jjK04p8K4qLbqvzKXRtOQiKhOctxffxw@mail.gmail.com>
 <707599b21e074097e0a8a89873354a8c@0leil.net>
 <65a33804-8952-b322-3103-1a758920a0fe@bootlin.com>
 <CAP71Wjy+_tu6VAdWOZAFqfYeE3UQgYDcufFw2LJwOY0NM6efUg@mail.gmail.com>
 <a7b2178f-f6c7-4332-1b70-aa3c3835947f@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <a7b2178f-f6c7-4332-1b70-aa3c3835947f@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Mon, Jun 07, 2021 at 10:37:56AM +0200, Michael Opdenacker wrote:
> Hi Quentin,
>=20
> On 6/2/21 7:26 PM, Nicolas Dechesne wrote:
> >
> >
> > On Wed, Jun 2, 2021 at 4:50 PM Michael Opdenacker
> > <michael.opdenacker@bootlin.com
> > <mailto:michael.opdenacker@bootlin.com>> wrote:
> >
> >     Quentin, Nicolas,
> >
> >     On 5/29/21 5:15 PM, Quentin Schulz wrote:
> >     >
> >     > It works without making it explicit where the term is defined a=
nd I
> >     > think it's what we want. Because if the term is only defined in
> >     > Bitbake, itll find it anyway so all good. And the day we decide=
 to
> >     > "duplicate" the entry in the YP docs, it'll point to the one
> >     from YP,
> >     > no maintenance needed so really neat :)
> >     >
> >     > I can make separate patches if you want but I would not like to=
 add
> >     > bitbake prefix.
> >     >
> >     > I've rewritten the script now and it's a bit smarter (no need t=
o
> >     call
> >     > sphinx.ext.intersphinx module). If there's interest I can try t=
o
> >     make
> >     > it even nicer and add it to the doc repo for future use since w=
hen
> >     > we'll document more variables, if they are already highlihted
> >     > somewhere else, it'll stay this way unless this script is run a=
gain.
> >
> >
> >     Nicolas, did you think about it? Quentin seems to be waiting for =
your
> >     feedback to send his v2 with the updated script.
> >
> >
> > Yes, I agree with last message from Quentin. He is right, we don't
> > need to prefix with bitbake.=A0
> > =A0
> >
> >
> >     I'd vote for keeping the script in the repository for future use
> >     as you
> >     suggest, Quentin. You may copy it to ./tools/ or
> >     ./documentation/tools/
> >
> >
> > I think we tend to use ./scripts in a few other places, but it's a
> > minor detail.
> >
> > Perhaps this script can be turned into a sphinx extension eventually,
> > and emit warnings ;)
>=20
>=20
> Am I right to expect a V2 from you? As far as I understood, you were
> proposing to update the script quoted in the commit message.
>=20

Yes I will. It was a long (and sunny) week-end in Austria, sorry for the
delay :)

I was also trying to find a way to create a module for sphinx to do this
on the fly when compiling and throw errors/warnings but in the few hours
I spent, I didn't find anything straightforward. So for now, the manual
way will do.

Just to be sure, no separate patch for bitbake and YP variables right?
(not talking the :term:`bitbake:` stuff but more the objects.inv used
to detect the missing term references; I run the script twice now :) )

Cheers,
Quentin
