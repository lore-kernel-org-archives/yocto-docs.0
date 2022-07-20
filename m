Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBD9CCA486
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 13:13:06 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.53487.1658322776528481071
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 06:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PMnIDwVB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 19BA31C0004;
	Wed, 20 Jul 2022 13:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658322774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K4swQ7BHh5wSp55f8v004Cv+oC67Z2qq6iPzumcWV64=;
	b=PMnIDwVBrW+Z0LRH3xRqkE8wqV8D/kl9+CaMnkc2Vh+LVFQQsyEQfrmDr9KrJiBD1wz1Wx
	K12lqQx0c8Yq/DX5ERKy3Bz+ObggdNiq31hSeoCQY9KC+w0n3OKlMPJT61x46Mf6FiMMoW
	0udhdJNanliD9WjHiabNBvLLgZbzSYqPED75JujM1XjNhZrnTgJptAv8gYFWn5HK4Gmc6F
	0uBGfp1PsQUoyzxMRjnyGP18u8vNjH8mioetbzJoyv3dtQxSD+ltL9BxVFxfiJkgswk1LY
	gOZbVYRYYF3QYp47C/xlLnR6umjexkt7oKKD0uLMUn/zRomO3ZlGiuf0/WbMng==
Message-ID: <8d968d95-91ce-33cd-2357-10484eeedb5b@bootlin.com>
Date: Wed, 20 Jul 2022 15:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH yocto-autobuilder-helper 2/2]
 scripts/run-docs-build: do not checkout releases.rst from master anymore
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org,
 yocto@lists.yoctoproject.org
References: <20220719081214.1924835-1-foss+yocto@0leil.net>
 <20220719081214.1924835-3-foss+yocto@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220719081214.1924835-3-foss+yocto@0leil.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Jul 2022 13:13:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3079


On 7/19/22 10:12, Quentin Schulz wrote:
> Master branch of the yocto-docs now autogenerates the releases.rst file
> and the file therefore does not exist anymore.
>
> Signed-off-by: Quentin Schulz <foss+yocto@0leil.net>


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Indeed, it should be applied right after the latest pull request from 
master-next is applied.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


