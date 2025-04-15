Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F300FC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:49:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.20599.1744724976828905795
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 06:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b9r3gW3K;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D31343927;
	Tue, 15 Apr 2025 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744724974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EF7DlxwC606EgqaybIDuu6G3413gJ56lhcO61EWGeO8=;
	b=b9r3gW3K8tuEQtenwNebCQqc0Tqh806QjC0xXlRqkVnbpWr4yV3CavTXsKUf48NNS65OUx
	43vqdJLSxYcJKSXx/rKH+P5Dc/5wdS4pCwqSQBW9KzN6+zJE4Q9wd6zvnQcnbMC/5XoJzA
	WIhZLqHYbQqJAGnBIZr4whQW99daxNEOHZP6UZkuLxkBKaS7+dvY6JMsSZrXPe2pIy4Zc5
	1d9R+sabI4t8aGZpkur1oIA3e/5d7JUCZkFLJy8Fh8r0DJhoXcGqYAHkYRW69Gm/SQFxOk
	VZpK/Unw1DjhPnRlOhm21UzKfX7VsmipbLq8D5QiATdB8n4lNNnhemBfuJIV4A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Apr 2025 15:49:34 +0200
Message-Id: <D979DW160AWA.3BNSCK8AIH7I0@bootlin.com>
Subject: Re: [docs] [PATCH]
 migration-guides/{migration,release-notes}-5.2.rst: notes for systemd
 pni-names
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250415-systemd-migration-note-v1-1-24f9ee7c2b94@bootlin.com>
 <235677f5-9ad7-4653-b23d-7a57c5cd8812@bytesatwork.ch>
In-Reply-To: <235677f5-9ad7-4653-b23d-7a57c5cd8812@bytesatwork.ch>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfeiueekteelgfdthfetvdeigeetieffheetteduudduieehteeggedvheetueenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepuggrnhhivghlrdgrmhhmrghnnhessgihthgvshgrthifohhrkhdrtghhpdhrtghpthhto
 hepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegvjhhosehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Apr 2025 13:49:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6749

Hi Daniel,

On Tue Apr 15, 2025 at 3:18 PM CEST, Daniel Ammann wrote:
> Hello Antonin
>
> On 4/15/25 14:41, Antonin Godard via lists.yoctoproject.org wrote:
>> Add a note to the migration guide regarding the pni-names behavior
>> change.
>>=20
>> Suggested-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/migration-guides/migration-5.2.rst     | 7 +++++++
>>   documentation/migration-guides/release-notes-5.2.rst | 7 ++++---
>>   2 files changed, 11 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/documentation/migration-guides/migration-5.2.rst b/document=
ation/migration-guides/migration-5.2.rst
>> index 6b7d02d65..9df04d291 100644
>> --- a/documentation/migration-guides/migration-5.2.rst
>> +++ b/documentation/migration-guides/migration-5.2.rst
>> @@ -104,6 +104,13 @@ systemd changes
>>      ``journald.conf`` to "persistent". The ``/var/log/journal`` directo=
ry is now
>>      used for logging instead of ``/run/log``.
>>  =20
>> +-  If ``pni-names`` is not in the :term:`DISTRO_FEATURES`, the `Predict=
able
>> +   Network Interface names <https://www.freedesktop.org/wiki/Software/s=
ystemd/PredictableNetworkInterfaceNames/>`__
>> +   systemd feature will now be disabled. Previously the feature was sti=
ll
>> +   enabled even if ``pni-names`` was part of :term:`DISTRO_FEATURES`. M=
ake
>
> Shouldn't this be "was *not* part of"?

Well spotted, thanks.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

