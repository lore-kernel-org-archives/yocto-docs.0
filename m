Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6BFCD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 14:41:49 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.18116.1711636898710331958
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 07:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PUkx5mKj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6F3860006;
	Thu, 28 Mar 2024 14:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711636897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DvIz7XWBTDop+IzldERR8zDd0//ND451bkvg022Bv2w=;
	b=PUkx5mKjjqgKqiMj4/tJUFqjohqkRNl6HuQ38rfblztvIu76Dcib8fpbLmi0DgjLPURMYM
	JKF/QY8ArbD69OrUCVy1p8Wea2WLFlVP9TSHHYhbu9hyqYA+x5bh+JwfkrQJRZiPFFStTO
	jeNhmg1OnXZbG2Mb/XBvzM4K1ODwwiLly3npA8Ind3Vgla9seAt+OOspz/E+dm5+wwWQA6
	Dk1xIPUJVrSO9CEZLpVA4CN5cYzOS9XSXWutPMWjhGIWIrAxjIuhZWspqcOT+UoQIlC+Ae
	nkAsGIp47GRUDJaTtOLItqorVIBAaGkKTa3LQakIlfM2VBVXZg++7FiQjjZRaQ==
Message-ID: <2fcb0eff-8a38-4238-94f7-44cfbb8a8cd9@bootlin.com>
Date: Thu, 28 Mar 2024 15:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] release-notes-4.0.17: reorder CVEs
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20240328023142.3416785-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240328023142.3416785-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Mar 2024 14:41:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5021

Hi Lee

On 3/28/24 at 03:31, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> reorder CVEs from alphabetical order to numerical order, align it
> with text based release notes.
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>

Makes for this update!
Are the CVEs now automatically sorted by your scripts?

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


