Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D643CC02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 08:18:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.64884.1738916306185905634
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 00:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fak8bS6C;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C35344354;
	Fri,  7 Feb 2025 08:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738916304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SZ9ZuCEfJ77zH54zzsrTN6dR3noYtSDfXG0E4n44NVA=;
	b=fak8bS6Cb1bdNmTnwKpTADidbADk9j8OUXcMiu1FN7mb13G1loyAervBUGip6S8K8JBSpD
	+kssk3D9Vntnmvlj1ArQ3197YWXPT9AOcw+hMuFhwGTXDqdNEqYXzlmIFiIceE+4MDHUb4
	pvCO01XEf41Vt76zDTuNl/Mme/ZJgwTqAhNNJa4kMHM9sHsKsnD8Nur+nW5K2zIw7D5Mt5
	b913cg1w529Fz4AiMQ+gwkqw2j29zhADBG7nNtiXOPpxnRia4bxeSyMxajEYas8U8vbrT9
	K/ce/Jst7MzqxKGfVhtOmFMsbgyHCjRdVRJ5k60vT2A8He0gSltCYVPXqu9m5w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 09:18:23 +0100
Message-Id: <D7M2DTQZV3KJ.1FMDRKOD2OBR2@bootlin.com>
Subject: Re: [docs] [yocto-docs][PATCH v2 2/2] migration-5.2: add virtual
 provider change
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250131-migration-5-2-updates-v2-0-4ce688a74bfd@bootlin.com>
 <20250131-migration-5-2-updates-v2-2-4ce688a74bfd@bootlin.com>
 <ef83770e-6502-4f74-8ae4-89954666780b@cherry.de>
 <D7GA5NFGNWXK.22TNU3A37YW4I@bootlin.com>
 <23e98634-61ac-47d9-a237-8ca27b36e575@cherry.de>
In-Reply-To: <23e98634-61ac-47d9-a237-8ca27b36e575@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdehtdetteehfefgjeelieelvdeiveeludffjeegueefudejueeffeejfeevgedunecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehth
 hhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 08:18:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6271

Hi Quentin,

On Thu Feb 6, 2025 at 10:25 AM CET, Quentin Schulz wrote:
[...]
>>> +
>>> +PREFERRED_PROVIDER_virtual/nativesdk-cross-cc =3D "gcc-crosssdk-${SDK_=
SYS}"
>>> +PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ =3D "gcc-crosssdk-${SDK=
_SYS}"
>>> +PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs =3D "nativesdk-gcc-r=
untime"
>>>
>>> Now looking a bit more into the changes made in this commit, there isn'=
t
>>> a simple search and replace that can be used, sometimes it's replacing =
a
>>> variable with one value, sometimes with another. Depends on the recipe
>>> the change is made in I guess?
>>=20
>> I guess so. It's probably going to be different based on the recipe, but=
 I
>> wouldn't know how to phrase it here. I just gave some more examples to
>> illustrate the changes. Any idea on a better way to explain this?
>>=20
>
> The issue is that the example implies that the change is simple and=20
> automatic, it is not I'm afraid. For the variables that we know can be=20
> changed automatically then it's fine, I believe that's the case for=20
> PREFERRED_PROVIDER with TARGET_PREFIX. For the others, maybe stating=20
> that one replacement could be X -> Y but it depends, so rather see <link=
=20
> to commit> to check for yourself.
>
> Don't have a better suggestion than that unfortunately.

I get what you mean, thanks. I think I will rephrase this is bit, stating t=
hat
those are examples, but should not be taken as a simple grep & replace. I'l=
l
also link to the commit in question.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

