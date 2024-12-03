Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1673E69EA6
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 10:48:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.16308.1733222902230970212
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 02:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BcYmp+k4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFA82FF80D;
	Tue,  3 Dec 2024 10:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733222900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F4k8KLixRTwp1aAGuZc6ScnGa1enlNOSgy9O3ihQlcE=;
	b=BcYmp+k4zK4nODn3n92R8SXxJ06NV+YJ+b6Bnp/ynqyHuITpYy5GC9QJagXbFbE6M1AiMs
	oDvqV5xuIeUBu6/sMsrVl4bzmZSo7NiHEOt1ouYoAgSzm1H3s9OtNmZ/TGBBinvN55aIDv
	A8tsZeEFDNAe8vST61kNZ93BIlNaWC2cGrq3un4h9yg5eHRPycFEERQWO1A9C/YbwZHhZt
	CfzULzwfsqqTsglHGEzB5wrX5ALJoZXw4/O8uNbNzYSw2fKnTZmdVsvTbuwpxh6c6OiMai
	6HIsA0BSlycge2H0TgvbezECQA96EEWx7wGNVzERmhfaoXvUeu9rNzmlApcgzw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Dec 2024 11:48:19 +0100
Message-Id: <D6208NWRJAPX.SPZ8IMGUAUZ@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH] Add scripts to build the docs in
 containers
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "AntonQuentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241121-docs-build-dockerfiles-v1-1-3b54e1237bf5@bootlin.com>
 <3b8d482f-93c4-4ad8-ad74-6ed8365fcede@cherry.de>
 <D5YR4057DRW4.36YJYWAR7MRDB@bootlin.com>
In-Reply-To: <D5YR4057DRW4.36YJYWAR7MRDB@bootlin.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Dec 2024 10:48:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5866

Hi Quentin,

On Fri Nov 29, 2024 at 4:01 PM CET, Antonin Godard wrote:
[...]
>>> +  fi
>>> +
>>> +  $CONTAINERCMD run \
>>> +    --rm --interactive --tty \
>>> +    --volume "$DOCS_DIR:/docs:rw" \
>>> +    --workdir "/docs" \
>>> +    $EXTRA_ARGS_RUN \
>>> +    "yocto-docs-$image" \
>>
>> please prepend the image name with localhost/ to be sure we don't end up=
=20
>> downloading some yocto-docs-ubuntu from docker.io for example :)
>
> Nice tip, didn't know about that one, thanks :)

Hm, this doesn't seem to work for me, and I couldn't find anything on the n=
et
that shows this. Is there something I'm missing?

  Unable to find image 'localhost/yocto-docs-ubuntu-24-04:latest' locally
  docker: Error response from daemon: Get "http://localhost/v2/": dial tcp =
[::1]:80: connect: connection refused.


Building an image named "localhost/..." will work, but I think it's just
building an image with the name "localhost/...". Not really building someth=
ing
local.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

