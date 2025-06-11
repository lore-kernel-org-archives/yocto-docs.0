Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FE8C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 10:28:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.4427.1749637700658395613
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 03:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=GGZs6eHs;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nRzJX4OaVG244+7g+YpUROcpCDLI3H+9/meIB03oVsk=; b=GGZs6eHsNpMRwCkRQhVW7rVaHN
	oqV5xToe53cP+ARZ219aUuQ5PHg+LxHNai7GlCx5UgTVufRBeQfhPmnqi4mfGas8/0doNm5fH67cV
	CO+LfQmlrrJSoyQRfLTIP3FVOXlkfGCE7ANhKotI8MB0xGmL/b2TTRtwIvpF8ZjrdlnS8kNGnp5LP
	vXeGNQ4x2AUN0H+ZgKFqrIW2u/aEMxWBg4awxSfAlCTcJbmevWmczTaAWw2d1HLavma5ITX2IAIzv
	UejWb22ZWzI3drfnwfTIdF1K7N/UkKaYetTiU1FXwbhYMe3G7ElK+Rp4WW+qSmVBcdZMKhLtKHpVg
	se2pR3Qw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:40186 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uPIgq-0000000EInp-1bl4;
	Wed, 11 Jun 2025 06:28:19 -0400
Date: Wed, 11 Jun 2025 06:28:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: quentin.schulz@cherry.de
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH][ref-manual] clarify definition of PROVIDES
 variable
In-Reply-To: <06189ef1-544a-48e4-97e5-bc9a4f934f33@cherry.de>
Message-ID: <ab3c4141-ee16-7d84-643b-4351d0976e07@crashcourse.ca>
References: <6686fc57-f92d-8c76-704d-ebc5046561a9@crashcourse.ca> <06189ef1-544a-48e4-97e5-bc9a4f934f33@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Jun 2025 10:28:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7060


  OK, I'll redo this after the coffee kicks in.

rday

On Wed, 11 Jun 2025, Quentin Schulz via lists.yoctoproject.org wrote:

> Hi Robert,
>
> No need for [ref-manual] in the subject, or use:
>
> ref-manual: clarify definition of PROVIDES
>
> if you want.
>
> On 6/11/25 10:49 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Correct the example used in the definition, and add a bit more detail,
> > including the use of both assignment operators.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/variables.rst
> > b/documentation/ref-manual/variables.rst
> > index 5c18b852d..2d3af4966 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -7411,21 +7411,25 @@ system and gives an overview of their function and
> > contents.
> >         provides itself. If a recipe uses :term:`PROVIDES`, the additional
> >         aliases are synonyms for the recipe and can be useful for satisfying
> >         dependencies of other recipes during the build as specified by
> > -      :term:`DEPENDS`.
> > +      :term:`DEPENDS` without needing to be specific as to which package
>
> recipe != package. PROVIDES is for the recipe, not the package.
>
> > +      provides that dependency.
> >
>
> I still feel this isn't making it that much clearer because we don't make it
> explicit that two recipes can have the same alias (which is actually the whole
> point of aliases). We do explain it in a few paragraphs though.
>
> > -      Consider the following example :term:`PROVIDES` statement from the
> > recipe
> > -      file ``eudev_3.2.9.bb``::
> > +      As an example, the term "udev" refers to the Linux subsystem for
> > +      managing device events. Depending on how you configure your build,
>
> I don't think udev is a Linux subsystem?
>
> I would reword it to something like:
>
> """
> As an example, "udev" `Linux dynamic device
> management<https://www.kernel.org/pub/linux/utils/kernel/hotplug/udev/udev.html>`__
> functionality is handled by ``eudev`` and ``systemd`` recipes, which is why
> they both have the following::
>
>    PROVIDES = "udev"
> """
>
> what do you think?
>
> > +      that functionality can be supplied by either the ``eudev`` package
>
> package != recipe
>
> > +      or by ``systemd``, which is why both of those BitBake recipes
> > advertise
> > +      that with the line:
> >
>
> You need to end the paragraph with :: instead of : otherwise what follows
> isn't a code block.
>
> > -         PROVIDES += "udev"
> > +         PROVIDES = "udev"
> >
> > -      The :term:`PROVIDES` statement
> > -      results in the "eudev" recipe also being available as simply "udev".
> > +      Those :term:`PROVIDES` assignments result in both the ``eudev`` and
> > +      ``systemd`` packages being available as simply "udev".
> >
>
> s/packages/recipes/
>
> s/being available as simply "udev"/being also available under the "udev"
> alias/
>
> I'm not entirely sure but I also believe that you cannot install packages from
> two recipes providing the same alias? Also, your build dependency tree
> probably shouldn't have a dependency on multiple recipes providing the same
> alias?
>
> As a test, I copied kmscube into kmscube2 in poky, made them both have
> PROVIDES = "kmscube-test", then have my bootloader DEPENDS on kmscube and my
> kernel DEPENDS on kmscube2 and I get the following error:
>
> ERROR: Multiple .bb files are due to be built which each provide kmscube-test:
> | ETA:  0:00:00
>   /build/../work/poky/meta/recipes-graphics/kmscube/kmscube2_git.bb
>   /build/../work/poky/meta/recipes-graphics/kmscube/kmscube_git.bb
> A list of tasks depending on these providers is shown and may help explain
> where the dependency comes from.
> /build/../work/poky/meta/recipes-graphics/kmscube/kmscube2_git.bb has unique
> dependees:
>  /build/../repo/meta-bsp/recipes-kernel/linux/linux-cherry-es-dev_git.bb:do_package_write_rpm
>  /build/../repo/meta-bsp/recipes-kernel/linux/linux-cherry-es-dev_git.bb:do_package
>  /build/../repo/meta-bsp/recipes-kernel/linux/linux-cherry-es-dev_git.bb:do_collect_spdx_deps
>  /build/../repo/meta-bsp/recipes-kernel/linux/linux-cherry-es-dev_git.bb:do_prepare_recipe_sysroot
> /build/../work/poky/meta/recipes-graphics/kmscube/kmscube_git.bb has unique
> dependees:
>  /build/../repo/meta-bsp/recipes-bsp/u-boot/u-boot-cherry-es_2024.07.bb:do_package
>  /build/../repo/meta-bsp/recipes-bsp/u-boot/u-boot-cherry-es_2024.07.bb:do_package_write_rpm
>  /build/../repo/meta-bsp/recipes-bsp/u-boot/u-boot-cherry-es_2024.07.bb:do_prepare_recipe_sysroot
>  /build/../repo/meta-bsp/recipes-bsp/u-boot/u-boot-cherry-es_2024.07.bb:do_collect_spdx_deps
> It could be that one recipe provides something the other doesn't and should.
> The following provider and runtime provider differences may be helpful.
> /build/../work/poky/meta/recipes-graphics/kmscube/kmscube2_git.bb has unique
> provides:
>   kmscube2
> /build/../work/poky/meta/recipes-graphics/kmscube/kmscube2_git.bb has unique
> rprovides:
>   kmscube2
>   kmscube2-doc
>   kmscube2-locale
>   ^kmscube2-locale-.*
>   kmscube2-staticdev
>   kmscube2-src
>   kmscube2-dev
>   kmscube2-dbg
> /build/../work/poky/meta/recipes-graphics/kmscube/kmscube_git.bb has unique
> provides:
>   kmscube
> /build/../work/poky/meta/recipes-graphics/kmscube/kmscube_git.bb has unique
> rprovides:
>   ^kmscube-locale-.*
>   kmscube-doc
>   kmscube-src
>   kmscube-dev
>   kmscube-dbg
>   kmscube-staticdev
>   kmscube-locale
>   kmscube
>
> I think this is an important note as well, one should be really thinking twice
> before (ab)using the PROVIDES mechanism :) Doesn't need to be in this patch
> though.
>
> Cheers,
> Quentin
>

