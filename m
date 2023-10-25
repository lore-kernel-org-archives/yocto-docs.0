Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9A2C25B47
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 14:50:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.45651.1698245429091749964
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 07:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hc9c2NNG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE5484000A;
	Wed, 25 Oct 2023 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698245427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xkZZLEqQumE7LsOOSTI1vljmo7vogYrEX7e2/vk/M4=;
	b=hc9c2NNGxcaEgDSgZ3LQaH/Z4dYLh1FQT/0myTosSevkQXNJUz6ygUmgkGl0GQeGRoNNS3
	kqZ6PB29JfphF6wbADETQKy4nqgANctFjV1ciCWbiBJh6MPZ+Uzx11NBge4/q4fhnWMnzY
	VoIzhyaw0R8s0kwEL2XGbXJ9NTzr5CNSBZfvMjXtuhuJ6Ghf2FHjbXMe5BVTX6w6Opzupp
	q4E8f7w58HaLwWQsQvUt7xJ79UHWpZma4AHiebEzH7oNRgslpG5/eKa8JbUA4AlVInEL6+
	OAoMhei1tZEBfaeRqQbysluABwzF+tTLUCMquONvNX+ym5GWx1WzCtToECOOJA==
Message-ID: <d030fb28-f093-41bc-8908-84d235aa7f4c@bootlin.com>
Date: Wed, 25 Oct 2023 16:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v4][docs] dev-manual: add security team processes
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>,
 Marta Rybczynska <rybczynska@gmail.com>
References: <20231025131202.5762-1-rybczynska@gmail.com>
 <CH3PR11MB809327A3858AF4B85F60325FB9DEA@CH3PR11MB8093.namprd11.prod.outlook.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CH3PR11MB809327A3858AF4B85F60325FB9DEA@CH3PR11MB8093.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Oct 2023 14:50:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4501

Marta, Lee,

On 25.10.23 at 16:14, Lee Chee Yang wrote:
> +
> +Branches maintained with security fixes
> +---------------------------------------
> +
> +See the
> +:ref:`Release process <ref-manual/release-process:Stable Release
> +Process>` documentation for details regarding the policies and
> +maintenance of stable branches.
> +
> +The :yocto_wiki:`Releases page </Releases>` contains a list of all
> +releases of the Yocto Project. Versions in grey are no longer actively
> +maintained with security patches, but well-tested patches may still be
> +accepted for them for significant issues.
> +
> +Security-reated discussions at the Yocto Project
> minor typo
>   reated -> related

Fixed, thanks for the review and update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


