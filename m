Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6E0C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 09:50:06 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14061.1738057793735835112
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 01:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mxoqvPjb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A31884428B;
	Tue, 28 Jan 2025 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738057792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yaC+YbWU2fKrG+MWkvUefhWvhdWNGSSDsR+ZWJOjNDw=;
	b=mxoqvPjbRJT6I1ehYVHWI9QVJn2iMTzUrAqVf1QS9A8GMIiyQkkGOyM949DrtHdrclFH57
	0LUUyvUq9EIxb6VCaYAIo9NKewHnuFk3bGAaCmi3v3yiGCHhMWYWBclMlwHm9n0A5YCpEN
	8qPgjQYPRXsReUo5QfYs7mIWnXSRk5VMoHBhITi7TUJ0glzSPB8rfBTCsPmkFoYpJb+cQp
	MIrEEK+iNU1FQMw4/Asm3WgDJCnrC68MP19RVxuaoXik7RILdKNXVhPFUVegJxyGfaI84y
	37QnQoZW380In0nMkBTH30lhDRcvDSkMiLBduOdxkkVVEn94rkcMLSPP5OkyLQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jan 2025 10:49:51 +0100
Message-Id: <D7DM2EL3Q8XR.V29T6MFJ89R@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Simon Eugster" <simon.eu@gmail.com>
Subject: Re: [PATCH v2] ref-manual: Describe grub-efi-cfg overrides and
 GRUB_TITLE
Cc: <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250128075328.20912-1-simon.eu@gmail.com>
 <D7DK5YLXCDJ3.31RLRC7EGPYS4@bootlin.com>
 <CAO8d5Ba0AVHET7CL3EZJnMEd6ca9sgfCWFtT25Tm8sLBRmF1TQ@mail.gmail.com>
In-Reply-To: <CAO8d5Ba0AVHET7CL3EZJnMEd6ca9sgfCWFtT25Tm8sLBRmF1TQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudehjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffveejtedvudekfffgjeffkedtveeggfefvdfgffffjeeugfekhefhleefvdfgieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehsihhmohhnrdgvuhesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jan 2025 09:50:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6205

Hi Simon,

On Tue Jan 28, 2025 at 10:18 AM CET, Simon Eugster wrote:
> Hi Antonin,
>
> thanks again for your comments.
>
> On Tue, Jan 28, 2025 at 9:20=E2=80=AFAM Antonin Godard <antonin.godard@bo=
otlin.com>
> wrote:
>
>> Hi Simon,
>>
>> On Tue Jan 28, 2025 at 8:53 AM CET, Simon A. Eugster wrote:
>> > This patch describes how to use overrides for grub-efi-cfg because tha=
t
>> > is otherwise only clear after reading the .bbclass file. It also adds
>> > a description for GRUB_TITLE.
>> >
>> > Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
>> > ---
>> >  documentation/ref-manual/classes.rst   | 16 ++++++++++++++++
>> >  documentation/ref-manual/variables.rst |  5 +++++
>> >  2 files changed, 21 insertions(+)
>> >
>> > diff --git a/documentation/ref-manual/classes.rst
>> b/documentation/ref-manual/classes.rst
>> > index 761be7b545..1de362e864 100644
>> > --- a/documentation/ref-manual/classes.rst
>> > +++ b/documentation/ref-manual/classes.rst
>> > @@ -991,6 +991,7 @@ This class supports several variables:
>> >
>> >  -  :term:`INITRD`: Indicates list of filesystem images to
>> >     concatenate and use as an initial RAM disk (initrd) (optional).
>> > +   Can be specified for each ``LABEL``.
>> >
>> >  -  :term:`ROOTFS`: Indicates a filesystem image to include
>> >     as the root filesystem (optional).
>> > @@ -1004,6 +1005,9 @@ This class supports several variables:
>> >  -  :term:`APPEND`: An override list of append strings for
>> >     each ``LABEL``.
>> >
>> > +-  :term:`GRUB_TITLE`: A custom title for each ```LABEL``.
>> > +   Defaults to ``LABEL`` if it is not defined.
>> > +
>> >  -  :term:`GRUB_OPTS`: Additional options to add to the
>> >     configuration (optional). Options are delimited using semi-colon
>> >     characters (``;``).
>> > @@ -1011,6 +1015,18 @@ This class supports several variables:
>> >  -  :term:`GRUB_TIMEOUT`: Timeout before executing
>> >     the default ``LABEL`` (optional).
>> >
>> > +Each ``LABEL`` defined in the ``LABELS`` variable creates a GRUB boot
>> entry,
>> > +and some variables can be defined individually per ``LABEL``. The lab=
el
>> > +specific override names are defined as ``grub_LABEL``.
>>
>> +
>> > +For example, for a label ``factory``, the override name would be
>> > +``grub_factory``. A custom GRUB menu entry titled "Factory Install"
>> with the
>> > +additional parameter ``factory=3Dyes`` can be achieved as follows::
>> > +
>> > +   LABELS:append =3D " factory"
>> > +   APPEND:grub_factory =3D "factory=3Dyes"
>> > +   GRUB_TITLE:grub_factory =3D "Factory Install"
>> > +
>> >  .. _ref-classes-gsettings:
>> >
>> >  ``gsettings``
>> > diff --git a/documentation/ref-manual/variables.rst
>> b/documentation/ref-manual/variables.rst
>> > index 0c5c7aab97..16ffbf0e85 100644
>> > --- a/documentation/ref-manual/variables.rst
>> > +++ b/documentation/ref-manual/variables.rst
>> > @@ -3320,6 +3320,11 @@ system and gives an overview of their function
>> and contents.
>> >        :ref:`ref-classes-grub-efi` class for more information
>> >        on how this variable is used.
>> >
>> > +   :term:`GRUB_TITLE`
>> > +      Specifies custom titles for GRUB labels defined in
>> :ref:`LABELS`. See
>>
>> Here you make a :ref: to LABELS, but like GRUB_TITLE, it needs to be add=
ed
>> to
>> variables.rst, otherwise it produces a compile error. You would also use
>> :term:,
>> not :ref:.
>>
>> Can you add documentation for it?
>>
>
> I will change it to :term:. The LABELS term already exists, right?

You're right, I should have double checked. Only change it to :term: then,
thanks!

> Also, is it okay if I fix a typo in standards.md in this same MR, or do y=
ou
> need a separate patch for that?

Please send a separated patch

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

