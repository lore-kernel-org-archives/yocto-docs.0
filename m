Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27FCC47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 11:13:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.10695.1709118781686798589
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 03:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Y8XtYkda;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54DA620009;
	Wed, 28 Feb 2024 11:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709118780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6hopaP+Sip+2lso3k7M5nzovBVJ36ED6Rw/7Ech1ok=;
	b=Y8XtYkdaCrofQgd0KJPdjJd+Ox7sPJkOMFBtnqFIflvprfvcyqALmporqFfX+RcFgMRlGh
	pdgaEw7PhOc76xvkGbij5DiyCGH+OGOEMupXTKuegucqokK7L626mkDuwHBk+NLddRPLva
	UW6im40p5E6KMfgo+LHrjU185DhWUlKSTuTK2lK46/zg3audKc/NOhXYa254v8cry94iAE
	w4gFzu1iApbgD0AkT+FsPZXOSwSTaiS0OuW4ytosG7uEhkRleqYqQ7JAzioDk2XtIYWrd1
	wkh5gR48/CqJXi4zgobhKQMf0WQCahuxGbF1Yq/LG60F4ijdud1SoESrub21Vg==
Date: Wed, 28 Feb 2024 12:12:58 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [docs] [PATCH v2 1/2] ref-manual: tasks: do_cleanall: recommend
 using '-f fetch' instead
Message-ID: <20240228121258.020bb63d@booty>
In-Reply-To: <1d1b0f9b-cc95-4024-8001-1c3a53546890@theobroma-systems.com>
References: <20240227-clean-tasks-notes-v2-0-35fb627e9ca0@bootlin.com>
	<20240227-clean-tasks-notes-v2-1-35fb627e9ca0@bootlin.com>
	<0ea73b57-b0ec-4a29-a0a2-fc16c01b077e@theobroma-systems.com>
	<20240227130009.02bd611e@booty>
	<1d1b0f9b-cc95-4024-8001-1c3a53546890@theobroma-systems.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Feb 2024 11:13:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4911

Hi Quentin,

On Tue, 27 Feb 2024 13:23:52 +0100
Quentin Schulz <quentin.schulz@theobroma-systems.com> wrote:

> Hi Luca,
> 
> On 2/27/24 13:00, Luca Ceresoli wrote:
> [...]
> >> One of the issues with using -f is that it taints the build as far as I
> >> remember and you'll get a warning for all subsequent builds until you
> >> clean stuff?  
> > 
> > Yes. But I don't see any other way out other than removing the entire
> > tmp dir... the warning is maybe annoying but harmless anyway.
> >   
> 
> I worked for a company whose build system was blurting out lines and 
> lines of warnings and it took me some time to teach people to not ignore 
> those warnings because sometimes those warnings were actually important, 
> so that's where I'm coming from :)

While I feel your pain, I think no documentation can prevent people
from actively shooting on their feet. So we can add this note for who
is willing to read it, I guess...

[...]

> >>> +   This can be even more tricky if using a shared download
directory.
> >>>    
> 
> [...]
> 
> >> I think we could also be a bit more explicit about the risks here.
> >>
> >> If a download directory (DL_DIR) is shared between different bitbake
> >> running at the same time (e.g. multiple bitbakes on the same machine, or
> >> spread over the network), removing stamps and source tarballs/git repo
> >> from one bitbake would likely break the other bitbakes trying to get the
> >> source from the common place that now doesn't exist anymore.  
> > 
> > That's the example that was in v1 of this patch. However I now added an
> > example of the error happening without a shared DL_DIR, which is much
> > more relevant because you don't even need a shared dir. I then removed
> > the initial example as I don't think we need a verbose list of examples
> > here. i think we need to say: don't do this because it can fail
> > even in the basic case.
> > 
> > If anything should be done about the last sentence would rather be to
> > remove it entirely.
> >   
> 
> I could suggest the following rewording:
> 
> """
> Note that this also applies to bitbake from concurrent processes when a 
> shared download directory (:term:`DL_DIR`) is setup.
> """

Sounds better. Took your version as-is for v3, thanks!

> In any case, the original is fine with me with the few typo fixed :)

Cool. v3 incoming.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

