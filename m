Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3A1C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 09:56:35 +0000 (UTC)
Received: from sender-op-o19.zoho.eu (sender-op-o19.zoho.eu [136.143.169.19])
 by mx.groups.io with SMTP id smtpd.web10.5589.1718099786063851553
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jun 2024 02:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=odMMzRke;
 spf=pass (domain: opdenacker.org, ip: 136.143.169.19, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1718099780; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=incMWbZci8+5WxrlUZEcVizLjH6XrElLb/yW5dCq/21iL0fFTa3xVUU3L0HbHhNAKoY7zkfF2dNHsmwNBRJYZFyGq/tIZlvO4EUeiLrjaLUzUYynJSZRt8DVIHDR7Pn6mRXW9qbMT8fpkGhYRoehYc3j+Sn5zD1HErKm7l3W538=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1718099780; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=noqyL1cm0mHUdO8wdesPwU4Q58dpueqvHCqW5vehlRo=; 
	b=gSCH9nXP4UlCxtOpsU/cQMkh/fLaz/P319YkC76LnN7/Fi84ePuWrsBvCNZ0avJx24qOovxj3UNSkkaR29eQ7DQ1fp/VK+6PLqKdlHE1kAFzqNxgSR5NHxFhU1ZAD73GvaV9i3aANNzjux9mccoA4jWbByJVhw+6d6LchxZsYuw=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718099780;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=noqyL1cm0mHUdO8wdesPwU4Q58dpueqvHCqW5vehlRo=;
	b=odMMzRkeknToXwyfK35Vqc2m6XhNdeOtD5aQAZ8cPGRt38w5uKHbm3rzO93LVW7h
	eyv5c34Qb+TViBLZ1+fYdV/QyTOxO6r4x3eXXq4PmTZHeCfuSIqfduMRcDh9k9+L3C6
	2Bx7FevssyLVG2kl7hSBr+oH9htw5R3Weih4wCKM=
Received: by mx.zoho.eu with SMTPS id 1718099775802200.60895855963338;
	Tue, 11 Jun 2024 11:56:15 +0200 (CEST)
Message-ID: <229777f7-7a55-4bbf-82b9-26870ce96692@opdenacker.org>
Date: Tue, 11 Jun 2024 11:56:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Aleksandar Nikolic <an010@live.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: introduce CVE_CHECK_REPORT_PATCHED
 variable
To: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
References: <20240607211559.455144-1-aleksandar.nikolic010@gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael@opdenacker.org>
In-Reply-To: <20240607211559.455144-1-aleksandar.nikolic010@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jun 2024 09:56:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5292

Hi Aleksandar

Many thanks for the patch!

On 6/7/24 23:15, Aleksandar Nikolic wrote:
> From: Aleksandar Nikolic <an010@live.com>
>
> Signed-off-by: Aleksandar Nikolic <an010@live.com>
> ---
>   documentation/ref-manual/variables.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 07b5b6f95..88c3602e6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1681,6 +1681,12 @@ system and gives an overview of their function and contents.
>      :term:`CVE_CHECK_IGNORE`
>         This variable is deprecated and should be replaced by :term:`CVE_STATUS`.
>   
> +   :term:`CVE_CHECK_REPORT_PATCHED`
> +      Specifies whether or not the :ref:`ref-classes-cve-check`
> +      class should report patched or ignored CVEs. The default is "1", but you
> +      may wish to set it to "0" if you do not need patched or ignored CVEs in
> +      the logs.
> +
>      :term:`CVE_CHECK_SHOW_WARNINGS`
>         Specifies whether or not the :ref:`ref-classes-cve-check`
>         class should generate warning messages on the console when unpatched

Reviewed-by: Michael Opdenacker <michael@opdenacker.org>
Cheers
Michael.


