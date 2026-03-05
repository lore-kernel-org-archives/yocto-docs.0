Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAF1F33A8A
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:15:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46554.1772723727044112384
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 07:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Zitb2WWg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EC5CC1A2CEB;
	Thu,  5 Mar 2026 15:15:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2F595FDEB;
	Thu,  5 Mar 2026 15:15:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 835D710369874;
	Thu,  5 Mar 2026 16:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772723724; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zg2Qe7F8BuegKUdgkXjZv6B10vFS5CEl/P2dGaMadTU=;
	b=Zitb2WWgyxr7P8atQIrm8wNLsCKz9G0KzeLTi4n2kW+ENi+g5vXz9VzXkuLQLk2UXQA1LC
	9j4BJU3ZrqcBcR5sE3nNeZsIUGz2NGP73/QePdnkCy/zeTXDAf0NAlk73Bfoix4OxVME46
	dOEpJJQQD+jtE3GkndDKbgL4gxOIPveuQy/18num4b4tg7Rnn3BPhu5wiHDPLL5FVV0qYx
	PNZ9wIXTlu7CLNxkTUbnmyqlElgXw60PolZ9l0rhxZVI6LBYyGrrZ8tyouB5PSrRBjIShW
	wmBG6SlXoyB0ymQBaimTtO27XJzGKbFaRf8TlQPsyZRlCuK91bOGVXZffqdXXg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 16:15:22 +0100
Message-Id: <DGUY43IUX7B0.2AAGJEI0AT2S9@bootlin.com>
Subject: Re: [docs] [PATCH 1/8] conf.py: define new
 {oecore,bitbake,meta_yocto}_rev roles
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
 <20260302-release-notes-6-0-v1-1-9662dee58591@bootlin.com>
 <d9b03e70-0027-4406-9577-f389f4721e93@cherry.de>
In-Reply-To: <d9b03e70-0027-4406-9577-f389f4721e93@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 15:15:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9073

Hi,

On Thu Mar 5, 2026 at 11:56 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 3/2/26 10:37 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Use the extlinks extension to create new roles to quickly reference a
>> commit from openembedded-core, bitbake, or meta-yocto.
>>=20
>> For example, use as: :oecore_rev:`437e0419608e`.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/conf.py | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/documentation/conf.py b/documentation/conf.py
>> index 5a69977cf..f3234b241 100644
>> --- a/documentation/conf.py
>> +++ b/documentation/conf.py
>> @@ -91,9 +91,17 @@ rst_prolog =3D """
>>   .. |author| replace:: %s
>>   """ % (project, copyright, author)
>>  =20
>> +# base url definitions
>> +oe_git_baseurl =3D "https://git.openembedded.org/"
>> +oecore_git_baseurl =3D f"{oe_git_baseurl}/openembedded-core"
>> +bitbake_git_baseurl =3D f"{oe_git_baseurl}/bitbake"
>> +yocto_git_baseurl =3D "https://git.openembedded.org/"
>
> Well, thanks to my company's wonderful mail server this is broken but...=
=20
> this should be git.yoctoproject.org and not git.openembedded.org.

Darn, thanks for spotting that.

>> +meta_yocto_baseurl =3D f"{yocto_git_baseurl}/meta-yocto"
>> +
>
> Small nitpick here, I think we should make it easier to distinguish the=
=20
> server URLs from the repo URLs.
>
> What about something like
>
> oe_git_server =3D "https://git.openembedded.org/"
> oecore_git_baseurl =3D f"{oe_git_server}/openembedded-core"
>
> for example?
>
> Not sure we need _baseurl, it's kinda implied if we have oecore_git?

I'll take your suggestion, thanks!

Antonin

