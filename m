Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A566CEE327
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:50:52 +0000 (UTC)
Received: from aye.elm.relay.mailchannels.net (aye.elm.relay.mailchannels.net [23.83.212.6])
 by mx.groups.io with SMTP id smtpd.web11.20345.1728489045432907925
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=KeU/7vM8;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.6, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id AFD11A44A9
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 15:50:44 +0000 (UTC)
Received: from uk-fast-smtpout3.hostinger.io (100-101-172-178.trex-nlb.outbound.svc.cluster.local [100.101.172.178])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E1848A4831
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 15:50:43 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1728489044; a=rsa-sha256;
	cv=none;
	b=Ua1SyDm+JXfK4bP7xssiZdxdfXCkioX8gHASvxDdKWYN+qR7zPMR9/eu12UvJzD8OwEp07
	fuuanl/8Egp0PJFy5gR7wkO3CmLin+nLYcdcOctkPh7YdQGBStORhkHhjoNx84kR3BaIvS
	K3LiLtVcMVpc+QqrYlcVcSY6LgQrl01Kw4hZNRT1Gcq2EH+urQus3dXDCQoxWODgYiF9VL
	fBh6utFg1dBp+WucDsOAPAQb5sEomC2vNrHtzJG/9kGZw+aflT7qEagtV3jhXXJvxpZHWO
	zP1sFXMU0hmPEubAL2wajSypjJ8THmt0lNI74krDMOvt+41irlSsMKKWkiT0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1728489044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=mxX4o2nHe14e80YxpDOOBdwVnkVnUkNlOJ4TzXl9VPY=;
	b=09vcigXwYQc0koQvzqRphg1NWrkuHf9QTTNiEd4kP/Ux8VNddEIcTG747LKhIDnn+f1B02
	c7/IDDi52Y2KoG86jvIE40Y85EVzHtnEZLvrHMq2e0yMARpuEj9TDGVGtTVa6tkPWlpF8w
	nqktEkrVltaxAdy6Gir7GnGhFfkDxd161d5x5BQzKzT21zulDT2Te2IiXf8lCwWrufGOgG
	7sLXJTevgKvowwet/UREOD3cnOSvsc9OsaWs6WDc4/gvJLhfybsIlX8eIPNDRflmUuOsrA
	hKMN3Mg1V1+hIMh/u9X4UsEjM+4P/eVFoblY/CnRPRB8AIvNAhpnoDqUK52VvA==
ARC-Authentication-Results: i=1;
	rspamd-54f99b5bc4-5nqmh;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Tank-Abiding: 2e8421be73d25573_1728489044400_3914096810
X-MC-Loop-Signature: 1728489044400:3727892433
X-MC-Ingress-Time: 1728489044399
Received: from uk-fast-smtpout3.hostinger.io (uk-fast-smtpout3.hostinger.io
 [31.220.23.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.172.178 (trex/7.0.2);
	Wed, 09 Oct 2024 15:50:44 +0000
Message-ID: <8290e1cb-73c3-447a-aaa2-dabf4a3ecae3@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1728489042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mxX4o2nHe14e80YxpDOOBdwVnkVnUkNlOJ4TzXl9VPY=;
	b=KeU/7vM83xxS8v1qgGy+iy2MKQ4glwiGa9DHzTE1Tu8uRAzVnC2LCj4hwtj+ncFf0jw7E6
	Cc6/wtt57lh7UC2S83j2VmhQSkSzlJLy1bEdTNTsOlRG+IX5LLWsPwDgRMyNJJLdSm3+Dd
	BwcNl8w7S9gewnPwURZ55MQqrVvslcK5W28Tz9mJANfFNV6IcCVkootP6NXHt5N2A5upsw
	gGZNfJJQpxissrc0KDWN1oIKmj0DRLMENSVof9xaYJNmvvryWi39da+/I1oVcoku/Rxrfy
	FcUxQpR4megkn9l7c7bOgnDAgg2ZmDDIAzq9slURaZL+cBPV3ntVxxa2vFuiOQ==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, ross.burton@arm.com,
 paul.eggleton@microsoft.com
Subject: Re: [docs] [PATCH 01/16] ref-manual: add missing CVE_CHECK manifest
 variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
 <20241009074120.866786-2-antonin.godard@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20241009074120.866786-2-antonin.godard@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 09 Oct 2024 15:50:41 +0000 (UTC)
X-CM-Envelope: MS4xfIxwvDs9fofgjD9Ts93p0FEAHsaCo7NJ2g7cLf1AtkTNqYp4fAGzhH8eCB0RA6cNhSm1HpwlOFOpp7Qb8EEAk2ovMSCkGi1cgRfVnDsRfcRrX2yGyMjm cgEe8t0Bj8JY/5nrQlY7xN0qEH1x78cAkqy8R9TN7iS/i/Of2lMnwn3vgNNOgjYLlJ7fSL/vacgmxL9ZABJ3jrRFuJ8g+VyDYC9RI2M8prXq2Ff0d2Os7FHo p8anTdIPc4YsxEI7zn1PVnVZfamvmKLQdpGMnWO1PGRsKmi8qGOwh+kM/KKjB53xGdibtkwqqiQCE0OLWH5mSwv7I9GkZPXxu75vcYX7NXebiaiIR4RQyFnY DkxvLv1MMKp4d72aT9fl3lMMG1aqtw835pY3cFNDX+DPztlz2mAeUHlLaJEadT4inu1GrSKNFdsvJxNCPfSV3xAz5GgIkBDiIDaGxJwaWYuPpWf3IjYwUGum ZLLpkkaLatwe+6jC
X-CM-Analysis: v=2.4 cv=TcnEtgQh c=1 sm=1 tr=0 ts=6706a652 a=FxzzrTkVuG1G0rBnFVKeJA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=d70CFdQeAAAA:8 a=WWh1xRv5PYP6kJWvDfQA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:50:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5446

Hi Antonin

On 10/9/24 09:40, Antonin Godard via lists.yoctoproject.org wrote:
> From: Antonin Godard <antonin.godard@bootlin.com>
>
> Variables that can be used for toggling creation of manifest and
> specifying the path to the output in the deploy directory.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 32c9e7407..0236c8c9c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1678,9 +1678,21 @@ system and gives an overview of their function and contents.
>            variable only in certain contexts (e.g. when building for kernel
>            and kernel module recipes).
>   
> +   :term:`CVE_CHECK_CREATE_MANIFEST`
> +      Specifies whether to create a CVE manifest to place in the deploy
> +      directory. The default is "1".
> +
>      :term:`CVE_CHECK_IGNORE`
>         This variable is deprecated and should be replaced by :term:`CVE_STATUS`.
>   
> +   :term:`CVE_CHECK_MANIFEST_JSON`
> +      Specifies the path to the CVE manifest in json format. See
> +      :term:`CVE_CHECK_CREATE_MANIFEST`.
> +
> +   :term:`CVE_CHECK_MANIFEST_JSON_SUFFIX`
> +      Allows to modify the json manifest suffix. See
> +      :term:`CVE_CHECK_MANIFEST_JSON`.
> +


I would use "JSON" instead of "json" in the above changes. IMHO that's a 
more explicit way to describe a format, and except for a few cases, 
"JSON" is more frequently used in the current docs.
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
https://rootcommit.com


