Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D996D132B0
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 11:12:02 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.55226.1730718714578084093
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 03:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f0MzomOf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59750C0008;
	Mon,  4 Nov 2024 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730718712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JoIGSpivXIjhBGDPG1oZxqtGJ7ygTSTImWFkvY4IN1g=;
	b=f0MzomOfzHb5Md9wZdjWH5jPz816vy0+I7PGkBzPrBG5rZXRWWJtrpp5g0uCotEOrTKYRS
	f6CRR77gJZXX+21t145tV+rR2csl2zCcWt7o7wySNLDIkeJMxlt+hCuYpdoB3bt1dfyMn2
	NPl+hzKMTMQtCXQwMuRonb+2l/V6wJ7uhogwuZkyXlYe2yG2ftPDyZRqJlB5lel8lCKXLq
	22h6jcoln2jn35dI0QLERNVUZHKbERCjYjMUtU40IsICg2Ty0l+0zPKMsy5EPurvXCnSDX
	ZMxcFdcenEzUs0uWfudUIEOSaZP3o8RkFpb0mua+1SG3W2OWMYsqKtlqKXdsuQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 12:11:51 +0100
Message-Id: <D5DCKW2IBZAC.2RML7Y7RASG@bootlin.com>
To: <quentin.schulz@cherry.de>, <jstephan@baylibre.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] conf.py: silence cve role already registered
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241031-fix-cve-add-role-warning-v1-1-68e44c7e8961@baylibre.com> <337392e0-c192-49d0-82fe-0eaaa9d43953@cherry.de>
In-Reply-To: <337392e0-c192-49d0-82fe-0eaaa9d43953@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 11:12:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5649

Hi Quentin,

On Mon Nov 4, 2024 at 11:33 AM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Julien,
>
> On 10/31/24 5:52 PM, Julien Stephan via lists.yoctoproject.org wrote:
>> Commit bd9add8a0 - conf.py: add macro for Mitre CVE links
>> added a new macro for mitre cve links called "cve_mitre" which conflicts
>> with the already existing "cve" role.
>>=20
>>    WARNING: role 'cve' is already registered, it will be overridden [app=
.add_role]
>>=20
>> The warning is turned into an error making "make html" fail, but
>> documentation is still successfully built.
>>=20
>> Since documentation is still correctly built, just suppress the warning.
>>=20
>
> I don't understand the issue and why Sphinx complains about it.
>
> I'm also very wary about just silencing a warning instead of tackling it.

The issue is that newer Sphinx versions are already defining a :cve: role t=
hat
points to cve.org, instead of the role we defined in conf.py that points to
nvd.nist.gov. So we have different solutions:

- either override the role to make it point to nvd.nist.gov, which is a bit=
 of a
  hack but works:

  from sphinx.roles import CVE
  CVE._BASE_URL =3D'https://nvd.nist.gov/vuln/detail/CVE-'

  Also that may not be backwards compatible. Context: we already noticed la=
st
  week that old releases don't build with newer versions of Sphinx, we were=
 thus
  planning on keeping an old Sphinx version for building old doc versions.

- just point to cve.org instead, I'm not sure how important pointing to the=
 nist
  database is. May pose a problem with older sphinx versions, though.

- remove the warning as Julien did. Has the advantage of being backward
  compatible, although not nice to suppress a warning of course.

> I don't understand why this triggers it, extlinks contains an alias with=
=20
> a base URL and a caption. The only overlap we have is the CVE-%s=20
> caption. But why would that be an issue, it's just text!

I guess extlinks doesn't really act as an "override existing roles" behavio=
r but
an "append to existing roles and warn if a role already exists".

> Also not sure what Antonin meant with "make the
> links point to NIST, as expected.". Which ones? What's the actual issue
> here we're trying to fix?
>
> Cheers,
> Quentin

Cheers,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


