Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web09.21482.1605690665862192635
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 01:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pBYtw5nv;
 spf=pass (domain: konsulko.com, ip: 209.85.210.67, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f67.google.com with SMTP id a15so1069202otf.5
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 01:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CO+fbCXWoyylK+J8vxFOGg+wWxFWtOarfAavAPprlN4=;
        b=pBYtw5nvL/yNwHj/7HvMNyLk4edfBW0X/+iHSRiSDTQ57K3U9ycnHOzwJV4CiOUZy6
         +YfkJN4Vsd7tpCgxgWv2sWW9BBF62w2BAAaRXTRxvtqRN66SdtbUpyIZli8n8JKSQn49
         lel3cf6PvpiWP/bie6Q84uCISuUXcSvBD3r34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CO+fbCXWoyylK+J8vxFOGg+wWxFWtOarfAavAPprlN4=;
        b=B5ujET56n1JY0BwLq+EPIQPwqAhvg+PxW2/EJ6M8YmKXXCNaiGgmduc4e88fs4hb11
         6h3XSAN1l3r387Z77cY4Ov8X1Rh+Nnda+lQ4iDKG+ealhAGC6SBGJB5MCUni3KQ8PE34
         gBvQUawslr3zYuFK5gWGDOXlhWnB+C2wE7n3+2fwu6lGm7kRLN/z1xRwjH2M9+Ne0Shu
         LHxnPvx5Tm5wqpsVdKB1bFiMt0Cj+2Dk5S4B2Fuy39dTBLTSvlr294As9wtt7pY3aW5s
         UozwIAyrkM5ZZqcqp/wXGRxGxpG69+FD6zZYGTXQogUgtBD1VgmtY7VWFcGE/b4tivi4
         e1mw==
X-Gm-Message-State: AOAM531/TwXIYnp/CS6DzWRIauCZ3Fz1B2jyaMpIITKjLkK5XAkZzXup
	AYg8hsn7d+uAiszOXPaTIwTT+WwJyQAwyy+bCD4aa9AmgmI=
X-Google-Smtp-Source: ABdhPJz5fJEh61kJrZCghEbDZ8l1zWhoXf0ZhWwETPkm4d3Swj2BwmqqrFX+TxyQ9emIsBfOkVb7GH8QikowsGDOG38=
X-Received: by 2002:a05:6830:1b66:: with SMTP id d6mr6132209ote.258.1605690665208;
 Wed, 18 Nov 2020 01:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20201111160800.5669-1-pbarker@konsulko.com> <20201111160800.5669-6-pbarker@konsulko.com>
 <20201111163911.3ahilkvwgyib2zs4@qschulz>
In-Reply-To: <20201111163911.3ahilkvwgyib2zs4@qschulz>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 18 Nov 2020 09:10:55 +0000
Message-ID: <CAM9ZRVs03DriHngnE7oZ0MNuvMAKS9cDn-sWqmwES65LnPswTw@mail.gmail.com>
Subject: Re: [docs] [PATCH 6/8] dev-manual-common-tasks: Describe how to propose changes to stable branches
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2020 at 16:39, Quentin Schulz
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

That's an easy fix.

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

Yes that would be better. I didn't know a lot of these expressions
existed but they look very helpful.

-- 
Paul Barker
Konsulko Group
