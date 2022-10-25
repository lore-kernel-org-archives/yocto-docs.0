Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E18DC38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 16:10:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.9035.1666714204558747267
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 09:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KEvxceau;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 60F6B240006;
	Tue, 25 Oct 2022 16:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666714202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zV1+4+CMeFhZ+bJtJDdRpyeW4nGZsc/2uVIOuVTDyac=;
	b=KEvxceauEWnr2UxMEkbu/p0mXc6jXLnluDH5tz/FR0L4I9iT6i621QpKfff0ZTK9XvLm5o
	QczD7Rv9FvqHjrxlki6/KsWZ2Kr+0mTrHf78gyEk11mhyD1MMBPU6XH8noJ21YEtG42Vlq
	mt8H8klI7kdV86NBfng5dp5yf1SyzzTwj2T7ofMK98ASf0S8w8HseXKZ7NjZ+4CeYVWdCb
	FdFobTZOg6Zma1UIZx8n/FDaPP6Oe5bsbF7V6YVnhCPX7RdzDgSsjqbrFQruemjjdK4PPj
	6mILBAV4w5V6vT8+hytN5G6CbN3Ax8RQ1Ej2mU8KmegpEqb3KtGK1ttccmlp/A==
Message-ID: <8623b082-27e0-a3bb-df4c-927efd96f4df@bootlin.com>
Date: Tue, 25 Oct 2022 18:10:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: JPEWhacker@gmail.com
Subject: Re: [docs] [RFC PATCH] ref-manual: document create-spdx class and
 variables
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <17215B3A7EFA7824.21867@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <17215B3A7EFA7824.21867@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Oct 2022 16:10:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3402

Hello Joshua and all,

On 10/25/22 18:00, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst   | 11 ++++
>   documentation/ref-manual/variables.rst | 71 ++++++++++++++++++++++++++
>   2 files changed, 82 insertions(+)


Once this is in place (after receiving your corrections and comments), 
I'll have to properly introduce SBoM / SPDX generation.

A suitable place may be 
https://docs.yoctoproject.org/dev-manual/common-tasks.html#working-with-licenses.

However, it seems to me that 
https://docs.yoctoproject.org/dev-manual/common-tasks.html#providing-spdx-files 
is now outdated, as we no longer need meta-spdxscanner to generate our 
SPDX files. Am I correct?

Joshua, I saw in your presentation to possibility to go on using 
FOSSology. But what for, as we have all the metadata we need?

Thanks in advance for your insights.

Cheers

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


