Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C293C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 08:03:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.33997.1742803403243410392
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Mar 2025 01:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e35bDQc0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42D66442D7;
	Mon, 24 Mar 2025 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742803401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+Zsz9aBv/RvYTKTbTgMULWYwEuqeGJEsXVaFcn5wBM=;
	b=e35bDQc0kJ4yF6DnZwnAqRrxWZAA/YtvrZHjtykLSNUBd5UkfdaTz8+qUl2vBiSDMo8U17
	e26az5fYk7oFg1n9ZeSOJ+t+GL1E32wgt+7q5EVx304bGB/0TJzPE4fwSvjYx+m+8OUE33
	VBHZEkJqOz2crH3U4dDo6eiJ5zUddpU5ONwcW97Cx46HP4NdHNnoC542h6CMmp7zpFBB6f
	y4RgUZx4uNPnECKsaAroEKdRrx3rExtlz6LA/4eSk5SIf0jtNoRdLY2s4CAFj+siuW2L3K
	r1JbdwhpBBcY04nJVeDjCCcp5PEMV35xXbgdB36vVXN9ktnKSVukxyS9iRkfRg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Mar 2025 09:03:20 +0100
Message-Id: <D8OC8T5JH1E1.1BY5JO1ZMJZUT@bootlin.com>
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: encourage
 patch version changelogs
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Trevor Woerner" <twoerner@gmail.com>, "Antonin Godard"
 <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-42-gf66bdccc6922-dirty
References: <20250318035605.1221-1-twoerner@gmail.com>
 <D8J8L9OJVWQU.2W2AYKHMLC149@bootlin.com> <20250321165129.GA12580@localhost>
In-Reply-To: <20250321165129.GA12580@localhost>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhedtteetheefgfejleeiledvieevleduffejgeeufedujeeufeefjeefveegudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtfihovghrnhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhis
 hhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Mar 2025 08:03:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6607

Hi Trevor,

On Fri Mar 21, 2025 at 5:51 PM CET, Trevor Woerner wrote:
[...]
>> > +   ---
>> > +   changes in v4:
>> > +   - provide a clearer commit message
>> > +   - fix spelling mistakes
>> > +
>> > +   changes in v3:
>> > +   - replace func() to use other_func() instead
>> > +
>> > +   changes in v2:
>> > +   - added
>>=20
>> "added return value check for func"?
>> to give a more concrete example
>
> It's not uncommon for the v1 series to have N patches, and the v2 series =
to
> have >N patches; in which case one or more patches were added in v2. This
> isn't a really bad commit log where the author forgets to say what they a=
dded,
> it's a message saying "this patch was added in v2".

Oh ok, I didn't understand what you wanted to show when reading the example=
. I
think for the sake of the example we could be a little more verbose, and wr=
ite
something like: "added patch '<title of the new patch>' to the series". Aga=
in,
it's just to give clear examples to users of what this changelog could cont=
ain.
What do you think?

>> I think it would also be nice to also instrict to give the link to the p=
revious
>> patch but that might go a bit too far if done manually each time.
>
> That's not something I've seen often, but it could be community-specific.

Actually, b4 is doing this for me automatically. :)

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

