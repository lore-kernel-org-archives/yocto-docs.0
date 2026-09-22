Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45ECAC982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 14:23:27 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11612.1790087001853578490
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 07:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=an3REJug;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5311edbc154so34222061cf.3
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 07:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087001; x=1790691801; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=94hFIPEQOSRtDIu7E29nrYrUv2wsC4VR6PNuETASodk=;
        b=an3REJugjoH3Y0K1Eg/laICgIGPqQG4ekWgjXVQ+WlIsuquJgkrSAuPA7nkadYM+hI
         vCmDSo3OZOHsj9+ohSs5kRDqNuBznf+Ub0IItHR+5Bfc9zBw15Uz4RF9SjOQR4uJ25jN
         CJo1/HvfAnqbd6eTf/hWSypEggQ5z3HuS1N2NqVGClgLEtbgZ3t/ENDVS7PHJCk6QHQp
         0H0ErhQgz1v++nuc1o6oVPorQckKvgfG3HwArfgXQ0ATQKa8YgLIZRfF3idFrFTr44IR
         mq1YQnn2RnRTrH7WaYNmm5l0RPp98gwbAStur4QvHcfqZlRbwrt9j1iJeOCNmX5i5EeM
         Xu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087001; x=1790691801;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=94hFIPEQOSRtDIu7E29nrYrUv2wsC4VR6PNuETASodk=;
        b=I+hsiex3EpOfBqZn9t4OlJIwFvc7qJp+xZe8V9BgPyGcldk/OdbBF1noDoYKgOK5wL
         oOrrNkC8DM1RVXrw7OSUv8QqDcZvOdGfaI9nUix0nMFvKdpCBdcfGw2raGyqAGdGldtZ
         k8+KDlSiYVWY9y8Rsp3IxRMY47iDmKLePJ+d+eaO5LSZNmkSeAykaMJx7HYReyAB50Qh
         iwxTcikR408WfXjzR/XZ3zu9rn1Zj+CEWxLSxizT/o5ZCxJRdLRl/0IVrOshEp8w0TPM
         eEAy4dMZfyyZY3gjuo7ab2ml1x90atxwXBM34xFBQjIm+z8Yt5TtGjwd97I3cS86l2aN
         yXmw==
X-Gm-Message-State: AFuF++luCC4HQIbjhOoyFyfMeZjKHxmA56po5VxSIFLlVqV81eIez64E
	VDLGU4iQTbiIKH1wWBoriunAs6xeLPEdrG4kRBRVEafYl8hrB2xQMx4fwpLWqQ==
X-Gm-Gg: AYBFou0z6/EfNxbbS7P8qQzj60sMSPr89Gw+2t2EIngUmmRoyjV2l4e/nBVgiYFcEYg
	nSaWwYlIgDcz/uFWqSNv2YzFb28vEERgN0WeeFHtzyiU+eujDULfNVY41zD1M1PIFIm43iJEA1x
	ia3Hdhu+MuumV9rijr7M9MFPtmuVbB3sPevafkMMEcAtFxw12XK+rzn9YWebjsbUn4UBYh4oEZz
	o20a4F1Ihojchd5vFUENSD1XqmQzP0q6bcxAELFpYzfxWHAnpvjVDIXnOSyxzkVmUHhyv2nhfl7
	JzSC576IpS8+JvshJlwa6M/krT5s/1BSX9KbncaVgeSmCN2WQFkCgT6p8UClF+RYCNOejptMmt4
	+ijzriKLnWwV0WsynYCpLjhANYdMh7uJhvxrPMVl57B167hxVhefFwJSL7eN/No6IGBe/Vanywd
	bE9M0SOj0FbluLhAMxeeG3erexXwZO1JwjGtpZEbiZK41YaxxhbTkXRDOYfdzjDi5HHOEICQepR
	QODQ/Nngpavl5AFAjMhqLxxBqNuZujh9DPF+OhL
X-Received: by 2002:ac8:6907:0:b0:530:f5c7:a277 with SMTP id d75a77b69052e-532d8ce9cebmr59132231cf.7.1790087000317;
        Tue, 22 Sep 2026 07:23:20 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e1716786sm13993561cf.4.2026.09.22.07.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:23:19 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:23:17 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 03/10] docs: show a prompt on commands the reader
 is meant to type
Message-ID: <arKPVdMuqv21ldaC@localhost.localdomain>
References: <20260922020339.481929-1-twoerner@gmail.com>
 <20260922020339.481929-4-twoerner@gmail.com>
 <DLLU9BGBPRP7.2N2XWEQWTHZ7I@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLLU9BGBPRP7.2N2XWEQWTHZ7I@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 14:23:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10586

On Tue 2026-09-22 @ 02:19:59 PM, Antonin Godard wrote:
> Hi,
> 
> On Tue Sep 22, 2026 at 4:03 AM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
> > Most command blocks in the manuals start their lines with "$", but a
> > scattering of them do not, and those read as a file listing rather than
> > as something to run. Give them the prompt the surrounding pages already
> > use.
> >
> > Transcripts take a prompt on their opening line alone. Two things that
> > matter only once a line is a command go with that: a bare "$" at the end,
> > the prompt returning after the command finished, and a trailing "\" on a
> > Windows path, which a shell reads as a continuation into the output.
> >
> > AI-Generated: codex/claude-opus 5 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  documentation/brief-yoctoprojectqs/index.rst  |  2 +-
> >  .../contributor-guide/recipe-style-guide.rst  |  2 +-
> >  .../contributor-guide/submit-changes.rst      | 60 +++++++++----------
> >  .../dev-manual/creating-fragments.rst         |  4 +-
> >  documentation/dev-manual/debugging.rst        |  1 -
> >  documentation/dev-manual/devtool.rst          |  8 +--
> >  documentation/dev-manual/disk-space.rst       |  4 +-
> >  documentation/dev-manual/hashequivserver.rst  |  2 +-
> >  .../dev-manual/limiting-resources.rst         |  2 +-
> >  documentation/dev-manual/new-recipe.rst       |  6 +-
> >  documentation/dev-manual/packages.rst         |  2 +-
> >  .../dev-manual/python-development-shell.rst   |  1 -
> >  documentation/dev-manual/qemu.rst             |  8 +--
> >  documentation/dev-manual/start.rst            |  2 +-
> >  documentation/dev-manual/wayland.rst          |  6 +-
> >  documentation/kernel-dev/common.rst           |  3 -
> >  .../migration-guides/migration-2.1.rst        |  4 +-
> >  .../migration-guides/migration-2.5.rst        |  4 +-
> >  .../migration-guides/migration-4.0.rst        |  2 +-
> >  .../migration-guides/migration-5.3.rst        | 10 ++--
> >  .../migration-guides/release-notes-4.2.rst    |  2 +-
> >  .../migration-guides/release-notes-5.3.rst    |  2 +-
> >  documentation/ref-manual/classes.rst          |  8 +--
> >  .../ref-manual/devtool-reference.rst          |  2 -
> >  documentation/ref-manual/fragments.rst        | 16 ++---
> >  documentation/ref-manual/qa-checks.rst        |  4 +-
> >  documentation/ref-manual/variables.rst        |  6 +-
> >  .../test-manual/reproducible-builds.rst       |  2 +-
> >  documentation/test-manual/runtime-testing.rst |  4 +-
> >  29 files changed, 86 insertions(+), 93 deletions(-)
> >
> > diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> > index f7e4606f1f7b..e138df6c9351 100644
> > --- a/documentation/brief-yoctoprojectqs/index.rst
> > +++ b/documentation/brief-yoctoprojectqs/index.rst
> > @@ -373,7 +373,7 @@ layer>`:
> >  
> >      First, clone the layer next to the other layers::
> >  
> > -      git clone -b &DISTRO_NAME_NO_CAP; https://git.yoctoproject.org/meta-raspberrypi ../layers/meta-raspberrypi
> > +      $ git clone -b &DISTRO_NAME_NO_CAP; https://git.yoctoproject.org/meta-raspberrypi ../layers/meta-raspberrypi
> >  
> >  #.  **Add Your Layer to the Layer Configuration File:** Before you can use
> >      it, you must add the layer and its dependencies to your :ref:`structure-build-conf-bblayers.conf`
> > diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> > index 84c6bb14e8b0..fe12a8e6d826 100644
> > --- a/documentation/contributor-guide/recipe-style-guide.rst
> > +++ b/documentation/contributor-guide/recipe-style-guide.rst
> > @@ -436,7 +436,7 @@ By default, patches created with ``git format-patch`` have a `Git` version signa
> >  To avoid having a `Git` signature at the end of generated or updated patches,
> >  you can use `Git` configuration settings::
> >  
> > -   git config --global format.signature ""
> > +   $ git config --global format.signature ""
> 
> I would take the opportunity to use the "console" lexer here, instead of using
> the default one:
> 
> .. code-block:: console
> 
>    $ git config --global format.signature ""
> 
> Applies to patch 01/10 too, this one, and maybe the other patches.

I am working on a large patchset (which I'm calling "flip") to implement
the decision that was made to set *bitbake* as the default in conf.py
and then tag everything else that is not bitbake. It is big because
around 750 blocks need a label added, on top of the 277 that already
carry one.

The flip will switch these, and others, to *console* or to whatever
each block needs, one patch per manual. I would prefer to keep the two
operations, docs-fixes and flip, separate rather than intermingling them
as I go.

But, before I can send flip, I need to send my "lexers" patchset first
:-)


ideally:
docs-fixes → lexers → flip → conventions (reader and author facing)

I sent the reader-facing conventions page first by mistake; it was my
goal, and I had not realised how much would need fixing before
everything it says is true. Now that it is applied, the page is slightly
ahead of the manuals. It says a line beginning with "#" is a comment,
while kernel-dev still runs "# dmesg | less" as root [1]; and it says
commands are shown with the prompt that runs them, while
recipe-style-guide still has an unprompted "git config --global
format.signature" [2]. Those two patches are what close the gap.

[1]: https://lore.kernel.org/r/20260922020339.481929-2-twoerner@gmail.com
[2]: https://lore.kernel.org/r/20260922020339.481929-4-twoerner@gmail.com

> Antonin

