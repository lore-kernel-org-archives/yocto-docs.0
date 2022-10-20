Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54C5C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 07:06:54 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.6906.1666249604188142338
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 00:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NbY4UHs2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8DAADFF80C;
	Thu, 20 Oct 2022 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666249602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4K2/f2R6GRURAw+w2JpmZGcR3MmEHbNP6GUvCrXbHSE=;
	b=NbY4UHs2tYB0QkCHL8Jp3OMShO36ZLip0SZ6qMppVwGuiiMxHnFIpyOuFCd6GhjyrqjgvL
	cxmJ3WfUORLxY2n27Cyz7YIzGZscg7oJ3w3XqAo6gZV5WM9kkklouDHiX9ZIbMmRCUOb4i
	oEK/lnhbgHyZCGM9thenDbN71zHJ9b2RqFKp5Td49dKfV2wpEz/DTbM4sYcAFBOdLsknPV
	5Gb+t4moPzipS0Ffj0uHehmH8bXWC3HzK7alxTTvWrdibKDIVGWaBcDeHnFuyZm5ZQbWO/
	XDaOFZ++E6zn7sJc7LPJYvA1bfwvjUXgdKF1EI9YbbTzaf91wJKU4CZi2GRZxQ==
Message-ID: <39e4d562-ea12-9fe3-7d6d-853c57f45cc7@bootlin.com>
Date: Thu, 20 Oct 2022 09:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH v6] release-notes-4.1.rst remove bitbake-layers
 subcommand argument
Content-Language: en-US
To: Takayasu Ito <ito@lineo.co.jp>
References: <20221020065246.33834-1-ito@lineo.co.jp>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221020065246.33834-1-ito@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 07:06:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3387

Hi again Ito

Now that the patch is correct, let's talk about the proposed change 
itself...

On 10/20/22 08:52, Takayasu Ito wrote:
> From: Takayasu Ito <ito@lineo.co.jp>
>
> Signed-off-by: Takayasu Ito <ito@lineo.co.jp>
> ---
>   documentation/migration-guides/release-notes-4.1.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
> index 0c552bf1a..a2d4b3d6c 100644
> --- a/documentation/migration-guides/release-notes-4.1.rst
> +++ b/documentation/migration-guides/release-notes-4.1.rst
> @@ -18,7 +18,7 @@ New Features / Enhancements in 4.1
>   
>     - New ``scripts/oe-setup-layers`` standalone script to restore the layer
>       configuration from a json file
> -  - New ``bitbake-layers create-layers-setup destdir`` command to save the
> +  - New ``bitbake-layers create-layers-setup`` command to save the
>       layer configuration to a json file
>     - New ``bitbake-layers save-build-conf`` command to save the active build
>       configuration as a template into a layer


I'm not sure what you propose to modify is correct though.

Here's what I have with the latest "master" branch from the poky repository:

$ bitbake-layers create-layers-setup

NOTE: Starting bitbake server...

usage: bitbake-layers create-layers-setup [-h] [--output-prefix OUTPUT_PREFIX] [--writer {oe-setup-layers}] [--json-only] destdir

bitbake-layers create-layers-setup: error: the following arguments are required: destdir

$ mkdir my-conf

$ bitbake-layers create-layers-setup my-conf

NOTE: Starting bitbake server...

NOTE: Created /home/mike/work/git/git.yoctoproject.org/build/my-conf/setup-layers.json

NOTE: Created /home/mike/work/git/git.yoctoproject.org/build/my-conf/setup-layers

Which version did you make your tests with? Or what misled you?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


