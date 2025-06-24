Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CF4C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 08:35:56 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web11.3815.1750754147922811482
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 01:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OSW1G8RM;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0445E4386C;
	Tue, 24 Jun 2025 08:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750754146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Om8yEzJHbeYl59GZylFkCoALC9jvRCsmccaDTBOpldA=;
	b=OSW1G8RMHzKTNZsxGj7MoY9Qlzi9zRP/X8XpRL8SCTP+Pas0/1SrkTtVmOrsFt/lKgc7Be
	fXSHJr4L5qv6woAE+2NaqTfqzKvSjheHAiOnhuX+IpyXOyvGQzPSkEIPPqj8xNV+KuJU19
	lBI597giiCWrpzKPNM6hmDmUBjcUxdaMlpWioYUw44KnJ8KpkTPPnA9kZlYi7czLw2KT6P
	5n6ghqLIVAIZ2LXPtI4Fg4sObqEuVGhTxecoevNJADWMq2AZ44P1CtZeCMKSe0u5KIq+/a
	3A54ZmXVxJhpRIa1mR7YgxW8HPfXqPi2LUV5s7pRdMHZ0B8sKCNsuqnYclDNSg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 10:35:45 +0200
Message-Id: <DAUMJR1JIO0X.I9IFP24VIJ4Y@bootlin.com>
Subject: Re: [docs] [PATCH] dev-manual: some minor cleanups to "Pre-Built
 Libraries"
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <b88499e3-e0d1-5aff-490c-ae13c2dbfb31@crashcourse.ca>
 <DAULKYBT3POY.38V8CSIV0F8K0@bootlin.com>
 <e35decf1-32df-59f8-9456-335ecdec531b@crashcourse.ca>
In-Reply-To: <e35decf1-32df-59f8-9456-335ecdec531b@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedutefftdefffeikeetueeuiedvkeduieeliefhkedtfeekveehleelleeuheffkeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhpjhgurgihsegtrhgrshhhtghouhhrshgvrdgtrgdprhgtphhtthhopeguohgts
 heslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 08:35:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7192

On Tue Jun 24, 2025 at 10:31 AM CEST, Robert P. J. Day wrote:
> On Tue, 24 Jun 2025, Antonin Godard via lists.yoctoproject.org wrote:
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
>
>   i'm not sure that's the right way to do it. that old article is
> quite a decent explanation of library versioning; if we now link
> directly to the FHS spec from the yocto docs and bypass that article,
> we lose a lot of good intro-level explanation.
>
>   thoughts?

I see. Then as Quentin suggested I think it's reasonable to link to
https://refspecs.linuxfoundation.org/fhs.shtml instead of the 3.0 version, =
and
say:

"""
the latest release can be found `here
<https://refspecs.linuxfoundation.org/fhs.shtml>`__.
"""

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


