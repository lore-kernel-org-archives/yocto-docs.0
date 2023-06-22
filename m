Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0596EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:06:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.17267.1687453568176656156
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 10:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TurjNzXL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687453565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lra4ZQiT6hT5nLKlrXRoN3Rytw+9mseAi3Tju2ljSWM=;
	b=TurjNzXLh/MjbVQpX/xF0GMsHkUDaIC1ZoHW7GLlNGgYFJOqfBG4nMYpN4rmDKM6pxwB/w
	tr7SOSrHRJfgqWcwnJBTVnLjfA+HgjSDRmgO9IDYaI8CTbSF4zLe5hsBbOAHPRGvR1d6SN
	2lgzWBHi3jaQmoy08c3Ha4Puplqvj1GIm9RE2utNrMSCVdJc+DGC1sVuWDk4KuS0m8CYtd
	GcIHCSq1w0PePML/HtgFPL5GxmePAL8KxunzMuKLACtpHdos29zYyP6tCqK8tD5R70R5NF
	F7nKlvIys3IsWU6BKTsMclaRBkviWIYfnX2kVj40kF6+aeP2QTzklpcJFDha2w==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08F2C20003;
	Thu, 22 Jun 2023 17:06:04 +0000 (UTC)
Date: Thu, 22 Jun 2023 19:06:02 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: classes.rst: document
 devicetree.bbclass
Message-ID: <20230622190602.415ff38d@booty>
In-Reply-To: <f4e27e11-5b97-207e-61e5-559dbad5da43@theobroma-systems.com>
References: <20230412191122.620584-1-michael.opdenacker@bootlin.com>
	<f4e27e11-5b97-207e-61e5-559dbad5da43@theobroma-systems.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 17:06:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4032

Hi Quentin,

On Thu, 22 Jun 2023 14:54:13 +0200
Quentin Schulz <quentin.schulz@theobroma-systems.com> wrote:

> Hi Michael, Luca,
> 
> On 4/12/23 21:11, Michael Opdenacker via lists.yoctoproject.org wrote:
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > 
> > This addresses [YOCTO #15092]
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >   documentation/ref-manual/classes.rst | 43 ++++++++++++++++++++++++++++
> >   1 file changed, 43 insertions(+)
> > 
> > diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> > index f8172e6b29..79a2bdb69b 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -580,6 +580,49 @@ add the task at the appropriate place, which is usually after
> >   :ref:`ref-tasks-install`. The class then takes care of
> >   staging the files from :term:`DEPLOYDIR` to :term:`DEPLOY_DIR_IMAGE`.
> >   
> > +.. _ref-classes-devicetree:
> > +
> > +``devicetree``
> > +==============
> > +
> > +The :ref:`ref-classes-devicetree` class allows to build a recipe that compiles
> > +device tree source files that are not in the kernel tree.
> > +
> > +The compilation of out-of-tree device tree sources is the same as the kernel
> > +in-tree device tree compilation process. This includes the ability to include
> > +sources from the kernel such as SoC ``dtsi`` files as well as C header files,
> > +such as ``gpio.h``.
> > +
> > +The :ref:`ref-tasks-compile` task will compile two kinds of files:
> > +
> > +- Regular device tree sources with a ``.dts`` extension.
> > +
> > +- Device tree overlays, detected from the presence of the ``/plugin/;``
> > +  string in the file contents.
> > +
> > +This class behaves in a similar way as the :ref:`ref-classes-kernel-devicetree`
> > +class, also deploying output files into ``/boot/devicetree``. However, this
> > +class stores the deployed device tree binaries into the ``devicetree``
> > +subdirectory.  
> 
> If I'm not mistaken, you're saying the same thing twice.
> 
> I believe :ref:`ref-classes-kernel-devicetree` class puts the dtb in 
> /boot directory by default (KERNEL_DTBDEST which defaults to 
> KERNEL_IMAGEDEST which defaults to boot) while 
> :ref:`ref-classes-devicetree` class puts it into /boot/devicetree/ 
> directory?

Haha, you are perfectly right, I wrote nonsense! :-)

> I think you may have used the comment from the devicetree.bbclass header 
> which is also a bit confusing.

Indeed that was my starting point.

I'm sending an amendment tomorrow.

Thanks for reviewing,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

