Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AE8C9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 15:58:28 +0000 (UTC)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1754.1790265506288412007
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 08:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZiAh/7tx;
 spf=pass (domain: gmail.com, ip: 74.125.227.41, mailfrom: twoerner@gmail.com)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78564421fdbso737652137.1
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 08:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265505; x=1790870305; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJaoRHCoPTtgA20R9421Pj0nI0JX0UsCKraFVqUbung=;
        b=ZiAh/7txyCvfpv/wxhXOLFmuY0rxSYoBNvZllBOkeKPfbYkFe3pejHDsrzb0eC8vAM
         KzXlfLkKpu/HPprAOhatyPNSbnZuoQ3MCveTZKxXFPt3A4N+ZTaSuCdS6Vrk4hgx83l8
         PKl8gbRVY6CP33+f+O6fjLDRVJn2l6NDafYuIjCoKN6TU2goHIcNgu/rttCVljM7wRAO
         ammr4FPRYBmn2YIqKopM/CrQtP+MUe4g8gVKltS6QtWhuRkfDyXypa4ITUHOL75i83Zq
         bNE7VuZjDzL5gLe0iCYStNHdU7M9S3Ry1ggrPiRdGZxRHQau9pKq4P+R5e8WExxLvqzO
         WOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265505; x=1790870305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJaoRHCoPTtgA20R9421Pj0nI0JX0UsCKraFVqUbung=;
        b=NLBD7fIn/fZLj4kIiK3a8mlZx3eryDBpLx+UdoO9/aijsy5Ei7A3nzO5UFPdKUl/Ki
         LTqrRpJYnMJggpBPDOivYgYnvTbMtVfG/bRe6eZBS33S1XPS5NKPgCXwBYMxdjhuLNHn
         Tyw6XlAZnNBZAfaMflQDEjr4bJxoAUMFW7CljygC3/CO8tfOFH2OGZmkeZoy5YavkezX
         QRtha0//wLPOIfQwP5hXBD3BLdClDUSlsJrbB6puYzKKillGBVhLBLNb7HuSpzmAzD9Y
         ZmWgfdsXJbuRPgSpfyiLyXdjcQRprwN2qjI4wRI8svzt6ZxwNWZQYp7BOm/b0gtZAp4/
         Fx2w==
X-Gm-Message-State: AFuF++mPkiQv+CJiryR497U+Xd9r7x68e5LyS9tpdX8UisBxSQKcUvcg
	HXXKWBzfoEB3j1vErJzkn5VkGt18Ysb30ILSA7UUjCQNhTGtMo154TNdCta25g==
X-Gm-Gg: AYBFou3IECqeU0SuakV+ZEoQnxUD0kvdR/uYFSxKhR8+5qwoAzGLBtItPkCMB7dKNYl
	bqUXbaw4HcHcs9eQ82EYhqtMHNoDonM2PQeEp2uwmVV36JbRubdU6D0sxWhI0lc/pEOFqgsE3iW
	pl0F7eQjTIV2IQpNeq6FrcFPhcJ4kSRxzRdshjeDdoVYIA5mimN1elm30E7gUg1gjgSVrnpt8+l
	kQugTZy+biW3Ci8Xnm30AsP+EjsDGXwFHaN0cyccmZBknBoc89VrwsGNpciPFmnbEuekRKBjkQt
	w82KP8+kXaBzR6gATQiqHRS3tpYijmzWl2XsSl3uwbB8EjEWtNtZc/7c8bo681wmGCNQ05LedFL
	21rOalc3IEUetiOuUby39QU89vFHS1rOJ+yI3kdIlvdhLJgV3WNNdKhNQf2xFKOOAxznMPPL/SC
	8usVXSgdhrPKzsEZcKbFqyE91+LNQFFQ7RZYf1HgwP3TNk8NhZ3VI5agr4pn2usd6FLakT8bHCv
	HHFmPpaM1kba5PDrrmN6TYpDG7fGDiPELkbVbWEECYjOfXetBIt
X-Received: by 2002:a05:6102:3f0c:b0:7a2:63d4:3d25 with SMTP id ada2fe7eead31-7af1dae7e71mr1294914137.32.1790265505097;
        Thu, 24 Sep 2026 08:58:25 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ac2a1ea160sm6916139137.6.2026.09.24.08.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:58:24 -0700 (PDT)
Date: Thu, 24 Sep 2026 11:58:22 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 5/8] docs: mark the placeholders in examples
Message-ID: <arVInhJefH824gNT@localhost.localdomain>
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-6-twoerner@gmail.com>
 <440060d6-6522-4703-a036-ec42d128f0ad@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <440060d6-6522-4703-a036-ec42d128f0ad@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 15:58:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10620

On Wed 2026-09-23 @ 12:57:39 PM, Quentin Schulz wrote:
> Hi Trevor,
> 
> On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> > Values the reader is expected to replace are written as though they were
> > literal. "arch-gdb" reads like a command that exists, a Git SRC_URI
> > example reads like a URL and a pair of revisions worth copying, and the
> > git-config examples give an account name and address that are somebody
> > else's. Put them in the angle brackets the manuals already use for the
> > purpose.
> > 
> > Two corrections go with them: the directory placeholder in the GDB
> > example described itself at length rather than naming the thing, and the
> > smtppass example carried a stray "=". Since git config takes a name and
> > then a value, that "=" was the value, and the password behind it an
> > argument git config reads as a pattern.
> > 
> > AI-Generated: codex/claude-opus 5 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > changes in v2:
> > - rebased on master-next; no other change
> > ---
> >   .../contributor-guide/submit-changes.rst         | 12 ++++++------
> >   documentation/dev-manual/debugging.rst           |  8 ++++----
> >   documentation/migration-guides/migration-5.2.rst | 16 ++++++++--------
> >   documentation/ref-manual/devtool-reference.rst   |  2 +-
> >   documentation/ref-manual/variables.rst           |  2 +-
> >   5 files changed, 20 insertions(+), 20 deletions(-)
> > 
> > diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> > index e60f8ca7ace3..a283eb734768 100644
> > --- a/documentation/contributor-guide/submit-changes.rst
> > +++ b/documentation/contributor-guide/submit-changes.rst
> > @@ -62,8 +62,8 @@ on Debian and Ubuntu::
> >   Then, you need to set a name and e-mail address that Git will
> >   use to identify your commits::
> > -   $ git config --global user.name "Ada Lovelace"
> > -   $ git config --global user.email "ada.lovelace@gmail.com"
> > +   $ git config --global user.name "<name>"
> 
> <firstname> <lastname>

Sounds good, i like the above one.

> maybe? I'm guessing some cultures have other orders, I've seen
> 
> <lastname>, <firstname>
> 
> a few times.
> 
> > +   $ git config --global user.email "<email>"
> >   By default, Git adds a signature line at the end of patches containing the Git
> >   version. We suggest to remove it as it doesn't add useful information.
> > @@ -399,8 +399,8 @@ regular STMP server, using a Google Mail account as an example::
> >      $ git config --global sendemail.smtpserver smtp.gmail.com
> 
> Why is this not changed to a placeholder?

Sounds good.

> >      $ git config --global sendemail.smtpserverport 587
> >      $ git config --global sendemail.smtpencryption tls
> > -   $ git config --global sendemail.smtpuser ada.lovelace@gmail.com
> > -   $ git config --global sendemail.smtppass = XXXXXXXX
> > +   $ git config --global sendemail.smtpuser <email>
> > +   $ git config --global sendemail.smtppass <password>
> 
> It's also optional, in which case you're prompted every time you send a
> mail, which I kinda like :)
> 
> >   These settings will appear in the ``.gitconfig`` file in your home directory.
> > @@ -509,7 +509,7 @@ We have a frequent issue with contributors whose patches are received through
> >   a ``From`` field which doesn't match the ``Signed-off-by`` information. Here is
> >   a typical example for people sending from a domain name with :wikipedia:`DMARC`::
> > -   From: "Linus Torvalds via lists.openembedded.org <linus.torvalds=kernel.org@lists.openembedded.org>"
> > +   From: "xxx via lists.openembedded.org <xxx@lists.openembedded.org>"
> 
> Please keep this one (or use an example that exists in the wild, I don't
> think Linus sent patches to OE-Core :)) as it is an actual example.

Okay.

> >   This ``From`` field is used by ``git am`` to recreate commits with the right
> >   author name. The following will ensure that your e-mails have an additional
> > @@ -517,7 +517,7 @@ author name. The following will ensure that your e-mails have an additional
> >   maintainers accepting your patches don't have to fix commit author information
> >   manually::
> > -   $ git config --global sendemail.from "linus.torvalds@kernel.org"
> > +   $ git config --global sendemail.from "<email>"
> >   The ``sendemail.from`` should match your ``user.email`` setting,
> >   which appears in the ``Signed-off-by`` line of your commits.
> > diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
> > index 0f6e9d1d7e85..8412c997a51e 100644
> > --- a/documentation/dev-manual/debugging.rst
> > +++ b/documentation/dev-manual/debugging.rst
> > @@ -810,7 +810,7 @@ be visible. In this case, there is a missing dependency for the ``neard``
> >   Makefile target. Here is some abbreviated, sample output with the
> >   missing dependency clearly visible at the end::
> > -   i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/home/scott-lenovo/......
> > +   i586-poky-linux-gcc  -m32 -march=i586 --sysroot=<path/to/sysroot>
> >         .
> >         .
> >         .
> > @@ -1114,11 +1114,11 @@ debugger.
> >      After running gdbserver on the target, you need to run Gdb on the
> >      host and configure it and connect to the target. Use these commands::
> > -      $ cd directory-holding-the-debugfs-directory
> > -      $ arch-gdb
> > +      $ cd <debugfs-directory>
> > +      $ <arch>-gdb
> >         (gdb) set sysroot debugfs
> >         (gdb) set substitute-path /usr/src/debug debugfs/usr/src/debug
> > -      (gdb) target remote IP-of-target:1234
> > +      (gdb) target remote <IP-of-target>:1234
> 
> Here's yet another prompt we should support that I don't think it's
> supported in patch 2/8.

Agreed! Good catch.

> >      At this
> >      point, everything should automatically load (i.e. matching binaries,
> > diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> > index 77a11fe27047..48f9e7485d93 100644
> > --- a/documentation/migration-guides/migration-5.2.rst
> > +++ b/documentation/migration-guides/migration-5.2.rst
> > @@ -193,9 +193,9 @@ The support for having multiple Git revisions per URL in :term:`SRC_URI` was
> >   removed from BitBake, which means the following syntax is not supported
> >   anymore::
> > -   SRC_URI = "git://some.host/somepath;bareclone=1;branch=branchX,branchY;name=nameX,nameY"
> > -   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
> > -   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
> > +   SRC_URI = "git://<some.host>/<somepath>;bareclone=1;branch=<branchX>,<branchY>;name=<nameX>,<nameY>"
> > +   SRCREV_<nameX> = "<revisionX>"
> > +   SRCREV_<nameY> = "<revisionY>"
> 
> We should say that this is the full sha of the commit.

Sounds good. I thought "revisionX" was better enough from "xxxx", but
SHA is better yet.

> >   This was rarely used in the core repositories because it would only ever make
> >   sense for bare clones (the ``bareclone=1`` :term:`SRC_URI` option) where recipes
> > @@ -205,10 +205,10 @@ places.
> >   If one of your recipes is using this mechanism, you can split the code source
> >   fetching into two separate entries::
> > -   SRC_URI = "git://some.host/somepath;bareclone=1;branch=branchX;name=nameX \
> > -              git://some.host/somepath;bareclone=1;branch=branchY;name=nameY"
> > -   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
> > -   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
> > +   SRC_URI = "git://<some.host>/<somepath>;bareclone=1;branch=<branchX>;name=<nameX> \
> > +              git://<some.host>/<somepath>;bareclone=1;branch=<branchY>;name=<nameY>"
> > +   SRCREV_<nameX> = "<revisionX>"
> > +   SRCREV_<nameY> = "<revisionY>"
> 
> Ditto.

Got it.

> Cheers,
> Quentin

