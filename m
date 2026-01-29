Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1585D6101C
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 14:11:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15339.1769695892174223351
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 06:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ip138QG5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1368A4E4231F;
	Thu, 29 Jan 2026 14:11:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D7568606FD;
	Thu, 29 Jan 2026 14:11:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EA91119A868D;
	Thu, 29 Jan 2026 15:11:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769695889; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uAceT68o6a/AoT37xf5BMcOkDYZ7gnzWTMDYxBSRKjg=;
	b=Ip138QG5b8EEPltnx4JB2OhqL0pplUR/XxuNBbByrchDQhzPJsz/Qrvql9n+xnc3q/hQ3j
	Y2HAVkgOcMUHafKTuFlErFIUClCbaMPamzuiuC2TAMHJmQ2vPtnJpjrjPfugZZtuHHt4qQ
	MdcBhyDX+WgEy0EHeL01tBIfvVvkkIhMEX51E+OjPP9bk4TSmIK/l+Pp3aktPmGI4UojLK
	J9sBV1Uc6p/gVu/d7Ja/p1VYzVV2nHvyez4A2dF5ojvUvexrMZXrsnmxquhQradZbooCl8
	vJ6tiiiUGsLq6P7KYzbDoDxR9eoD1xrdBw509X8c5eWlbmTL8PjIe8k6fJ0jEQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 15:11:27 +0100
Message-Id: <DG14U3IOA8BF.117ITNN64V7T@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 26/56] ref-manual/structure.rst: remove
 obsolete poky repo references
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-26-74bf80cc4e5a@bootlin.com>
 <0126a3ff-df2a-47b9-90b7-3f4fe791ebb0@cherry.de>
In-Reply-To: <0126a3ff-df2a-47b9-90b7-3f4fe791ebb0@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 14:11:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8785

Hi,

On Wed Jan 28, 2026 at 12:48 PM CET, Quentin Schulz via lists.yoctoproject.=
org wrote:
[...]
>> -``oe-init-build-env``
>> ----------------------
>> +``layers/openembedded-core/oe-init-build-env``
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> For this one and all the others (above and below): watch out, this will=
=20
> switch the cross-reference default string from oe-init-build-env to=20
> layers/openembedded-core/oe-init-build-env, is this what we want? Do we=
=20
> need to change the cross-reference string everywhere?

Good point!

Since this section and the others are subsections of
``layers/openembedded-core/``, I've renamed them to remove the leading
"layers/openembedded-core". Same for subsections of ``layers/meta-yocto/``.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


