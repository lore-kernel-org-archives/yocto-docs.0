Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1865C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 16:29:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.7356.1647016189466392168
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 08:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Pk2UrYIF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D77DC1C000E;
	Fri, 11 Mar 2022 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647016187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygVJueGTeysAQ1MAqMfuJKEzspcJHGyCrKxK9Mxc+2o=;
	b=Pk2UrYIFTrqi38SgyazPoCn0o7K0ZEh1B/FeIe1InEj7GMVoM7uocmRnIaT+htoe0aXnYm
	DSh2edu6RnaQ+iGiFGaiLk9Jki3KuQ6HbXSuL2v4NwMTzpmoJMinuFxY4RMydxJi+6cakw
	47gn92Ri3gPSNGdaUhxkVdOGbCKRHjAX1sbo+8W6cQH8tKuIXQzsERbKueyhIJftlQa2Rg
	SlIG5C+IXOeQx9KraHXIAGzsvKXaUet49PaOH70Hqn0rsORBDkGSkjWCmpxK0OlOudvsoO
	BU0fSprddDwqZP1YFaDEy0H/yLQ72CTAZT9pT+bnLP8l3zorcbDHnx6OiR36FQ==
Message-ID: <66ca0a6f-cb1b-b2b0-e1fb-31239a5dff74@bootlin.com>
Date: Fri, 11 Mar 2022 17:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] manuals: inclusive language updates
Content-Language: en-US
To: docs@lists.yoctoproject.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <16DA20B7CA534643.15718@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <16DA20B7CA534643.15718@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Mar 2022 16:29:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2596

Hi Quentin

On 3/7/22 15:49, Michael Opdenacker via lists.yoctoproject.org wrote:
> Changes identified by OE core's
> scripts/contrib/convert-variable-renames.py script
>
> Original variable names are kept in old migration notes,
> but references to the new ones are provided.

I merged this change into "master-next", but the change disturbed the
alphabetic order of the variables. To keep the commit easy to check, I
prefer to fix this in another commit.
Didn't you have a script to restore the alphabetical order in the
variables.rst file ?
Otherwise, I'll do that manually, but I won't be very proud of it...
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


