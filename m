Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72273C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 14:43:27 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10199.1646923405636089884
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 06:43:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=azzbysl/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 89D0140007;
	Thu, 10 Mar 2022 14:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646923403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vOzc20Gwfx+rzq9ycv1VQdekvWvutaPa/OrQxSjnR8k=;
	b=azzbysl/YRyTzA3/qoSSUkAfwuE97sY75z/51Ww3sBQ471kIe+jJNJ2Z6o6M4D/IVcgk7o
	SDiwLyBS6ypwywQqc89VmaX+/+1+UaESxDzovOpxfwjFTItSoDTP46CIEB2psHJzBAnv2P
	R2TLFz0wXEWvQ/ZMqHBbAczaQBwyBdwFc1H4nQISyRMq+Qk7Bo/cjRzYqoVruxxIBPkR8i
	OwzKSSfYNbBm1hikOG9/Qst9BxIDEWclqpP7eEv7bH2Pl9WjDuN82pqKgpPSZuVC3w/ieO
	1HLbi0JzJodEShvOfrULwA5nnM8/SJLuvqgORU9gobMha9m7aCNbsatbyTYHzg==
Message-ID: <37bfb570-9a47-c78c-e4ac-f7e87e613865@bootlin.com>
Date: Thu, 10 Mar 2022 15:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] docs: update examples to add branch info to git
 URIs
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
References: <20220309141551.612610-1-michael.opdenacker@bootlin.com>
 <51c1934a-6ead-c938-ecb6-c40c8b2f0d45@theobroma-systems.com>
 <16DB0B75A9F968CB.20222@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <16DB0B75A9F968CB.20222@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Mar 2022 14:43:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2582

Hi again Quentin,

On 3/10/22 15:31, Michael Opdenacker via lists.yoctoproject.org wrote:
> I agree this is an issue. We never know when this upstream will change.
>
> The challenge though is to find a suitable example which also includes
> an EXTRA_OEMAKE, because that's what the corresponding paragraph is about.


Oops, I was actually talking about the lz4 package, which is just fine
here as it doesn't use the "master" branch.
I'll do my best to remove "branch=master" from the patch.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


