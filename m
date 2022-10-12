Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A65C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 08:50:48 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.18265.1665564644347412271
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 01:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EHWsrz6o;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A2B72C0014;
	Wed, 12 Oct 2022 08:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665564642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJ+MyeRGYof+ULk/H4D0eDb3V331w0aSkXA49Wi59y4=;
	b=EHWsrz6oCaogW1iRkT+UFwUBsmFbyKDFM0HEhyR4zaIy6uG9cQz0Htd1Wh1aKT+sBg5igc
	tCoYcw0JrDZDSZ/ahBRXUpW+Dggwr1RohUL+L2RUquYTw+bDeKNc2hMWphsXU2sOff0KGI
	PUsuRzmmsSbGdqntpfjpuEQaEUu3O9zxzDD+hIChcJQyMjAwWBifAhC2pZw187z0f9wvAS
	UrjVrbE7hMosDDkhdSQqwyKSqTETAfJdh2Nu0CSbBO+lb2yzxPywGvkC8Xmjj28VndEPOi
	nzIsh5rI+c3Fz5YUeKXdX/hIn6d8cKKBtKb0uvRTSnLV3mL/QKWhhFHcLkDg2A==
Message-ID: <dda71c0b-808c-5f10-9471-e32ee1646b73@bootlin.com>
Date: Wed, 12 Oct 2022 10:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 34/34] Add 4.1 migration guide & release notes
Content-Language: en-US
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <eab587c8b9e2b1afc2eed83159e9eb728cdccbbb.1665392836.git.paul.eggleton@linux.microsoft.com>
 <171D1A9DBE3157A3.17458@lists.yoctoproject.org>
 <171D4544CA71D54E.3472@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <171D4544CA71D54E.3472@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Oct 2022 08:50:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3352


On 10/12/22 10:33, Michael Opdenacker via lists.yoctoproject.org wrote:
>
> As you already updated your branch for most of the items, I'll take 
> care of merging your changes into master-next right away.
> This way, I won't make further changes which will conflict with yours.


Done: https://git.yoctoproject.org/yocto-docs/log/?h=master-next
I just didn't pick the change that was adding Ubuntu 21.10 to the 
supported distros (we could discuss this further) and the documentation 
of the pressure variables, which I intend to submit for the BitBake User 
Manual.

To contributors on this list: given the number of patches in yocto-docs' 
master-next, it's best if your patches are based on this branch. This 
always makes my life easier, though conflicts are rare.

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


