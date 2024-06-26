Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655BCC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 13:43:11 +0000 (UTC)
Received: from sender21-op-o13.zoho.eu (sender21-op-o13.zoho.eu [185.172.199.227])
 by mx.groups.io with SMTP id smtpd.web10.26901.1719409389242509841
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Jun 2024 06:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=TmXr6ltc;
 spf=pass (domain: opdenacker.org, ip: 185.172.199.227, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1719409382; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=SQCLVxac65JEZyWJz1D7j9X3GZ7iBkSkraiLNeWi2GZGBoOvqNTiO4XkEJ2EFz+6UWoPtCeDSSVPJQi7j3dU5tg/Ig8ImtKe+uBoz+kzY/hqr4ZTbwBA/+AeN4SSuHK9D1GS0eAu8ncf4tk2ZSXRMSJH+zG0G0DAd1fnQ5HoDx8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1719409382; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PL35q/lDwGSkpXsjvrqYRcD3Qq4p55vBqL0yJKJALgc=; 
	b=VIAkXle7S3v+5a9IGx0A0gyVvw19MxHtpD4HJzuUdd/g6a+PdMD1P7o/f41gNsiCbhi0uRyKVUNQkKjPoLZ9/gzY0cyoa2rAc8MnSL5o1OsJzpqnWNxeY2oA+25Z9wKQqT5apaJaEGPLuobdsYL5jJjUrf49RuEaRUh/iU+FfjM=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719409382;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PL35q/lDwGSkpXsjvrqYRcD3Qq4p55vBqL0yJKJALgc=;
	b=TmXr6ltcc+jrMLp/hySqPYMynEwZtKV69H9chWhdTK0urpUFDP8h7Zwg81exa2er
	aoiYCtSI+D1EY1rL+YoXVloehLEVt1GpmGkwUAh8wvwi+JoEpr//2oN6TknQuAZh0be
	YMEgws3JP77hL0LvKoZpiSbODLGl43MmpGjud5Ps=
Received: by mx.zoho.eu with SMTPS id 1719409380728893.9220507126563;
	Wed, 26 Jun 2024 15:43:00 +0200 (CEST)
Message-ID: <e925e369-8a15-488c-8908-bbe0a573d661@opdenacker.org>
Date: Wed, 26 Jun 2024 15:42:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH v2] ref-manual: add DEFAULT_TIMEZONE variable
To: joerg.sommer@navimatix.de
References: <a782759d-652e-4d48-be6d-e3c25fb06b47@opdenacker.org>
 <9df638ebdf30b32b0817a357547adc01fe8a455b.1719346288.git.joerg.sommer@navimatix.de>
Content-Language: en-US
From: Michael Opdenacker <michael@opdenacker.org>
In-Reply-To: <9df638ebdf30b32b0817a357547adc01fe8a455b.1719346288.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Jun 2024 13:43:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5307

Hi Jörg

On 6/25/24 22:11, joerg.sommer@navimatix.de wrote:
> From: Jörg Sommer <joerg.sommer@navimatix.de>
>
> Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
> ---
>   documentation/ref-manual/variables.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 16b449d6b7..848cea787f 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1877,6 +1877,13 @@ system and gives an overview of their function and contents.
>            by :term:`BBFILE_PRIORITY` if that variable is different between two
>            layers that contain different versions of the same recipe.
>   
> +   :term:`DEFAULT_TIMEZONE`
> +      Specifies the time zone set in the image.
> +
> +      This variable causes the ``tzdata`` package to configure
> +      ``${sysconfdir}/localtime`` accordingly. Valid values are all files
> +      found in ``/usr/share/zoneinfo`` like ``CET`` or ``Asia/Baku``.
> +


Many thanks for the fix!
Reviewed-by: Michael Opdenacker <michael@opdenacker.org>
Cheers
Michael.


