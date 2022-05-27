Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D57C433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 09:01:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.1571.1653642101492481986
 for <docs@lists.yoctoproject.org>;
 Fri, 27 May 2022 02:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=neOvnwvL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2163520009;
	Fri, 27 May 2022 09:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653642099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Izpi7iTKih0SALsaXi857SmZycozSA5csDKBvRUEBb4=;
	b=neOvnwvLxkDCCok09YdKbBpP7v3ZnBFsAub8avH2M/Tr++EViW+O+Mfp58ZV/DCw8ID8ge
	ugkrNfLIFgXFu1mhVJsvrO2OskeMVMBWbhstRefQlugF+ho5o++WE47SLc9cTS5zIMMRWE
	WI8RIHi836UleLknqoYHy+0fGqGJ+QqkoskCPg4KvuBn4KHF/eUjFSHwNeQWqlTadNLYGa
	5Dc55S5J8GLVsJIa2WaZSYh4w1mfrG1fGywyKTj5HRI9xBsidf3xR/tq+YFeLKYu7mGFh4
	R8p0cHViTTGjPRnJWJ5V5alF5SjpBomowcukwApIN5yQu05lZz1P/PR88uzpEQ==
Message-ID: <719abe09-baec-6a73-fba6-cb6ee555ed0f@bootlin.com>
Date: Fri, 27 May 2022 11:01:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Cc: Zachary T Welch <zach@aquabyte.ai>
Subject: Re: [docs] [PATCH 2/2] test-manual/intro: bitbake-selftest needs
 bitbake
Content-Language: en-US
To: Zach Welch <zach@mandolincreek.net>, docs@lists.yoctoproject.org
References: <20220526151228.562281-1-zach@aquabyte.ai>
 <20220526151228.562281-2-zach@aquabyte.ai>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220526151228.562281-2-zach@aquabyte.ai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 May 2022 09:01:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2951

Hi Zach

On 5/26/22 17:12, Zach Welch wrote:
> Without adding bitbake/bin to the PATH, some tests will fail when
> they cannot find the main bitbake script.
>
> Signed-off-by: Zachary T Welch <zach@aquabyte.ai>
> ---
>  documentation/test-manual/intro.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
> index c445e28a7..12324e592 100644
> --- a/documentation/test-manual/intro.rst
> +++ b/documentation/test-manual/intro.rst
> @@ -175,8 +175,14 @@ Tests map into the codebase as follows:
>     which include the fetchers. The tests are located in
>     ``bitbake/lib/*/tests``.
>  
> +   Some of these tests run the ``bitbake`` command, so ``bitbake/bin``
> +   must be added to the ``PATH`` before running ``bitbake-selftest``.
>     From within the BitBake repository, run the following::
>  
> +      $ export PATH=$PWD/bin:$PATH
> +
> +   After that, you can run the selftest script::
> +
>        $ bitbake-selftest
>  
>     The default output is quiet and just prints a summary of what was


Many thanks for the two patches. For both of them:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


