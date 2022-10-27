Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DCFC67871
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 08:16:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.4149.1666858617210602762
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 01:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Th98tUo7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DA7701BF20B;
	Thu, 27 Oct 2022 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666858615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fg80ijDp1Rh+f2wjiZ49AVB2Nq98EdSTE82B9WtTrcs=;
	b=Th98tUo7XfBhDXyzKnpzGLuY/2ZanzI987W1kV0QuAyMKhqlwzx778FDxIixEkOpe9D3uY
	hA8U4LfNLQ7j42kajQSkMqV3gh2trLOuoW8iVZt2gfLM4FbEtqIGNXUMkp1LbajZInKIvf
	s/p4soozEGMLp1W+3Ulz/s66III6FaqgtpFEjPtMNXJaLTvGir/Q5WIiAuL3gAoscHAqy3
	dLisQuHk6Mmo5WwINXESTWyEu0dlSGrWYrsLIRJS5fr7j3+SEvqYyeohKgtqsNVzk8s2Iy
	7fgN8I7IeEGKqV50iaypdBZYrCbwlguZIwD/AiAQvvuqYOFVs3cRlJlo4kPEtQ==
Message-ID: <c6b589e3-1c12-e1db-200c-d0c3ff1972b9@bootlin.com>
Date: Thu, 27 Oct 2022 10:16:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org, rybczynska@gmail.com
Subject: Re: [docs] [PATCH v2 4/4] dev-manual: common-tasks.rst: refactor and
 improve "Checking for Vulnerabilities" section
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
References: <1721A288D2BAB036.492@lists.yoctoproject.org>
 <20221026160713.2068570-1-michael.opdenacker@bootlin.com>
 <20221026160713.2068570-5-michael.opdenacker@bootlin.com>
 <Y1orJ5GKSJUCbf/z@nuoska>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <Y1orJ5GKSJUCbf/z@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Oct 2022 08:16:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3424

Hi Mikko

On 10/27/22 08:54, Mikko Rapeli wrote:
> Now it looks good to me. Thanks for the review and new version!


Thanks for reviewing your text once again!
I fixed all the new issues you reported.

Cheers and thanks again for these very useful improvements to the 
documentation.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


