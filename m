Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51ACD167FA
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 10:10:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7159.1767953422471806037
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 02:10:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=T0XHWOU/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C4236C1F6D3
	for <docs@lists.yoctoproject.org>; Fri,  9 Jan 2026 10:09:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D84560734;
	Fri,  9 Jan 2026 10:10:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDDB2103C8887;
	Fri,  9 Jan 2026 11:10:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767953419; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MklqS3H5hum2jDESnYkpiMxoGH3FOx1tKG6TiHpKuPY=;
	b=T0XHWOU/p1rPWwIXdxla6G2bUmJnE7ixKfvNgN3qYwKvhrjpCM83qsXMOMrYLOz+7sS/KD
	mhDbEPFTFpDQtHEei+c63L3VjngaYoHvDKCm4y805TBgRxm7bnL9vA+sub+0HAoWkDITa/
	2LBJPSMrrWdUeNYuiF3CgBmqW/WqRUZaFtWysOSsYBPwej8GPqQh75XSXvdmFexy3wRrgm
	nUmPY5xLwQ5LHaIoNmco4eeoT62PWdERVG3hJvfA+6LNgsbbVIEdurlcKjArIiLN+ltowu
	Hv1TaTWor/33VFHD1PAUhy9wM3x1AD3UOGH9k/vEd8rMtmP5OnQ+2tpQcWAP1Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 11:10:18 +0100
Message-Id: <DFJZ6JW9BHEA.27YW4O4TNZ6NR@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 5/5] ref-manual/terms.rst: refresh the
 OpenEmbedded build system definition
References: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
 <20251224-terms-refresh-v1-5-691329fd038f@bootlin.com>
 <42a421a406ba11170bc89a052dc28b9ed201ee7d.camel@pbarker.dev>
In-Reply-To: <42a421a406ba11170bc89a052dc28b9ed201ee7d.camel@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 10:10:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8446

Hi,

On Thu Jan 8, 2026 at 4:04 PM CET, Paul Barker wrote:
> On Wed, 2025-12-24 at 17:24 +0100, Antonin Godard via
> lists.yoctoproject.org wrote:
>> Remove the mention of Poky containing BitBake, just mention BitBake.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>  documentation/ref-manual/terms.rst | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manu=
al/terms.rst
>> index 21e30de96..ea674eff6 100644
>> --- a/documentation/ref-manual/terms.rst
>> +++ b/documentation/ref-manual/terms.rst
>> @@ -403,7 +403,7 @@ universal, the list includes them just in case:
>>     :term:`OpenEmbedded Build System`
>>        The build system specific to the Yocto
>>        Project. The OpenEmbedded build system is based on another projec=
t
>> -      known as "Poky", which uses :term:`BitBake` as the task
>> +      known as :term:`BitBake` which is the task
>>        executor. Throughout the Yocto Project documentation set, the
>>        OpenEmbedded build system is sometimes referred to simply as "the
>>        build system". If other build systems, such as a host or target b=
uild
>
> I think we should replace the first two sentences here with:
>
>   The build system used by the Yocto Project, using :term:`Bitbake` as
>   the task executor.

I agree, thanks.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


