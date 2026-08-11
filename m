Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D16BC5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 14:16:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55038.1786457807891892455
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 07:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DrzAbZb0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C7ABB4E411B8;
	Tue, 11 Aug 2026 14:16:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CA026033C;
	Tue, 11 Aug 2026 14:16:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52CCF11C48CDC;
	Tue, 11 Aug 2026 16:16:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786457801; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tJJ0CMLIHOfh2oH6V+2Mml/jhfXNd6sFK8nknObonKo=;
	b=DrzAbZb0yejzGNbwNOlfVMnFAjv3EPKjSb1ZE8PwLQU+AUAAUnXlFgAv/aAc7rD0QbuMV0
	U2O6Fzx1Ay8rgMh0l0jXwGRETO4CYKCzaQwaaJ39XYwSsatNjth5liUgXDGYhTgW0Hx5yr
	GkiqB47JZvTLDDCVVk9A4oQGGakcDqUHHSoqEYLL2kjt+HE9z4aiqwl3MPysn8MNeztG3G
	sK3f2D4o0eYbR+ZcgrPmP8v//8iVvCnzvl3rLP67fQfSWyCws42Kp6MRcr5WJU8rI5wZtO
	ZrKDD0QWRuQQ9r9CoSkW9W0t2Y4F4UW2W1LL+j6syUbPwGFqVBYvfj0DnDMmeQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 16:16:39 +0200
Message-Id: <DKM6FRDAN66C.2R7XLGJ615WDL@bootlin.com>
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: document the
 QB_DEFAULT_BIOS variable
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20260811-qb-default-bios-v2-1-02a6284ca3cf@bootlin.com>
 <dcab219f-68a4-4323-8876-f27b1ca7c3ca@cherry.de>
In-Reply-To: <dcab219f-68a4-4323-8876-f27b1ca7c3ca@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 14:16:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10268

Hi,

On Tue Aug 11, 2026 at 3:31 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 8/11/26 3:17 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> The QB_DEFAULT_BIOS allows setting the -bios parameter of QEMU, which
>> can be used to emulate U-Boot, for example.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> Changes in v2:
>> - Address comments from Quentin (thanks!)
>> - Link to v1: https://patch.msgid.link/20260804-qb-default-bios-v1-1-bc8=
51931973d@bootlin.com
>> ---
>>   documentation/ref-manual/variables.rst | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index e75f42afe..f4ed9a883 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -8084,6 +8084,25 @@ system and gives an overview of their function an=
d contents.
>>         replaces the ``@CLIENT@`` and ``@GATEWAY@`` place holders by the=
 IP and
>>         the gateway address of the QEMU guest.
>>  =20
>> +   :term:`QB_DEFAULT_BIOS`
>> +      The :term:`QB_DEFAULT_BIOS` variable can be used to provide a def=
ault
>
> "can be used to provide a default value" can be read as "it's not=20
> mandatory" while it is when using runqemu

It's not? Using runqemu with qemuarm64 and _without_ a BIOS value (or
QB_DEFAULT_BIOS) is possible. In fact it's the default behavior.

Antonin

