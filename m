Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC26C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 08:28:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.3738.1750753702048809356
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 01:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IJhGkGmy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BABF6433E7;
	Tue, 24 Jun 2025 08:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750753700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/JBIyHsCElyJX3LXDN7IkfGwavQ+TEoPN1rJvN4Kdk=;
	b=IJhGkGmy82swUf1ATaZtHFe6izD0wpJ+yVVEFDPQT+Vf9iQdOjhxzU/oyrI72TFanqgKTz
	Xrjp/RDbFGtToYZD980z195EJGlmVi547CMtJsNN88LZQsNGhAfDK7KOhsBTZPszdMTgza
	qq7FEfB1oODWINX8DCtK3g4C0Zi9nGjxOChVEQrMmgi2xBN8G/ub9NNPzFCqltexLaY+YT
	fe+DpGAIdOGxOWvH0E1jtzFGYP9JNGqgNY9K0ByuAbV6bjQHVH6qM/8cUOXRzSgyUvG060
	F4Rz3kJBhsaldUiGIiEJNFFi4kUzKNJ8dKPaj7mSavypTH4iqcM/V4zkQecmGQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 10:28:19 +0200
Message-Id: <DAUME290K9QZ.1EJZ6TH3TAJJW@bootlin.com>
Subject: Re: [docs] [PATCH] dev-manual: some minor cleanups to "Pre-Built
 Libraries"
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <b88499e3-e0d1-5aff-490c-ae13c2dbfb31@crashcourse.ca>
 <DAULKYBT3POY.38V8CSIV0F8K0@bootlin.com>
 <26af7080-8fd3-1010-4c3c-66bfc1e2e057@crashcourse.ca>
In-Reply-To: <26af7080-8fd3-1010-4c3c-66bfc1e2e057@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieevveeffefgtedvgffhkeefteduteeltdejffduleegkedvueetvdevueefveenucffohhmrghinheplhhinhhugihfohhunhgurghtihhonhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjv
 ggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 08:28:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7190

On Tue Jun 24, 2025 at 10:19 AM CEST, Robert P. J. Day wrote:
> On Tue, 24 Jun 2025, Antonin Godard wrote:
>
>> On Sun Jun 22, 2025 at 12:59 PM CEST, Robert P. J. Day wrote:
>> >
>> >   * Add note about new URL for FHS 3.0.
>> >   * Add wildcard for "INHIBIT_" variable.
>> >   * Fix font for ${PN}.
>> >
>> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>> >
>> > ---
>> >
>> > diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documen=
tation/dev-manual/prebuilt-libraries.rst
>> > index a05f39ca1..077184657 100644
>> > --- a/documentation/dev-manual/prebuilt-libraries.rst
>> > +++ b/documentation/dev-manual/prebuilt-libraries.rst
>> > @@ -22,6 +22,13 @@ To summarize, a versioned library must meet two con=
ditions:
>> >  This section shows how to deal with both versioned and unversioned
>> >  pre-built libraries.
>> >
>> > +.. note::
>> > +
>> > +   In the shared library article referenced above, the link to the cu=
rrent
>> > +   version of the Filesystem Hierarchy Standard (FHS) is out of date;
>> > +   the current FHS 3.0 release can be found
>> > +   `here <https://refspecs.linuxfoundation.org/FHS_3.0/index.html>`__=
.
>>
>> Not sure adding a note to say a link is outdated is the good approach.
>> Instead update the link above?
>>
>> >  Versioned Libraries
>> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >
>> > @@ -79,7 +86,7 @@ To write a recipe to use such a library in your syst=
em:
>> >  -  The vendor will typically ship release builds without debugging sy=
mbols.
>> >     Avoid errors by preventing the packaging task from stripping out t=
he symbols
>> >     and adding them to a separate debug package. This is done by setti=
ng the
>> > -   ``INHIBIT_`` flags shown below.
>> > +   ``INHIBIT_*`` flags shown below.
>> >
>> >  The complete recipe would look like this::
>> >
>> > @@ -170,7 +177,7 @@ as follows::
>> >  The modifications cause the ``.so`` file to be the real library
>> >  and unset :term:`FILES_SOLIBSDEV` so that no libraries get packaged i=
nto
>> >  ``${PN}-dev``. The changes are required because unless :term:`PACKAGE=
S` is changed,
>> > -``${PN}-dev`` collects files before `${PN}`. ``${PN}-dev`` must not c=
ollect any of
>> > +``${PN}-dev`` collects files before ``${PN}``. ``${PN}-dev`` must not=
 collect any of
>>
>> Can you send this in a separate patch?
>
>   do you mean the FHS fix as one patch, and all else as a second
> patch?  can do.

I mean the part fixing the `${PN}` not being ``${PN}``.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


