Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web10.9633.1603696601415566881
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 00:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iba0Gdhm;
 spf=pass (domain: linaro.org, ip: 209.85.219.195, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f195.google.com with SMTP id c3so6828670ybl.0
        for <docs@lists.yoctoproject.org>; Mon, 26 Oct 2020 00:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZznNnlRkgEdS4F8RGZkHAIgg3CxXY9uQXIi59MXqq7c=;
        b=iba0GdhmqbulY6OaVDvKPrCCtx3nAt+jrcpVYTWhjRCj2NgcqCgewMUDlr0T8diHvD
         F314/vAJdbfry3+RUN/G4kdsopN6S6SdEIoxbwyZo158ZDAzU5zAHzrr6ZQqq/LdW4fd
         EQWFGVmTj3UXpMAyg9d6GA17LtNPN+XHGsp9yY8B9rO5VAzdSZmqbW7W7QnFHzHo03Y3
         Qvd+/22CVIMWNc9n2Dl8JuJzq3i3BJJDfSUWN9Fic/ds/+NsWKnZ1yKDymuDolauyxoP
         I9RfCeCuhDU159B+h0y8lh+dT0h2w6/Tv2YNJyZSSe2cotnypsHxMnFvcXvQEjt/Vl3B
         yp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZznNnlRkgEdS4F8RGZkHAIgg3CxXY9uQXIi59MXqq7c=;
        b=RqpuUrGUn3yH4CRMeMSgZFi0BQUhn14t55tewZo0brwTzySNZoQYasz+d0VMIurkG0
         3Q7B4EuFZUuRLk4tCEzyMozDKhriAVb6od0XM5MlrVop7RLN13udHE4fd6ebXMaPhTcs
         O8HN/Nk53QtKV/l7FRVNP4mAo0WxKsTWN5kuR0EgI0JmNyBlNrSuAK5xqjLL1t7H3cg2
         9hfSBhgVFrThpMvg/ZN/sbLqFPJOCX5oZB0i2hGkgHY6uKUw5ONKgG8aBTIp4P7tIoAj
         hz3Y32dLB8g4oPlK+Zji5OyIRyELN2MyltJ5un8dFOlCCQRjlUFN//+S2ZhPykcll7xd
         S6jg==
X-Gm-Message-State: AOAM531E2e6ANbRLEfDmtjRz23dGy4ClZBYLFWw/9VezyXKYsPbmFJgb
	bgUqzyIL8aGrVcxm1UAaA9sz3rq42oI7RIT4Jg2J5HLUPovh8Q==
X-Google-Smtp-Source: ABdhPJyz/AJFdmhVaSvSS+FJNYh2l9qAnhHi983xOm2q6Y/pJo2JXicFyEbQtXzv9EzfjXXRVQED5gWRhFJfMhG7ux0=
X-Received: by 2002:a25:8752:: with SMTP id e18mr18398804ybn.133.1603696600336;
 Mon, 26 Oct 2020 00:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201012034255.2186713-1-leimaohui@cn.fujitsu.com>
 <CAP71WjyWn6cPg2rZP0T8-iNDWH4KTaBULh4UgaGf9pyZ7FLg=g@mail.gmail.com> <d7d72831ede6498e91563c4ae747f611@G08CNEXMBPEKD05.g08.fujitsu.local>
In-Reply-To: <d7d72831ede6498e91563c4ae747f611@G08CNEXMBPEKD05.g08.fujitsu.local>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 26 Oct 2020 08:16:27 +0100
Message-ID: <CAP71Wjwf+KicWg58QUFcL_75bVsAbFhRp8PzHh0Wdxjw5L4daQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] docs: Updated the status of spdx module.
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

hi Lei,

On Mon, Oct 26, 2020 at 7:48 AM Lei, Maohui <leimaohui@cn.fujitsu.com> wrote:
>
> Hi, nico
>
> Thanks for your comment, I'm sorry that I'm not  very familiar with syntax  of doc.

Not a problem, we just missed that during the review process!

> So, do I need to submit patch again? Or you have updated this patch?

Your patch was merged, so we need a new patch on top of current branch
to fix the issue. If you confirm that the patch I put in my previous
email is good, then I can submit it, otherwise, feel free to submit a
patch directly.

>
>
> Best regards
> Lei
>
> > -----Original Message-----
> > From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > Sent: Friday, October 23, 2020 10:44 PM
> > To: Lei, Maohui <leimaohui@cn.fujitsu.com>
> > Cc: docs@lists.yoctoproject.org
> > Subject: Re: [docs] [PATCH] docs: Updated the status of spdx module.
> >
> > hey Lei,
> >
> > On Mon, Oct 12, 2020 at 5:44 AM leimaohui <leimaohui@cn.fujitsu.com>
> > wrote:
> > >
> > > - Deleted content about old spdx.bbclass.
> > > - Added usage of meta-spdxscanner.
> > >
> > > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > > ---
> > >  .../dev-manual/dev-manual-common-tasks.rst    | 38 +++++++++++++++++++
> > >  documentation/ref-manual/ref-classes.rst      | 13 -------
> > >  documentation/ref-manual/ref-tasks.rst        | 14 -------
> > >  3 files changed, 38 insertions(+), 27 deletions(-)
> > >
> > > diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst
> > > b/documentation/dev-manual/dev-manual-common-tasks.rst
> > > index bef8bf840f..80fd23e960 100644
> > > --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> > > +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> > > @@ -11401,6 +11401,8 @@ to be covered by assuming that three main
> > areas of concern exist:
> > >  -  Compilation scripts and modifications to the source code must be
> > >     provided.
> > >
> > > +-  spdx files can be provided.
> > > +
> > >  There are other requirements beyond the scope of these three and the
> > > methods described in this section (e.g. the mechanism through which
> > > source code is distributed).
> > > @@ -11595,6 +11597,42 @@ layers (recipes, configuration files, and so
> > > forth) enables you to meet  your requirements to include the scripts
> > > to control compilation as well  as any modifications to the original source.
> > >
> > > +Providing spdx files
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +The spdx module has been integrated to a layer named meta-spdxscanner.
> > > +meta-spdxscanner provides several kinds of scanner. If you want to
> > > +enable this function, you have to do the following steps:
> > > +
> > > +1. Added meta-spdxscanner layer into ``bblayers.conf``.
> > > +
> > > +2. Reference to README of meta-spdxscanner, setup the environment(e.g,
> > > +   setup a fossology server) of scanner.
> > > +
> > > +3. Meta-spdxscanner provids several methods(bbclass) to create spdx files.
> > > +   Please choose one that you want to use and enable the spdx task. You
> > have to
> > > +   add some config options in
> > > +``local.conf`` file in your
> > > +:term:`Build Directory`.
> > > +The following is an example about how to get spdx files during
> > > +bitbake by fossology-python.bbclass:
> > > +::
> >
> > this causes the following new warning:
> > WARNING: Enumerated list ends without a blank line; unexpected unindent.
> >
> > I believe the code-block belongs to the #3 item in the list, in which case this
> > patch is needed:
> >
> > --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> > +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> > @@ -11487,26 +11487,23 @@ this function, you have to follow the following
> > steps:
> >  2. Refer to the README in meta-spdxscanner to setup the environment (e.g,
> >     setup a fossology server) needed for the scanner.
> >
> > -3. Meta-spdxscanner provids several methods within the bbclass to create
> > spdx files.
> > +3. Meta-spdxscanner provides several methods within the bbclass to
> > create spdx files.
> >     Please choose one that you want to use and enable the spdx task. You have
> > to
> > -   add some config options in
> > -``local.conf`` file in your
> > -:term:`Build Directory`.
> > -The following is an example showing how to generate spdx files during
> > bitbake -using the fossology-python.bbclass:
> > -::
> > -
> > -   # Selet fossology-python.bbclass.
> > -   INHERIT += "fossology-python"
> > -   # For fossology-python.bbclass, TOKEN is necessary, so, after setup a
> > -   # Fossology server, you have to create a token.
> > -   TOKEN = "eyJ0eXAiO..."
> > -   # The fossology server is necessary for fossology-python.bbclass.
> > -   FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo"
> > -   # If you want to upload the source code to a special folder:
> > -   FOLDER_NAME = "xxxx" //Optional
> > -   # If you don't want to put spdx files in tmp/deploy/spdx, you can enable:
> > -   SPDX_DEPLOY_DIR = "${DeployDir}" //Optional
> > +   add some config options in ``local.conf`` file in your :term:`Build
> > +   Directory`. The following is an example showing how to generate spdx files
> > +   during bitbake using the fossology-python.bbclass::
> > +
> > +      # Selet fossology-python.bbclass.
> > +      INHERIT += "fossology-python"
> > +      # For fossology-python.bbclass, TOKEN is necessary, so, after setup a
> > +      # Fossology server, you have to create a token.
> > +      TOKEN = "eyJ0eXAiO..."
> > +      # The fossology server is necessary for fossology-python.bbclass.
> > +      FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo"
> > +      # If you want to upload the source code to a special folder:
> > +      FOLDER_NAME = "xxxx" //Optional
> > +      # If you don't want to put spdx files in tmp/deploy/spdx, you can enable:
> > +      SPDX_DEPLOY_DIR = "${DeployDir}" //Optional
> >
> > Note: I fixed a typo as well.
> >
> > > +
> > > +   # Selet fossology-python.bbclass.
> > > +   INHERIT += "fossology-python"
> > > +   # For fossology-python.bbclass, TOKEN is necessary, so, after setup a
> > > +   # Fossology server, you have to create a token.
> > > +   TOKEN = "eyJ0eXAiO..."
> > > +   # The fossology server is necessary for fossology-python.bbclass.
> > > +   FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo" //Optional
> > > +   # If you want to upload the source code to a special folder.
> > > +   FOLDER_NAME = "xxxx" //Optional
> > > +   # If you don't want to put spdx files in tmp/deploy/spdx, you can change.
> > > +   SPDX_DEPLOY_DIR = "${DeployDir}" //Optional
> > > +
> > > +More usage of meta-spdxscanner, which you can find at:
> > > +https://git.yoctoproject.org/cgit/cgit.cgi/meta-spdxscanner/.
> > > +
> > >  Copying Licenses that Do Not Exist
> > >  ----------------------------------
> > >
> > > diff --git a/documentation/ref-manual/ref-classes.rst
> > > b/documentation/ref-manual/ref-classes.rst
> > > index 756df2a60f..7277c6bb9d 100644
> > > --- a/documentation/ref-manual/ref-classes.rst
> > > +++ b/documentation/ref-manual/ref-classes.rst
> > > @@ -2380,19 +2380,6 @@ Autotools automatically picks up.
> > >  The class also provides variables like ``SITEINFO_ENDIANNESS`` and
> > > ``SITEINFO_BITS`` that can be used elsewhere in the metadata.
> > >
> > > -.. _ref-classes-spdx:
> > > -
> > > -``spdx.bbclass``
> > > -================
> > > -
> > > -The ``spdx`` class integrates real-time license scanning, generation
> > > of -SPDX standard output, and verification of license information
> > > during the -build.
> > > -
> > > -.. note::
> > > -
> > > -   This class is currently at the prototype stage in the 1.6 release.
> > > -
> > >  .. _ref-classes-sstate:
> > >
> > >  ``sstate.bbclass``
> > > diff --git a/documentation/ref-manual/ref-tasks.rst
> > > b/documentation/ref-manual/ref-tasks.rst
> > > index 2569306fc5..ea145644f7 100644
> > > --- a/documentation/ref-manual/ref-tasks.rst
> > > +++ b/documentation/ref-manual/ref-tasks.rst
> > > @@ -859,17 +859,3 @@ sure that the machine and metadata branches as
> > > specified by the  branches. If these branches do not exist and
> > > :term:`AUTOREV` is not being used, the  ``do_validate_branches`` task
> > > fails during the build.
> > > -
> > > -Miscellaneous Tasks
> > > -===================
> > > -
> > > -The following sections describe miscellaneous tasks.
> > > -
> > > -.. _ref-tasks-spdx:
> > > -
> > > -``do_spdx``
> > > ------------
> > > -
> > > -A build stage that takes the source code and scans it on a remote
> > > -FOSSOLOGY server in order to produce an SPDX document. This task
> > > applies -only to the :ref:`spdx <ref-classes-spdx>` class.
> > > --
> > > 2.25.1
> > >
> > >
> > > 
> > >
> >
>
>
>
