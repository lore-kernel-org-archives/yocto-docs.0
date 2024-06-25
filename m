Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06C5C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 15:51:49 +0000 (UTC)
Received: from sender-op-o11.zoho.eu (sender-op-o11.zoho.eu [136.143.169.11])
 by mx.groups.io with SMTP id smtpd.web10.177369.1719330708951712158
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Jun 2024 08:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=mAOrfW38;
 spf=pass (domain: opdenacker.org, ip: 136.143.169.11, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1719330703; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Yaro+Sbbaz+irBol2d+YqfcRhLZ2ZiBqMtjlyPI6JPOzcQfyH62tCwaJIgp9vugyX1AimxV1SDf8L56RZ5Ud44OGVttkL2goPUrdCxoULPrIHBTA/zKYI20fH3tStPYMAoIKTflXCotMRXexwe6TASzTfeKStusKQdxixE0q+lo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1719330703; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XdBjL7DxHbw/fGsz1aDBetwNtC8N85WxckJeo9MiN28=; 
	b=EFxsUIFQGQ3A/wo2g7u0sZH3upF5ZAWPraIYh6+6QWHLbHu3hp91tHGHzBL8ab8qUC8MzRCej3KIE4wqY6UAcGfVqSG/7mRdjcqoYg8/RqW3Z2sMsKErIK1Htzc3EFVQdN9XdG7X4Nv2Z29zAEWZmH40flgDkW5b3XoJGxYWIKk=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719330703;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XdBjL7DxHbw/fGsz1aDBetwNtC8N85WxckJeo9MiN28=;
	b=mAOrfW38i0lXeGO2VFgSYcxmf3C1uYB95120RB3dzdFvCK2gnIu197iG4e8sHRqC
	H49Qcy3jc50IOUJQ1s6g8M6mq/ProzfujrdplAH9ldEFeyvv6nA3Ufxs9LYiPW1INtT
	YWK1YzKVYV6ZQv1VL7ocGz7Amia004TbtkE4P+3g=
Received: by mx.zoho.eu with SMTPS id 1719330702777217.8965840897656;
	Tue, 25 Jun 2024 17:51:42 +0200 (CEST)
Message-ID: <a782759d-652e-4d48-be6d-e3c25fb06b47@opdenacker.org>
Date: Tue, 25 Jun 2024 17:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: add DEFAULT_TIMEZONE variable
To: joerg.sommer@navimatix.de
References: <b62a042438fb0cdec9cec6dd18ba226e84d35b57.1718996126.git.joerg.sommer@navimatix.de>
Content-Language: en-US
From: Michael Opdenacker <michael@opdenacker.org>
In-Reply-To: <b62a042438fb0cdec9cec6dd18ba226e84d35b57.1718996126.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Jun 2024 15:51:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5305

Hi Jörg,

Many thanks for the update!
I see just a minor issue to fix...

On 6/21/24 20:55, Jörg Sommer via lists.yoctoproject.org wrote:
> From: Jörg Sommer <joerg.sommer@navimatix.de>
>
> Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
> ---
>   documentation/ref-manual/variables.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 16b449d6b7..34d0d239bd 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1877,6 +1877,13 @@ system and gives an overview of their function and contents.
>            by :term:`BBFILE_PRIORITY` if that variable is different between two
>            layers that contain different versions of the same recipe.
>   
> +   :term:`DEFAULT_TIMEZONE`
> +      Specifies the time zone set in the image.
> +
> +      This variable causes the ``tzdata`` package configures


s/configures/to configure/ ?
Cheers
Michael.


