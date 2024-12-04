Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F9DE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 10:17:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.10664.1733307422424760486
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 02:17:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MnGB5UBh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EC5E1C000A;
	Wed,  4 Dec 2024 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733307420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EXIn4ky/+PI1IAF0uoNrEIGIQ06ynJ2+4oQl0jGTPjg=;
	b=MnGB5UBhUpr1sjIgb7r3aU+kPSRRqh+RAroyMdamqLhXskhPp7c6VOVRKINI6zi05vsCjK
	HU9StRrk8nz7lN2bRNuLG7o2sfuigXbEsabhvjHmMLKeBRlEIEwgnqE2hFGSTKO82YucBI
	VQJhkvyFKyYGds2m9blOml2gH+NWOgoAWWly6dWkrqpCcEZH7EUl+uu1t3RM3RhTwRoUz2
	QGtt/IBAssrhR1TG48XGtMLKAmWh6NhkgvQ0DrmTw116M+9NRKcDrvnm7uTpk/yQs0ASwm
	c1I9VAoY6JqQSQgqJRkcxqTa0Yvtn6zPG0L3S/wpNgtjeIr0Dts8+XxVw9JyhQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Dec 2024 11:17:00 +0100
Message-Id: <D62U785RP89V.3LP5FTJUJMCV9@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 3/3] dev-manual/bmaptool.rst: simplify and fix
 instructions
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
 <20241201173801.3290796-3-michael.opdenacker@rootcommit.com>
 <D613DE1UW3GV.OXCJKSG2VQH6@bootlin.com>
 <7fa75108-fb1b-4d62-babc-054888a076d3@rootcommit.com>
 <1bf657ac-1392-4ac0-b279-9689a8de8d09@rootcommit.com>
In-Reply-To: <1bf657ac-1392-4ac0-b279-9689a8de8d09@rootcommit.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 10:17:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5874

Hi Michael,

On Wed Dec 4, 2024 at 10:33 AM CET, Michael Opdenacker wrote:
>
> On 12/4/24 10:26, Michael Opdenacker wrote:
>> Hi AntoninI know this was already instructed before, but maybe `chmod=20
>> o+w` is a better
>>> practice and advice to give. What do you think?
>>
>>
>> I wondered too. Let's do it, I agree.
>
>
> Actually "chmod a+w". On my Ubuntu system, "o+w" would have worked, but=
=20
> there may be other systems on which the user either owns the device file=
=20
> or belongs to its group.
> Michael.

Yes indeed "chmod a+w" covers all use use cases so let's go for that :)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

