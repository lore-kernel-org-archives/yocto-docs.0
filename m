Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047EBC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 09:31:18 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web08.11448.1632821477489643741
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 02:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fc6a8hxR;
 spf=pass (domain: gmail.com, ip: 209.85.217.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id n17so21296596vsr.10
        for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 02:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xbfuphGZBga+8PTy8zgeQoU0ebD0b+8oMkkzrOe2uGY=;
        b=fc6a8hxRCjXyL2QTAce1P0uY0y5nZ8Va4eYZGxbBhDYbTXGmnb2pxdmJ2OukE0H7+z
         SY6FOTFO1KvCoSuRT+q8jgdFR7PM+5IHl0e0EDLjZdBfaMyVwTo/AlSx4PIrWUa1epQm
         OXXAl3XwgUrj0U3ekRTjiZNwTEvi40vC1ehUjTTWXegH+Lsz+ezLlPAXdkscm3uOa0O/
         wQPpi8kuHdkt41R4kxZyH7Zl86rxZ4Zf3jYLiHoZGg5LUFLnRkOYlmGKGJr/EovXV3Yz
         E9C9W73NlMyIdOIm5rK0Y5zKZ+BHGv4sfUObaVhlDGkm6+Esmb0d5Bjmj5HjZtKUafFo
         JWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xbfuphGZBga+8PTy8zgeQoU0ebD0b+8oMkkzrOe2uGY=;
        b=E7P3x9FIgV6SRHuvOBS2MEQRMtbMvNvIrkaRStgMDmPulkYoMbyhZpM5S3KHHNmxRL
         TAr6EGhXcu+yEe5XkK8TcY/0iS7pUEurjpi7SL7TcLoEKq0H7+Zv5bwbm4UXBIKmMciV
         F2kRhdGZeRwKGhh9RQkhGwhHfWevquCYQNgF2VAbJw9Zv8KW06n+lJigJO1XC1aoWQf4
         Ny8wVDH9/51yQn+RiuoZIm8MrTuJUYYjk4jX2/8lDy9Kzcur2BrzGHKJvd9XQ9U1O3xN
         1lqxRZa4vOWBdhBfPGl3vA7NSSYLDwpSomd+kbq4kmZrRtFu97Zu6SCsA4B0QRD+j0/d
         8kpg==
X-Gm-Message-State: AOAM532HtSgU6LzvK7rEw3ps+ZTQ8Mo5/JB4jPRR68ng5AzWha/dECIN
	qY3/41xUjN55UR65WxNDiWWXR0q9TygNft/7v1Y=
X-Google-Smtp-Source: 
 ABdhPJxZUilik9xPs2okozVggQtrVvBdBkbEMSwkSXTfG4iMqLn7VmjxO8frPaa2JiWJeKA+06x5MCNHRzPTiFAfT5s=
X-Received: by 2002:a67:bb04:: with SMTP id m4mr4024505vsn.18.1632821476534;
 Tue, 28 Sep 2021 02:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <f08d3e1d-97f5-d29-4764-e019205bbf47@crashcourse.ca>
In-Reply-To: <f08d3e1d-97f5-d29-4764-e019205bbf47@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Sep 2021 11:31:04 +0200
Message-ID: 
 <CANNYZj-vYUZ=vdBCgDRJop+2C0nW_-B1w_PS4mkeqSCoQ4b+6w@mail.gmail.com>
Subject: Re: [docs] possibly rewriting the "shared state" section (and
 others?)
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000172e4b05cd0ae093"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Sep 2021 09:31:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1897

--000000000000172e4b05cd0ae093
Content-Type: text/plain; charset="UTF-8"

Just a general thought that I've often been frustrated by documentation
(especially manpages) that thinks it's a good idea to drown the reader in
rigorous definitions of the API, syntax and inner workings before getting
to actual examples (and most people learn by examples, fact).

Every document should start with a TL;DR section (not necessarily named so).

Alex

On Tue, 28 Sept 2021 at 11:14, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   pursuant to my tripping over a typo in the shared state section:
>
>
> http://docs.yoctoproject.org/overview-manual/concepts.html#shared-state-cache
>
>   it seems like that section (and many others) are unnecessarily
> cumbersome far too early, in the sense of explaining the underlying
> mechanics before simply telling the reader how to do something. case
> in point: you need to read to almost the end of the whole section to
> see a simple example of how to use SSTATE_MIRRORS.
>
>   it seems like it should be the other way around -- "how can i save
> all my sstate elsewhere on my disk to save piles of time?". here's an
> example. *then* you back up and get into the intricacies. so let me
> ask a couple (admittedly trivial) questions to make sure i grok this
> and i'll ponder submitting some changes.
>
>   in the sense of saving sstate-cache elsewhere on disk, it appears
> that doing a simple "cp -a" or "mv" will do it, at which time i can
> just set SSTATE_MIRRORS appropriately.
>
>   first question: if i start from scratch and build a generic image
> like "core-image-base", then save all sstate elsewhere, set
> SSTATE_MIRRORS, delete tmp/ and build again, should i get *all* of my
> build content from sstate? (unless there are recipes that explicitly
> indicate they must be re-run no matter what?) i'm going to test this
> right away building systemd-based core-image-base for aarch64 to see
> what happens.
>
>   second: as i extend my image, i will occasionally add a recipe that
> has no saved sstate, so it will be built and sstate saved locally in
> SSTATE_DIR in the build directory. if i want to add that to my global
> sstate, is it just a matter of a simple "rsync" or something similar?
>
>   last: i am simply assuming that it's probably a bad idea to set
> SSTATE_DIR and SSTATE_MIRRORS to the same location trying to be
> clever, because i'd want to have a mostly read-only SSTATE_MIRRORS to
> be shared among developers, and not allow everyone to dump stuff in
> there arbitrarily.
>
>   thoughts?
>
> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1896):
> https://lists.yoctoproject.org/g/docs/message/1896
> Mute This Topic: https://lists.yoctoproject.org/mt/85920423/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000172e4b05cd0ae093
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just a general thought that I&#39;ve often been frust=
rated by documentation (especially manpages) that thinks it&#39;s a good id=
ea to drown the reader in rigorous definitions of the API, syntax and inner=
 workings before getting to actual examples (and most people learn by examp=
les, fact).</div><div><br></div><div>Every document should start with a TL;=
DR section (not necessarily named so).</div><div><br></div><div>Alex<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, 28 Sept 2021 at 11:14, Robert P. J. Day &lt;<a href=3D"mailto:rp=
jday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><br>
=C2=A0 pursuant to my tripping over a typo in the shared state section:<br>
<br>
<a href=3D"http://docs.yoctoproject.org/overview-manual/concepts.html#share=
d-state-cache" rel=3D"noreferrer" target=3D"_blank">http://docs.yoctoprojec=
t.org/overview-manual/concepts.html#shared-state-cache</a><br>
<br>
=C2=A0 it seems like that section (and many others) are unnecessarily<br>
cumbersome far too early, in the sense of explaining the underlying<br>
mechanics before simply telling the reader how to do something. case<br>
in point: you need to read to almost the end of the whole section to<br>
see a simple example of how to use SSTATE_MIRRORS.<br>
<br>
=C2=A0 it seems like it should be the other way around -- &quot;how can i s=
ave<br>
all my sstate elsewhere on my disk to save piles of time?&quot;. here&#39;s=
 an<br>
example. *then* you back up and get into the intricacies. so let me<br>
ask a couple (admittedly trivial) questions to make sure i grok this<br>
and i&#39;ll ponder submitting some changes.<br>
<br>
=C2=A0 in the sense of saving sstate-cache elsewhere on disk, it appears<br=
>
that doing a simple &quot;cp -a&quot; or &quot;mv&quot; will do it, at whic=
h time i can<br>
just set SSTATE_MIRRORS appropriately.<br>
<br>
=C2=A0 first question: if i start from scratch and build a generic image<br=
>
like &quot;core-image-base&quot;, then save all sstate elsewhere, set<br>
SSTATE_MIRRORS, delete tmp/ and build again, should i get *all* of my<br>
build content from sstate? (unless there are recipes that explicitly<br>
indicate they must be re-run no matter what?) i&#39;m going to test this<br=
>
right away building systemd-based core-image-base for aarch64 to see<br>
what happens.<br>
<br>
=C2=A0 second: as i extend my image, i will occasionally add a recipe that<=
br>
has no saved sstate, so it will be built and sstate saved locally in<br>
SSTATE_DIR in the build directory. if i want to add that to my global<br>
sstate, is it just a matter of a simple &quot;rsync&quot; or something simi=
lar?<br>
<br>
=C2=A0 last: i am simply assuming that it&#39;s probably a bad idea to set<=
br>
SSTATE_DIR and SSTATE_MIRRORS to the same location trying to be<br>
clever, because i&#39;d want to have a mostly read-only SSTATE_MIRRORS to<b=
r>
be shared among developers, and not allow everyone to dump stuff in<br>
there arbitrarily.<br>
<br>
=C2=A0 thoughts?<br>
<br>
rday<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#1896): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/1896" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/1896</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/85920423/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/85920423/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000172e4b05cd0ae093--

