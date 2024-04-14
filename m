Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B35C4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 17:50:41 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.2937.1713117038272681055
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 10:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TB8LPPEl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF8DA20004;
	Sun, 14 Apr 2024 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713117036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvABAw6zSRVvlOEz5tPtnnPkyF7WeA6ljjdoKueUL1Y=;
	b=TB8LPPElybu4LqQAFgB/IqMCl8D5st8OiYygOYK7NdxRudfb1ERjp3pN5H6pRO+Zwz6BUh
	xMGg8LKn09gAnWBYKV1E46jli7bic6pilIMDXZbsY+paDZm2wfV9bcYBIiRZKP6ez+sEqO
	WzwpZIID5lMC7RLxfidsCKxh0CIju0OXYQQDowJnv5NXHNg9bK/BwO1NKnvAfhpsNpd56N
	lP3P7+hIcfDqawN6eSMm9pfBPqxkXXZR/MrMBFpkgrh8yoQTB2sQww/wKhLtxeDc0uDhs3
	Oz9Ktj6gj2TaiS93SmXQYVWnrMjkWSc8Nv642NDiwos9OFyX+/iBM5SennLtUw==
Message-ID: <62b3af1f-b5de-402f-bb71-e0936e5c39fe@bootlin.com>
Date: Sun, 14 Apr 2024 19:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Geoff Parker <geoffrey.parker@arthrex.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: variables: Update default
 INHERIT_DISTRO value
To: Geoff Parker <geoffhp@gmail.com>
References: <20240412184657.2933679-1-geoffrey.parker@arthrex.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240412184657.2933679-1-geoffrey.parker@arthrex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 17:50:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5123

Hi Geoff

On 4/12/24 at 20:46, Geoff Parker wrote:
> From: Geoff Parker <geoffrey.parker@arthrex.com>
>
> Add remove-libtool and create-spdx to INHERIT_DISTRO defaults per
> meta/conf/distro/defaultsetup.conf
>
> Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>

Good catch! Thanks for the patch.
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


