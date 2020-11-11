Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web11.10411.1605115931058919796
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 09:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=T0Qzx+/m;
 spf=pass (domain: linaro.org, ip: 209.85.219.195, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f195.google.com with SMTP id c18so2622490ybj.10
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 09:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3uAeNq4dssp3bPYfqLymuMN4eIkeReFpr7c2DPxn4x0=;
        b=T0Qzx+/mUTukUMYqr//dhJFtBnQKvnixbI340lMlt/Xm1LW00jDF5F555LRpKu96Ds
         L7sbw8xOQMHrurYVEAHp02mTiOx7spBklqPXcoCGBKkYKEdJ0UkYXqko7kDvU2g5928Z
         C+dYJV+5d7m4Wd6UGscpq3inZQSHgIPA8zaki+Vo1ANzLs5ZuCoROBZ9EiPqFnEz60kS
         OYWHgXeeXg8H3SJSr04yGJGZgRg95B7PjwiiUUm5BBKmtJ4M7RVFK8lebNLfHvRAJjtA
         ptS3YTWgNyPiRMZ7jfFyKZJTAVI3FUeqtSs88bI9hm38kgv1ipiBKvmi8q7KGTdzPisP
         as6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3uAeNq4dssp3bPYfqLymuMN4eIkeReFpr7c2DPxn4x0=;
        b=Xvhcr/aPYIw0JmwMqcA7CRHM14z19Qm61o0RfGuW11S/TK0VXeOk3MiqHk4F5J5mQ4
         tyfePsb+5V85l3dffj524wWhqVKiRjtieJl0dubozImYHo2a/snFsF1SxfqAyVkHic3p
         dNNvmZiAoWD5+9r4trgzyuERzdqX7Foiuz9jjCkXdD7+k8fwvihd+qS6PVb4ey3fbCCR
         BQrMwPPg9U1SDOOLX5UD8oC4KrJCg8ZaMNbXxgc9ZrylROvGrjc40z2k8iCSnzWYRY5a
         m7Xg5Nc8SRgnOK4nTKNDYT4N34wGfMUGYvvBL1cwa/NtWBoV6FfQdFRZkJqQSry4eSbZ
         bidg==
X-Gm-Message-State: AOAM532GQYbBVQfEZSNW76aWwAUJrBfgQDNkFtgeGlif5nhTok1VYLql
	UY1aoY6ig8Utic57pfO/LNcNgweXJsqwp2rqdDqPBg==
X-Google-Smtp-Source: ABdhPJxV0pFAazFNsz8OkA7VDA4n+ghoxh7iu13F+GcxbZD/dg0aBEVi0mzs6ndWg9ycINrtUUfaGqGUXmFcNSlEjEY=
X-Received: by 2002:a25:9b04:: with SMTP id y4mr3043577ybn.397.1605115925374;
 Wed, 11 Nov 2020 09:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20201111160800.5669-1-pbarker@konsulko.com> <20201111160800.5669-6-pbarker@konsulko.com>
 <20201111163911.3ahilkvwgyib2zs4@qschulz>
In-Reply-To: <20201111163911.3ahilkvwgyib2zs4@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 11 Nov 2020 18:31:53 +0100
Message-ID: <CAP71WjxtVnQNZ5MpVOP=pPG8U=nGJXGUm3ySfyX3YLht7OSvvg@mail.gmail.com>
Subject: Re: [docs] [PATCH 6/8] dev-manual-common-tasks: Describe how to propose changes to stable branches
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Paul Barker <pbarker@konsulko.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2020 at 5:39 PM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Paul,
>
> On Wed, Nov 11, 2020 at 04:07:58PM +0000, Paul Barker wrote:
> > The documentation on submitting changes to the project should cover the
> > ways in which the process differs for stable branches. These changes add
> > a brief description of the typical policy for handling changes to stable
> > branches and give some steps to follow when proposing changes to these
> > branches. The information is based on my personal experience and on the
> > existing content of the "How to submit a patch to OpenEmbedded" page on
> > the OE wiki.
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  .../dev-manual/dev-manual-common-tasks.rst    | 55 +++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >
> > diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> > index 0a3ab8241..e923ce834 100644
> > --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> > +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> > @@ -11005,6 +11005,61 @@ Lastly please ensure that you also test your revised changes. In particular
> >  please don't just edit the patch file written out by ``git format-patch`` and
> >  resend it.
> >
> > +Submitting Changes to Stable Release Branches
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The process for proposing changes to a Yocto Project stable branch differs
> > +from the steps described above. Changes to a stable branch must address
> > +identified bugs or CVEs and should be made carefully in order to avoid the
> > +risk of introducing new bugs or breaking backwards compatibility. Typically
> > +bug fixes must already be accepted into the master branch before they can be
> > +backported to a stable branch unless the bug in question does not affect the
> > +master branch or the fix on the master branch is unsuitable for backporting.
> > +
> > +The list of stable branches along with the status and maintainer for each
> > +branch can be obtained from the `Releases wiki page <https://wiki.yoctoproject.org/wiki/Releases>`__.
> > +
>
> :yocto_wiki:`Releases wiki page </wiki/Releases>`
>
> > +.. note::
> > +
> > +   Changes will not typically be accepted for branches which are marked as
> > +   End-Of-Life (EOL).
> > +
> > +With this in mind, the steps to submit a change for a stable branch are as
> > +follows:
> > +
> > +1. *Identify the bug or CVE to be fixed:* This information should be
> > +   collected so that it can be included in your submission.
> > +
> > +2. *Check if the fix is already present in the master branch:* This will
> > +   result in the most straightforward path into the stable branch for the
> > +   fix.
> > +
> > +   a. *If the fix is present in the master branch - Submit a backport request
> > +      by email:* You should send an email to the relevant stable branch
> > +      maintainer and the mailing list with details of the bug or CVE to be
> > +      fixed, the commit hash on the master branch that fixes the issue and
> > +      the stable branches which you would like this fix to be backported to.
> > +
> > +   b. *If the fix is not present in the master branch - Submit the fix to the
> > +      master branch first:* This will ensure that the fix passes through the
> > +      project's usual patch review and test processes before being accepted.
> > +      It will also ensure that bugs are not left unresolved in the master
> > +      branch itself. Once the fix is accepted in the master branch a backport
> > +      request can be submitted as above.
> > +
> > +   c. *If the fix is unsuitable for the master branch - Submit a patch
> > +      directly for the stable branch:* This method should be considered as a
> > +      last resort. It is typically necessary when the master branch is using
> > +      a newer version of the software which includes an upstream fix for the
> > +      issue or when the issue has been fixed on the master branch in a way
> > +      that introduces backwards incompatible changes. In this case follow the
> > +      steps in :ref:`preparing-changes-for-submissions` and
> > +      :ref:`submitting-a-patch` but modify the subject header of your patch
> > +      email to include the name of the stable branch which you are
> > +      targetting. This can be done using the ``--subject-prefix`` argument to
> > +      ``git format-patch``, for example to submit a patch to the dunfell
> > +      branch use ``git format-patch --subject-prefix='dunfell][PATCH' ...``.
>
> s/dunfell/&DISTRO_NAME_NO_CAP_MINUS_ONE;/g ?

ouch.. that makes me realize we didn't update them in gatesgarth
branch yet..  and we should.. will send something..

>
> Thanks,
> Quentin
>
> 
>
