Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D375C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 07:06:05 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.1974.1752563156540980946
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 00:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YKrfFWLx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F914443C7;
	Tue, 15 Jul 2025 07:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752563154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=za2yqU1UGYPDaLwQU6Kzwz5rrSDvcm3gtPk3Gd+2xi8=;
	b=YKrfFWLxkA1fIuyZP3dIFP5l+tJHa/vvqyQoG0ZARQDAWEfH7QcMSM21ijBO8kUZNk7Ddc
	6CZx0TLTGPJKiTrWaZxRws+2glqlczj3YenF8fYtJ9LZIkXniYctTZnskJM6zfkWNYpxW3
	K/QrHH+szawrJRz+IHRmL4iBayB5x9K9P0xoOesQ249OjZT7TZBcpitFzSVKSdTrQq6ieA
	bgven6WQ6TZ+ipxhNh+/7Ap4mrGf2G4VdL7ZxaZ0EM92i51gb9dthpN7EFcw/35tUOLMOK
	qCj71FiLlkF0TVJdmYwi5IXjS7lYcKMXS0nihOoLmuQTma6wZk5WMR6Hu4xD8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 09:05:53 +0200
Message-Id: <DBCFSE5GDADI.263HWWQM1LUHQ@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH 2/4] ref-manual/structure.rst: update with info
 on PERSISTENT_DIR
Cc: <docs@lists.yoctoproject.org>, "Matthias Schiffer"
 <matthias.schiffer@ew.tq-group.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
References: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com>
 <20250709-update-sstate-dir-docs-v1-2-9114688f33d1@bootlin.com>
 <CANNYZj-4mUU9Beoz95ekGRwvGTUV9zbXqd3w2z7pU_na6qYLtA@mail.gmail.com>
 <ca38bde3e186f7ff5ba3e290e49bc80cbf2df4d7.camel@linuxfoundation.org>
In-Reply-To: <ca38bde3e186f7ff5ba3e290e49bc80cbf2df4d7.camel@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffhvffuvehfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejveeuvedvieeuhfefleduvdfgvefhudekleehkeevhfegtedujedtvedukeetjeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprghlvgigrdhkrghnrghvi
 hhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghtthhhihgrshdrshgthhhifhhfvghrsegvfidrthhqqdhgrhhouhhprdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Jul 2025 07:06:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7329

On Fri Jul 11, 2025 at 11:45 PM CEST, Richard Purdie wrote:
> On Fri, 2025-07-11 at 19:09 +0200, Alexander Kanavin via lists.yoctoproje=
ct.org wrote:
>> On Wed, 9 Jul 2025 at 09:57, Antonin Godard via lists.yoctoproject.org
>> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
>> >=20
>> > Since we mention that SSTATE_DIR can be shared for multiple builds, al=
so
>> > mention that PERSISTENT_DIR should be shared alongside SSTATE_DIR.
>>=20
>> NO. These changes are incorrect, please do not merge or revert if
>> already merged.
>>=20
>> PERSISTENT_DIR can be copied from one build directory to another when
>> bitbake is not running, but it cannot be shared between two active
>> builds.
>>=20
>> If one wants to share sstate, they either have to setup a hash
>> equivalence server (and then sharing PERSISTENT_DIR is not needed), or
>> disable hash equivalency (in which case it is also not needed).
>
> The changes did merge and definitely are unclear.
>
> The point is that if you share sstate, you also need to have common
> hash equivalence data.
>
> That may be via having common hashequiv server, or, of you have a local
> sstate directory and delete the build directory, you need to preserve
> the hashequiv database file to make the sstate useful.
>
> You cannot have a common PERSISTENT_DIR shared by two builds, that is
> not supported.
>
> Hopefully Antonin can tweak things to make this all clearer. I should
> have caught this, sorry :/

Hi all,

Sorry! I drew a wrong conclusion from bug #15921, I will correct this soon
this week.

Alex, thanks for catching this.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


