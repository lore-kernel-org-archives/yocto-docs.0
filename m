Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DE4C02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:09:11 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.65235.1738919345805289923
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ctwzAUyf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9380443304;
	Fri,  7 Feb 2025 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738919343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8eL2TTjh/H49BWfVJ/FbNZ5GEjXo7Qnkr3SYvbSbDQ=;
	b=ctwzAUyf0rWGk7GC0d/oOgWGxCVj6CwqVUZeK5YvA4gYPKsAqJgMbeMByfs9ge9MAFTgw8
	yd8dp5X30fnaSJWM6gC7QRchQlpifbNvIzSxgwk2jsvIgHseWqMp1sPNkOofxPXVkn7Dm1
	5+KN5pCgfw7BVNX027XfLXBg/DZfLTcboGHp090MeDX8SMh2wIy1BAe+pgLdSg+6UqIgPF
	kgipwwlzKYCLGobLUFKRwtMjJVuE+XyqbznexaO9TM4UMCk7zp4Zj0CBy3dFSOP3m7c105
	DjnHHIS/DznCPVOR+0lz5RUOjXXwUaYslarMzhoYkPzWdL4beVoBc/mXQ6cckA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 10:09:03 +0100
Message-Id: <D7M3GM34KQS7.2FXQ9D5DD967T@bootlin.com>
Subject: Re: [docs] [PATCH v2] add basic b4 config file
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
In-Reply-To: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddvffdvveetieehkeetjeevgedttefgieelkefftefgteekteehheegteekleetnecuffhomhgrihhnpehphihpihdrohhrghdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepfhhoshhssedtlhgvihhlrdhnvghtpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrg
 hdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:09:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6282

Hi Quentin,

On Wed Feb 5, 2025 at 3:02 PM CET, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> b4[1] is a very nice tool for mail-based contribution. A config[2] file
> exists to set up a few defaults. We can use it to set the To recipients
> to always add, in our case the mailing list.
>
> Because we do not have anything to check for now, disable needs-checking
> so patches can be sent without running b4 prep --check.
>
> Because we do not have any auto-to-cc support (and the implicit one
> using scripts/get_maintainer.pl cannot work for us), also disable
> needs-auto-to-cc so patches can be sent without running b4 prep
> --auto-to-cc.
>
> [1] https://pypi.org/project/b4/
> [2] https://b4.docs.kernel.org/en/latest/config.html
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> I'm wondering if we couldn't add some per-patch check as well, checking
> that the documentation builds for each for example. Could be added in a
> later patch though. Any idea?

I think this is a good idea although I think it would make more sense to bu=
ild
the tip commit only, as doc builds are a bit long? Don't know if this is
possible with b4, though.

In any case we might also use your container scripts for this (which I will=
 get
to soon hopefully!).

> ---
> Changes in v2:
> - add mailing list to To recipients instead of Cc recipients to match
>   our contribution instructions,
> - Link to v1: https://lore.kernel.org/r/20250123-b4-support-v1-1-03b4a18e=
dfdf@cherry.de
> ---
>  .b4-config | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/.b4-config b/.b4-config
> new file mode 100644
> index 0000000000000000000000000000000000000000..77b28554b1952158bd8ee94a9=
c9439a60f3e80d2
> --- /dev/null
> +++ b/.b4-config
> @@ -0,0 +1,3 @@
> +[b4]
> +  send-series-to =3D docs@lists.yoctoproject.org
> +  prep-pre-flight-checks =3D disable-needs-auto-to-cc, disable-needs-che=
cking
>
> ---
> base-commit: 6b44257874858db3aa426d3e84a79c41cb4937a3
> change-id: 20240524-b4-support-d5e749251bba
>
> Best regards,

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thanks for this!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

