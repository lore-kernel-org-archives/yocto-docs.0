Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1956C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 14:42:11 +0000 (UTC)
Received: from sender-op-o11.zoho.eu (sender-op-o11.zoho.eu [136.143.169.11])
 by mx.groups.io with SMTP id smtpd.web10.43669.1717771328367942640
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Jun 2024 07:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=MsO+LdJY;
 spf=pass (domain: opdenacker.org, ip: 136.143.169.11, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1717771323; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=fwyhESOuzwYH8J2lWeN8iOoOCjOKR6CAtkJZB9MLNuGQ0o5CNpMMC1Sq1C8HkbTCR8lIpxt/isftkicDAqm9FzlEvirS3Ke/0wSVjBIDP5os6h6jZ07jc+tmg13hlnsJA2HFwifv/3GXkFjvt7r+19DHSOqrvY8yU6WhBkAwBmg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1717771323; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yItzAqiMlOn2yhMcrTbJ6pUjlJ06NG/h3ITZN6Os9n4=; 
	b=F4EifXoJSOPIJru0+rbdU72b3wnvULV62N24v+dp7r1l/ZM4GR77LfLnGR7EPqpA+xgcrKLXMewp6+5TXCll/EVn/YwGvnXa0iM/44Av8gz8fq46+Ka3rUsDQnyO7+1yqSnqUvGxB+iObaV0QurmHS77ndXpJjS6tiYs4RskBkk=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1717771323;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yItzAqiMlOn2yhMcrTbJ6pUjlJ06NG/h3ITZN6Os9n4=;
	b=MsO+LdJYa9ktUs6Y4QlPh4re5viprSXl83spE8dWtmTkS4MZoh6JGoyH9mm4rNIq
	Up8JRzPJl9vz+ds6ZHyjklgfA7twyeyRO43kr5IaCnuAGeghRj2KawVZ2Gf0uxyQ+F0
	z0V9mzlHKif/QztIDnuuqm8aS60W73UWO5sqxbfQ=
Received: by mx.zoho.eu with SMTPS id 1717771322039773.2966458085967;
	Fri, 7 Jun 2024 16:42:02 +0200 (CEST)
Message-ID: <da0a1574-a4d3-4dda-9c1b-e1a7957a46ff@opdenacker.org>
Date: Fri, 7 Jun 2024 16:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: aoife.power@iris-sensing.com, quentin.schulz@cherry.de,
 alex.kanavin@gmail.com, docs@lists.yoctoproject.org
Subject: Re: [PATCH v3] dev-manual: Add info on build env initialization
To: jasper@fancydomain.eu
References: <20240606223427.3884-1-jasper@fancydomain.eu>
Content-Language: en-US
From: Michael Opdenacker <michael@opdenacker.org>
In-Reply-To: <20240606223427.3884-1-jasper@fancydomain.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Jun 2024 14:42:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5284

Hi Jasper

On 6/7/24 00:34, jasper@fancydomain.eu wrote:
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
> index 386e5f5d2..05827610b 100644
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
> +From within the ``poky`` directory, source the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment
> +setup script to define Yocto Project's build environment on your build host::
> +
> +    $ source oe-init-build-env
> +
> +Note, that this step will have to be repeated every time you open a new shell.

Thank you for the update! It looks good to me.
Reviewed-by: Michael Opdenacker <michael@opdenacker.org>
Cheers
Michael.


