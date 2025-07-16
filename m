Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68589C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 07:28:14 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.16370.1752650889484428934
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Jul 2025 00:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lwMFFY8U;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EB2D1FD3B;
	Wed, 16 Jul 2025 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752650887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ulDVQNOcgqOdrCeHXy1ow5zfibbhCh7AdgpPtx1Ukmg=;
	b=lwMFFY8UWEHnmNbTqmmqmvAx2sL+WKQibw+H67NyOxQ6sOFWg4kxSajZmF151MAol7au/X
	yO4RUuk8uA22Quj6x0lMQou3GZ4TTGtno97gPIJr0gUGSPR6iH0VcsWobwOP1P32Sm2Jlz
	jpxxbljRXd1gG4DhV5NCLfA2KPgpw9kDLRxHZkwzjPCQfUVBllSuxaQpVjWlb6JCsGFH+B
	LtINJE4222J8v2JXIUSaEIoyIywYcFX3188NDAGLoFN+3d/WWlKB1xOagOBNKapAtMbZLF
	i1xlIhXqCwe9X5Kfq9Cu+uXwmnY9PmoXjuH/n5JStHXjP2hazO5PH0GMPxHgdA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 09:28:07 +0200
Message-Id: <DBDAVYFTZ6JV.2TSQDQCH9NU87@bootlin.com>
Subject: Re: [docs] [PATCH 2/2] dev-manual/start.rst: remove shared
 PERSISTENT_DIR mentions
Cc: <docs@lists.yoctoproject.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Matthias Schiffer"
 <matthias.schiffer@ew.tq-group.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
References: <20250715-fix-persistent-dir-v1-0-e3f31214b677@bootlin.com>
 <20250715-fix-persistent-dir-v1-2-e3f31214b677@bootlin.com>
 <CANNYZj_kvLsZG3sgH+nPu9B=pqWBU785w0SGHGdQqB4UW-DtmA@mail.gmail.com>
In-Reply-To: <CANNYZj_kvLsZG3sgH+nPu9B=pqWBU785w0SGHGdQqB4UW-DtmA@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfekieeufeeiveekkeevjeetveelkeejiefgfeeihfeghfeghfduvdejuddvvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtt
 hdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrshgthhhifhhfvghrsegvfidrthhqqdhgrhhouhhprdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Jul 2025 07:28:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7340

On Tue Jul 15, 2025 at 5:55 PM CEST, Alexander Kanavin wrote:
> On Tue, 15 Jul 2025 at 11:56, Antonin Godard via
> lists.yoctoproject.org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
>
>> +    -  Set up a local :ref:`overview-manual/concepts:Hash Equivalence` =
server
>> +       with :term:`BB_HASHSERVE` and :term:`BB_SIGNATURE_HANDLER`. A ba=
sic setup
>> +       would be::
>> +
>> +          BB_HASHSERVE =3D "auto"
>> +          BB_SIGNATURE_HANDLER =3D "OEEquivHash"
>
> This is still problematic and should be clarified further:
>
> 1. BB_HASHSERVE and BB_SIGNATURE_HANDLER do not set up or start a
> server, they set up the hash equivalence client built into bitbake.
>
> 2. The above client configuration (used by poky) also starts a private
> server that is specific to a particular build directory. So hash equiv
> information would not be shared between multiple build directories,
> and this will cause sstate mismatches (as reported in the bug), if
> sstate is shared.
>
> Maybe it's easier to just remove the above, and only refer to the hash
> equiv section in the other manual:
>
> +    -  Set up a local :ref:`overview-manual/concepts :Hash Equivalence` =
server
> +
> +       See the :ref:`overview-manual/concepts:Hash Equivalence` section =
of the
> +       Yocto Project Overview and Concepts Manual for more details on th=
e hash
> +       equivalence feature.
>
> Then we can do a correct, comprehensive description there.

Yes, I also feel that hash equivalence could deserve its own document, and
should go further than a server/client local to the build directory only. T=
hanks
for the clarification.

I will try to work on this soon, at least for now the shared PERSISTENT_DIR
mention is reverted, which is good.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


