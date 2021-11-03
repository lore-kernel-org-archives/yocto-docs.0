Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DF5C433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 11:25:09 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.6259.1635938708676316400
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 04:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=I/p47rdO;
 spf=pass (domain: linaro.org, ip: 209.85.208.48,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f48.google.com with SMTP id f8so7963671edy.4
        for <docs@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 04:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VT8gPuwrd2ddkj1f4PSa5Aszbj/HlakkHw4zHTRYP5Q=;
        b=I/p47rdOpLWU4caX03ozwZaaYYX1qFlQ5eRnnAfGaGwESnI0Cmi7D00PYdodjAEM8W
         +h66/Z901B18iSzfKWegErokDOd6irsJSKUVT9K6NdbHjRa4nEDd4wHoaIGeuq/scuA5
         1Apzs64nZI0PP+OeDxboqvcXt+vbg0Y+m13EsaCUztbnwh90vK8FvhBAavh7PGDAyrt1
         pZrSQDyGhqn28BuOdwzUh1XQ6wSrjSJBJo3hWliGDzV3qppO1Kk43Camni81TYo99wGs
         +Z+utsLqi3W0y8Ajl+na9XwTLKJRxf1wnzoZMbtpq0uZcIMHmcj4jx475j8C/H68H7nR
         tgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VT8gPuwrd2ddkj1f4PSa5Aszbj/HlakkHw4zHTRYP5Q=;
        b=dCYChktTYxhlRN68UJhUzE2djGMdUBjEjZUdBIwxaSpLCQ/1glNPv1OANs+6+QQQ2d
         KXBVjzonWg6oH2IeGfvzjPhcDxTLDnqPTaiCgIQKB2/9zNujJxH9NDrnh8Ptvduf/53Z
         Rn5idCh9hNs15B0MTfIpyufx6rsBkiqdnw2fit3O5Qeje6lbgBwxCJ5UMeWcvIs0TZq3
         XoPesGYWOYroChgOdfyRqn14iNT0twDK51VFpFqVyRYFMMbGenG/OkjyOyzDaQGjG0IE
         bpIBk79jwsextGcUIp12x/R0k2NU9RifAtFWM3UxaQRZYlHv+nBKvKUuJBImQZl5Pskb
         qCVg==
X-Gm-Message-State: AOAM530ROXVIZwW4VhLCqXH6ISfMUgHXu/oVayGICpGtlrjhkCK7kAur
	s2BYwA/NpvuLZCU62bL01WeuF+fHVlqZzQGeBj+DGg==
X-Google-Smtp-Source: 
 ABdhPJzyvV1UZx7HqqZOhDKDerE3biF184RKlCsSzAIXl1apFP2ChPlgJ95Y6lAnh4WLiBllltNuQcFRiuPLhb5wGqw=
X-Received: by 2002:a17:906:d552:: with SMTP id
 cr18mr54785895ejc.88.1635938706788;
 Wed, 03 Nov 2021 04:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <f9c8e642-a6d1-afbe-247c-39ac1db60a0c@bootlin.com>
 <20211103093533.prsusa5rblbmqset@fedora>
 <fb3b31c1-f4a1-961d-292f-db932ef2c787@bootlin.com>
In-Reply-To: <fb3b31c1-f4a1-961d-292f-db932ef2c787@bootlin.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 3 Nov 2021 12:24:55 +0100
Message-ID: 
 <CAP71Wjy8m+rJbWo2p_RBiLrzOgVoFScSn3XX3yHSeCP8zS0SNw@mail.gmail.com>
Subject: Re: [docs] Variable documentation overlap between Yocto and Bitbake
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000007e2e6305cfe0a9d8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Nov 2021 11:25:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2075

--0000000000007e2e6305cfe0a9d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hey!

On Wed, Nov 3, 2021 at 11:46 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Quentin,
>
> Thanks for your suggestions!
>
> On 11/3/21 10:35 AM, Quentin Schulz wrote:
> > Hi Michael,
> >
> > On Tue, Nov 02, 2021 at 08:06:21PM +0100, Michael Opdenacker wrote:
> >> Greetings,
> >>
> >> Following recent discussions, I realize that the "gitsm" fetcher (Git
> >> Submodule) is not documented yet in the description of SRC_URI.
> >>
> >> However, shall I add this to both Yocto Project and Bitbake
> >> documentation, which both describe SRC_URI? There's a lot of overlap
> >> between the two, by the way, and this makes me uncomfortable.
>

This is a good catch.


> >>
> >> Could there be a clean way to document all the common stuff in Bitbake=
's
> >> documentation, and only OE core's specific options in Yocto docs? I'm
> >> thinking about options such as "striplevel" that are implemented only =
in
> >> OE core...
> >>
> > What I'd like to see personally is removal of duplicates and have
> > entries in the glossary for terms defined in the bitbake docs. Since th=
e
> > objects.inv from bitbake docs only does a mapping between references an=
d
> > URL... I guess we can only add URLs to YP docs variables glossary.
>

Since we are at the beginning of the dev cycle (and the next release is an
LTS..) how about we discuss again how the bitbake manual is integrated into
yp-docs. I agree that having such duplicate is a bad user experience.

I know we want bitbake and yp-docs to be separate repo, but should we try
to combine them together when we create/publish the YP docs in a more
efficient manner. Without going as far as merging the 2 repos, perhaps we
could use a git submodule in yp-docs, and embed bitbake docs without using
the intersphinx extension, e.g. directly.

e.g. I've tested this, and it seems to work well:

--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -34,7 +34,7 @@ Welcome to the Yocto Project Documentation
    Application Development and the Extensible SDK (eSDK) <sdk-manual/index=
>
    Toaster Manual <toaster-manual/index>
    Test Environment Manual <test-manual/index>
-   bitbake
+   bitbake/doc/index

 .. toctree::
    :maxdepth: 1

after cloning bitbake repo in yp-docs/documentation.

I am well aware that bitbake doc can be standalone too, but we could still
publish bitbake docs independently like we do today. Btw, looking at the
new index (using the submodule) I can see 64 duplicate entries ;)


>
> > For how to include common stuff, I guess we could give a link saying:
> > Common stuff defined in Bitbake <link>
> >
> > Here are Yp/OE specific stuff for this thing:
> > <specific stuff>
> >
> > I haven't really looked deeply into Sphinx so maybe there's something
> > possible but out of the blue, I'd just say we have links to refs to
> > other sphinx docs but nothing else.
> >
> > Just my 2=C2=A2, not really offering solutions :/
>
>
> Definitely agree with the idea. We can make a reference to
> :term:`bitbake:SRC_URI` in the Yocto docs, and add the OE specific stuff
> there. I checked that this works, and that's not complicated.
> I'll propose a patch for SRC_URI soon.
>
> Thanks again,
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2074):
> https://lists.yoctoproject.org/g/docs/message/2074
> Mute This Topic: https://lists.yoctoproject.org/mt/86774485/1279857
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> nicolas.dechesne@linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007e2e6305cfe0a9d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hey!</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 11:46 AM Michael Opdenacke=
r &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.opdenacker@=
bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Quentin,<br>
<br>
Thanks for your suggestions!<br>
<br>
On 11/3/21 10:35 AM, Quentin Schulz wrote:<br>
&gt; Hi Michael,<br>
&gt;<br>
&gt; On Tue, Nov 02, 2021 at 08:06:21PM +0100, Michael Opdenacker wrote:<br=
>
&gt;&gt; Greetings,<br>
&gt;&gt;<br>
&gt;&gt; Following recent discussions, I realize that the &quot;gitsm&quot;=
 fetcher (Git<br>
&gt;&gt; Submodule) is not documented yet in the description of SRC_URI.<br=
>
&gt;&gt;<br>
&gt;&gt; However, shall I add this to both Yocto Project and Bitbake<br>
&gt;&gt; documentation, which both describe SRC_URI? There&#39;s a lot of o=
verlap<br>
&gt;&gt; between the two, by the way, and this makes me uncomfortable.<br><=
/blockquote><div><br></div><div>This is a good catch.=C2=A0</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt;<br>
&gt;&gt; Could there be a clean way to document all the common stuff in Bit=
bake&#39;s<br>
&gt;&gt; documentation, and only OE core&#39;s specific options in Yocto do=
cs? I&#39;m<br>
&gt;&gt; thinking about options such as &quot;striplevel&quot; that are imp=
lemented only in<br>
&gt;&gt; OE core...<br>
&gt;&gt;<br>
&gt; What I&#39;d like to see personally is removal of duplicates and have<=
br>
&gt; entries in the glossary for terms defined in the bitbake docs. Since t=
he<br>
&gt; objects.inv from bitbake docs only does a mapping between references a=
nd<br>
&gt; URL... I guess we can only add URLs to YP docs variables glossary.<br>=
</blockquote><div><br></div><div>Since we are at the beginning of the dev c=
ycle (and the next release is an LTS..) how about we discuss again how the =
bitbake manual is integrated into yp-docs. I agree that having such duplica=
te is a bad user experience.=C2=A0</div><div><br></div><div>I know we want =
bitbake and yp-docs to be separate repo, but should we try to combine them =
together when we create/publish the YP docs in a more efficient manner. Wit=
hout going as far as merging the 2 repos, perhaps we could use a git submod=
ule in yp-docs, and embed bitbake docs without using the intersphinx extens=
ion, e.g. directly.=C2=A0</div><div><br></div><div>e.g. I&#39;ve tested thi=
s, and it seems to work well:</div><div><br></div><div>--- a/documentation/=
index.rst<br>+++ b/documentation/index.rst<br>@@ -34,7 +34,7 @@ Welcome to =
the Yocto Project Documentation<br>=C2=A0 =C2=A0 Application Development an=
d the Extensible SDK (eSDK) &lt;sdk-manual/index&gt;<br>=C2=A0 =C2=A0 Toast=
er Manual &lt;toaster-manual/index&gt;<br>=C2=A0 =C2=A0 Test Environment Ma=
nual &lt;test-manual/index&gt;<br>- =C2=A0 bitbake<br>+ =C2=A0 bitbake/doc/=
index<br>=C2=A0<br>=C2=A0.. toctree::<br>=C2=A0 =C2=A0 :maxdepth: 1<br></di=
v><div>=C2=A0</div><div>after cloning bitbake repo in yp-docs/documentation=
.</div><div><br></div><div>I am well aware that bitbake doc can be standalo=
ne too, but we could still publish bitbake docs independently like we do to=
day. Btw, looking at the new index (using the submodule) I can see 64 dupli=
cate entries ;)</div><div><br></div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
&gt;<br>
&gt; For how to include common stuff, I guess we could give a link saying:<=
br>
&gt; Common stuff defined in Bitbake &lt;link&gt;<br>
&gt;<br>
&gt; Here are Yp/OE specific stuff for this thing:<br>
&gt; &lt;specific stuff&gt;<br>
&gt;<br>
&gt; I haven&#39;t really looked deeply into Sphinx so maybe there&#39;s so=
mething<br>
&gt; possible but out of the blue, I&#39;d just say we have links to refs t=
o<br>
&gt; other sphinx docs but nothing else.<br>
&gt;<br>
&gt; Just my 2=C2=A2, not really offering solutions :/<br>
<br>
<br>
Definitely agree with the idea. We can make a reference to<br>
:term:`bitbake:SRC_URI` in the Yocto docs, and add the OE specific stuff<br=
>
there. I checked that this works, and that&#39;s not complicated.<br>
I&#39;ll propose a patch for SRC_URI soon.<br>
<br>
Thanks again,<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2074): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2074" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2074</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/86774485/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/86774485/1279857</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicol=
as.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007e2e6305cfe0a9d8--

