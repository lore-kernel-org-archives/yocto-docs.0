Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F13CC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 12:00:20 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10617.1709035213164423554
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 04:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E+1XslVD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D62C11BF207;
	Tue, 27 Feb 2024 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709035211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D9zJI39bMYPlrkYoSYPNlEWYAg+Tm4JdIH+Z2gwReoQ=;
	b=E+1XslVDX+lxUqJdgtUYWwOwYH3dd0tgnn4snCbxDLPGkuTq8AvwSGnAZcASOu6Ue2slr6
	4IIAP+dwiLTTJg4OD4q3R0b8f+05Y2TJ8dAQTpAqlwrkz6k5P4KSGiCglM8PIJAjxcPGLG
	UlgPcFBUhAvLaan2mNp3erl6ZFBiX5eH/Cs/HDtlWuzKiJ+1fzjQH7rQnsPVbAidV0mHwb
	vbF9L2s9zQN9n0kuO1g7qsugZeXb6g/UVt5p2dLZa2zVooqDzGwsPENo1G2A4WymslDH8d
	5lgyXPyYuR2+ZbeGUsSacb85Fco2UrZYc9FUyoujKx8/ZZdZ+7/pKkz6iCAqSw==
Date: Tue, 27 Feb 2024 13:00:09 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [docs] [PATCH v2 1/2] ref-manual: tasks: do_cleanall: recommend
 using '-f fetch' instead
Message-ID: <20240227130009.02bd611e@booty>
In-Reply-To: <0ea73b57-b0ec-4a29-a0a2-fc16c01b077e@theobroma-systems.com>
References: <20240227-clean-tasks-notes-v2-0-35fb627e9ca0@bootlin.com>
	<20240227-clean-tasks-notes-v2-1-35fb627e9ca0@bootlin.com>
	<0ea73b57-b0ec-4a29-a0a2-fc16c01b077e@theobroma-systems.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4881

Hi Quentin,

thanks for you reviews.

On Tue, 27 Feb 2024 12:24:03 +0100
Quentin Schulz <quentin.schulz@theobroma-systems.com> wrote:

> Hi Luca,
> 
> On 2/27/24 11:59, Luca Ceresoli via lists.yoctoproject.org wrote:
> > [You don't often get email from luca.ceresoli=bootlin.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > do_cleanall can produce failures when used in legitimate cases, wuch as  
> 
> s/wuch/such/

Thanks for noticing all of my typos... will fix.

> One of the issues with using -f is that it taints the build as far as I 
> remember and you'll get a warning for all subsequent builds until you 
> clean stuff?

Yes. But I don't see any other way out other than removing the entire
tmp dir... the warning is maybe annoying but harmless anyway.

> 
> > 
> > Reported-by: Sam Liddicott
> > Link: https://bootlin.com/blog/yocto-sharing-the-sstate-cache-and-download-directories/#comment-2650335
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >   documentation/ref-manual/tasks.rst | 25 ++++++++++++++++++++++---
> >   1 file changed, 22 insertions(+), 3 deletions(-)
> > 
> > diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> > index 0db960b22f80..ebaa03dc7613 100644
> > --- a/documentation/ref-manual/tasks.rst
> > +++ b/documentation/ref-manual/tasks.rst
> > @@ -470,9 +470,28 @@ You can run this task using BitBake as follows::
> > 
> >      $ bitbake -c cleanall recipe
> > 
> > -Typically, you would not normally use the :ref:`ref-tasks-cleanall` task. Do so only
> > -if you want to start fresh with the :ref:`ref-tasks-fetch`
> > -task.
> > +You should never use the :ref:`ref-tasks-cleanall` task in a normal
> > +scenario. If you want to start fresh with the :ref:`ref-tasks-fetch` task,  
> 
> Maybe we could suggest here that if one needs to do this, the recipe 
> needs to be fixed so that this isn't needed.

Not sure about this. As I understand it, do_cleanall should just not be
needed in normal cases, full stop. I personally use it when giving
trainings because I want to show that some recipes are actually
downloading and building, and not reusing the whole sstate cache from
my previous training. However I think this goes out of what should be in
a manual, and I cannot see other valid uses for do_cleanall.

> > +use instead::
> > +
> > +  $ bitbake -f fetch recipe
> > +  
> 
> I think we're missing a -c before fetch

Right! Here and at other places.

> I completely glossed over cleanall being for recipe-native in the 
> example and was wondering why it would be in a different work directory. 
> It'd be nice to specify this is the case because the first and third 
> steps are for the target recipe and the second for the native recipe. 
> They are in different work directories, and their stamp files are there. 
> However, the source code in tarball/git form - if identical between 
> target and native recipes - are stored in a directory common to the 
> target and native recipes (DL_DIR).
> 
> > +   at step 3 will try to extract the downloaded archive and fail as it has
> > +   been deleted in step 2.
> > +  
> 
> It's been a few months since I've played with Yocto but I think the 
> example above will work just fine?

It definitely fails. You can try it easily:

  bitbake -c fetch zstd
  bitbake -c cleanall zstd-native
  bitbake -c unpack zstd

> -c unpack will still go through the task dependencies if they aren't 
> done already? I don't really see a usecase for bitbake to NOT do the 
> dependencies first?

The point is: "if they aren't done already". Here zstd has a
stamp for do_fetch after step 1 so at step 3 it is considered "done
already".

> > +   This can be even more tricky if using a shared download directory.
> >   
> 
> It'd be nice to give a link to the documentation about shared download 
> directory (if theres' one) or at the very least the variable name.

OK, adding "(see :term:`DL_DIR`)" at the end of the sentence.

> I think we could also be a bit more explicit about the risks here.
> 
> If a download directory (DL_DIR) is shared between different bitbake 
> running at the same time (e.g. multiple bitbakes on the same machine, or 
> spread over the network), removing stamps and source tarballs/git repo 
> from one bitbake would likely break the other bitbakes trying to get the 
> source from the common place that now doesn't exist anymore.

That's the example that was in v1 of this patch. However I now added an
example of the error happening without a shared DL_DIR, which is much
more relevant because you don't even need a shared dir. I then removed
the initial example as I don't think we need a verbose list of examples
here. i think we need to say: don't do this because it can fail
even in the basic case.

If anything should be done about the last sentence would rather be to
remove it entirely.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

