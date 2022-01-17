Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70848C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 12:56:41 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web08.10698.1642424200716254809
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 04:56:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B7Z7g18r;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id w21so20763299uan.7
        for <docs@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 04:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q+uQ0qnA4ePftJWuKdcdwzAol2JzF/Vnu5Gt0hgp+mM=;
        b=B7Z7g18r5UHbPPBR7SVhDZO57Fp16O1Fdt72xOejZA5Y+FVkxrz5P1262CJ50OTG84
         SUDxCD2vhIfv/OtTYD69gdySm/t0YyUvC5xuCPuolup+r6oi6fdJwhy8y/0RXogS/cGa
         4KOp8kNV9onko3+wB7OsoOEtvZWHAK1LkRqyXof6RbZ4kSaKZ+7tTbUlatw8Of5ImbAe
         r1AywxaBc1qpzZ1YH4d0DHUAccQT8INVkxU8CXKl0RXiBlfsW73kXDbYGhYtLFgsA68R
         ASUkVz7RJL/MoP7ZXpfG9YIDZpG/EfB8FEPzhbliD3DwPk6lXmR/JGGagmfq489oE/tN
         BbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q+uQ0qnA4ePftJWuKdcdwzAol2JzF/Vnu5Gt0hgp+mM=;
        b=uWQYtNZUbAGtlFzXS4T3B7Xi+bvUNmNOmVp4LV57ncVQ+OeTV0Pwv/u1oPPFwPidba
         cCiBx7vC18wyPn/6kHH6heju0zdWhf2vDNJJBO4KKF0aJk7sT2kcsYJ48JqddZk/EoQf
         36S+ySkylUbfDIAYQz3wLePydeDXoeHRufRibfEPZLWhsSQVdXEoIf7XCUFTqm+D03v6
         Kd56d3cVXlXlnyd8ZY4aYCTludwPYLpssb/W7BJwc/a3kTDmldw3lQRkQzJKWSbVEitP
         CVMlWNrqpKtRoyF7ShIQ7c/85W1INsE3EhGbI2nPXyyjRUIKlF0m+4wwXAYHOylMuWVi
         dWZA==
X-Gm-Message-State: AOAM532QoKl1keGIKTG3AzCw8r354FF2CexSi51hAZAR5EfIO1bY9+mJ
	h/p7gY3EKvn/YB3JVhPeTPCB2yyngOLcXJnHznE=
X-Google-Smtp-Source: 
 ABdhPJz7Ebo2wD3dtmaLsWpK8ZrVrQvWFEOmKrQhaBKevA9l6m301UsgG9tItjBw4tv+43oJUTUDZHdm8mHz/ijoGv8=
X-Received: by 2002:a67:c40e:: with SMTP id c14mr6836214vsk.73.1642424199823;
 Mon, 17 Jan 2022 04:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20211217140415.49840-1-michael.opdenacker@bootlin.com>
 <37ea9c19f9c8d8810ae2b2404c0994b735b4130d.camel@linuxfoundation.org>
In-Reply-To: 
 <37ea9c19f9c8d8810ae2b2404c0994b735b4130d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jan 2022 13:56:28 +0100
Message-ID: 
 <CANNYZj83eY1hkzt-OGyfdxKSsvoQAedVJ4b1QSmspWfdnNRMrw@mail.gmail.com>
Subject: Re: [docs] [PATCH] migration-guides: prepare for release 3.5
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000000443505d5c6af37"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Jan 2022 12:56:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2415

--00000000000000443505d5c6af37
Content-Type: text/plain; charset="UTF-8"

It undermines software supply chain security as well, an important point to
make I think. It is not okay to pull random things from the internet
quietly.

Alex

On Mon, 17 Jan 2022 at 13:51, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-12-17 at 15:04 +0100, Michael Opdenacker wrote:
> > diff --git a/documentation/migration-guides/migration-3.5.rst
> b/documentation/migration-guides/migration-3.5.rst
> > new file mode 100644
> > index 0000000000..c63c9dff05
> > --- /dev/null
> > +++ b/documentation/migration-guides/migration-3.5.rst
> > @@ -0,0 +1,37 @@
> > +Release 3.5 (kirkstone)
> > +=======================
> > +
> > +This section provides migration information for moving to the Yocto
> > +Project 3.5 Release (codename "kirkstone") from the prior release.
> > +
> > +Recipe changes
> > +--------------
> > +
> > +- Because of the uncertainty in future default branch names in git
> repositories,
> > +  it is now required to add a branch name to all URLs described
> > +  by ``git://`` and ``gitsm://`` :term:`SRC_URI` entries. For example::
> > +
> > +     SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
> > +
> > +  A :oe_git:`convert-srcuri
> </openembedded-core/tree/scripts/contrib/convert-srcuri.py>`
> > +  script to convert your recipes is available in
> :term:`OpenEmbedded-Core (OE-Core)`
> > +  and in :term:`Poky`.
> > +
> > +- Because of `GitHub dropping support for the git:
> > +  protocol <
> https://github.blog/2021-09-01-improving-git-protocol-security-github/>`,
> > +  recipes now need to use ``;protocol=https`` at the end of GitHub
> > +  URLs. The same script as above can be used to convert the recipes.
> > +
> > +- The :term:`TOPDIR` variable and the current working directory are no
> longer modified
> > +  when parsing recipes. Any code depending on that behaviour will no
> longer worked as
> > +  expected (we don't know of any).
> > +
> > +- BitBake no longer supports ``append``, ``prepend`` and ``remove``
> operators
> > +  combined with the ``+=``, ``=+``, ``.=``, ``=.`` and ``?=`` operators.
> > +  Such operations should be made using ``=`` alone. This means that
> > +  a leading space may need to be explicitly added.
> > +
> > +- :ref:`allarch <ref-classes-allarch>` packagegroups can no longer
> depend on packages
> > +  which use ``PKG:xxx`` renaming such as :ref:`debian.bbclass
> <ref-classes-debian>`.
> > +  Doing this will produce an error.
> > +
>
> Thanks for starting this. We need to now add something like:
>
> """
> Network access from tasks is now disabled by default on kernels which
> support
> this (most recent distros e.g. centos8 and debian11 onwards). This means
> that
> tasks accessing the network need to be marked as such with the network
> flag,
> e.g.:
>
> do_mytask[network] = "1"
>
> This is allowed by default from do_fetch but not from any of our other
> standard
> tasks. Recipes shouldn't be accessing the network outside of do_fetch as
> it that
> usually undermines fetcher source mirroring, image manifests and licence
> manifests/auditing.
> """
>
> Cheers,
>
> Richard
>
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2414):
> https://lists.yoctoproject.org/g/docs/message/2414
> Mute This Topic: https://lists.yoctoproject.org/mt/87789405/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000000443505d5c6af37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It undermines software supply chain security as well,=
 an important point to make I think. It is not okay to pull random things f=
rom the internet quietly.<br></div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, 17 Jan 2022 at 13:51, Richard Purdie &lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2021-12-17 =
at 15:04 +0100, Michael Opdenacker wrote:<br>
&gt; diff --git a/documentation/migration-guides/migration-3.5.rst b/docume=
ntation/migration-guides/migration-3.5.rst<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c63c9dff05<br>
&gt; --- /dev/null<br>
&gt; +++ b/documentation/migration-guides/migration-3.5.rst<br>
&gt; @@ -0,0 +1,37 @@<br>
&gt; +Release 3.5 (kirkstone)<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
&gt; +<br>
&gt; +This section provides migration information for moving to the Yocto<b=
r>
&gt; +Project 3.5 Release (codename &quot;kirkstone&quot;) from the prior r=
elease.<br>
&gt; +<br>
&gt; +Recipe changes<br>
&gt; +--------------<br>
&gt; +<br>
&gt; +- Because of the uncertainty in future default branch names in git re=
positories,<br>
&gt; +=C2=A0 it is now required to add a branch name to all URLs described<=
br>
&gt; +=C2=A0 by ``git://`` and ``gitsm://`` :term:`SRC_URI` entries. For ex=
ample::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.den=
x.de/u-boot.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.d=
enx.de/u-boot.git;branch=3Dmaster</a>&quot;<br>
&gt; +<br>
&gt; +=C2=A0 A :oe_git:`convert-srcuri &lt;/openembedded-core/tree/scripts/=
contrib/convert-srcuri.py&gt;`<br>
&gt; +=C2=A0 script to convert your recipes is available in :term:`OpenEmbe=
dded-Core (OE-Core)`<br>
&gt; +=C2=A0 and in :term:`Poky`.<br>
&gt; +<br>
&gt; +- Because of `GitHub dropping support for the git:<br>
&gt; +=C2=A0 protocol &lt;<a href=3D"https://github.blog/2021-09-01-improvi=
ng-git-protocol-security-github/" rel=3D"noreferrer" target=3D"_blank">http=
s://github.blog/2021-09-01-improving-git-protocol-security-github/</a>&gt;`=
,<br>
&gt; +=C2=A0 recipes now need to use ``;protocol=3Dhttps`` at the end of Gi=
tHub<br>
&gt; +=C2=A0 URLs. The same script as above can be used to convert the reci=
pes.<br>
&gt; +<br>
&gt; +- The :term:`TOPDIR` variable and the current working directory are n=
o longer modified<br>
&gt; +=C2=A0 when parsing recipes. Any code depending on that behaviour wil=
l no longer worked as<br>
&gt; +=C2=A0 expected (we don&#39;t know of any).<br>
&gt; +<br>
&gt; +- BitBake no longer supports ``append``, ``prepend`` and ``remove`` o=
perators<br>
&gt; +=C2=A0 combined with the ``+=3D``, ``=3D+``, ``.=3D``, ``=3D.`` and `=
`?=3D`` operators.<br>
&gt; +=C2=A0 Such operations should be made using ``=3D`` alone. This means=
 that<br>
&gt; +=C2=A0 a leading space may need to be explicitly added.<br>
&gt; +<br>
&gt; +- :ref:`allarch &lt;ref-classes-allarch&gt;` packagegroups can no lon=
ger depend on packages<br>
&gt; +=C2=A0 which use ``PKG:xxx`` renaming such as :ref:`debian.bbclass &l=
t;ref-classes-debian&gt;`.<br>
&gt; +=C2=A0 Doing this will produce an error.<br>
&gt; +<br>
<br>
Thanks for starting this. We need to now add something like:<br>
<br>
&quot;&quot;&quot;<br>
Network access from tasks is now disabled by default on kernels which suppo=
rt<br>
this (most recent distros e.g. centos8 and debian11 onwards). This means th=
at<br>
tasks accessing the network need to be marked as such with the network flag=
,<br>
e.g.:<br>
<br>
do_mytask[network] =3D &quot;1&quot;<br>
<br>
This is allowed by default from do_fetch but not from any of our other stan=
dard<br>
tasks. Recipes shouldn&#39;t be accessing the network outside of do_fetch a=
s it that<br>
usually undermines fetcher source mirroring, image manifests and licence<br=
>
manifests/auditing.<br>
&quot;&quot;&quot;<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2414): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2414" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2414</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87789405/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87789405/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000000443505d5c6af37--

