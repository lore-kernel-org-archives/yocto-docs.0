Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBF7C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 21:23:17 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.2713.1663708990377003737
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 14:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LLGqAdz9;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id x29so4670573ljq.2
        for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 14:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=c2FR4xEKwa5y/KLQT2yu8POQp+HP5RRc7x354d029Ek=;
        b=LLGqAdz9vm+pq55B6/hhyRyc0O/Zjw7s4WHlKd3AVTLH96MsN6fusVf2YD3H4ymy0J
         hP9EkAzB8Xf1cBoMbdEhF5ETX4rmeoPEBrXxLNqWPHBXPsZEoQJX1+Q0ww3qPHSBRXt0
         KgIn8M0u7ipCDP6k4rLgVR7lx/IFeY1ZJ6Lez3I3UGrty0brDJNo9T2uLxkrOi3PFomS
         gv+MktCA30KrmSCDksakk+fU+yVfMAy5buG2Ft22r747IrfaTwPfs8xOfQ3HOifpcNOE
         fakgjs4Hl9TL0Zc5wkEwdKeoyRGA23zOJ3BwuuJtZyshcpdZSNNYxJKfoCXWiPpexuo6
         f29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=c2FR4xEKwa5y/KLQT2yu8POQp+HP5RRc7x354d029Ek=;
        b=xI0lgjHkcJ4T8jqSR7nq0vcwW+MzuiDTq63HiZhT4Rh1xA74uro9Kpzg+PkRJ6cXqz
         eBTpYu0G+gkF3S4QjzX7asjeM1tf4pIzkdrEuRc9Y+RUUYOI07VnvGclJbLNhwkyvD3k
         V0tD06/ilIEPop8HnXJj6KlimtH8U9CJ4hwHYSrR99CI7KI1CvmWM2w1peYy1cLT97sc
         boELYm5x+Ln945YZ2JnAwhfqqVQfwl0I/xSXn84N2b4Y67Mx9K0APosVd7A/WCwT1SxS
         jEgqjTisHjZVrhWInLPQMjMJYPQNg3+EQrq2n9PLfRcKfDvJfMppEO/2AUslhAbFKjWl
         slVw==
X-Gm-Message-State: ACrzQf3mxFFJSvc9JzWU0unyuu+fM3/Kx8oGdattOZkkD3AnZ61RtCvz
	BmdWbxd9mnbB94v+/1KywB1nryki0MH13MCGrUY=
X-Google-Smtp-Source: 
 AMsMyM4HML3AcbhdkVPDZfgXjlUzAYXLao+TH9I3GAm3c2pzAJFWDWEvJeJowXgI16p9TCNxrBrgkEzFEMUpVRwU3ck=
X-Received: by 2002:a05:651c:1787:b0:261:c1ff:4407 with SMTP id
 bn7-20020a05651c178700b00261c1ff4407mr7509957ljb.257.1663708988572; Tue, 20
 Sep 2022 14:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220911172608.2542076-1-alex@linutronix.de>
 <20220911172608.2542076-3-alex@linutronix.de>
 <056487c1-6447-d078-be5d-05340b424ce5@theobroma-systems.com>
 <6b495f9b-fbc3-7f91-19b3-0e1bb433e54a@bootlin.com>
In-Reply-To: <6b495f9b-fbc3-7f91-19b3-0e1bb433e54a@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Sep 2022 23:22:57 +0200
Message-ID: 
 <CANNYZj8LQMoKhSLd9v1259cseQYr2mmC1YJrnK-xiXxj2pU2Lg@mail.gmail.com>
Subject: Re: [docs] [PATCH 3/5] common-tasks.rst: describe the newly added
 layer setup and template config commands
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: quentin.schulz@theobroma-systems.com,
	Alexander Kanavin <alex@linutronix.de>, docs <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 21:23:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3193

I'm not sure alphabetical order makes sense. There is a certain
logical order in describing the commands that follows a typical
'setting up a build and configuration' workflow, and that is perhaps
better. In any case, that should be a separate commit, as reordering
things should always be kept separate from modifying them.

Thanks for all the fixups!

Alex

On Tue, 20 Sept 2022 at 22:28, Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Quentin, Alex,
>
> Thanks for the patch and review.
>
> On 19.09.22 17:23, Quentin Schulz via lists.yoctoproject.org wrote:
> > Hi Alex,
> >
> > On 9/11/22 19:26, Alexander Kanavin wrote:
> >> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> ---
> >>   documentation/dev-manual/common-tasks.rst | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/documentation/dev-manual/common-tasks.rst
> >> b/documentation/dev-manual/common-tasks.rst
> >> index c2afec946..4d19bd921 100644
> >> --- a/documentation/dev-manual/common-tasks.rst
> >> +++ b/documentation/dev-manual/common-tasks.rst
> >> @@ -728,6 +728,17 @@ The following list describes the available
> >> commands:
> >>     -  ``create-layer``: Creates a basic layer.
> >>   +-  ``save-build-conf``: Saves the currently active build
> >> configuration
> >> +   (conf/local.conf, conf/bblayers.conf) as a template into a layer.
> >
> > Double tick-quote the paths please, e.g.:
> > ``conf/local.conf``
> >
> >> +   This template can later be used for setting up builds via
> >> TEMPLATECONF.
> >
> > :term:`TEMPLATECONF`
> >
> >> +   For information about saving and usinc configuration templates, see
> >
> > s/usinc/using/
> >
> >> + ":ref:`dev-manual/common-tasks:creating a custom template
> >> configuration directory`".
> >> +
> >> +-  ``create-layers-setup``: Writes out a configuration file and/or a
> >> script that
> >> +   can replicate the directory structure and revisions of the layers
> >> in a current build.
> >> +   For more information, see ":ref:`dev-manual/common-tasks:saving
> >> and restoring the layers setup`".
> >> +
>
>
> I took your review into account, Quentin.
>
> >
> > Should we order alphabetically the list of available commands?
>
>
> Maybe, this should be another change, as the commands are not sorted
> alphabetically in the existing text. At least, I modified Alex' changes
> to insert them in a way that is consistent with the order in the
> "--help" output.
>
> I agree though that sorting commands alphabetically would help, in the
> documentation, but in the code too. Would the latter make sense?
>
> Anyway, I merged this change into master-next. I had to apply the 4/5
> patch first, otherwise, this one was making a reference to a chapter
> that didn't exist yet.
>
> Thanks again!
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

