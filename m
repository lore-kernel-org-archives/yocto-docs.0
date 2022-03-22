Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E46C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 14:39:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.10771.1647959943462539401
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 07:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B/82hZMK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C6D67240002;
	Tue, 22 Mar 2022 14:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647959941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJ1DHlrBZ+0kqJKf737C+Rl02g08mhex8PTnl4WuFks=;
	b=B/82hZMKa1FYh4hTm9a78nDPqGJc1o9dpMSfHno6KYXMGhluHsYMjH0MsI1XwYEpmjjVIi
	AYXPp3ZYy9PjEKxyh5kspDoqLDgO7GmtIslEEOQafAUgT1vyjX6svMTvn0BFpxC1G31kbi
	TzVql7uX7KUpq+HPHCfzI+pG5v8i+6lE4a8E72mmrveLGBkJNlGlJMAx+bGPTVoB1fFeMi
	1PueHIi15P03T3cK8RsFWBIPWdQAlw5Dj1MGu2OP5wCM7mLSQ8HBHrRjbTGDrt4m8v/3vo
	aFP8RKNLHA8xpIxBgsMcP+9OJUi5KGn4cprY8xgKJh2G/mnwyaCukI/1mAKg0Q==
Message-ID: <f0676b02-a32e-3826-12aa-ce6e78aacfc8@bootlin.com>
Date: Tue, 22 Mar 2022 15:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] ref-manual: update Python class documentation
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>
References: <20220321150927.3355757-1-ross.burton@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220321150927.3355757-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 14:39:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2685

Hi Ross,

On 3/21/22 16:09, Ross Burton wrote:
> Add new PEP517_* variables, remove obsolete variables, and update for
> renamed classes.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>


Thanks for the update.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into "master-next".

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


