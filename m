Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B0AC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 16:13:51 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.20528.1704816822886351857
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 08:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nm4PV16K;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3736C0008;
	Tue,  9 Jan 2024 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704816820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HVMSU92hlZwV7DupLQurq7J3zf028X1zjy0/D+lNhQY=;
	b=nm4PV16KS8Dr7EInzrJkE2DFEurSVP+W2xBNvl799jK99qFFn+XXNGN2tU7r9S9zb6On/+
	MlO1PsnJqCJzBZrW1OnSOYV9XLgZOSxn0UZmiT8Zu7eJE7lBmzZtsOG04A4A9LvikIFEqH
	l89orlq3F1aIwvhdh0sqeUnf1oKm0EUCfAMEulsC1ixADs2yWxfngt9RZ1tgaUys4E27/+
	f50r07mByT3h7lb63JMv7qmm7BWoJTfbPb6IETq/Niz7RsprYkyksOlP0dZ/dOWl60FVF9
	UQ3GyDyqH+GZ/mUlVRXtEy+CCWUaS8EC92xy/kKFBK1FYMDBSxKQeZEQn6x5qA==
Message-ID: <bfd50fe6-9f71-4dd8-9883-8c87249b8417@bootlin.com>
Date: Tue, 9 Jan 2024 17:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guide: add release notes for 4.3.2
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20240109124804.616460-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240109124804.616460-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jan 2024 16:13:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4757

Hi Lee

On 09.01.24 at 13:48, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.3.rst          |   1 +
>   .../migration-guides/release-notes-4.3.2.rst  | 246 ++++++++++++++++++
>   2 files changed, 247 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.3.2.rst

Thanks for the release notes!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next, and soon in the "nanbield" branch.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


