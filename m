Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92395C54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 12:00:20 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10618.1709035217293105435
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 04:00:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f/gxjosD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A8A21BF20B;
	Tue, 27 Feb 2024 12:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709035215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Fvb58ByktrfJr21nJDLkcNae1HpMxXYCaKPr/92FSg=;
	b=f/gxjosDHk3T5J2eJl8ropTOgLWDhY0lrZ4uCYzfOEpcFlvwBrHlfbvKx+x2EUVchpzjTX
	wxwFQ54lwaWAHrqUz52q/N/gjaL3UocqpkQMTY70jFs/Bm86SIUObzIexU5SindD/xGKg7
	9emwDgjkVgdewI7tqOxid89uoNRidVdyd0Kize9USD4culICYjbD1aF5m3a1UmIkrbKoc0
	XuzqDh1I/G0QZux3y7SrkDRT/mU3X4uUC4EdrStP6FJB4JcjRyTvfZfHL3TJ6kuEX3konF
	WHiPSW2E/e4mWUE5w9E73eyGx1POdz3NgWeFUJNEIJ6sPb8xe6ijbEsxIY+dKg==
Date: Tue, 27 Feb 2024 13:00:14 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/2] ref-manual: tasks: do_cleansstate: recommend
 using '-f' instead for a shared sstate
Message-ID: <20240227130014.0072c78e@booty>
In-Reply-To: <d7b36e4e-2eaf-4971-a369-84b727f1cf1b@theobroma-systems.com>
References: <20240227-clean-tasks-notes-v2-0-35fb627e9ca0@bootlin.com>
	<20240227-clean-tasks-notes-v2-2-35fb627e9ca0@bootlin.com>
	<d7b36e4e-2eaf-4971-a369-84b727f1cf1b@theobroma-systems.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 12:00:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4882

Hi Quentin,

On Tue, 27 Feb 2024 12:30:48 +0100
Quentin Schulz <quentin.schulz@theobroma-systems.com> wrote:

> Hi Luca,
> 
> On 2/27/24 11:59, Luca Ceresoli wrote:
> > do_cleansstat can produce build errors when using a shared sstate cache.
> > 
> > Add a note to clearly discourage, provide a safe alternative (bitbake -f),
> > and the rationale.
> > 
> > Proposed-by: Quentin Schulz  <quentin.schulz@theobroma-systems.com>
> > Link: https://lore.kernel.org/yocto-docs/20240219155513.76738-1-luca.ceresoli@bootlin.com/T/#m5529687ecb0f9ec2dacddcb6ff58e2df73af9cde
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >   documentation/ref-manual/tasks.rst | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> > index ebaa03dc7613..9f130bb4e0c9 100644
> > --- a/documentation/ref-manual/tasks.rst
> > +++ b/documentation/ref-manual/tasks.rst
> > @@ -513,6 +513,18 @@ When you run the :ref:`ref-tasks-cleansstate` task, the OpenEmbedded build syste
> >   no longer uses any sstate. Consequently, building the recipe from
> >   scratch is guaranteed.
> >   
> > +.. note::
> > +
> > +   Using :ref:`ref-tasks-cleansstate` with a shared sstate directory is not  
> 
> I would add a :term:`SSTATE_DIR` here to highlight what we're talking about.

Sure.

> 
> > +   recommended because it could trigger an error during the build of a  
> 
> s/of/from/ ?
> 
> > +   separate bitbake instance. This is because the builds check sstate "up
> > +   front" but download the files later, so it if is deleted in the
> > +   meantime, it will cause an error but not a total failure as it will
> > +   rebuild it.
> > +  
> 
> Is bitbake actually safe from corruption? i.e. what happens if the file 
> gets removed while it's being currently downloaded by another bitbake 
> instance?

I'm happily leaving this question to Richard. :)

> Also, I would really recommend adding a similar warning in the cleanall 
> target. We would have a disclaimer on the use of shared download dir but 
> not on a shared sstate cache. One way to do it could be to link from the 
> cleanall target to the cleansstate target telling the user to check 
> other limitations that apply to both targets.

The first line in the do_cleanall sections points to do_cleansstate,
and in patch 1/2 we have even stronger reasons to not use do_cleanall.
I think that's enough.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

