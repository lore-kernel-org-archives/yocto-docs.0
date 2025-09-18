Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BAECAC5A0
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 15:38:04 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.17569.1758209879679907998
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 08:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RFmXDfG0;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2677DC003CB;
	Thu, 18 Sep 2025 15:37:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B322B6062C;
	Thu, 18 Sep 2025 15:37:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB37B102F1C44;
	Thu, 18 Sep 2025 17:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758209877; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hgOM04Kw6NHX8vlvJC0EVGNMEQpg2g57mcEF1puPvEw=;
	b=RFmXDfG0eLmwvGuXYe9G+tm0jWrsZzEVNqa1hMlGG+pIohNpL+iKwDvNE8bdRvMAIsg8s6
	oYgY8zs+/nyxX591pk7TB8/HBu0mpycLgeRKViK/AX0bk8P4SEI5ZeBz0rA9/pDJaBgtqI
	WcgW/NVDDUOPxsT1c34KUWPgDfW92o7UUvA+YiIBZiIrzE8AiieZFeQE5cvfQzZ+bNcChW
	JdARvumF+7rhkUEMz7G06VPwi7EFZzBvLpw7cpWXD0jxi3/nvR34kdTR8SDojBF2++Jraj
	c4cFZnluLU21Oxbv4oRIoNxPBAZSpwKUhJj6UGx4boOCjDjTWZ4yEBL/7iC6mg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Sep 2025 17:37:49 +0200
Message-Id: <DCW1DRNGJELA.1WL7VLD0XA7T2@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <ross.burton@arm.com>
Subject: Re: [docs] [PATCH 0/2] drop Debian 11 from supported distros
Cc: "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>, "Quentin Schulz"
 <foss+yocto@0leil.net>, "docs@lists.yoctoproject.org"
 <docs@lists.yoctoproject.org>
References: <20250918-dev-supported-distros-v1-0-aa1dc6b54c30@cherry.de>
 <9e6da26e-f697-4838-b204-7cae85c8d336@cherry.de>
 <DCVY0YDNJJQ3.1VWKDMHUP2S3F@bootlin.com>
 <E458F975-F269-4587-99F7-E76D1E06E32D@arm.com>
In-Reply-To: <E458F975-F269-4587-99F7-E76D1E06E32D@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Sep 2025 15:38:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7554

On Thu Sep 18, 2025 at 3:45 PM CEST, Ross Burton via lists.yoctoproject.org=
 wrote:
> On 18 Sep 2025, at 14:00, Antonin Godard <antonin.godard@bootlin.com> wro=
te:
>>
>> On Thu Sep 18, 2025 at 12:03 PM CEST, Quentin Schulz via lists.yoctoproj=
ect.org wrote:
>>> Reading a bit more the docs, I'm wondering if we shouldn't add Debian 1=
1
>>> to the list of "distros we supported but we don't anymore" for older
>>> releases in the docs, e.g. kirkstone, scarthgap and walnascar if we
>>> really are dropping Debian 11 from the builders?
>>
>> Yes, basically if the Autobuilder workers for debian-11 are turned off
>> completely (not even run for stable branch), we can move it below the
>>
>>  Finally, here are the distribution versions which were previously
>>  tested on former revisions of "&DISTRO_NAME;", but no longer are:
>>
>> sentence in system-requirements.rst.
>>
>> However if we still run workers for stable branches, we can move it unde=
r the
>> second sentence:
>>
>>  The following distribution versions are still tested, even though the
>>  organizations publishing them no longer make updates publicly available=
:
>>
>> Let's wait until the patch from Ross gets merged on Poky and see what is=
 done
>> with the workers.
>
> I was meant to speak to you about this, as RP had concerns that the scrip=
ts
> that compare the AB setup with the docs won=E2=80=99t like this.
>
> We want to keep debian-11 around for walnascar and earlier, but not build=
 on
> it for master/whinlatter onwards.  I know we can do this for the AB, but =
is
> the script that keeps the docs in sync with the AB happy with this too?

For master, the script has a logic to detect when a worker is configured on=
 the
AB but not listed in SANITY_TESTED_DISTROS, to avoid forgetting to update t=
he
file. It looks in all_workers in config.py[1]. So I think it will be an iss=
ue.

But I wonder how are you going to configure the worker to run _only_ on
walnascar and earlier? Remove it from workers_debian[2] in config.py and le=
ave
it in workers_prev_release[3]? Does that make the AB automatically pick a
debian11 builder for stable branches?

We could maybe solve this by adding a "master" entry to workers_prev_releas=
es
(we could rename that variable too), and have master run on all the availab=
le
workers in all_workers minus the one we want to drop.

To illustrate, something like:

workers_prev_releases =3D {
    "master": all_workers.remove("debian11*"),
    "walnascar" : ("alma8", "alma9", "debian11", "debian12", "fedora39", "f=
edora40", "fedora41", "opensuse155", "opensuse156", "rocky8", "rocky9", "st=
ream9", "ubuntu2004","ubuntu2204", "ubuntu2304", "ubuntu2404", "ubuntu2410"=
, "perf-"),
    ...
}

And then the script can be adapted to read from this dict no matter if it's
master or a stable branch.

[1]: https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py?id=3Db9=
db368e79c5d761c3e6c1fea8697914fc5fe930#n198
[2]: https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py?id=3Db9=
db368e79c5d761c3e6c1fea8697914fc5fe930#n183
[3]: https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py?id=3Db9=
db368e79c5d761c3e6c1fea8697914fc5fe930#n201

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


