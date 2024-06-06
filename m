Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBB6C27C54
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 15:45:13 +0000 (UTC)
Received: from sender-op-o19.zoho.eu (sender-op-o19.zoho.eu [136.143.169.19])
 by mx.groups.io with SMTP id smtpd.web11.18041.1717688704901637118
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 08:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=ao0mZhDw;
 spf=pass (domain: opdenacker.org, ip: 136.143.169.19, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1717688700; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Ma8O9r7yCKY/86ZCOsBe+awq9Ryrm29zgLdz0/hu1sc0rTkh5pd6SXebohZ9hCuqVYLsAMlnC6A4igXeHCGxhwTkKeefgrwfZ1qfGkw9GK4TYpiImZdSqMR6OUWaDuMxTuZ4vywcOHSNSVrKAyCi3QxoxR4YkyRWZf8QhkvHx+s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1717688700; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TtzBULMb/1hzjxqXWXKBQrKyj1FNxUZugLMviS2ln+k=; 
	b=Yn/V41vq0hCgbJoZPxHmuWO2YJFw6Izem5+yOhluBybsNmc8NPh5xOHe4uMeaMv6NTOcgU5MKV8nfcZ4pK6eG8vXLZupRRtrLH13fj5T0sBWXjKNECAmmAnFWeyuV3QPtKWzvkG2X4CP/fbiXbDJ+yxnwFHxHyMcvqxcwsHtiec=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1717688700;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=TtzBULMb/1hzjxqXWXKBQrKyj1FNxUZugLMviS2ln+k=;
	b=ao0mZhDwqVOEotSfHviqScfus+7V6g7n63OtKlyaWtLurhu2TyrMtseDiOc/tJu9
	nQ3upiA2ftHueSS697WPTiEQzE1Wkmvsx2ipbv8LrSM77a7/s1uylB5METHb6V1VaG8
	4UezrmQl6JslP1gpNaHMZye3rpGcgIjF0NhURbrw=
Received: by mx.zoho.eu with SMTPS id 1717688695618554.0620025564217;
	Thu, 6 Jun 2024 17:44:55 +0200 (CEST)
Message-ID: <6484f5a1-50fb-42f1-871c-f2d6dfd4a38b@opdenacker.org>
Date: Thu, 6 Jun 2024 17:44:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: aoife.power@iris-sensing.com, quentin.schulz@cherry.de,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] dev-manual: Add info on build env
 initialization
To: jasper@fancydomain.eu
References: <20240606150410.69388-1-jasper@fancydomain.eu>
Content-Language: en-US
From: Michael Opdenacker <michael@opdenacker.org>
In-Reply-To: <20240606150410.69388-1-jasper@fancydomain.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Jun 2024 15:45:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5280

Hi Jasper

On 6/6/24 17:04, Jasper Orschulko via lists.yoctoproject.org wrote:
> From: Jasper Orschulko <jasper@fancydomain.eu>
>
> Going through the docs we a new trainee, we noticed that the build
> initialization is only mentioned in the quick build
> (https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html) but not
> in the in-depth getting started documentation.
>
> While this is repeatedly mentioned later on, e.g. in the "building" section,
> you might easily end up somewhere where this has not been mentioned yet.
>
> E.g. in our case this was:
>
> https://docs.yoctoproject.org/dev-manual/layers.html# (which comes right
> after the "setup" chapter)
> ->
> https://docs.yoctoproject.org/dev-manual/layers.html#creating-a-general-layer-using-the-bitbake-layers-script
> (which is linked right at the top)
>
> To avoid any confusion I think it best to mention this required step
> directly in the "start" document.
>
> Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
> ---
>   documentation/dev-manual/start.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
> index 386e5f5d2..66e70cf21 100644
> --- a/documentation/dev-manual/start.rst
> +++ b/documentation/dev-manual/start.rst
> @@ -853,3 +853,14 @@ similar to checking out by branch name except you use tag names.
>      ``checkout`` command are a snapshot of the "&DISTRO_NAME_NO_CAP;"
>      development branch at the point where Yocto Project &DISTRO; was
>      released.
> +
> +Initializing the Build Environment
> +==================================
> +
> +Before you can use Yocto you need to setup the build environment.
> +From within the `poky` directory, source the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment

One last nitpick...
If poky is a directory name, you should use ``poky``. If you refer to 
the project name, it should be `Poky`.

I think the first solution is what you want here.
Cheers
Michael.


