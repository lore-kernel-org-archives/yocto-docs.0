Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FC9CEE329
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:58:42 +0000 (UTC)
Received: from cheetah.ash.relay.mailchannels.net (cheetah.ash.relay.mailchannels.net [23.83.222.34])
 by mx.groups.io with SMTP id smtpd.web11.20553.1728489520669053384
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=d1+GQBV7;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.34, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DE2F7845248
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 15:58:39 +0000 (UTC)
Received: from fr-int-smtpout3.hostinger.io (trex-2.trex.outbound.svc.cluster.local [100.101.175.87])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3475B845556
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 15:58:39 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1728489519; a=rsa-sha256;
	cv=none;
	b=QwSjM8/YQAqO4td4NgHe8SxlCrJKIKlefZRyBH3zwVGi1xTlq4VHLb6v3NcdAlfZ7YAUC/
	5sVLmQ8Hk4p8ySV2pYtZYRp8GzpPL6JIJpI3iXRvAWJTw8DvDtR/vAgVwE1IKNT8XAw9/o
	Fq0amAS7ebhPtsikvzXJhDU5/FcIPhPMVXXfq97zUeaDXvuCExAJligoaRBv5vEysXM7nI
	MUiQQ2MR+DvsNAvU+6HsclVX6Er7nrCfvpbRfouZbwt1li342RQ4HYynJ1cU/Q5y3ZEHUC
	wYNvY1pRvo39sNQ26bVAvI1Ul9VHAnAY5c4qZhRKZNUC58PihBTrxc/mYZW92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1728489519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=ksfN5BJ0U8Y2yUID9f3YS6DPsJG05Eyyn6IyisQgMYM=;
	b=MfnwPPf5sf1/9aTdzEqBygWl6p2Qy5X3sVMWQ4FIhfP1cjtTrVR+KOFM5mSUuI1sLj8IHn
	quFn6AZyYvx6Kqmq25zR27yDgSBCHX3e3wLrAUcV2H2SrGHXbtipFKXdKW01LCAsr0xnEn
	EAPEBV7rg+b5Gp9QNXmUeJMNvpx7ofz9pSxjaf/QPeVnjkZHCJpoqgMYFCoMcFwYM2uLP6
	+JP5ICQsI/RUkCsda8ESyRXUi3e0UrKvqzdwPN2fIhzAVQRoWkC+ko+ATXGUAldYAtOQ6a
	p+J9Q4P2wCrFZWeW0a5hBjvCi4TRy7lfL74SIx3iS/KBvG20EUluZ84GT3YaMw==
ARC-Authentication-Results: i=1;
	rspamd-54f99b5bc4-kmmxb;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Occur-Tasty: 5961aea26e4f559d_1728489519800_3645704349
X-MC-Loop-Signature: 1728489519800:3030985002
X-MC-Ingress-Time: 1728489519800
Received: from fr-int-smtpout3.hostinger.io (fr-int-smtpout3.hostinger.io
 [89.116.146.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.175.87 (trex/7.0.2);
	Wed, 09 Oct 2024 15:58:39 +0000
Message-ID: <0a862d53-0f40-4cb3-99b6-54ebb0a362b6@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1728489517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ksfN5BJ0U8Y2yUID9f3YS6DPsJG05Eyyn6IyisQgMYM=;
	b=d1+GQBV7x5KSK9JEuFZdZXMCGRIiWFToDT6tVnWA4UIoT2IsepKRI94gnAf9bQUiI7EmzK
	/eU0ANrlJ3weJW6zf5MMug8ly6v6sqmkzTr4j9f9f/Vx9FlQMR6NNtEIEeIV43fmq4uxSh
	u01Pz7KdGutcyVQOzftSB3WUpm9DT7l5BwQakN5jynEQML6eLTQOEW8O9K3fzi3leLIGcH
	Wn2R5iwMBIRO3iLMmPQpRVuRDQRchgrm97wrPz8A0lUq1YydgXzHNXFpMLKPj6ldJOeI13
	s5e2tzGdjPObbByDCpZEfGmXHWB76WQ7M1SuTbyg5OARVLvXNSRP8BHNT8X2wg==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, ross.burton@arm.com,
 paul.eggleton@microsoft.com, thomas.petazonni@bootlin.com
Subject: Re: [docs] [PATCH 11/16] ref-manual: add missing OPKGBUILDCMD
 variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
 <20241009074120.866786-12-antonin.godard@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20241009074120.866786-12-antonin.godard@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 09 Oct 2024 15:58:36 +0000 (UTC)
X-CM-Envelope: MS4xfInYrOqlCZsgwgdsH62fBo3K9IzvNcwk407TLx7PiFPoXMQJ2NHL+Gb5u3ahr+9heNhp+up+3T/pWkAYzXHLD89n8V0B17qf8PxJ5BRyXSOjF4MNH2fg h/ifFc5YmIPP7BQnaxNay2UXHmVjb+nSHyS1l1YviNRkjfnIwiqufIzRXfJP7p6axvYgaUKIEnnzSPQUiTsKRp5YJiGiXItamXPJBX6WTPscld8dSfBguB03 JDNSnGP7v03SvXoCi3xJmjjZkXkdSDlR4j6eLqGECau1cjqkItzo0KS/FrWMvvkBerLbCVboi6Dpu/xXW6TNTotHyzdsItBfJ3XBciCKo14oMJFPILMXDJMd JQqhbkcexEov2h2b0T3D1Eq9d1oz3l+p5Atu1jFYb0kPolymH8MHqy9rOk4/FrGnRqzYSoxzd2p5Ph30OGiKERohrPOHA8FaRkh1c1xFkoeqjzqjFIbVZdHb inycfQm/U3CL0TSOiCAbfFh6n13oY5YD0hDDdyyuS+1ASX5af5GR8gLgOqs=
X-CM-Analysis: v=2.4 cv=Z6G+H2RA c=1 sm=1 tr=0 ts=6706a82d a=FxzzrTkVuG1G0rBnFVKeJA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=d70CFdQeAAAA:8 a=wmADJgZp0pqJyO-pTKcA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:58:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5448


On 10/9/24 09:41, Antonin Godard via lists.yoctoproject.org wrote:
> From: Antonin Godard <antonin.godard@bootlin.com>
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 8907572e6..72781d93b 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5761,6 +5761,13 @@ system and gives an overview of their function and contents.
>      :term:`OPKG_MAKE_INDEX_EXTRA_PARAMS`
>         Specifies extra parameters for the ``opkg-make-index`` command.
>   
> +   :term:`OPKGBUILDCMD`
> +      The variable :term:`OPKGBUILDCMD` specifies the command used to build opkg

s/package/packages/

-- 
Michael Opdenacker
Root Commit
https://rootcommit.com


