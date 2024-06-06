Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D43C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 14:01:43 +0000 (UTC)
Received: from sender-op-o11.zoho.eu (sender-op-o11.zoho.eu [136.143.169.11])
 by mx.groups.io with SMTP id smtpd.web10.15221.1717682501729464973
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 07:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=ars1pAcN;
 spf=pass (domain: opdenacker.org, ip: 136.143.169.11, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1717682498; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=OeQhPsw5gkGoSXpniOb7IdUrlGEhmWGtct4zEmY/yz9hRWKatYjsu+odC+iSswkCrocZwKP6PK0JTABEQhWFZpAEUJNJ/AP2E3mkLuZExRK+Q/U+Sk3ziO/biTQok2Hx8HZO5ufngVUk/ikBkKO23vZLn3mUOvJdUhkcaAAzSZ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1717682498; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=37QZzCT+qO3fPPpk0eclXC62fcOWfkvEgNHqtayFaQA=; 
	b=LNW1hdozgXU5BjpCrBgweP83epqSrpw/3htclVnrrVmINYGOfReKWLS5FzwJFvyta1/txOuUKlIwj67U/3VU6YniUugRcoyWaxCQ464hTAv00oiQ75fM1ShGhUTHBTcqOL7zOr+U2wL8G7uB+OnIMrSjr01pvsM65PVHIzVEmWc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1717682498;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=37QZzCT+qO3fPPpk0eclXC62fcOWfkvEgNHqtayFaQA=;
	b=ars1pAcNn1jSRyygHHpcZ9YO2bp+qysRHP69aGRSX9WEwXlxraUOSGogtmkplugB
	aVOEl0fxNKec2AmMgd2f/jHmg+eRDkYYYBACD+4uelOKGrDWohaW0CoHuNuOyHAOYS1
	rWi3T5tJcuDjcFC8WANAj541MMEyQN7isXWwPPDQ=
Received: by mx.zoho.eu with SMTPS id 1717682495441802.9978094334298;
	Thu, 6 Jun 2024 16:01:35 +0200 (CEST)
Message-ID: <18f5ecc4-a96a-4c90-a2be-6dbb9092db97@opdenacker.org>
Date: Thu, 6 Jun 2024 16:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Yoann Congal <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] recipe style guide: add recommendation for
 patches without signature
To: alexandre.truong@smile.fr
References: <20240606075415.6666-1-alexandre.truong@smile.fr>
Content-Language: en-US
From: Michael Opdenacker <michael@opdenacker.org>
In-Reply-To: <20240606075415.6666-1-alexandre.truong@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Jun 2024 14:01:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5276

Hi Alexandre

Many thanks for the update!

On 6/6/24 09:54, Alexandre Truong via lists.yoctoproject.org wrote:
>  From discussion [0], the presence of git version signature at the end of
> patches has been questionned. To avoid a bit more noise, the setting git
> format.signature is added to the documentation and its use is
> recommended.
>
> [0]: https://lists.openembedded.org/g/openembedded-core/topic/106323318#msg199967
>
> Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>   .../contributor-guide/recipe-style-guide.rst         | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> index 08d8fb425..142c02db1 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -409,3 +409,15 @@ This should be the header of patch that fixes :cve:`2015-8370` in GRUB2::
>      Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432e109771bb8febafca7a5f1f2]
>      CVE: CVE-2015-8370
>      Signed-off-by: Joe Developer <joe.developer@example.com>
> +
> +Patch format
> +============
> +
> +By default, patches created with ``git format-patch`` have a `Git` version signature at the end.
> +To avoid having a `Git` signature at the end of generated or updated patches,
> +you can use `Git` configuration settings::
> +
> +   git config --global format.signature ""
> +
> +.. note::
> +   Patches generated or updated by ``devtool`` are created with no signature.


Reviewed-by: Michael Opdenacker <michael@opdenacker.org>
Cheers
Michael.


