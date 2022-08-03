Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38A9C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 14:23:03 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.9131.1659536581196983703
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 07:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J0NfX7gc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 05DF7240003;
	Wed,  3 Aug 2022 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659536579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UEme21gdyBcaBp0bChwo1yGqNr4fXFf3wFjhMKpXWcs=;
	b=J0NfX7gcR/eZHPufZImORypzND69g5vqz9SRlIiNZ9lpzz3x6HMdg7Am5GQiPakpgWIu35
	79gfUL9qU0qP4w80hwZhtCRfMUN+580NV7sSB2AYtGeAhWgj2dHxlv35j2T5lAdlUX21VN
	YP/ANaIyhHxw15I8gv38Q2cw6qS3cldo1/1EauUhjP3klhjOIG05O30K3MsUjQBmMWO6Oi
	Twl0dPzevNNwURJLJEYBGnpQPe0shNfUtqqSiqSYfFE4ypc7Zt8ZSKuBx6D+4kME4KRhDA
	WtlnTOzof0ySb45ax0rr3DhNDlk/dbaSl1hULOMhx4yG1i12rUjaLs/eCGVPaQ==
Message-ID: <adb89bed-1708-e152-90b6-828be646eb41@bootlin.com>
Date: Wed, 3 Aug 2022 16:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: Re: [docs] [PATCH 1/2] kernel-dev: working with kernel using devtool
 does not require building and installing eSDK
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, docs@lists.yoctoproject.org
References: <20220802083803.2773818-1-alex@linutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220802083803.2773818-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Aug 2022 14:23:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3109

Hi Alex,

On 8/2/22 10:38, Alexander Kanavin wrote:
> In fact, all the same tasks can be done directly from a Yocto build. Let's just
> drop the steps to produce and install the eSDK - if someone wants it, the SDK
> manual covers everything.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/kernel-dev/common.rst | 84 +++++------------------------
>   documentation/kernel-dev/intro.rst  |  8 +--
>   2 files changed, 16 insertions(+), 76 deletions(-)


Thanks for the patch.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


