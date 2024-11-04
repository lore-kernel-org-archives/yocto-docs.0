Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169A5D132C5
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 13:31:23 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.57318.1730727080965936243
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 05:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PrL/p9pB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE697E0005;
	Mon,  4 Nov 2024 13:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730727079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xB+s55zyGBKrNqAgIKH6pqu90gz6DopKfR/swaQYLlk=;
	b=PrL/p9pBzC1FCqVQkDbvtzk3AW4LMNp8LKGoZtHNV8wepcHYCPenlZ/xKff6qb6f+89GS9
	tkZg3m5oZYyAnr8P8aST4Xx+ecY0e8RemmK4V3rr/X/I05YOmdGsC4EGX6yXv12s/jWSE3
	XTvvwHHVZYS9/u3QfZg898C8Uelk63x8BxxgIwV7abFjp36ZDe5f+Uf3PVD3ny/29BJDZ4
	yOS3w3xIHG6EA44zM87wHlpgbvtnW+Fj1TsTxjmh48R0adm9opOw+V13VinP2QElCGwX/x
	pLqUwqrDq/qYBRigpHrSOWqtnT70GaMLZN088DWrZN8yTN9FLhFVNfOcaiCZww==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 14:31:18 +0100
Message-Id: <D5DFJNMJZVEW.HSMGI2KFHB0O@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [PATCH] conf.py: rename :cve: role to :cve_nist:
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Julien Stephan"
 <jstephan@baylibre.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241104-new-cve-role-v1-1-4d2c6efa364a@bootlin.com>
 <c329c77d-b5cc-4a28-a345-ac4261a70d3c@cherry.de>
In-Reply-To: <c329c77d-b5cc-4a28-a345-ac4261a70d3c@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 13:31:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5656

On Mon Nov 4, 2024 at 1:55 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/4/24 1:39 PM, Antonin Godard wrote:
>> Newer versions of Sphinx already define a :cve: role that points to
>> cve.org, instead of the role we defined in conf.py that points to
>> nvd.nist.gov.
>>=20
>> Rename our role to :cve_nist: to avoid warnings (treated as errors).
>> This is also backwards compatible, meaning we can build the doc with an
>> older Sphinx if needed.
>>=20
>> Suggested-By: Quentin Schulz <quentin.schulz@cherry.de>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>
> Looks good to me. I assume you didn't change those by hand, maybe add=20
> the command you used to do the migration so we can figure out if=20
> something's been left out inadvertently? (Would be useful if we figure=20
> out in the future that this missed something so we can more easily find=
=20
> a programmatic way of fixing the left-out instead of finding and fixing=
=20
> them by hand?).

Hmm... I used my editor, but the equivalent one-liner is:

find . -name '*.rst' -exec sed -i 's/:cve:/:cve_nist:/g' {} \+

Which I'll add to the commit message.

> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> (Admittedly only reviewed the conf.py part :) ).
>
> For backporting, we'll likely need a new patch on the autobuilder, c.f.=
=20
> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/docs-b=
uild-patches=20
> since we want to build tags which we cannot move.

If I understand correctly, these are patches to apply to old documentation
versions? To extend my reasoning on this, since new tags were added recentl=
y for
old doc versions, should I update `missing_tags` and add corresponding patc=
hes
there? I'm a bit clueless :)

> Thanks!
> Quentin

Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


