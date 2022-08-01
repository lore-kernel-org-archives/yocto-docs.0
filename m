Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99173C3F6B0
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 13:04:18 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.24689.1659359051516252842
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 06:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X03BpgJ5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6AA15240008;
	Mon,  1 Aug 2022 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659359049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xi2pzvRpKNAKYlETptgQVRLTmS1z7ZhqHpWUTX2y7tg=;
	b=X03BpgJ59FP2CvxWEgJz86zjE30wPqL7uhXyB1j7ZN/WRqMxxN1FPVTuXSpRxTMv+Xh3q7
	3Sbkdl0kuqx+3iBMZm/28K2oFNfpcI9dyYdfvJhvePQEedS3CW+mwyaup4pSuMs0vJWdx1
	Py7Is+WTmMzaCOL0mgSDfQbmJ+PORIv8RujhURxy/X1nIKH1EGNq4hLJy6JE8vNwdv0ylS
	93Oret2jj/pyaXqafuJUixWpD5RCBS1Fp1BhirVEZz19/2c6L2mSKTEH7KttUko6Zqx5fB
	EBsvnBLFN8vLY51Cka+2en++Yy21KKwa1dLm4KXQhj/hwayywUDacMcbxed3JA==
Message-ID: <3d2bce3c-145b-9c42-762f-32515f4db3ae@bootlin.com>
Date: Mon, 1 Aug 2022 15:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH 4/4] docs: ref-manual: system-requirements: add
 missing packages
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20220801103529.2053164-1-foss+yocto@0leil.net>
 <20220801103529.2053164-4-foss+yocto@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220801103529.2053164-4-foss+yocto@0leil.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Aug 2022 13:04:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3099

Hi Quentin,

On 8/1/22 12:35, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> inkscape and the package providing fncychap.sty TeX font were missing
> from the packages to install to be able to build the documentation, so
> let's add them to the list.
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   documentation/ref-manual/system-requirements.rst | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)


Good catch. Thanks for the updates and patches.
For all 4 patches:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.


Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


