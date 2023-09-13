Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4E3CA5509
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 08:28:13 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6939.1694593685176340804
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Sep 2023 01:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ax1Iplvi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C07B2000C
	for <docs@lists.yoctoproject.org>; Wed, 13 Sep 2023 08:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694593683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3BNnWK7nYDiELhcHCu0GeUbVRw2Cvbf1INB1Qn9xFQ=;
	b=ax1IplviwrsX9btzeeGMyGCe+AIv1f9oQoAx0iMKziJq7Cn4/M47I+nouhWojHt7iV2O5H
	hD55/ZZJQj5YSJI+o2FgW45RF+3DpsUzypXBqcoBVDPhxI6ueqW0oi8uXScztaLm3oMG5c
	lihozHznIR1P8P5J/Y2v7RtWPRAGE19khhdyJJ+AmNhuOii4Me1OzS4tY5lhq9AxBWqxiH
	+StSajFR50zhV7thrsbAwOrzmN5Dlp+DroIq0/o1O39XfO/+Jq55W1rWuB23v2mZLFYDYz
	hcSuwZ8JidCk3KUtrEL3uEEp2BmGTdZUd5+xtmfDbo6ccc1VwDRp82qBtxER2w==
Message-ID: <17c35ae1-778a-af80-f088-b6d6806c2402@bootlin.com>
Date: Wed, 13 Sep 2023 10:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [docs] [PATCH] contributor-guide: recipe-style-guide: add
 Upstream-Status
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <178467A0A9613B6A.17301@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <178467A0A9613B6A.17301@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Sep 2023 08:28:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4214

Greetings,

On 13.09.23 at 10:21, Michael Opdenacker via lists.yoctoproject.org wrote:
> +``Inappropriate [reason]``
> +   The patch is not appropriate for upstream, include a brief reason on the
> +   same line enclosed with ``[]``. The reason can be:
> +
> +   -  ``not author`` (you are not the author and do not intend to upstream this,
> +      the source must be listed in the comments)
> +   -  ``native``
> +   -  ``licensing``
> +   -  ``configuration``
> +   -  ``enable feature``
> +   -  ``disable feature``
> +   -  ``bugfix`` (add bug URL here)
> +   -  ``embedded specific``
> +   -  ``other`` (give details in comments)


The text originates from 
https://www.openembedded.org/index.php?title=Commit_Patch_Message_Guidelines&oldid=10935

I don't understand the meaning of the "native" reason.

Why the fact that a native version of a component is used can make a 
patch unsuitable for upstream? I may not be the only one wondering, so a 
few more explanations would help.

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


