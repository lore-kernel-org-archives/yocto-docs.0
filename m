Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4940CDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:04:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38243.1782115433217676415
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 01:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zQLk+GBK;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0E6CBC62209;
	Mon, 22 Jun 2026 08:03:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0AF0B601BB;
	Mon, 22 Jun 2026 08:03:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BC54106C819E;
	Mon, 22 Jun 2026 10:03:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782115430; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7gbQncA92lGvX9rEidFaAWs8CYZ7z+GQ0iLJutCFoJg=;
	b=zQLk+GBKaWeHCEf2GFvDiIdLcS9oRxjwK257l0nJyD7gawKS1sO9JwzFwY9zV/KpmgVzKL
	9klBy1xvdGXnGTnFFJXaD2aOxLtSLo/zCzdsyOHMvYsakU/gb83d8NtT6+0QIazncq5ww3
	h6fxdORrPn40kqIqIwjRCmL+pfDpBo5TUmaMq41Txz8ToZMxuHqW2zaP3yz9Etn56N/SFe
	SfrGoIRQEwap9187dBPWn4wuTJmfq+GyTEg2MevvV4xKHyvsDLpu08QLBSkmQyNP9PSAz7
	91QMkcwLMFDh6eLv2jBlVtybD2A0W5ucCxPcBNVw5IZ1jN1E0o+Hpul3YohAJg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 10:03:48 +0200
Message-Id: <DJFF71VOMOX3.QQ7JIW3WTEM@bootlin.com>
Subject: Re: [docs] [PATCH v2] dev-manual: mention that "bmap-tools" is
 transitional package
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "Quentin Schulz"
 <quentin.schulz@cherry.de>
References: <79fecd83-e402-c49f-ef11-ea4024ed77e8@crashcourse.ca>
 <b2efd029-8b9b-499b-91e5-dce3646f384f@cherry.de>
 <35ff1c1f-1331-8675-be8a-ddec3baf0283@crashcourse.ca>
In-Reply-To: <35ff1c1f-1331-8675-be8a-ddec3baf0283@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:04:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9817

On Fri Jun 19, 2026 at 8:32 PM CEST, Robert P. J. Day wrote:
> On Fri, 19 Jun 2026, Quentin Schulz wrote:
[...]
>> > +   -  Finally, in modern Ubuntu and Debian releases, the ``bmap-tools=
``
>> > +      package is a transitional package; it exists solely to ensure
>> > +      backward compatibility and smooth upgrades from older installat=
ions.
>> > +      You can safely remove it and install the active package,
>> > ``bmaptool``,
>> > +      which contains the actual utilities for flashing block images.
>> > +
>>
>> Just list this in the first bullet point which is related to Ubuntu and =
Debian
>> distributions?
>>
>> I could see switching the default package to install from bmap-tools to
>> bmaptool and add a note (Sphinx note) that on older releases, it was nam=
ed
>> bmap-tools so install that package instead.
>>
>> Note that Fedora 43+ has bmap-tools, and Leap 16+
>> python3-bmap-tools/python3-bmaptools.
>
>   my patch was already merged into master-next, but i like your
> suggestion so if antonin thinks it's worth it, he can revert that
> earlier patch and i can do it your way.

I dropped it, I also like Quentin's suggestion.

Thanks both,
Antonin

