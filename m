Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE19DC48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 10:38:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10483.1708425478513529583
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 02:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O1gmhG+J;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71B2D4000F;
	Tue, 20 Feb 2024 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708425476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0ZdyRD2if8dim9xqSl6DQHwi/dgXgTu+XY07EjmOhs=;
	b=O1gmhG+JrkZUGLEbP+JDjwExTfpc4Kdfr0y0x+2TPYSQGoODAZfkmhPCe8cCj2a5XQshB0
	bPiXdA70nGSvx1KSwPMPdriP58qKOxb14bOTrd3SlUU6fFbcTN40uyjdaba2TqAauUo94d
	8AkuthRVlzb+o+6CLIvgxkJ7tj0VfGZX45jIuHQ36K/Ym9QSUZTvMB87keo3sgLA82srYR
	JBd86khMe8mMWYMGKVbDum1SfVa7MImWPkJ1vD6xUW9lPDTB3RItJkT7MZyGHn2le776se
	/o6a0yq+zQ+JzRMO69E5YKEdQNqxrrxVRwexLyblj1+VF7cH3SpBU2beZ9tiVQ==
Message-ID: <3ad9ddcb-97af-4ea5-95c9-dcbdbe903897@bootlin.com>
Date: Tue, 20 Feb 2024 11:37:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] migration-guide: add release notes for 4.3.3
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>,
 Takayasu Ito <ypa.takayasu.ito@gmail.com>
References: <20240220041233.3730675-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240220041233.3730675-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Feb 2024 10:38:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4851

Lee, Takayasu,

Thanks for review and update!

On 2/20/24 at 05:12, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
> v2: move some linux-yocto/6.1 cve to "fix". These were fixed in version
>   upgrade but marked Ignore in exclusion as fixed dot version not updated
>   in NVD database.

I was too quick to merge the first iteration!

I updated "master-next", and will update "nanbield" soon too.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


