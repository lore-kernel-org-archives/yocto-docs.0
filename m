Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD787D462AC
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:23:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.12844.1731507782924668595
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 06:23:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JAExJp12;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 715292000E;
	Wed, 13 Nov 2024 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731507780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AtFe+2P5esxrJ74w+/i0H4MasvlS86nqc6Sa44F5u+8=;
	b=JAExJp12dy72r6l8Zl25vG5Iqed/E5nR31MnJWJj3Muasf3kWNn9oLQcL2O8FRd1C6Z9sN
	VcZekmgb+PqUVQtzX6QD8NVin6ve5XHtCEUgbnz8DLO9ngaagBnUKhRypKJuIk7qoMyRl/
	zpWU/BVWeFHgaRex96U7xjzNDUHHgTWG1OO+7Eue5cthOWvnr9zqSOJUiS80xuA08MgHop
	6jlzT0PNrr5iTmMrF1cXLVE/CU9mpa9oT/Zzhg+yib+YdgbPGfUgdzfehmYwQ8WAZZSEHv
	YWHJ/1Rd7P8PFDqpc9Cl/HqkRjBCwud6JASjIygmTBxKEYSUE6H6rNXl0Ln7xw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Nov 2024 15:23:00 +0100
Message-Id: <D5L4A4YLI2UO.3VLZ0KRBPK7R1@bootlin.com>
Subject: Re: [PATCH v2 2/2] dev-manual: document how to provide confs from
 layer.conf
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241112-layer-confs-v2-0-22a09f1a0a8e@bootlin.com>
 <20241112-layer-confs-v2-2-22a09f1a0a8e@bootlin.com>
 <e5dde215-3310-4a3f-bd10-c02137d5c1b7@cherry.de>
 <D5L4597JFNEO.3GX30FCK1IUNZ@bootlin.com>
 <b9d477cc-d0f3-4e20-9b32-53be03b62c44@cherry.de>
In-Reply-To: <b9d477cc-d0f3-4e20-9b32-53be03b62c44@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 14:23:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5730

On Wed Nov 13, 2024 at 3:20 PM CET, Quentin Schulz wrote:
[...]
>>>> +
>>>> +  PREFERRED_PROVIDER_virtual/kernel =3D "linux-custom"
>>>> +
>>>> +This can be defined in the ``layer.conf`` file. If your layer is at t=
he last
>>>> +position in the :term:`BBLAYERS` list, it will take precedence over p=
revious
>>>> +``PREFERRED_PROVIDER_virtual/kernel`` assignments.
>>>> +
>>>
>>> Mmmmm, except if the machine configuration file sets it too with "=3D"?
>>=20
>> Also from local.conf, etc. I guess so what about:
>>=20
>> """
>> it will take precedence over previous ``PREFERRED_PROVIDER_virtual/kerne=
l``
>> assignments (unless it is set from another :term:`configuration file` su=
ch as
>> machine configuration files).
>> """
>>=20
>
> another configuration file that is parsed later, such as machine or=20
> distro configuration files.
>
> ?

Yep, this looks good. :)

> Cheers,
> Quentin

I'll send a v3 shortly. :)

Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


