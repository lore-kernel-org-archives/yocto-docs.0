Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FD9C47DA9
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 09:00:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14314.1706605228646874940
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jan 2024 01:00:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KNHh8JJH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 240F6240011;
	Tue, 30 Jan 2024 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706605226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3vWJy1+ZxgwQP7BtqRRG2vRGCItJP8lZwXGtjQIbDw=;
	b=KNHh8JJH7bWORJKv0hb1FN6JiRZp1Z17owPbSWBKvkiWtqCIApzhpapDf7SNDZ/7+d9LCt
	2yOhtZaUdgN4HQRLv5YcDpjUSfEUFbimTvjq4FfYf1aCAmqmp6VaHm3UNttSju/N6IGHRb
	apwDfdG7u/venigxs2imX4RqGj4EKEyKaTnWAT7pmfpWqfVEPXI+LJGUFav4c3PLxEq8z2
	ev/DoH64am5Q2aPdFPx/jK5HlXE8jvUpDWMsYGUlARp22NhGQ9PAJldUGJ+0RG9QU8DnKP
	w+p4aVTsLcC+Cmx6c91l5IDeNeeZEQQXQ0VdqsrkEVpvXTVLH9j6W4dQ0VE+XA==
Message-ID: <c4f41ac0-3499-4e88-961a-ce5b4cbd98b8@bootlin.com>
Date: Tue, 30 Jan 2024 10:00:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] migration-guide: add release notes for 4.0.16
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20240130025030.1979753-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240130025030.1979753-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Jan 2024 09:00:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4800

Hi Lee

On 1/30/24 at 03:50, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.0.rst          |   1 +
>   .../migration-guides/release-notes-4.0.16.rst | 191 ++++++++++++++++++
>   2 files changed, 192 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.0.16.rst

Thanks for the V2!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next, kirkstone and nanbield.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


