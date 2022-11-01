Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF0EC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 15:42:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.7997.1667317340493528702
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 08:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U980y8VD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D717A1BF20A;
	Tue,  1 Nov 2022 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667317338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+StNNHMa4YQ7gdeLSQVfSjx/ATywjwG+RtOJpnh8b8=;
	b=U980y8VDX1lBjnnLb8zPRPQffcWx+hCylDvK1n8xmA5CyRl4iYTYhXBXixbZ8DujOCic65
	H3JJNFWvf/oya+Oe0u0TVFmfFMLXTML2Wbgo0fn+abS9YEp/GFN2O/daxKlPnY0Dj9SznF
	xcy7vP4LttSLP0fHH2Oeww4awROb+cL8Pk6E6fdR4h+5WWGFsbaB8UTAWwCcMa1H/eZwmM
	/AGucNGtVTOswkENqrWfTk7HwAdbTyUA2ndZlIsJsel+xaknyn009B3k76a2aD1BEhS8C/
	9FKLwTFZixeGUCpvXB5qcOXU4F44R/Bp2hfsgyXnHbUiBxoOLXdI78J/fZqk+A==
Message-ID: <898edb5f-3e7c-9763-c84f-6b59fb5daef6@bootlin.com>
Date: Tue, 1 Nov 2022 16:42:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] Yocto Tasks Detailed Diagram Proposal
Content-Language: en-US
To: Bel Hadj Salem Talel <talel.hajsalem@sofia-technologies.com>
References: <3u6w.1667236384580014962.DpiY@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <3u6w.1667236384580014962.DpiY@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Nov 2022 15:42:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3452

Hi Talel

On 10/31/22 18:13, Bel Hadj Salem Talel wrote:
> Hello All,
>
> I did create a detailed diagram about Yocto Tasks and where they 
> happen exactly in tmp, downloads and other directories in the build 
> folder.
>
> Please find attached the SVG diagram.
>
> If it can be added to Yocto documentation it would be great, so any 
> comments/reviews are welcome.
>
> This will setup the way for me to add more detailed diragrams about 
> other Yocto topics.


Many thanks for proposing this contribution!
Before we find a place in the manual where we could use it, I've got an 
issue with the text labels, which Google docs turned into shapes when 
you exported to SVG, removing the possibility to edit them in the future.

Ultimately, I'd like this diagram to be maintained in SVG format, so 
that everyone can easily maintain them, typically using Inkscape.

Maybe we can manually edit this SVG document to fix this, replacing the 
shapes by real text, which could be rather quick.

List members, any feedback about the content itself?

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


