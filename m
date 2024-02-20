Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E43C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 07:58:42 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8750.1708415912498400012
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Feb 2024 23:58:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bmcfKCDT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D34E24000B;
	Tue, 20 Feb 2024 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708415910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kpVx2gvZ70C3y57Yohk2VhvLiNtNf/Px/dxO2avSyyI=;
	b=bmcfKCDTPWqH+ZT5aD/Ka8sKBFb/hCNGaVqiNY8u8Bxh947KKw2ri4KwLcZWkyv4lEdkfR
	BumlgBxcfdJ6JlYzQ0IuSR5FRIhcGomr3oh/FNnwKb2FpaR+cGCqF6DTqi/uir7ujsMy5j
	rvcOEWpQYRFm8beh0k9+v6nTH+Gom/sqAaNkmJkuEl3KGcVvfcC7E9bsgQU3ZSNMatjd+X
	szq/YUO4VqnSsZORTd3FQdkwi0TcbLezaFNIjZ7mH048cpfQV9B2RS4oKlXsIkxwzigm/o
	in+SvG4vVzjuCFGt8TlfCCU5zV8MqN8QZWiKMPDp6XOdpHWGYj2PRiwPXDX5dw==
Date: Tue, 20 Feb 2024 08:58:27 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: tasks: do_cleanall: mention it is
 not allowed with a shared DL_DIR
Message-ID: <20240220085828.00300bdf@booty>
In-Reply-To: <d7177c8d-756e-41ab-95aa-6e7b8ccb591b@theobroma-systems.com>
References: <20240219155513.76738-1-luca.ceresoli@bootlin.com>
	<d7177c8d-756e-41ab-95aa-6e7b8ccb591b@theobroma-systems.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Feb 2024 07:58:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4848

Hi Quentin,

On Mon, 19 Feb 2024 17:12:46 +0100
Quentin Schulz <quentin.schulz@theobroma-systems.com> wrote:

> Hi Luca,
> 
> On 2/19/24 16:55, Luca Ceresoli via lists.yoctoproject.org wrote:
> > [You don't often get email from luca.ceresoli=bootlin.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > do_cleanall can produce failures if using a shared download directory. This
> > is why it is forbidden when writing tests that will run on the autobuilders
> > (https://docs.yoctoproject.org/test-manual/intro.html?highlight=cleanall#considerations-when-writing-tests).
> > 
> > Reported-by: Sam Liddicott
> > Link: https://bootlin.com/blog/yocto-sharing-the-sstate-cache-and-download-directories/#comment-2650335
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >   documentation/ref-manual/tasks.rst | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> > 
> > diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> > index 0db960b22f80..c754eb15514b 100644
> > --- a/documentation/ref-manual/tasks.rst
> > +++ b/documentation/ref-manual/tasks.rst
> > @@ -474,6 +474,19 @@ Typically, you would not normally use the :ref:`ref-tasks-cleanall` task. Do so
> >   if you want to start fresh with the :ref:`ref-tasks-fetch`
> >   task.
> > 
> > +.. note::
> > +
> > +   Never run the :ref:`ref-tasks-cleanall` task if your :term:`DL_DIR` is  
> 
> This also applies if SSTATE_DIR is shared I believe?

I don't think so. As far as I understand the sstate cache, a cache
entry is either found or not found, while for the downloads there is
the strange state of having a do_fetch stamp but no downloaded archive.

However I may be wrong. Do you have an example command sequence where
do_cleansstate can create a build failure?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

