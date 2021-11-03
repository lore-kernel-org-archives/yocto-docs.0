Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739D3C433FE
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 11:38:09 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.6151.1635939488067175936
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 04:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Y7H9xeRE;
 spf=pass (domain: linaro.org, ip: 209.85.208.49,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f49.google.com with SMTP id z20so7947099edc.13
        for <docs@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 04:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O8HrVtV2hS1mTweBJ+xt8wwlEHbsYU5GZEXPqw2J+CI=;
        b=Y7H9xeRECAkpE0oF7P+Izw88Dj2ctz8SUZcuhwL+C+psVCX/kcayA3oGBgqKQ9/fCB
         XT67ZDIKC9mEJFMimjVH6evPbHsNn3fK0I4cYh/fvyM6JE7u0AFY6aM36gkh08wq6Z3P
         8yvRyiU0HKTfBTd1/mLNscONysVW26fGcM6Vgp6SSfKs7cBdWSriwlTTQagPN2TEZu/D
         YSlDStElg3Dq2herMbZp0/Drvf1SNcvww0/uLYji5rDOglEmKl8mTubjTQ4DNCuDmkvi
         tdJPblWVJfDqIhZ4W4KTyesoLjaoU9nq61S/8zSfE7Fe62j/hdD4Mty9Mswi3PfnNE38
         PSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O8HrVtV2hS1mTweBJ+xt8wwlEHbsYU5GZEXPqw2J+CI=;
        b=KgQ4swBYm4Oxxe6J8XWBAZmKs1Cxo3YZyZQyTMM44my/2EsiOAPoiug5fLf9AGqXuG
         dfzeuYhOeR1f6FT8D76b2vABIbtZs2syrWtarrdp6xkw3AKS6kKwoAyED1ohkVvIt4fi
         0tcKP50swaoUr3OZGdk2zYsMgL1Ibec6vcrORxqx3W37jSqw2BOMHnliwA7H9C9G9cKg
         jHv0Rytvt9wiS2jQmByCAvd/MWZgjPLt93DqtbKaVl0dtmtHMULfTruxQYUG/FkRlNXv
         cQKwF8OAHDqBHWHVdA69po+XYHtjfCnVDNp5zaoQYKXo178mtmK5vaWdcv4m9yb8C5vg
         UeIg==
X-Gm-Message-State: AOAM531znHBckU6W3o88WLzoSUWP3pF4xUUy9fW9ZMjkW5Q6SXaHEUac
	UR7kqnXifQeOXr+iP9uhdD6Q6ik7cL+IBcnWluA3TQ==
X-Google-Smtp-Source: 
 ABdhPJwEUI7QctdrbEhNKSsQ8UzV/85A3dv5pO3XO8k7OiyrE8y8nelz0Mt69qL6LP9LABIiIk8z7w83wNOgNc5GOSg=
X-Received: by 2002:a05:6402:520b:: with SMTP id
 s11mr21104848edd.213.1635939486258;
 Wed, 03 Nov 2021 04:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <f9c8e642-a6d1-afbe-247c-39ac1db60a0c@bootlin.com>
 <20211103093533.prsusa5rblbmqset@fedora>
 <fb3b31c1-f4a1-961d-292f-db932ef2c787@bootlin.com>
 <CAP71Wjy8m+rJbWo2p_RBiLrzOgVoFScSn3XX3yHSeCP8zS0SNw@mail.gmail.com>
 <955b3fc96a77c72e505aa6ebdb3ce36656d70940.camel@linuxfoundation.org>
In-Reply-To: 
 <955b3fc96a77c72e505aa6ebdb3ce36656d70940.camel@linuxfoundation.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 3 Nov 2021 12:37:55 +0100
Message-ID: 
 <CAP71WjyG1_52rk9gkmn7nuuf8bNML6JT1ReRTkXYvzgU3Heypg@mail.gmail.com>
Subject: Re: [docs] Variable documentation overlap between Yocto and Bitbake
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000f3ee1a05cfe0d76f"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Nov 2021 11:38:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2077

--000000000000f3ee1a05cfe0d76f
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 3, 2021 at 12:29 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-11-03 at 12:24 +0100, Nicolas Dechesne wrote:
> > hey!
> >
> > On Wed, Nov 3, 2021 at 11:46 AM Michael Opdenacker
> > <michael.opdenacker@bootlin.com> wrote:
> > > Hi Quentin,
> > >
> > > Thanks for your suggestions!
> > >
> > > On 11/3/21 10:35 AM, Quentin Schulz wrote:
> > > > Hi Michael,
> > > >
> > > > On Tue, Nov 02, 2021 at 08:06:21PM +0100, Michael Opdenacker wrote:
> > > > > Greetings,
> > > > >
> > > > > Following recent discussions, I realize that the "gitsm" fetcher
> (Git
> > > > > Submodule) is not documented yet in the description of SRC_URI.
> > > > >
> > > > > However, shall I add this to both Yocto Project and Bitbake
> > > > > documentation, which both describe SRC_URI? There's a lot of
> overlap
> > > > > between the two, by the way, and this makes me uncomfortable.
> > >
> >
> >
> > This is a good catch.
> >
> > > > >
> > > > > Could there be a clean way to document all the common stuff in
> Bitbake's
> > > > > documentation, and only OE core's specific options in Yocto docs?
> I'm
> > > > > thinking about options such as "striplevel" that are implemented
> only in
> > > > > OE core...
> > > > >
> > > > What I'd like to see personally is removal of duplicates and have
> > > > entries in the glossary for terms defined in the bitbake docs. Since
> the
> > > > objects.inv from bitbake docs only does a mapping between references
> and
> > > > URL... I guess we can only add URLs to YP docs variables glossary.
> > >
> >
> >
> > Since we are at the beginning of the dev cycle (and the next release is
> an
> > LTS..) how about we discuss again how the bitbake manual is integrated
> into
> > yp-docs. I agree that having such duplicate is a bad user experience.
> >
> > I know we want bitbake and yp-docs to be separate repo, but should we
> try to
> > combine them together when we create/publish the YP docs in a more
> efficient
> > manner. Without going as far as merging the 2 repos, perhaps we could
> use a
> > git submodule in yp-docs, and embed bitbake docs without using the
> intersphinx
> > extension, e.g. directly.
> >
> > e.g. I've tested this, and it seems to work well:
> >
> > --- a/documentation/index.rst
> > +++ b/documentation/index.rst
> > @@ -34,7 +34,7 @@ Welcome to the Yocto Project Documentation
> >     Application Development and the Extensible SDK (eSDK)
> <sdk-manual/index>
> >     Toaster Manual <toaster-manual/index>
> >     Test Environment Manual <test-manual/index>
> > -   bitbake
> > +   bitbake/doc/index
> >
> >  .. toctree::
> >     :maxdepth: 1
> >
> > after cloning bitbake repo in yp-docs/documentation.
> >
> > I am well aware that bitbake doc can be standalone too, but we could
> still
> > publish bitbake docs independently like we do today. Btw, looking at the
> new
> > index (using the submodule) I can see 64 duplicate entries ;)
>
> How does the combined poky repo look where it contains both bitbake and
> yocto-
> docs?
>

Right. That's another idea. I think sphinx needs everything in the same top
level folder. let me check. But that could be fixed with a symlink in the
worst case. In fact Poky already combines oe-core, yp-docs and bitbake.. so
pushing the generation of docs.yp.org there might make sense..


>
> I understand why the submodule makes this bit easy, it just pushes a load
> of
> problems to other places (such as the CI, release tarball generation,
> combo-
> layer and probably other issues) :/.
>
> Cheers,
>
> Richard
>
>

--000000000000f3ee1a05cfe0d76f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 12:29 PM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Wed, 2021-11-03 at 12:24 +0100, Nicolas Deche=
sne wrote:<br>
&gt; hey!<br>
&gt; <br>
&gt; On Wed, Nov 3, 2021 at 11:46 AM Michael Opdenacker<br>
&gt; &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com" target=3D"_blank=
">michael.opdenacker@bootlin.com</a>&gt; wrote:<br>
&gt; &gt; Hi Quentin,<br>
&gt; &gt; <br>
&gt; &gt; Thanks for your suggestions!<br>
&gt; &gt; <br>
&gt; &gt; On 11/3/21 10:35 AM, Quentin Schulz wrote:<br>
&gt; &gt; &gt; Hi Michael,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On Tue, Nov 02, 2021 at 08:06:21PM +0100, Michael Opdenacker=
 wrote:<br>
&gt; &gt; &gt; &gt; Greetings,<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Following recent discussions, I realize that the &quot;=
gitsm&quot; fetcher (Git<br>
&gt; &gt; &gt; &gt; Submodule) is not documented yet in the description of =
SRC_URI.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; However, shall I add this to both Yocto Project and Bit=
bake<br>
&gt; &gt; &gt; &gt; documentation, which both describe SRC_URI? There&#39;s=
 a lot of overlap<br>
&gt; &gt; &gt; &gt; between the two, by the way, and this makes me uncomfor=
table.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; This is a good catch.=C2=A0<br>
&gt; =C2=A0<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Could there be a clean way to document all the common s=
tuff in Bitbake&#39;s<br>
&gt; &gt; &gt; &gt; documentation, and only OE core&#39;s specific options =
in Yocto docs? I&#39;m<br>
&gt; &gt; &gt; &gt; thinking about options such as &quot;striplevel&quot; t=
hat are implemented only in<br>
&gt; &gt; &gt; &gt; OE core...<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; What I&#39;d like to see personally is removal of duplicates=
 and have<br>
&gt; &gt; &gt; entries in the glossary for terms defined in the bitbake doc=
s. Since the<br>
&gt; &gt; &gt; objects.inv from bitbake docs only does a mapping between re=
ferences and<br>
&gt; &gt; &gt; URL... I guess we can only add URLs to YP docs variables glo=
ssary.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Since we are at the beginning of the dev cycle (and the next release i=
s an<br>
&gt; LTS..) how about we discuss again how the bitbake manual is integrated=
 into<br>
&gt; yp-docs. I agree that having such duplicate is a bad user experience.=
=C2=A0<br>
&gt; <br>
&gt; I know we want bitbake and yp-docs to be separate repo, but should we =
try to<br>
&gt; combine them together when we create/publish the YP docs in a more eff=
icient<br>
&gt; manner. Without going as far as merging the 2 repos, perhaps we could =
use a<br>
&gt; git submodule in yp-docs, and embed bitbake docs without using the int=
ersphinx<br>
&gt; extension, e.g. directly.=C2=A0<br>
&gt; <br>
&gt; e.g. I&#39;ve tested this, and it seems to work well:<br>
&gt; <br>
&gt; --- a/documentation/index.rst<br>
&gt; +++ b/documentation/index.rst<br>
&gt; @@ -34,7 +34,7 @@ Welcome to the Yocto Project Documentation<br>
&gt; =C2=A0 =C2=A0 Application Development and the Extensible SDK (eSDK) &l=
t;sdk-manual/index&gt;<br>
&gt; =C2=A0 =C2=A0 Toaster Manual &lt;toaster-manual/index&gt;<br>
&gt; =C2=A0 =C2=A0 Test Environment Manual &lt;test-manual/index&gt;<br>
&gt; - =C2=A0 bitbake<br>
&gt; + =C2=A0 bitbake/doc/index<br>
&gt; =C2=A0<br>
&gt; =C2=A0.. toctree::<br>
&gt; =C2=A0 =C2=A0 :maxdepth: 1<br>
&gt; =C2=A0<br>
&gt; after cloning bitbake repo in yp-docs/documentation.<br>
&gt; <br>
&gt; I am well aware that bitbake doc can be standalone too, but we could s=
till<br>
&gt; publish bitbake docs independently like we do today. Btw, looking at t=
he new<br>
&gt; index (using the submodule) I can see 64 duplicate entries ;)<br>
<br>
How does the combined poky repo look where it contains both bitbake and yoc=
to-<br>
docs?<br></blockquote><div><br></div><div>Right. That&#39;s another idea. I=
 think sphinx needs everything in the same top level folder. let me check. =
But that could be fixed with a symlink in the worst case. In fact Poky alre=
ady combines oe-core, yp-docs and bitbake.. so pushing the generation of <a=
 href=3D"http://docs.yp.org">docs.yp.org</a> there might make sense..=C2=A0=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I understand why the submodule makes this bit easy, it just pushes a load o=
f<br>
problems to other places (such as the CI, release tarball generation, combo=
-<br>
layer and probably other issues) :/.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000f3ee1a05cfe0d76f--

