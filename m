Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5D6C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 11:12:46 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.84396.1749553959355016958
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 04:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kjOvLnt1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BE4D4397D;
	Tue, 10 Jun 2025 11:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749553957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZkMLHnqyvX8nzN3C7JWC31rFjj+NVwacnyfXJp7YPMg=;
	b=kjOvLnt1J55iMzN6uTMaSGHWFSO6TD9Ojpt4Y7P98PajbCPceqtYMs9aulnivXKJZSHWDt
	xIbI8qznUE4KK43dSENmUX0rVuNPBaMqmZmGjIzXhDcpMUWIvabexvlOygJJtKGMtph4B1
	HAyrYwx7hhfr6Vh9cq9NR32jNJLQNGtEqBFCqfRoO2XVcnk3T8D7x1qGHsEslZEICAiBou
	BHNngGzNl27PDrsoXcCmU9RhhLN5YBWiDibsZeh/OU0JFnsh7+6Og8NM5weILIie6qoAHE
	utKKtEq3dKb9YWjXAJU6qcqdZF0dVIhyY5DS/poSYxQLPwTt9PmIeWvtG4bPiw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 13:12:36 +0200
Message-Id: <DAIT484UO7PK.O44X5ENB46R3@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: classes: add recipe-naming QA test
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <ross.burton@arm.com>, <docs@lists.yoctoproject.org>
References: <20250610101926.2235143-1-ross.burton@arm.com>
 <DAIT2K0K3LCH.1WT45FSKPZOM3@bootlin.com>
In-Reply-To: <DAIT2K0K3LCH.1WT45FSKPZOM3@bootlin.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedttddugffgledvjeeihfegvedvuddtgeeggeejfffhtdektddvieeugfevtdeuudenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 11:12:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7049

On Tue Jun 10, 2025 at 1:10 PM CEST, Antonin Godard wrote:
> On Tue Jun 10, 2025 at 12:19 PM CEST, Ross Burton via lists.yoctoproject.=
org wrote:
>> Add documentation for the new recipe-naming recipe QA test.
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  documentation/ref-manual/classes.rst | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-ma=
nual/classes.rst
>> index 54a98bf24f3..9be1c2c587c 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -1591,6 +1591,10 @@ The tests you can list with the :term:`WARN_QA` a=
nd
>>     For example, assignments such as ``FILES:${PN} =3D "xyz"`` effective=
ly
>>     turn into ``FILES =3D "xyz"``.
>> =20
>> +-  ``recipe-naming:`` Checks that the recipe name and recipe class matc=
h, so
>
>> +   inherit :term:`nativesdk`.
>
> :term: are not defined for those, but :ref:`ref-classes-native` and
> :ref:`ref-classes-nativesdk` are.
>
> Maybe also say that BBCLASSEXTEND should be set appropriately, so users
> encountering the issue know what to do?

Sorry I got confused, recipes need to `inherit` one class or the other,
so BBCLASSEXTEND is not needed!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


