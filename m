Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00913C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:35:04 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.7530.1645623302774826866
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 05:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iDFi/oZu;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A0DC6240009;
	Wed, 23 Feb 2022 13:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645623301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nj1PK4c+gOjEbpVRFg/+TFz8X0+AN9BCNmkXaWx3cRM=;
	b=iDFi/oZuQqctqL42ubVTVWZCucAFYBKflmCvOe0K/JMmZkWBOioNkX/JlNraU8Ef0nc0wA
	p9FLp0PWOB61WhcrA0IlmPqcxUGyNLbHhZtGOpmqYhqhNsRGmcUi2YhGkvmG8U9KYccNjq
	LHgkPBN7MT9zyPyaXcPv/MZZ8+X8xG9ep4tLyJK9edpH5UpVxPPvK7/BP1jfoFtsGH2lH8
	Sl4jTK4HlsY0Y9GT2d/CTCiaLH9WyGQkjRt2HWgPmCz6XyrioQGfiHjqta6VpzLUnEqS7M
	MV28CY/i6pnQCfILvf/bJeaq7P59S+hAJgt5UKXJ9dDM1vLxTrbAIlvSY6hI/Q==
Message-ID: <24a2b39e-0d85-5514-b7dd-48782b2a4d2d@bootlin.com>
Date: Wed, 23 Feb 2022 14:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH 1/2] docs: fix hardcoded link warning messages
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20220223105206.2766014-1-foss+yocto@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220223105206.2766014-1-foss+yocto@0leil.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Feb 2022 13:35:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2493

Hi Quentin,

On 2/23/22 11:52, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> Sphinx complains about hardcoded links which can be replaced by an
> extlink.
>
> So let's apply its recommendations.


Many thanks for the fixes!
I wonder how you got those while I didn't. Which version of Sphinx do
you have? I have version 4.2.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into master-next.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


