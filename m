Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1442C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 11:12:56 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.14466.1711710767755342360
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Mar 2024 04:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YqLrUJUY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73C4C20003;
	Fri, 29 Mar 2024 11:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711710766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MaEkpKXh5xDWtFGhYQpZIHKE4ksGHTMRJ3+3HD6CkAU=;
	b=YqLrUJUY73WmiWHt9QhHg4ei1D5uwez2SypCPfSsHgpNG+bSfWzyRHg+B3J4EbXdd1bbJr
	HJuzIB3Au5hi0jZPDuhTEaPrGMNgBwcVSRJxWoTwCuefNRBZ7y/LP4+LAxHxggljBh5w48
	nKbvS6W3mKOl5IYprJaEYvse3FbyZueR1Jb13GYfK7Hl5zwJ/nFZtnrXBt/yzMOV0Ad5AK
	2ymjvG/dlSAFzO2d+TaSc0plfH47hBzBfB0B/Yx+Cta1oWiNCXeGLMFSwgKRm5NWfI6Pkg
	owSYgy1ol8N3xZdGY5ZKNAanTgc/ybM/0znK/jE4b4sDcFQPes5W9UWPul6Kbw==
Message-ID: <85b79cd0-2f49-4217-815f-ba23c653ee14@bootlin.com>
Date: Fri, 29 Mar 2024 12:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/3] conf.py: properly escape backslashes for
 latex_elements
To: Quentin Schulz <foss@0leil.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20240328-yocto-patches-v1-0-1124fa0bc532@theobroma-systems.com>
 <20240328-yocto-patches-v1-1-1124fa0bc532@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240328-yocto-patches-v1-1-1124fa0bc532@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Mar 2024 11:12:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5027

Hi Quentin

Thanks for the patch!

On 3/28/24 at 16:07, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> There are some syntax warnings returned by Python:
> """
> yocto-docs/documentation/conf.py:162: SyntaxWarning: invalid escape sequence '\P'
>    'passoptionstopackages': '\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
> yocto-docs/documentation/conf.py:163: SyntaxWarning: invalid escape sequence '\s'
>    'preamble': '\setcounter{tocdepth}{2}',
> """
>
> Backslashes must be doubled in Python string literals to avoid
> interpretation as escape sequence, c.f.
> https://www.sphinx-doc.org/en/master/latex.html#module-latex.

What command(s) were you running to get the error? I didn't see it.
Anyway:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next"
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


