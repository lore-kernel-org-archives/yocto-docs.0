Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E9DC67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 12:42:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.10177.1712320923956332252
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 05:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ph0GPdk6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A23B960007;
	Fri,  5 Apr 2024 12:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712320922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xIRGtI0UjNZt99GhEOEloOB/tkFkAUd2eGHFCOZBEmw=;
	b=Ph0GPdk6vd1qLw1FOqEMXulsgVRepktDRb2/Qrk4hTWLNI/7q6g4OebIDNxiQb0WwwakV3
	VfHwgfSRQjgBfrXNTM3Rkek/PegI0NFBIQl9lQKBCXLAtEwy4IsilSN8nlbq/uUtBX5DpL
	4cIREeAahlgL5svN5SuAoHMm9C5XtB0HSbcscZAWPGpGY8iZovJqcYpo+cYrxR3AP3m79j
	l72luNcKk1R5o9DkUyXV60rFAeOKdn2MB415FQTcAFoPCIwdapc8lNAbZDsQ5QzjvTkyGB
	Z4TbaN7zXFN4+vEkmqgeCR3OavRTAaGC3EG8lNov1g9uMKQ999wsCc2PMzyWAw==
Message-ID: <a1310a6e-41b6-4cb6-b2e6-bdcec4ab4850@bootlin.com>
Date: Fri, 5 Apr 2024 14:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: thomas.petazzoni@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [PATCH v1 0/3] Add missing parts to Go language changes
To: joaomarcos.costa@bootlin.com
References: <20240405100355.2268926-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240405100355.2268926-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 12:42:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5074

Hello João,

On 4/5/24 at 12:03, joaomarcos.costa@bootlin.com wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>
> Hello,
>
> I am (re)sending the patches that needed some rework, but not as a v2 since some
> patches from the previous series were already merged. Plus, a new patch to
> document the go-vendor class in ref-manual/classes.rst was included.
>
> Best regards,
>
> Joao Marcos Costa (3):
>    classes: document new go-vendor class
>    release-notes: add changes to Go language
>    migration: add Go language changes
>
>   documentation/migration-guides/migration-5.0.rst    |  4 ++++
>   .../migration-guides/release-notes-5.0.rst          |  4 ++++
>   documentation/ref-manual/classes.rst                | 13 +++++++++++++
>   3 files changed, 21 insertions(+)


For all patches:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com> (after 
a few edits for 1/3)
Merged into master-next
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


