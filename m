Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9CBC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 08:23:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.5124.1647678183618077056
 for <docs@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 01:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Amb/Ieaz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 686311BF206;
	Sat, 19 Mar 2022 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647678181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIC3BWb5glupB5+dn2V2bFr9v1ybgIWJ0v13t89+DGE=;
	b=Amb/IeazGfLYVs+hkOV4E4q+lWda5jmngx15ufDAyECTSGcoSjFxzXqAVNntGf5jgdHH39
	lB8ztoHROKsZ4b6e7f2XaiWMHtT4lEg4VVwcT7OAT6gnTVsh2/fBZBgA+4rImO2cHASOMT
	CB6BNgo3OFGInAU34PKJ+OLilquatWVFdCgss10yT3zV2ly9J0oCf0hysK6Z/hpx/ckIVS
	OdASHnSpguNTgbqAokxDQC0Pfen81SpVCylEduu4SqP7he/O11UHRSy5o80VMxC6A1LTMc
	46ZXyWymqdXRfiWYpQsRJV/8j7kdUTggAUQSFDmBPdN+crakKbi6L52z/RRZnQ==
Message-ID: <6f1440e0-548b-0d17-7c52-e3ae7b22a67c@bootlin.com>
Date: Sat, 19 Mar 2022 09:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH 3/3] set_versions: Add support for setting
 POKYVERSION found in older releases
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220318154228.1071136-1-richard.purdie@linuxfoundation.org>
 <20220318154228.1071136-3-richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220318154228.1071136-3-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 19 Mar 2022 08:23:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2643

Hi Richard,

On 3/18/22 16:42, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


For all 3 patches in this series:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Many thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


