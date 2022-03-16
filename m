Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88605C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 14:20:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.25789.1647440423419203634
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 07:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IlkzBpzu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9C96640007
	for <docs@lists.yoctoproject.org>; Wed, 16 Mar 2022 14:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647440421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzaPhifz0dFaf/TVamrgq3u8uBy31PuKT0goMWiuIFM=;
	b=IlkzBpzu5tC489sf6zaFusuvlxo1YU6BXbnpz+jZlAthfAzQRE9vTPWmv1Ztr3JBqLVSk6
	G9JhuVm/8REghYACpO9kRa24uT/60Xk1ewzBkUTsUVVqMaa9CwyY6Ab8TdB0TvpACmdw1i
	qqbMQwzVWNges+eHh9kPjE52Jh4GV7z6devm1OraaPsXb+FQr6x8FGN9jU5Le7cA1HmvJN
	Nrrm721ESzAnGTDGKjW6QNNZG/qJqxOapdB9uwATNmWs30a1HJA2fvt6XHs1hYd5BPbmd7
	vVnPz3HK3ysm46fWD0Sc5ol1qn/rD/7pekAJfoS/1ey2dFu6Q4EiiZqYsOmMQA==
Message-ID: <a6287bd7-c096-7d15-cfc8-f9a88d844d46@bootlin.com>
Date: Wed, 16 Mar 2022 15:20:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] doc: migration-3.5: variable changes for inclusive
 language
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <16DCE2241875AC1F.28363@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <16DCE2241875AC1F.28363@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Mar 2022 14:20:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2610


On 3/16/22 15:16, Michael Opdenacker via lists.yoctoproject.org wrote:
> +  An :oe_git:`convert-variable-renames.py


s/An/A/
Fixed in my branch.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


