Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE692C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 13:10:26 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.16038.1713964218961301400
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 06:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o6dQARh4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0965B20013;
	Wed, 24 Apr 2024 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713964217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxlwbUl1PS8mCACyr/omYDfFsZFr+Dn8Picl/vdYewM=;
	b=o6dQARh4oLxEPuqHa/eeGoFCtANlq2HTBCSrjXk2AC7Oj1HfJ7q4YOAohFrp6khhXULNd7
	JtnWZR3tZ6JSaVGPG0LTaI84Rd/oDQDd/2et3GWRFdYu/D8KjzWCvkNazNkD0byfSLn2zW
	MYWHvgt8VbysI3GKpDtxRpJd1TLPmetneMNl+nNFyneapdrlfLg17oFAzT29f/87oRze/S
	ux1z5B2iRH3mCaLFjiLu2khb3y0z4kSX9M+gFOO4fWxBFK/9QAc2ZaDlNc3rVNLc9luJ90
	3XX/nEpOvXq8zWVyZvlL7aKfcKtMtxcTeb7ujHclMjLsn8gsJ6yulr7FKWBsuA==
Message-ID: <22565952-f6bf-4b89-bdc7-8bd86303b992@bootlin.com>
Date: Wed, 24 Apr 2024 15:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] release-notes-5.0: update recipes changes
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20240424044154.4712-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240424044154.4712-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Apr 2024 13:10:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5174

Hi Lee

On 4/24/24 at 06:41, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> update recipes changes in 5.0 rc4.
> update new recipes, license changes, patched cve and recipes version
> changes.

Many thanks for these updates!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


