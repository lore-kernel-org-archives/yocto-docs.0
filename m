Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16287C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 16:49:20 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.705.1683305356032950656
 for <docs@lists.yoctoproject.org>;
 Fri, 05 May 2023 09:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SKuW8ltK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D18A3C0002;
	Fri,  5 May 2023 16:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683305354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tVq11G8Ol+R1Ztgu2dCRp78e4NdU8j6qamwKDjmAIO8=;
	b=SKuW8ltKB+I0N30ZW7IBDaCBb28fv/oSqf5TDJqukgHazSOpQbDh4SVDN8+guRPNZ2ngK+
	MvyMIxnjmgN9uBUKN1sokKR7G0PjdYVX4/Pr6DyZKjLa+hmpp6KZTNaTDcLM/bMlCG6A7f
	XQnx9L/SGrYk5nBUgA/hD9hHhejLdjVgAOg9k6j6p0p6TJdLHgesy23Qtf0x1M+uX01M3E
	baMSdKF/GXGcHyVjnP9J2PYuXXHIwpMxsRiOwUOf8Z20myvPlpwXuVlh9JtpqitZKB9NkR
	8ZXNkRISTxpL4JB90srNEyljpXluVGR7QGAYeq8O9qsbCpLPeklqiSRZJFo0XA==
Date: Fri, 5 May 2023 18:49:12 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] ref-manual: classes: kernel: document
 automatic defconfig usage
Message-ID: <20230505184912.4c4a7093@booty>
In-Reply-To: <d002676f-90a8-ab90-7fd0-381e7c1e9bff@bootlin.com>
References: <20230505091006.1888595-1-luca.ceresoli@bootlin.com>
	<20230505091006.1888595-2-luca.ceresoli@bootlin.com>
	<175C47EAC5CB336C.898@lists.yoctoproject.org>
	<d002676f-90a8-ab90-7fd0-381e7c1e9bff@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 May 2023 16:49:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3919

Hi Mike,

On Fri, 5 May 2023 18:40:21 +0200
Michael Opdenacker <michael.opdenacker@bootlin.com> wrote:

> Hi Luca,
> 
> On 05.05.23 at 17:10, Michael Opdenacker via lists.yoctoproject.org wrote:
> >
> > On 05.05.23 at 11:10, Luca Ceresoli via lists.yoctoproject.org wrote:  
> >> Since a very long time the kernel bbclass uses a defconfig file from
> >> SRC_URI automatically. Document this feature.
> >>
> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> >
> >
> > Hi Luca,
> >
> > That's great to document this behavior. Good catch!
> > For both patches: Reviewed-by: Michael Opdenacker 
> > <michael.opdenacker@bootlin.com>
> > ... and merged into "master-next".  
> 
> 
> Oops, I realize you should run a few git commands to have a proper 
> identity in your git commits.
> 
> See 
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity
> 
> Don't need to send your patches again, I will fix your last two commits 
> by myself.

My bad, I forgot to add --identity=yocto when running git send-email! I
now added it to the local git config for the various yocto
repositories, so it hopefully won't happen again.

> Thanks in advance for next time.

Thank you very much!

Cheers,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

