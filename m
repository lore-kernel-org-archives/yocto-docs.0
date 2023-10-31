Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD2DC4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 12:51:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.185377.1698756707874908245
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 05:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GvLVknFN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 316621BF204;
	Tue, 31 Oct 2023 12:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698756705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/qd9ki2r8DViGLY0HPHYgm44pM53SXm0glrtzU6Wcto=;
	b=GvLVknFN1eQ+5v8mm1YCagnJyWHYibceqMiJtt//vo7Q/+13ZUtsEyibOwQ9fiWukRRMj2
	qWvoKZa16ZoBnI+w66Xryx4AiRKa8h5kO7AP8OWOaKKwRTi569AJ5tr8Hj3YHCn/fcMKfh
	VTlwQEPzKQdh1xGJlsR9l1kuL9+jBD/MPMe9Nci/xuQ1V0f0YR/wFGg8GLnm7sqrbx96+m
	DS7Tmzkjf5t6/Xt/iz7HioPJfwegGPCuu4cqgWrUZBjyAg0NgJsq0HuBVbE+BfvM0zwebZ
	ugITmzAbAUvqzuHK6tchBzJ/+4O8dkrJ0oLN2pShU54+LsiSfDarO0APGBqPQA==
Message-ID: <7b1a880e-001b-43e1-89e1-c4000ffcc646@bootlin.com>
Date: Tue, 31 Oct 2023 13:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [nanbield] Pull request
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <808560ba-78f0-42b2-be6c-86531902bc51@bootlin.com>
 <ba52405bc4c9fe7016c4de37c387a5832303e8a3.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <ba52405bc4c9fe7016c4de37c387a5832303e8a3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 12:51:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4540

Hi Richard,

On 31.10.23 at 13:06, Richard Purdie wrote:
> Hi Michael,
>
> Would it make sense to update nanbield to master? Is there anything
> there which shouldn't be in nanbield?


No, everything in master should be in nanbield. That's what I meant.

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


