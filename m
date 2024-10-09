Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733DBCEE32A
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 16:02:42 +0000 (UTC)
Received: from toucan.tulip.relay.mailchannels.net (toucan.tulip.relay.mailchannels.net [23.83.218.254])
 by mx.groups.io with SMTP id smtpd.web11.20661.1728489754459833477
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 09:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=llgjR1J3;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.254, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E0CEA9456AE
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 16:02:33 +0000 (UTC)
Received: from nl-srv-smtpout8.hostinger.io (100-96-86-20.trex-nlb.outbound.svc.cluster.local [100.96.86.20])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 55843943A13
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 16:02:33 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1728489753; a=rsa-sha256;
	cv=none;
	b=6G1PHHtoVMXDFGy3SSu20nffvlQ7JSWN1VQtbLDk7AGVFb+3LRsOl68IMp8MccUFTq+jAf
	0kClQVHsNZKpOsI9eDlSlBgNt+7sTKvo7eE1nzZEVDLLkZK8Ah/HszsO4lAS2rU0Ql8FHV
	nyOqUpbxW3UfGgma31+H14DMMVq8L5zY5G/fzA6qWoe7BON50UFZ4jB6EyPJAmXR1VkCIF
	Tp+eML0GnP/dbGv6pQjxKUaVDa7zNcroTFfl7FUb+bhoXfN80mn2Vr8/33ugJp8rCzq9II
	EEi5c2BkA6KbVvBLnYjTC1fMOCIwrtMMz8ZdrrJ2RxQJ0mZ9IV6kMLnCvbwFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1728489753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=1zshBDpNip6V8I5g4vPboWo8ThL1eruc1dpbfRVTVbs=;
	b=XPjYDd8oiB7BPQtGcW2osYU7Nh0VcNgIidzol97YbuVdRsFP+VfmMDM/uFBmtUk+2YgR6t
	wqcx+eUJ3ivLmH0sRGl3sNW+7tEH9qjkg5KUGB1us2Z3p7NwrYwfiRRE2qSM9WxHhJAdoW
	oKGEQ6rtJfrDnWjf6Uu7M2qVMD/6XD8bG2eFROg+BKzkG3FdQJ2whKunp1W+Y5+qHqlTbF
	82nmnWKS8JOtDk3L8kcuW3DMC6oiC4iZEuQaduekYU51Fhqv3NPLVVYcpj86x0J90hjt0S
	ApX03PTzlB4AD+2xcuEd27dkYlD5BVUHcCg2OkTvDdFCma6yLMTi5Xvchr/LeQ==
ARC-Authentication-Results: i=1;
	rspamd-b4cd7f459-tj25z;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Illegal-Arch: 388039eb03183e5c_1728489753805_282104233
X-MC-Loop-Signature: 1728489753805:83575621
X-MC-Ingress-Time: 1728489753805
Received: from nl-srv-smtpout8.hostinger.io (nl-srv-smtpout8.hostinger.io
 [45.87.82.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.86.20 (trex/7.0.2);
	Wed, 09 Oct 2024 16:02:33 +0000
Message-ID: <72682ba8-dba3-4708-b7d8-98f4f9c4edde@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1728489751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zshBDpNip6V8I5g4vPboWo8ThL1eruc1dpbfRVTVbs=;
	b=llgjR1J3I7nM6h7GAjauHJrzeAFLLorSAdcYRii9KpA54Elm//34knH9n4srTJTTDKLaGU
	2X/qbGNE9KEN4dl2GdvDgF75b4AG0A3gQ3gtd1lhxnNhsHJtNHoSVglFBQ8SnnxohdORI7
	5AyR8T5WB9Jt14sIhtFGX9tZjy4LmOuvabAbtfZhLXgzM3PH5PBdGnn9oO2hRUrJjQEuEQ
	n+9mjUjtMfknxxwd7xK/V2oRIJ01jWXB3FZ9oLOQh3OdtRgMygSF3XOPrm192yWLeoEJkS
	BM7WVQi7D35N7BtI4L+pLEoKiRUcbFwvEMXJjlmwLrAmMErebEoZHwg4x0+uiA==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, ross.burton@arm.com,
 paul.eggleton@microsoft.com, thomas.petazonni@bootlin.com
Subject: Re: [docs] [PATCH 13/16] ref-manual: merge patch-status-* to
 patch-status
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
 <20241009074120.866786-14-antonin.godard@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20241009074120.866786-14-antonin.godard@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 09 Oct 2024 16:02:31 +0000 (UTC)
X-CM-Envelope: MS4xfEvo2C/yMCAcjHQJWhi/Ddyed+gmUesc8uBZjTOr3hjArA0Vllm805avmeeAHfPEXdaHhxS8iKlLp3/2K9wgNtCzOv8RODssEUw4GR2QaWRR9TxJoyoJ PSdPvVCCYix96tCOK86CvZWmNDhenBAShFmDcs4rk7JUn3GGffNlhxqvR9awFRXCy3rU+oKXUnQC4raExnmy9Uixcorphroz5sEGtH3RrnZZ17M1mFDyuufM my71gEd55foywB99AhpTDYWeJA4qyuRZSSOZhfKujXgfSMsIXF5F1/h6QeFO+LzfL0kQjsGUECxabRBPMbC+A5u/YZKFiYnEoua/7C5xrTZY3IHVzexJXwdZ G3u4LZYqBFcadD3GM0tMY6Q7Rrj45DEqWcvhCxIZtYrkX99Y/+DXL/0v1XZAV64g/AM5vWBDT24dm35VQvV5Nim5oGI9Bemf+inY3O4hCS1tdM43sWolbrYZ AbXTIeVa1TRXo721gmRGp/eoZTP7Gwb3GHsLZbojS5kS9tl5UJiRCwq6EJo=
X-CM-Analysis: v=2.4 cv=bZY5U/PB c=1 sm=1 tr=0 ts=6706a917 a=FxzzrTkVuG1G0rBnFVKeJA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=d70CFdQeAAAA:8 a=eAYsMxcYWI3fcBSpqZ4A:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 16:02:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5449

Hi Antonin

On 10/9/24 09:41, Antonin Godard via lists.yoctoproject.org wrote:
> From: Antonin Godard <antonin.godard@bootlin.com>
>
> These are not distinct anymore and check for any patches in any layer.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 121887d1f..0fce37cfa 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1461,12 +1461,8 @@ The tests you can list with the :term:`WARN_QA` and
>   -  ``patch-fuzz:`` Checks for fuzz in patch files that may allow
>      them to apply incorrectly if the underlying code changes.
>   
> --  ``patch-status-core:`` Checks that the Upstream-Status is specified
> -   and valid in the headers of patches for recipes in the OE-Core layer.
> -
> --  ``patch-status-noncore:`` Checks that the Upstream-Status is specified
> -   and valid in the headers of patches for recipes in layers other than
> -   OE-Core.
> +-  ``patch-status:`` Checks that the Upstream-Status is specified and valid in
> +   the headers of patches for recipes.

Not your fault here, but an opportunity to write:

Checks that the ``Upstream-Status`` value is specified...
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
https://rootcommit.com


