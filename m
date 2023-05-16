Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D0CC77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 13:39:02 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.22015.1684244341529151181
 for <docs@lists.yoctoproject.org>;
 Tue, 16 May 2023 06:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i85KX9/X;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 12225E0017;
	Tue, 16 May 2023 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684244339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YWhjf9JaX8ovi+LXcPMhUeoZ0r+GatJe/ziNGWPxi5w=;
	b=i85KX9/Xta67LzvfoYeQ3vzsHFGe0yH9cqY2HlXkqAoXa7+3ydZpgwlWmcUtyHBGnuPRTN
	xLqapGCCsbf1T6wNlHrCNuft7NDZ5CYZm700reJPxo0Rz+HOs2nM3hcFLQKBcyIZT/wCYP
	3GuZkZCxGZ2RuqTI2QjijLKG7kuIpFinJ7OdoXIOk3g6INztQpfWo1zrsb2DtyKoSvnUr2
	V166z8cdXTALmYJaysrKMJalV3SaTYuhOzau8jJZ52qCILsLZqFpUUlnDNXiEzNkf8cuxV
	gbzyr+UuR1/MduFnxf89DSSg1JdaHltALh/9nYO6YGa1ohAASFODhfV+Zmbtjg==
Message-ID: <b1c30eab-bd5d-109f-0c2c-bbceaf86b0c3@bootlin.com>
Date: Tue, 16 May 2023 15:38:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>
Subject: Re: [docs] [PATCH] releases.svg: update according to latest release
Content-Language: en-US
To: Takayasu Ito <ito@lineo.co.jp>, docs@lists.yoctoproject.org
References: <20230508055100.2204477-1-michael.opdenacker@bootlin.com>
 <c8174cd5-ee37-2c20-bc0d-33a0c3e57d7b@lineo.co.jp>
 <ab47ab08-90ed-00ec-014a-294056bfc2b9@bootlin.com>
 <3b21c172-34f5-8e77-be7a-82e53ec37f70@lineo.co.jp>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <3b21c172-34f5-8e77-be7a-82e53ec37f70@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 May 2023 13:39:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3946

Hi Takayasu,

On 16.05.23 at 13:37, Takayasu Ito wrote:
> Hi Michael
>
> I remember that this was extended at the request of the community in 
> Yocto 3.4 due to incompatible override syntax changes.
> https://docs.yoctoproject.org/migration-guides/migration-3.4.html#override-syntax-changes 
>
>
> https://lists.yoctoproject.org/g/yocto/message/55344
> "A request was made to continue hardknott support in the community and 
> this was agreed until Feb/March next year but will not overlap the LTS."


Oh yes, I remember now, thanks!
An update to the diagram with explanations is coming soon.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


