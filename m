Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FE6C021AA
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:17:30 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.52323.1739801842160513811
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 06:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Fr6d6T9F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8248442A1;
	Mon, 17 Feb 2025 14:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739801840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=maM5srG4JGpi1kw+TkgsFrtypZQEndQbbSG7XGmBD4Y=;
	b=Fr6d6T9F/xtgdnSX8rJdYZAdLam0spbon4q0ju8A4uS0PD86RzjYaLnTaruUUokvTl5eNt
	rPhB1eXqTgXudDDU2naBNrm1jhvZw7/pqs3TYFXom7YJJBy21HXO9mLHmWQIO2n2nM5OTs
	1zvikUJFPMYjeyENk+5VynWXkjPF4vy6WWmVF/RI24EUZ4Mb98mLlCFr7/TJoA96h0LfPp
	8+7ZJ6dwS03d3rrx9Tp26lWZbUKWDq1LyYKoA5esdPW+Lrii+F72z4jLqWfwl5jBO1STf0
	O/Tc1pIiCz05H0jKNNp0v85SDkRIFETk/w5RC7RiSIe5cxUbS+trmsjLsdmgxw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Feb 2025 15:17:19 +0100
Message-Id: <D7USA369NZPQ.25V6I7PBJC6PY@bootlin.com>
Subject: Re: [docs] [PATCH v2 5/6] dev-manual/multiconfig: improve the
 current doc
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Mark Hatle"
 <mark.hatle@kernel.crashing.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
 <20250213-multiconfig-doc-v2-5-f2bd35115cb7@bootlin.com>
 <4d5b0347-f39e-47ba-901c-22c7611630c5@cherry.de>
In-Reply-To: <4d5b0347-f39e-47ba-901c-22c7611630c5@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedvueetgeektefgjedthfffhfejudfhtedugeffvdetjeehffeiteduhfehffeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhoj
 hgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdhhrghtlhgvsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:17:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6388

Hi Quentin,

On Mon Feb 17, 2025 at 1:17 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/13/25 9:23 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> After the suggestions from Mark Hatle on the list
>> (https://lists.yoctoproject.org/g/docs/topic/110487932), rewrite the
>> introduction to multiconfig with the following changes:
>>=20
>> - Move the part of overriding TMPDIR or not to a note.
>> - Use BB_CURRENT_MC in the example.
>> - Various additions of references & improved formatting.
>>=20
>> Suggested-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Though I would recommend to just strongly recommend having separate=20
> TMPDIR instead of trying to explain what a valid usecase for a common=20
> TMPDIR would be?

You're right, I will add the following sentence at the end of the ..note::

"""
In the general case, using separate :term:`TMPDIR` for the different
multiconfigs is strongly recommended.
"""

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

