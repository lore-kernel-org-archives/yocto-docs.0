Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F17C77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 08:47:41 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.17133.1684226858903169238
 for <docs@lists.yoctoproject.org>;
 Tue, 16 May 2023 01:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AWLVkV+i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C41BC60008;
	Tue, 16 May 2023 08:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684226856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARQc9SaP5sl9TP4avnj2Vd5gvXavmFpE9/CSFGn+T9s=;
	b=AWLVkV+iNeEbNeqv8Fle7cBZHKGnPcVHlOGZGk2eFZYTvRt8koKFHNs2kd8O9qRVJ1yqP4
	HeBrWVuBcPZiWNJHQdxAHDmdxVzLFYZCquL6urcWqSZ448D1AvHoneu2rxqgiZqeuGYq28
	VowuyTJNj7vrXRfrwvf0U9aES7n8eL6gsD8hNQs5yioGwQVqBVOKRqgTVtjnzMsmAlIFJw
	pB1mj4Y6r93EWivUv4xA7Wym33SWlqAxT9SjmXBC8X+X5OansoXJBkUAzpVPQqLMxAD9LA
	xu0OzMBqhdXUKtKy7SajatH9R6uY2+HIXCCiW06tk/ribo+cVuU2kPSKM/PWBQ==
Message-ID: <ab47ab08-90ed-00ec-014a-294056bfc2b9@bootlin.com>
Date: Tue, 16 May 2023 10:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>
Subject: Re: [docs] [PATCH] releases.svg: update according to latest release
Content-Language: en-US
To: Takayasu Ito <ito@lineo.co.jp>, docs@lists.yoctoproject.org
References: <20230508055100.2204477-1-michael.opdenacker@bootlin.com>
 <c8174cd5-ee37-2c20-bc0d-33a0c3e57d7b@lineo.co.jp>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <c8174cd5-ee37-2c20-bc0d-33a0c3e57d7b@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 May 2023 08:47:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3944

Hi  Takayasu,

On 16.05.23 at 09:45, Takayasu Ito wrote:
> Hi Michael
>
> I see that the last point release of Yocto 3.3 was on 4/28/2022, and I 
> think Hardknott's line needs to be extended by 6 months.


Oops, that's correct. Do you remember why we supported Hardknott for so 
long?
Making the change may confuse people. They could think that Hardknott 
was a "short" LTS, but hey, that's what happened.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


