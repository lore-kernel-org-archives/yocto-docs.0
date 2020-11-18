Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.21857.1605690428651626464
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 01:07:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kSogWY43;
 spf=pass (domain: konsulko.com, ip: 209.85.210.52, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f52.google.com with SMTP id i18so1086855ots.0
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 01:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FtGBhjrxYp/Q9gKhOcSFb4bWStt7B8o79Q8+13rj+PY=;
        b=kSogWY43uVVeLDEbwPQSv85U3vbuaBas2WzEQjOHA71ySiuDfEJrrTryTZRJ8HUtbN
         O+zLws/zLJ7t8yEnKM794zjIdygXtozI3Of2E/CTeQDNTRX5QfGeHEAbgPZQZFicgaoV
         iL2mwTvLPWN5RCykzSJ1oXGHC2+sC6lszFBrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FtGBhjrxYp/Q9gKhOcSFb4bWStt7B8o79Q8+13rj+PY=;
        b=MLfQKeQ6Sc5uDyoW+wuEDK9gfyxer7WxL64jDx28iQc5J2ogDByDl6z/aj9ZhBmmB7
         9k2aEPXg1naX+oRQzMhDGWtsrCWGTWYJejECuNWu1sg8JkQu+zcxF3rVyXs+xlk38Vzg
         ywSlkYjjG/uhCLr6mwOMCmg8ZEqvK6bJHGOJYkOHAOGkKzSWW5OkHpl5bZK8o47DrCZE
         vREQG8keB8nU9iQaswoprKuX+/+tZFaoOlQJ40F5cWjeqsG26QSbQCywsaAti70eiikA
         MXYsbTxErlQ9xrN8YEYwUBRyKS9nPgoInjW5h/WNNzFWrehtG+6dSGd9nmfd/RsDIq2X
         OgAw==
X-Gm-Message-State: AOAM530PbI2i1QDTbYV7yfNx7E3070QRegPUQMVGFRn+83vP38TJqzdt
	6tRd/y9sKeF9WxuDqxcloEdOwb0GVv0jbxdbx2QRRA==
X-Google-Smtp-Source: ABdhPJytvsXs4TMhyzj4cN3koG471sTGFcPI1A7v/uaTLQ42vtZ5OmB3H964K+CJxgUF/IwFEcOd9sH1kg6T6QOALXI=
X-Received: by 2002:a05:6830:1b66:: with SMTP id d6mr6123256ote.258.1605690427500;
 Wed, 18 Nov 2020 01:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20201111160800.5669-1-pbarker@konsulko.com> <20201111160800.5669-7-pbarker@konsulko.com>
 <20201111165703.ewd3jll3hl5uou4c@qschulz>
In-Reply-To: <20201111165703.ewd3jll3hl5uou4c@qschulz>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 18 Nov 2020 09:06:57 +0000
Message-ID: <CAM9ZRVuMNosCtwkVM+t-WsB9bA__Kswb6ttFHiXxT3sJQWTtOw@mail.gmail.com>
Subject: Re: [docs] [PATCH 7/8] dev-manual-common-tasks: Re-order patch submission instructions
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2020 at 16:57, Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Paul,
>
> On Wed, Nov 11, 2020 at 04:07:59PM +0000, Paul Barker wrote:
> > New contributors to the project will usually be following the steps to
> > submit patches directly via email as they may not have commit access to
> > a contrib repository. For shorter series of patches this is the more
> > common workflow which we see anyway.
> >
> > The documentation here is updated to reflect this, addressing the email
> > submission process first and then the pull request process. The new
> > opening paragraph for the section on submitting pull requests is taken
> > from the "How to submit a patch to OpenEmbedded" page on the OE wiki.
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  .../dev-manual/dev-manual-common-tasks.rst    | 196 +++++++++---------
> >  1 file changed, 99 insertions(+), 97 deletions(-)
> >
> > diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/doc=
umentation/dev-manual/dev-manual-common-tasks.rst
> > index e923ce834..cde1b80d1 100644
> > --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> > +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> > @@ -10776,11 +10776,110 @@ Preparing Changes for Submission
> >
> >           detailed description of change
> >
> > +.. _submitting-a-patch:
> > +
> > +Using Email to Submit a Patch
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Depending on the components changed, you need to submit the email to a
> > +specific mailing list. For some guidance on which mailing list to use,
> > +see the `list <#figuring-out-the-mailing-list-to-use>`__ at the
>
> #figuring-out-the-mailing-list-to-use does not actually exist.
>
> Maybe adding:
> .. _figuring-out-the-mailing-list-to-use:
> right before "The "poky" repository, which is the Yocto Project's
> reference build environment" would work but not guaranteed, in any case
> you would need to use :ref:`list <some-ref>` instead as failing to find
> the link will fail the sphinx build instead of silently ignoring it.
>
> Otherwise, please link to :ref:`list <how-to-submit-a-change>`.
>
> > +beginning of this section. For a description of all the available
> > +mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" =
section in the
> > +Yocto Project Reference Manual.
> > +
> > +Here is the general procedure on how to submit a patch through email
> > +without using the scripts once the steps in
> > +:ref:`preparing-changes-for-submissions` have been followed:
> > +
> > +1. *Format the Commit:* Format the commit into an email message. To
> > +   format commits, use the ``git format-patch`` command. When you
> > +   provide the command, you must include a revision list or a number o=
f
> > +   patches as part of the command. For example, either of these two
> > +   commands takes your most recent single commit and formats it as an
> > +   email message in the current directory:
> > +   ::
>
> email message in the current directory::
>
> This is the same as above and we're striving for consistency.
>
> > +
> > +      $ git format-patch -1
> > +
> > +   or ::
>
> If you don't want a colon, great, otherwise remove the leading space
> before the two colons.
>
> > +
> > +      $ git format-patch HEAD~
> > +
> > +   After the command is run, the current directory contains a numbered
> > +   ``.patch`` file for the commit.
> > +
> > +   If you provide several commits as part of the command, the
> > +   ``git format-patch`` command produces a series of numbered files in
> > +   the current directory =E2=80=93 one for each commit. If you have mo=
re than
>
> I don't know if we want to keep this =E2=80=93 instead of a "normal" dash=
 (-)?
> Makes it harder to grep in the sources.
>
> > +   one patch, you should also use the ``--cover`` option with the
> > +   command, which generates a cover letter as the first "patch" in the
> > +   series. You can then edit the cover letter to provide a description
> > +   for the series of patches. For information on the
> > +   ``git format-patch`` command, see ``GIT_FORMAT_PATCH(1)`` displayed
> > +   using the ``man git-format-patch`` command.
> > +
> > +   .. note::
> > +
> > +      If you are or will be a frequent contributor to the Yocto Projec=
t
> > +      or to OpenEmbedded, you might consider requesting a contrib area
> > +      and the necessary associated rights.
> > +
> > +2. *Send the patches via email:* Send the patches to the recipients an=
d
> > +   relevant mailing lists by using the ``git send-email`` command.
> > +
> > +   .. note::
> > +
> > +      In order to use ``git send-email``, you must have the proper Git=
 packages
> > +      installed on your host.
> > +      For Ubuntu, Debian, and Fedora the package is ``git-email``.
> > +
> > +   The ``git send-email`` command sends email by using a local or remo=
te
> > +   Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
> > +   through a direct ``smtp`` configuration in your Git ``~/.gitconfig`=
`
> > +   file. If you are submitting patches through email only, it is very
> > +   important that you submit them without any whitespace or HTML
> > +   formatting that either you or your mailer introduces. The maintaine=
r
> > +   that receives your patches needs to be able to save and apply them
> > +   directly from your emails. A good way to verify that what you are
> > +   sending will be applicable by the maintainer is to do a dry run and
> > +   send them to yourself and then save and apply them as the maintaine=
r
> > +   would.
> > +
>
> Would benefit to explain "as the maintainer would". I guess we're
> talking about `git am`?
>
> > +   The ``git send-email`` command is the preferred method for sending
> > +   your patches using email since there is no risk of compromising
> > +   whitespace in the body of the message, which can occur when you use
> > +   your own mail client. The command also has several options that let
> > +   you specify recipients and perform further editing of the email
> > +   message. For information on how to use the ``git send-email``
> > +   command, see ``GIT-SEND-EMAIL(1)`` displayed using the
> > +   ``man git-send-email`` command.
> > +
> > +The Yocto Project uses a `Patchwork instance <https://patchwork.openem=
bedded.org/>`__
> > +to track the status of patches submitted to the various mailing lists =
and to
> > +support automated patch testing. Each submitted patch is checked for c=
ommon
> > +mistakes and deviations from the expected patch format and submitters =
are
> > +notified by patchtest if such mistakes are found. This process helps t=
o
> > +reduce the burden of patch review on maintainers.
> > +
> > +.. note::
> > +
> > +   This system is imperfect and changes can sometimes get lost in the =
flow.
> > +   Asking about the status of a patch or change is reasonable if the c=
hange
> > +   has been idle for a while with no feedback.
> > +
> >  .. _pushing-a-change-upstream:
> >
> >  Using Scripts to Push a Change Upstream and Request a Pull
> >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > +For larger patch series it is preferable to send a pull request which =
not
>
> Do we want to define what we mean by "larger"? (e.g. 10+?)
>
> > +only includes the patch but also a pointer to a branch that can be pul=
led
> > +from. This involves making a local branch for your changes, pushing th=
is
> > +branch to an accessible repository and then using the ``create-pull-re=
quest``
> > +and ``send-pull-request`` scripts from openembedded-core to create and=
 send a
> > +patch series with a link to the branch for review.
> > +
> >  Follow this procedure to push a change to an upstream "contrib" Git
> >  repository once the steps in :ref:`preparing-changes-for-submissions` =
have
> >  been followed:
> > @@ -10886,103 +10985,6 @@ been followed:
> >                $ poky/scripts/create-pull-request -h
> >                $ poky/scripts/send-pull-request -h
> >
> > -
> > -.. _submitting-a-patch:
> > -
> > -Using Email to Submit a Patch
> > -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > -
> > -You can submit patches without using the ``create-pull-request`` and
> > -``send-pull-request`` scripts described in the previous section.
> > -However, keep in mind, the preferred method is to use the scripts.
> > -
> > -Depending on the components changed, you need to submit the email to a
> > -specific mailing list. For some guidance on which mailing list to use,
> > -see the `list <#figuring-out-the-mailing-list-to-use>`__ at the
> > -beginning of this section. For a description of all the available
> > -mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" =
section in the
> > -Yocto Project Reference Manual.
> > -
> > -Here is the general procedure on how to submit a patch through email
> > -without using the scripts once the steps in
> > -:ref:`preparing-changes-for-submissions` have been followed:
> > -
> > -1. *Format the Commit:* Format the commit into an email message. To
> > -   format commits, use the ``git format-patch`` command. When you
> > -   provide the command, you must include a revision list or a number o=
f
> > -   patches as part of the command. For example, either of these two
> > -   commands takes your most recent single commit and formats it as an
> > -   email message in the current directory:
> > -   ::
> > -
> > -      $ git format-patch -1
> > -
> > -   or ::
> > -
> > -      $ git format-patch HEAD~
> > -
> > -   After the command is run, the current directory contains a numbered
> > -   ``.patch`` file for the commit.
> > -
> > -   If you provide several commits as part of the command, the
> > -   ``git format-patch`` command produces a series of numbered files in
> > -   the current directory =E2=80=93 one for each commit. If you have mo=
re than
> > -   one patch, you should also use the ``--cover`` option with the
> > -   command, which generates a cover letter as the first "patch" in the
> > -   series. You can then edit the cover letter to provide a description
> > -   for the series of patches. For information on the
> > -   ``git format-patch`` command, see ``GIT_FORMAT_PATCH(1)`` displayed
> > -   using the ``man git-format-patch`` command.
> > -
> > -   .. note::
> > -
> > -      If you are or will be a frequent contributor to the Yocto Projec=
t
> > -      or to OpenEmbedded, you might consider requesting a contrib area
> > -      and the necessary associated rights.
> > -
> > -2. *Send the patches via email:* Send the patches to the recipients an=
d
> > -   relevant mailing lists by using the ``git send-email`` command.
> > -
> > -   .. note::
> > -
> > -      In order to use ``git send-email``, you must have the proper Git=
 packages
> > -      installed on your host.
> > -      For Ubuntu, Debian, and Fedora the package is ``git-email``.
> > -
> > -   The ``git send-email`` command sends email by using a local or remo=
te
> > -   Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
> > -   through a direct ``smtp`` configuration in your Git ``~/.gitconfig`=
`
> > -   file. If you are submitting patches through email only, it is very
> > -   important that you submit them without any whitespace or HTML
> > -   formatting that either you or your mailer introduces. The maintaine=
r
> > -   that receives your patches needs to be able to save and apply them
> > -   directly from your emails. A good way to verify that what you are
> > -   sending will be applicable by the maintainer is to do a dry run and
> > -   send them to yourself and then save and apply them as the maintaine=
r
> > -   would.
> > -
> > -   The ``git send-email`` command is the preferred method for sending
> > -   your patches using email since there is no risk of compromising
> > -   whitespace in the body of the message, which can occur when you use
> > -   your own mail client. The command also has several options that let
> > -   you specify recipients and perform further editing of the email
> > -   message. For information on how to use the ``git send-email``
> > -   command, see ``GIT-SEND-EMAIL(1)`` displayed using the
> > -   ``man git-send-email`` command.
> > -
> > -The Yocto Project uses a `Patchwork instance <https://patchwork.openem=
bedded.org/>`__
> > -to track the status of patches submitted to the various mailing lists =
and to
> > -support automated patch testing. Each submitted patch is checked for c=
ommon
> > -mistakes and deviations from the expected patch format and submitters =
are
> > -notified by patchtest if such mistakes are found. This process helps t=
o
> > -reduce the burden of patch review on maintainers.
> > -
> > -.. note::
> > -
> > -   This system is imperfect and changes can sometimes get lost in the =
flow.
> > -   Asking about the status of a patch or change is reasonable if the c=
hange
> > -   has been idle for a while with no feedback.
> > -
> >  Responding to Patch Review
> >  ~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
>
> Ah. It's just re-ordering text... Well... forget about it then :)
>
> Free patches for anyone willing to send them :)

This is all good feedback and I'll definitely keep a pin in it for
looking at later. For now I just want to re-order what we already
have.

Thanks,

--=20
Paul Barker
Konsulko Group
