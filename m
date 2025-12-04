Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EADD2068D
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:21:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43243.1764854477153063609
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 05:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=v/EmFtey;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A68E91A1F46
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 13:21:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 680F26068C;
	Thu,  4 Dec 2025 13:21:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17A6C119224E6;
	Thu,  4 Dec 2025 14:21:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764854474; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d5CCuxUxMFqL6LwwjWWJ5vKmv3fF2FO5sxkXN1l3xjE=;
	b=v/EmFtey2ClqrN1jUAd7SY9cegV/9D3i34wDUKl2xN0QG7IIYmOwWFexhNGDF7nhe8Oodi
	zJHyXiHMTibzekIPpa46gDNDOpsenf8qRb0IluJM6OFGf6gACSdtc0sXdDwv6wkj0HIep/
	LJ/sfZQ8Dt6xfUJ23c18laDTgFRLg0E+nNjLopIMe/p+MP3clHmaXxYJ7q1Gv+qz1kFfr8
	+Qqntn0MOUlxw4VnFjBHP+CD2glR7HDRdr+o+NlPv3AzYmIb4M9lwsqASddijq8KeY12xN
	KlZRCXGVvyoM5QfahyCeRXyFiWC3vPLfPjE5KsYna7c7vw93xjKXX6wtFbqPqg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 14:21:13 +0100
Message-Id: <DEPGP4JHATVS.S2YO6LSPCXFP@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 4/4] poky.yaml.in: split automatic and manually
 replaced macros
References: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
 <20251202-release-updates-v1-4-889513ccc384@bootlin.com>
 <66616c7a-b998-40ed-912c-c0c1a199b890@cherry.de>
In-Reply-To: <66616c7a-b998-40ed-912c-c0c1a199b890@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 13:21:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8215

Hi,

On Wed Dec 3, 2025 at 4:04 PM CET, Quentin Schulz via lists.yoctoproject.or=
g wrote:
> Hi Antonin,
>
> On 12/2/25 5:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Instead of thinking some of these macros should be replaced when a new
>> release is out, split the variable that should be manually maintained
>> and the ones that are automatically computed in set_versions.py.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/poky.yaml.in | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>=20
>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>> index 810efd4d5..f6d6ea9fc 100644
>> --- a/documentation/poky.yaml.in
>> +++ b/documentation/poky.yaml.in
>> @@ -2,6 +2,12 @@
>>   # Macros used in the documentation
>>   #
>>  =20
>> +#
>> +# Automatically replaced by set_versions.py, no manual update required
>> +# Values below are placeholders to give an idea on how to use them in t=
he
>> +# documentation.
>> +#
>> +
>>   # The DISTRO variable represents the current docs version. It should b=
e used
>>   # when referring to the current docs version. See also DISTRO_LATEST_T=
AG.
>>   DISTRO : "5.2"
>> @@ -22,6 +28,11 @@ DISTRO_REL_TAG : "yocto-$DISTRO;"
>>   DISTRO_REL_LATEST_TAG : "yocto-&DISTRO_LATEST_TAG;"
>>   DOCCONF_VERSION : "dev"
>>   BITBAKE_SERIES : ""
>
> DISTRO_REL_TAG and DISTRO_REL_LATEST_TAG aren't actually replaced, so=20
> should we move them with the unchanged variables below?

Ha, had a bit of hesitation for these ones, it's true they aren't replaced
although I doubt they're subject to change. Will move them anyhow, thanks.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


