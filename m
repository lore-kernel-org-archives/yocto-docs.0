Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFAFC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 18:49:59 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.92566.1701974989453568002
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Dec 2023 10:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fWqbqn4w;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB0E840002;
	Thu,  7 Dec 2023 18:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701974988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eP0mSdL/20GSWsg02JmpuojRPL5kCbMzfMtlzR+AtYk=;
	b=fWqbqn4wwkDuMAs4rVV8mf4NCBnAHSuV4gbOUsB74g6mj3rjpRAyAbLG87kHv8KrFkTYOz
	wQMy3fC7FHQW1Gw0YTxEKCB0hdYE70hW1T5b/8djCAPq5+2XXKP7P34A4Q4KdljbmD50tS
	MdmyjDtcXslGntpLn+/TtyKTLe7UkQK7F91Qseh+aF2veVqRreXJizUWzLYYkW2dl6hRee
	1Q+i0uGDna7+KUPAJgeXzAsQdWVUPHxFO5/vqTrTyovd+hTF/OUR6QXXlRjYYCrctJrinM
	duG6IeZec56zYYiYYyEKkVDEHdplg1J/FzBEADRwfP3U1T2AGQ//+78SGpKvJA==
Message-ID: <2df71773-dab0-4846-a959-e82385169a0a@bootlin.com>
Date: Thu, 7 Dec 2023 19:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: Discourage the use of SRC_URI[md5sum]
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20231206184041.2824572-1-pkj@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231206184041.2824572-1-pkj@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Dec 2023 18:49:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4669

Hi Peter,

On 06.12.23 at 19:40, Peter Kjellerstedt wrote:
> SRC_URI[md5sum] has been deprecated for a long time. Discourage its use
> by removing it from examples and note that it should be replaced by
> SRC_URI[sha256sum] when updating recipes.
>
> Also mention that bitbake supports other checksums, though they are not
> commonly used.


Thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


