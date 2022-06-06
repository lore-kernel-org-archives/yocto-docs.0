Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFE6C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:57:15 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.32950.1654527427470826377
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 07:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VeEvOUYn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B336F40005;
	Mon,  6 Jun 2022 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654527425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rytx38OcVL6Iw3jIiCdQSLr0wZ8fapHmL1Y+2gWqAYI=;
	b=VeEvOUYnQ2Nsa/AodL5wcqAU7yweWbcmxBmdRB3h0qDH6jHRcM9Jkfq0jpYCO2ZP4K5wSI
	q5Oj8tsACMB5Nbk8VZJyYAFjYahNo0XaQj/hZHATcexRd2ciEr9BFWlqqCIMDMBKLWKK0C
	uu+SrsXcb60lqOUM+mHmXa/fBxppKqNJyiZ1lMMRWs65XKjpjQ6RA7joUHF1gTNDadY4BI
	ngH4ti04n4M/bOmDi8l/WExJQhQWtkGHImyolJvWkKw+ot2qEpH9Ee/tU7GTzFfIzcCrkd
	SLLeRIASh7I+5Gr1a3+HYBGRccRb7SAZeSVZrEPr8LKRU5j5z0V3z2kXFj83Ww==
Message-ID: <77b2a539-8ef8-eedb-083b-3f5ef84bf3a4@bootlin.com>
Date: Mon, 6 Jun 2022 16:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: michael.opdenacker@bootlin.com,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH] docs: releases: move hardknott and honister to
 outdated section
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20220603133353.506482-1-foss+yocto@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220603133353.506482-1-foss+yocto@0leil.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Jun 2022 14:57:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2962


On 6/3/22 15:33, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> Hardknott and honister releases are now outdated, let's move their
> manuals to the outdated section.
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>


Correct. Merged in "master-next". Thanks for the update!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


