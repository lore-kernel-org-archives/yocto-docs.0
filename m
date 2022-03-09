Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9811C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 07:54:09 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.3224.1646812448393128318
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 23:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j3GqZY8Y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2F8591C000F;
	Wed,  9 Mar 2022 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646812446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDZGp9lIL+MZn85Mfa/cl3i2o37jFW60x0ZpsFB0O08=;
	b=j3GqZY8Yn47RBFnzhyeWQ6Lg09TZNQS2SV2PbvNKUADihsjqpquVLeALNrngR/PH2VH6EI
	3H+w5oLFoM9XWCENT8R7FdTAkX2gupx61sOuPLRs3hPau/qWh9jpxd5j1m7lwDLWeONpU2
	fHrJVnOMqpvgXFc03ytS9byFhZIwciIcYCHdNr5Z1ng4Z6pSimI7m2ktXTwSqwph/tcH/l
	KS/xK0qaU4rCNvMruPL0o4oGzMem8wPGGiINw+zMQRVXZDJsW/4x44oYebLCs0o/6HN+Z9
	ea/gDlah9adNadMgwLdcDwFTk77TU4U/rbQwJ4ruv84+Xe/HJt1hHoKrSlIi5g==
Message-ID: <41207cc8-39a1-8257-0193-4fa353a7e662@bootlin.com>
Date: Wed, 9 Mar 2022 08:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] dev-manual: add instructions for compacting WSLv2
 VHDX files using DiskPart for those systems which lack optimize-vhd
Content-Language: en-US
To: Tony McDowell <svet.am@gmail.com>, docs@lists.yoctoproject.org
References: 
 <CADmuqUfgVBj28RbjVwGGxcT2NnP2k=DxSZ8z6C=miBqtncoN4w@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <CADmuqUfgVBj28RbjVwGGxcT2NnP2k=DxSZ8z6C=miBqtncoN4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Mar 2022 07:54:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2554

Hi Tony,

On 3/9/22 03:42, Tony McDowell wrote:
> This is an alternative way to compact VHDX files for Yocto Project use
> since the prior instructions depended on a Windows tool not available
> on all Windows hosts.


Many thanks for this patch.

However, did you try to apply it to the "master" branch of yocto-docs?
I'm getting this error:
error: git diff header lacks filename information when removing 1
leading pathname component (line 6)

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


