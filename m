Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D975AC27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 14:53:31 +0000 (UTC)
Received: from sender-op-o11.zoho.eu (sender-op-o11.zoho.eu [136.143.169.11])
 by mx.groups.io with SMTP id smtpd.web11.44398.1717772004600260281
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Jun 2024 07:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=PvjQ3DmQ;
 spf=pass (domain: opdenacker.org, ip: 136.143.169.11, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1717772001; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Z0nmdOv3DGByvQL7Udhb8YtXi2WVnMdKZu9hLEAhSFVzxoGbk/cCTr8uxOMTgs37t2+dKh0J+0thZz0LV540yAhGTAsni2U0F0vAMm9kzEo2ZT/F++e2n+Wrpg5TPN757UJE8MsKrJ9LBh+RrYcmhEvZaYU4lzg7DiYdnXTgVEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1717772001; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1rrzmWBRTlutZdet8UihDRNAOfuyyyQknr6yj6Fp/+E=; 
	b=ERSISaYvo9rqBpsJIbtb2+9SNx+dnbg0EBUHq89qJPBL15bieaypc1ZZlLiNnbVSFVaU8l+NoTlALUCWkwWcxREhtfTk7RwHX4ud9uXZgD7jwXCmPw/O1u0oBMH3bqWqUooCqew7epq6PCHvsPtv1hdJqZRPtwle4SgdwkmQx9U=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1717772001;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1rrzmWBRTlutZdet8UihDRNAOfuyyyQknr6yj6Fp/+E=;
	b=PvjQ3DmQJIzCBR0O4yCJguTmY0h46skdGNk6Ac3DDA0MYsYWXtmBpXGKZyVv9EEb
	2lhedbCFHQAM5dW5nJRziSE2ukTTvUnPPa5VEnlrqZXT3uqXQUaHVpZe/idFFluN84A
	EkrH6R21MXYQBVtjvBW28tvZsKcmYnmqhUYHWxNE=
Received: by mx.zoho.eu with SMTPS id 1717772000152993.6210522814514;
	Fri, 7 Jun 2024 16:53:20 +0200 (CEST)
Message-ID: <46ff554c-8c73-4d17-8451-0049459c722f@opdenacker.org>
Date: Fri, 7 Jun 2024 16:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: jasper@fancydomain.eu, aoife.power@iris-sensing.com,
 quentin.schulz@cherry.de, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] dev-manual: Add info on build env
 initialization
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20240606150410.69388-1-jasper@fancydomain.eu>
 <6484f5a1-50fb-42f1-871c-f2d6dfd4a38b@opdenacker.org>
 <CANNYZj8H-+OLyQ8_5ocDd9JHpGL5zSF94v9m4Sh5ENa7uR5VCQ@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael@opdenacker.org>
In-Reply-To: <CANNYZj8H-+OLyQ8_5ocDd9JHpGL5zSF94v9m4Sh5ENa7uR5VCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Jun 2024 14:53:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5285

Hi Alex,

On 6/6/24 18:07, Alexander Kanavin wrote:
> I think we should actually rewrite every mention of oe-init-build-env
> to suggest oe-setup-build instead and effectively deprecate using
> oe-init-build-env directly. I'm okay with this patch though, as such a
> rewrite is a bigger effort.

I agree. Let's keep this patch, which would be useful too as a backport 
for Scarthgap and Kirkstone, as I'm not sure Kirkstone will have 
oe-setup-build.
Thanks in advance for your patch :)
Cheers
Michael.


