Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030D4C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 19:31:43 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.12032.1665516700831262274
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 12:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rg453yOs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B511760002;
	Tue, 11 Oct 2022 19:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665516699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/D2CpPt1IxPH6XfJn3BjMMDfu+57NBCroiokr/a8isc=;
	b=Rg453yOsWAFEd8V1JtV64l30hPldXt5o9Zyr+HUOOBXF7BovvCmjxBlzvJ+PSX+qKeQmL5
	xjaNPCX2QiLQ2OQ+cRL9o7p++q3CGKj+bJCLs6FOLLOVJDGuS7q1J98Gwqn63E/aMqiNDh
	DEa1kSK+HLtFhTDH7ByHraXHoHGIHimjctN0Ck8u7UEwEI8rzHjTN7gZph5lymi4uBKMyF
	OIxdP86Zs7bSCfxpnP8WYqduWHZF/5c7i66eCAhVRGOIyYJ5KmcilSahjXYTdGI8gqIAns
	csklo98ojOzHxRFmFGbT0S2C7iaUlQi+Ub7a7qcjs8/80g4bqfM1PZN598PZBA==
Message-ID: <64a29c33-c1d4-41e7-7e16-fe318f00e799@bootlin.com>
Date: Tue, 11 Oct 2022 21:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 34/34] Add 4.1 migration guide & release notes
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <eab587c8b9e2b1afc2eed83159e9eb728cdccbbb.1665392836.git.paul.eggleton@linux.microsoft.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <eab587c8b9e2b1afc2eed83159e9eb728cdccbbb.1665392836.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Oct 2022 19:31:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3350

Hi Paul

On 10/10/22 11:24, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>
> This currently does not include known issues or download information.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>   documentation/migration-guides/index.rst           |   1 +
>   documentation/migration-guides/migration-4.1.rst   | 214 +++++++
>   documentation/migration-guides/release-4.1.rst     |   7 +
>   .../migration-guides/release-notes-4.1.rst         | 687 +++++++++++++++++++++
>   4 files changed, 909 insertions(+)
>   create mode 100644 documentation/migration-guides/migration-4.1.rst
>   create mode 100644 documentation/migration-guides/release-4.1.rst
>   create mode 100644 documentation/migration-guides/release-notes-4.1.rst


This all looks great, including these last two documents. I'd really 
like to include these changes in the "master-next" branch, so that we 
can base our new work on them.
Would you be able to share an update of your branch taking into account 
the few comments that we had?

Many thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


