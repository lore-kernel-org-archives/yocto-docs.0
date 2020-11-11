Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web11.9808.1605113827336798889
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 08:57:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4CWW9X64y8z5tlB;
	Wed, 11 Nov 2020 17:57:04 +0100 (CET)
Date: Wed, 11 Nov 2020 17:57:03 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 7/8] dev-manual-common-tasks: Re-order patch submission instructions
Message-ID: <20201111165703.ewd3jll3hl5uou4c@qschulz>
References: <20201111160800.5669-1-pbarker@konsulko.com>
 <20201111160800.5669-7-pbarker@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20201111160800.5669-7-pbarker@konsulko.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, Nov 11, 2020 at 04:07:59PM +0000, Paul Barker wrote:
> New contributors to the project will usually be following the steps to
> submit patches directly via email as they may not have commit access to
> a contrib repository. For shorter series of patches this is the more
> common workflow which we see anyway.
>=20
> The documentation here is updated to reflect this, addressing the email
> submission process first and then the pull request process. The new
> opening paragraph for the section on submitting pull requests is taken
> from the "How to submit a patch to OpenEmbedded" page on the OE wiki.
>=20
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  .../dev-manual/dev-manual-common-tasks.rst    | 196 +++++++++---------
>  1 file changed, 99 insertions(+), 97 deletions(-)
>=20
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/doc=
umentation/dev-manual/dev-manual-common-tasks.rst
> index e923ce834..cde1b80d1 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -10776,11 +10776,110 @@ Preparing Changes for Submission
> =20
>           detailed description of change
> =20
> +.. _submitting-a-patch:
> +
> +Using Email to Submit a Patch
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Depending on the components changed, you need to submit the email to a
> +specific mailing list. For some guidance on which mailing list to use,
> +see the `list <#figuring-out-the-mailing-list-to-use>`__ at the

#figuring-out-the-mailing-list-to-use does not actually exist.

Maybe adding:
.. _figuring-out-the-mailing-list-to-use:
right before "The "poky" repository, which is the Yocto Project's
reference build environment" would work but not guaranteed, in any case
you would need to use :ref:`list <some-ref>` instead as failing to find
the link will fail the sphinx build instead of silently ignoring it.

Otherwise, please link to :ref:`list <how-to-submit-a-change>`.

> +beginning of this section. For a description of all the available
> +mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" =
section in the
> +Yocto Project Reference Manual.
> +
> +Here is the general procedure on how to submit a patch through email
> +without using the scripts once the steps in
> +:ref:`preparing-changes-for-submissions` have been followed:
> +
> +1. *Format the Commit:* Format the commit into an email message. To
> +   format commits, use the ``git format-patch`` command. When you
> +   provide the command, you must include a revision list or a number o=
f
> +   patches as part of the command. For example, either of these two
> +   commands takes your most recent single commit and formats it as an
> +   email message in the current directory:
> +   ::

email message in the current directory::

This is the same as above and we're striving for consistency.

> +
> +      $ git format-patch -1
> +
> +   or ::

If you don't want a colon, great, otherwise remove the leading space
before the two colons.

> +
> +      $ git format-patch HEAD~
> +
> +   After the command is run, the current directory contains a numbered
> +   ``.patch`` file for the commit.
> +
> +   If you provide several commits as part of the command, the
> +   ``git format-patch`` command produces a series of numbered files in
> +   the current directory =E2=80=93 one for each commit. If you have mo=
re than

I don't know if we want to keep this =E2=80=93 instead of a "normal" dash=
 (-)?
Makes it harder to grep in the sources.

> +   one patch, you should also use the ``--cover`` option with the
> +   command, which generates a cover letter as the first "patch" in the
> +   series. You can then edit the cover letter to provide a description
> +   for the series of patches. For information on the
> +   ``git format-patch`` command, see ``GIT_FORMAT_PATCH(1)`` displayed
> +   using the ``man git-format-patch`` command.
> +
> +   .. note::
> +
> +      If you are or will be a frequent contributor to the Yocto Projec=
t
> +      or to OpenEmbedded, you might consider requesting a contrib area
> +      and the necessary associated rights.
> +
> +2. *Send the patches via email:* Send the patches to the recipients an=
d
> +   relevant mailing lists by using the ``git send-email`` command.
> +
> +   .. note::
> +
> +      In order to use ``git send-email``, you must have the proper Git=
 packages
> +      installed on your host.
> +      For Ubuntu, Debian, and Fedora the package is ``git-email``.
> +
> +   The ``git send-email`` command sends email by using a local or remo=
te
> +   Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
> +   through a direct ``smtp`` configuration in your Git ``~/.gitconfig`=
`
> +   file. If you are submitting patches through email only, it is very
> +   important that you submit them without any whitespace or HTML
> +   formatting that either you or your mailer introduces. The maintaine=
r
> +   that receives your patches needs to be able to save and apply them
> +   directly from your emails. A good way to verify that what you are
> +   sending will be applicable by the maintainer is to do a dry run and
> +   send them to yourself and then save and apply them as the maintaine=
r
> +   would.
> +

Would benefit to explain "as the maintainer would". I guess we're
talking about `git am`?

> +   The ``git send-email`` command is the preferred method for sending
> +   your patches using email since there is no risk of compromising
> +   whitespace in the body of the message, which can occur when you use
> +   your own mail client. The command also has several options that let
> +   you specify recipients and perform further editing of the email
> +   message. For information on how to use the ``git send-email``
> +   command, see ``GIT-SEND-EMAIL(1)`` displayed using the
> +   ``man git-send-email`` command.
> +
> +The Yocto Project uses a `Patchwork instance <https://patchwork.openem=
bedded.org/>`__
> +to track the status of patches submitted to the various mailing lists =
and to
> +support automated patch testing. Each submitted patch is checked for c=
ommon
> +mistakes and deviations from the expected patch format and submitters =
are
> +notified by patchtest if such mistakes are found. This process helps t=
o
> +reduce the burden of patch review on maintainers.
> +
> +.. note::
> +
> +   This system is imperfect and changes can sometimes get lost in the =
flow.
> +   Asking about the status of a patch or change is reasonable if the c=
hange
> +   has been idle for a while with no feedback.
> +
>  .. _pushing-a-change-upstream:
> =20
>  Using Scripts to Push a Change Upstream and Request a Pull
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =20
> +For larger patch series it is preferable to send a pull request which =
not

Do we want to define what we mean by "larger"? (e.g. 10+?)

> +only includes the patch but also a pointer to a branch that can be pul=
led
> +from. This involves making a local branch for your changes, pushing th=
is
> +branch to an accessible repository and then using the ``create-pull-re=
quest``
> +and ``send-pull-request`` scripts from openembedded-core to create and=
 send a
> +patch series with a link to the branch for review.
> +
>  Follow this procedure to push a change to an upstream "contrib" Git
>  repository once the steps in :ref:`preparing-changes-for-submissions` =
have
>  been followed:
> @@ -10886,103 +10985,6 @@ been followed:
>                $ poky/scripts/create-pull-request -h
>                $ poky/scripts/send-pull-request -h
> =20
> -
> -.. _submitting-a-patch:
> -
> -Using Email to Submit a Patch
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -You can submit patches without using the ``create-pull-request`` and
> -``send-pull-request`` scripts described in the previous section.
> -However, keep in mind, the preferred method is to use the scripts.
> -
> -Depending on the components changed, you need to submit the email to a
> -specific mailing list. For some guidance on which mailing list to use,
> -see the `list <#figuring-out-the-mailing-list-to-use>`__ at the
> -beginning of this section. For a description of all the available
> -mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" =
section in the
> -Yocto Project Reference Manual.
> -
> -Here is the general procedure on how to submit a patch through email
> -without using the scripts once the steps in
> -:ref:`preparing-changes-for-submissions` have been followed:
> -
> -1. *Format the Commit:* Format the commit into an email message. To
> -   format commits, use the ``git format-patch`` command. When you
> -   provide the command, you must include a revision list or a number o=
f
> -   patches as part of the command. For example, either of these two
> -   commands takes your most recent single commit and formats it as an
> -   email message in the current directory:
> -   ::
> -
> -      $ git format-patch -1
> -
> -   or ::
> -
> -      $ git format-patch HEAD~
> -
> -   After the command is run, the current directory contains a numbered
> -   ``.patch`` file for the commit.
> -
> -   If you provide several commits as part of the command, the
> -   ``git format-patch`` command produces a series of numbered files in
> -   the current directory =E2=80=93 one for each commit. If you have mo=
re than
> -   one patch, you should also use the ``--cover`` option with the
> -   command, which generates a cover letter as the first "patch" in the
> -   series. You can then edit the cover letter to provide a description
> -   for the series of patches. For information on the
> -   ``git format-patch`` command, see ``GIT_FORMAT_PATCH(1)`` displayed
> -   using the ``man git-format-patch`` command.
> -
> -   .. note::
> -
> -      If you are or will be a frequent contributor to the Yocto Projec=
t
> -      or to OpenEmbedded, you might consider requesting a contrib area
> -      and the necessary associated rights.
> -
> -2. *Send the patches via email:* Send the patches to the recipients an=
d
> -   relevant mailing lists by using the ``git send-email`` command.
> -
> -   .. note::
> -
> -      In order to use ``git send-email``, you must have the proper Git=
 packages
> -      installed on your host.
> -      For Ubuntu, Debian, and Fedora the package is ``git-email``.
> -
> -   The ``git send-email`` command sends email by using a local or remo=
te
> -   Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
> -   through a direct ``smtp`` configuration in your Git ``~/.gitconfig`=
`
> -   file. If you are submitting patches through email only, it is very
> -   important that you submit them without any whitespace or HTML
> -   formatting that either you or your mailer introduces. The maintaine=
r
> -   that receives your patches needs to be able to save and apply them
> -   directly from your emails. A good way to verify that what you are
> -   sending will be applicable by the maintainer is to do a dry run and
> -   send them to yourself and then save and apply them as the maintaine=
r
> -   would.
> -
> -   The ``git send-email`` command is the preferred method for sending
> -   your patches using email since there is no risk of compromising
> -   whitespace in the body of the message, which can occur when you use
> -   your own mail client. The command also has several options that let
> -   you specify recipients and perform further editing of the email
> -   message. For information on how to use the ``git send-email``
> -   command, see ``GIT-SEND-EMAIL(1)`` displayed using the
> -   ``man git-send-email`` command.
> -
> -The Yocto Project uses a `Patchwork instance <https://patchwork.openem=
bedded.org/>`__
> -to track the status of patches submitted to the various mailing lists =
and to
> -support automated patch testing. Each submitted patch is checked for c=
ommon
> -mistakes and deviations from the expected patch format and submitters =
are
> -notified by patchtest if such mistakes are found. This process helps t=
o
> -reduce the burden of patch review on maintainers.
> -
> -.. note::
> -
> -   This system is imperfect and changes can sometimes get lost in the =
flow.
> -   Asking about the status of a patch or change is reasonable if the c=
hange
> -   has been idle for a while with no feedback.
> -
>  Responding to Patch Review
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~
> =20

Ah. It's just re-ordering text... Well... forget about it then :)

Free patches for anyone willing to send them :)

Quentin
