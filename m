Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C59C48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 11:20:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.22356.1709205608657605278
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Feb 2024 03:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S9H3y2yG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EBFDFF80A;
	Thu, 29 Feb 2024 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709205606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cr857Iq1NMW/TgAf+ftQPQ7BeNPE4kcYRMO+BPJVw3w=;
	b=S9H3y2yGVnwqhO1ZMPOC1ZPjvn3Vrp5MscQMNzp15iJlqm3oSefgI3yYmWOWyLfaZigOww
	W2UPIL94ej8OIBwMlSiC2nCzwQwcF4tLWNzVa8R4QoP7RJsi4RBt4oRjpvuSOL5imAK5nw
	GgVpxod1alSCzPn8ozPXeje1tjT92x0EaGNkwwNS4X1FOmmoJcecp5A284zI91tuZ7FLkN
	7+oq/5mbgIO9U7tDGK20GpGd27g7dx9kUwM6Zp6n9LAp6xinhEewyOr+VrMZ+JWnNe8o5Z
	0kstIgVfYbmXHErH8mI06gqzDQOhIAR2suIfBvsex/8LbdT8rgpObLZGY84V6A==
Message-ID: <54df2516-b2c6-46ca-946c-dafb6e120153@bootlin.com>
Date: Thu, 29 Feb 2024 12:20:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] variables.rst: SDKPATHINSTALL correct installation
 default path
Content-Language: en-US
To: "Bezem, Johan (extern)" <JBezem.extern@arri.de>
References: <20240226161506.48020-1-jbezem.extern@arri.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240226161506.48020-1-jbezem.extern@arri.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Feb 2024 11:20:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4918

Hi Johan

On 2/26/24 at 17:15, Bezem, Johan (extern) wrote:
> From: "Bezem, Johan" <jbezem.extern@arri.de>
>
> The SDKPATH variable seems mistakenly identified as the
> default path where the SDK will be installed by the generated
> installation script, unless option '-d' or a manual input
> overrides this default.
>
> The intended variable is SDKPATHINSTALL. SDKPATH indicates
> where the SDK is being composed and built.
>
> The definitions have been added/updated.
>
> Signed-off-by: Johan Bezem <jbezem.extern@arri.de>
> ---
>   documentation/overview-manual/concepts.rst | 2 +-
>   documentation/ref-manual/variables.rst     | 6 +++++-
>   2 files changed, 6 insertions(+), 2 deletions(-)


Thanks for the new version!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


