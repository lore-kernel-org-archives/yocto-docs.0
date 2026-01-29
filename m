Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9CAD61003
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:17:36 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12778.1769685449792764646
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 03:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=H8TJ/Xf1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9AC0BC211FB
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 11:17:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B461606B6;
	Thu, 29 Jan 2026 11:17:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17E70119A882D;
	Thu, 29 Jan 2026 12:17:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769685446; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XY4zl5H6GdEHfREx65Vtwd+tm8VbN6EVXqt3dgG9hYY=;
	b=H8TJ/Xf1f/xnt6jdrA8afl/42WCrv1u2dI/XNg9oZwFjirMtF91wjFZLbBKUNsbMt7X3IO
	O57/wCiRAWZxoknemAgdbyJ/ji58MKt3Mp4agm9SOKrmg6lpnb/lGLjqwE67DLJGBG/8tb
	2BFOfbMA4YaE4XG7ojVg37wpoVF6gT4Htsz0DDibQ1mXjWJBkVtARIy5wuF3kQDnXrBsQv
	yWdMHLP1/13/LQPENCZeGKtVMOHGC/mc/tR3sb2SXfNUImcRou53L4k8wpr0FzX9YQWe7K
	2QqahFUMGH1PyV6p5a+BSRgiD2idDZcDFzCw/qPcLW/Pe8bQaERvryMdjvtTJg==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 12:17:25 +0100
Message-Id: <DG114U9XCHNL.1C0474QCG0ZCC@bootlin.com>
Subject: Re: [docs] [PATCH v2 04/56] bsp-guide/bsp.rst: remove obsolete poky
 repo references
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-4-74bf80cc4e5a@bootlin.com>
 <17c0f924-35d0-4d2b-b152-8ea5f7812676@cherry.de>
In-Reply-To: <17c0f924-35d0-4d2b-b152-8ea5f7812676@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 11:17:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8784

Hi,

On Tue Jan 27, 2026 at 12:27 PM CET, Quentin Schulz wrote:
[...]
> Actually, probably should be 4 and have two spaces between #. and=20
> *Initialize* since that's the rule we have for lists. I see most of the=
=20
> lists in the diff in this patch don't follow the rule so I guess that's=
=20
> not a blocker :)

I actually think it makes more sense to have one space for "#.", as this wa=
y it
aligns with bullet lists "-  ":

#. foo
-  bar

>> -      $ source oe-init-build-env
>> +      $ source layers/openembedded-core/oe-init-build-env
>>  =20
>>      Among other things, the script creates the :term:`Build Directory`,=
 which is
>> -   ``build`` in this case and is located in the :term:`Source Directory=
`.  After
>> -   the script runs, your current working directory is set to the ``buil=
d``
>> -   directory.
>> +   :term:`Build Directory`. After the script runs, your current working=
 directory=20
>
> s/:term:`Build Directory`/"build"/
>
> otherwise this says "Build Directory, which is Build Directory".
>
> is set to
>> +   the :term:`Build Directory` directory.
>> +
>> +   .. note::
>> +
>> +      Alternatively, you can source the ``init-build-env`` file provide=
d by
>> +      :doc:`bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-man=
ual-environment-setup>`
>>  =20
>
> You didn't answer the question on v1 so posting it here again:
>
> Can we set up using bitbake-setup and then source oe-init-buildenv from
> oe-core? Or vice-versa. The wording seems to imply that.

I mean you could but probably you wouldn't want to?

> Isn't most the above not applicable if we use bitbake-setup anyway?

As you have seen from this series, for now, it doesn't force you into setti=
ng
things one way or another. A further step to this series would be to locate=
 and
replace these with bitbake-setup specific instructions, dropping the manual
setup anywhere.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


