Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE81DC54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 11:07:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.21900.1709204834605915489
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Feb 2024 03:07:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kfSGbwjX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DDBDFF803;
	Thu, 29 Feb 2024 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709204832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UsWlTeFLVSMD3rZq5bF/AYSlAcnKAExSSBazGCDyl0s=;
	b=kfSGbwjXQuuH/BR6Mn6/OdPhNkolAyux674GTvx8lsJ9QUv1ja22N2IeQiAD5Om5Mq8VI8
	ReGTbU2c+K16FhZF+My9oCaw5G3hA0lC4LHTjsqkMfoEoBL+RLFsotxeyyVK2anpVhIWyY
	CVbnNTQMMdgIrKtdvfpL0JygjP2ikH1qoWCH/IuM8HdLyFHXvlVOGdgkPjkpAGze/14Wi7
	/fdL3sQSz+kH9569gKZe3obnp0XqNmAcBLlXisDJrf2Aq57WGdULtX3rIn4UtLvpsLhGel
	TsnSWG2SJ0HHS9EWXFxeF/iBGF4IaTh48zErduozgKOdUmoAeCom9m4i8Qe8xg==
Message-ID: <24ed4572-8008-48c8-8884-af215d313742@bootlin.com>
Date: Thu, 29 Feb 2024 12:07:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v3 2/2] ref-manual: tasks: do_cleansstate:
 recommend using '-f' instead for a shared sstate
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20240228-clean-tasks-notes-v3-0-368af5e1aa0e@bootlin.com>
 <20240228-clean-tasks-notes-v3-2-368af5e1aa0e@bootlin.com>
 <f21a5175-3c01-4bf4-9285-3a1ecda302ad@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <f21a5175-3c01-4bf4-9285-3a1ecda302ad@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Feb 2024 11:07:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4917

Luca, Quentin,

Many thanks for the patches and reviews!

On 2/28/24 at 12:46, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Luca,
>
> On 2/28/24 12:25, Luca Ceresoli wrote:
>> do_cleansstat can produce build errors when using a shared sstate cache.
>>
>> Add a note to clearly discourage, provide a safe alternative (bitbake 
>> -f),
>> and the rationale.
>>
>> Proposed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> In poky:
> $ git log --oneline --grep "Proposed-by" | wc -l
> 2
> $ git log --oneline --grep "Suggested-by" | wc -l
> 46
>
> https://git-scm.com/docs/SubmittingPatches#sign-off also only mentions 
> Suggested-by as a trailer.
>
> Not really important, it just surprised me to see this trailer for the 
> first time :)

I fixed this in the commit.

>
> For the whole series,
>
> Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>


Merged into "master-next"
Thanks again.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


