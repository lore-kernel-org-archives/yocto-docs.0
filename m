Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1D5C83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 06:49:34 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.7850.1753253371106709408
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Jul 2025 23:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZIHo9t00;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2779C42E80;
	Wed, 23 Jul 2025 06:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753253369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4g/2NiKoU8h4NeGrt4Qd5cJrjaA8J2LPNuguMKhY+r4=;
	b=ZIHo9t00uikp0g+ErR2LlRr6hsn9ZFyNxdYNugzHU2gPYDLa3Z38fYLxTiTqwdLnIJjULG
	xYh7Iu/5nmAOE1treXXntduUoqQvpeXXUYvIlB1hR+HOVLKViWIPuyDNh8QnLbWm3UAJlh
	mrEJd7qkNa8YIZhb16z9LAckNT9ffTii2aHXbHQQAWDtHyBYwcyvBzrTFRjMII2xkKBDDp
	GIhLbSz3n9u66ef8e6Ep0SC5ADDcXp5PPB2m/Y22O9t3drA9IhGEdOiDmZ/viq8tW6CdXZ
	tGyL3Fj9opigFPKI4/6ZqlfZtlX1fvrMEPzgmnfkBaNoLiqIN7qO9ZcP61Lc0g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 08:49:28 +0200
Message-Id: <DBJ8G6JYSDMV.2D1WMWE6I5J3B@bootlin.com>
To: <m.cavallini@koansoftware.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] start.rst: added missing command in Optimize
 your VHDX file using DiskPart
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20250719160642.15601-1-m.cavallini@koansoftware.com>
 <DBHJFODNAHX2.1F1Y9FOOE7AF0@bootlin.com>
 <1f54c0b2-0162-4292-a67c-f14bf81730ca@koansoftware.com>
In-Reply-To: <1f54c0b2-0162-4292-a67c-f14bf81730ca@koansoftware.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejjedutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkvffuhfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeggeeuveefvdeutdefueeltedvkeeiheejkeejfeeftdffiedtffduudehhedtkeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhdrtggrvhgrlhhlihhniheskhhorghnshhofhhtfigrrhgvrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Jul 2025 06:49:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7364

On Tue Jul 22, 2025 at 7:33 PM CEST, Marco Cavallini wrote:
> On 21/07/25 09:00, Antonin Godard via lists.yoctoproject.org wrote:
>> Hi Marco,
>>=20
>> Thanks for the patch. Could you describe the issue you had in the commit
>> message? It's hard for anyone to understand the context here, and having=
 a
>> commit message would help understand why this change is required.
>>=20
>> Antonin
>
>
> Hi Antonin,
> any news about my Patch v2 ?

I merged your patch on master-next, it will be merged to master on the next=
 pull
request. You will receive an email from me when that happens.

Thanks for reworking the commit message!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


