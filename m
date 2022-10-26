Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D201DC433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:06:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.8075.1666793207901148458
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 07:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Mh9g7p6W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BEAFEFF803;
	Wed, 26 Oct 2022 14:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666793206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DBZazf/aPcRw3wLRP1611+fnel6qgZXO8eSOMQy7pB8=;
	b=Mh9g7p6WNHF2TFU/wT4KC05LXvbrrLFr9kL7ZfeCoUa6Ovq4UAznvX6TQ1HQzihuV0yT7I
	aXO1xFykhpS46t7PJmSUw8T40PrGfSR2n/HZGxmHH5AW1b/gVYoT3eic4Ot7DCkgTnepll
	DeMvxYphTrFqdI7A/GTHCtfX8SZdmvp+PR92MAzw6aPlFhMtzsQKc2xMWZFqB/MYSLmIeI
	4yfwvGglkspct6sG3OboyCCbqc8J02u1FkAeZdR2jY7EpIsc76xx7+8ClUOrHK6b3Ks7Fb
	NJ19ThZVUwsxiCXthKiCNz6CvwIyFOU/OUGQNV+U1o9W/WIE+CO4CjQ3Oxvy5A==
Message-ID: <f2cedb34-a7a2-812f-ffbb-986117961192@bootlin.com>
Date: Wed, 26 Oct 2022 16:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v4 2/5] classes.rst: document
 openssl-native.bbclass
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20221005093007.326744-1-mikko.rapeli@linaro.org>
 <171B3A283AA2EB2B.30010@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <171B3A283AA2EB2B.30010@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 14:06:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3412

Hi Mikko,

On 10/5/22 18:42, Michael Opdenacker via lists.yoctoproject.org wrote:
>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> ... and waiting for the corresponding patches to be merged in OE-core 
> before merging the change in the documentation.
>

Still keeping an eye at Poky master for the appearance of 
openssl-native.bbclass, and keeping your changes in my local branch.
Don't hesitate ping me when you know this happened.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


