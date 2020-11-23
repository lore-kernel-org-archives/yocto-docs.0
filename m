Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.44709.1606175791721562123
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 15:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EcWzaxgf;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id bo9so20080997ejb.13
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 15:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=APVlt4vp5FSA6LLc+W7n48/KpHHrr6Uutk59yOQX2zk=;
        b=EcWzaxgfI+gElopqJFXINmKlbj+dghkxVN+34iVLCV9TWgMDwKYlnzhnIJWNDtYxKw
         VXDS2eGHdoyFLMwPVgTELikIL7wHM9B5FgOKsFfe3LPF4IlbSVTpVk1MpfFIR86WhX5H
         IKoqvLyi18kotWakGrlLsl0zZBaCOLZUEDPOlI+bVbLvwqh435lIlzAQ2U8/nzsj49cr
         mspLlvtOpHgffxgVNzJlF7tj7H/W0mCd9G+ZHydbtGzX2Z+NcsgJ/gnPAxhs8izUeJCa
         eLhB+aXnZmK3swx7D22SCqoLhN1Q1qhr62aOl66wRDlZp4qhG01pwjI5R6LyhqQ0qKog
         lU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=APVlt4vp5FSA6LLc+W7n48/KpHHrr6Uutk59yOQX2zk=;
        b=DcBXqs3aH1e+pS8t2kZeSqMXlO4U+Pj58LhiQkZEI8B9+bSP1nnTXtII7/8MnJB85a
         tRprtF6GNu5zvzE7tv8NA1iWHgvzO+Nys6QTxjxv4Q3BkHM1N2AyQqfQJc9dfnZ7c2sG
         RezXBQqw3iaBgGqkbkaQ+VmKAaETb6v++QZg1OPZYwpKdcZHZcCwgM2MjC1Q9stpdAwA
         fyu5VNHjncB8yxV+aA/zgdDZZ2D2bJQ0FlnpZm/PhvNptMpbZw9nvkdtr26thhXOvcvE
         779kejgNdj9XdA80OHlv2JgAftKCaVNDz4wk4qqETQHosGOouYm9QtYlY0v1C8j+ClXj
         1LlA==
X-Gm-Message-State: AOAM5317asa3MGVu1UomNd7gLiWm9Efor9D8T1YnM5vvy9kmmgGpl3EU
	5toNUVIjKOQJ3/WMir7k0/D4RWWFm+XUARGBMtnDow==
X-Google-Smtp-Source: ABdhPJzWi2k30spn67JuBqURGyckFOewcQJ+L6y/kkybgdSCqneJcUOk1tji27IjhcVq0Wb2Yf0p7fIHExiYTvxSofM=
X-Received: by 2002:a17:906:1e84:: with SMTP id e4mr1857126ejj.57.1606175790246;
 Mon, 23 Nov 2020 15:56:30 -0800 (PST)
MIME-Version: 1.0
References: <CAP71WjwM3+3SwN9XRO4Cthur7iwQB0O2bKBSh3VQXkGZbYUYWA@mail.gmail.com>
 <3f2097a08c323b05c32013bc0d7f84c1142f0838.camel@linuxfoundation.org>
In-Reply-To: <3f2097a08c323b05c32013bc0d7f84c1142f0838.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 23 Nov 2020 13:56:16 -1000
Message-ID: <CAOSpxdaLCD+5HLLuwpoCCvX_xBSZasNYg4JsOKx7Ys3xqAuySw@mail.gmail.com>
Subject: Re: Sphinx 'backport' for Dunfell LTS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000006cc43b05b4cef18e"

--0000000000006cc43b05b4cef18e
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020, 12:59 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2020-11-20 at 23:20 +0100, Nicolas Dechesne wrote:
> > I think I am "done" with the 'backport' of Sphinx docs in both
> > yocto-docs and bitbake. The backport process isn't straightforward..
> > here is what I did in each case:
> >
> > 1. take all sphinx commits from master branch and squash them into
> > dunfell. that's a large commit that brings sphinx and removes
> > docbook.
> > 2. because of #1 there are changes that we 'imported' which needed to
> > be undo'd (e.g. a doc change that was applied to master, but is not
> > needed in dunfell). To get the list of such changes, I look at each
> > patch in dunfell vs master.
> > 3. in yocto-docs, I had to 'revert' some patches first before I could
> > cherry-pick all the sphinx changes, and I have then 're-applied' the
> > changes later in the branch (of course when I say re-apply, i mean i
> > did it again in sphinx instead of docbook)
> > 4. Then I took as many patches as possible from 'master' which apply
> > to dunfell.
> >
> > I understand this is a complex 'merge', and I must admit I have gone
> > back and forth on whether we should do it..  I couldn't find a
> > simpler
> > way, but if we merge it and use Sphinx for the next LTS release
> > (3.1.5), then all active releases docs would now be based on Sphinx.
> >
> > I have pushed the branches here:
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?h=sphinx&id=488a421fea826a2cff27dd009768430769f25ab0
> > and
> >
> https://git.openembedded.org/bitbake/commit/?h=sphinx&id=fe9dde75fa55da08fddd0cce778d3eb6303b2124
> >
> > It's rather inconvenient to review the series by email (the first
> > patch is huge), But we can discuss here..
> >
> > enjoy... or not ;)
>
> Thanks for working on this. I'm in favour of merging and then handling
> any issues we find as they arise...
>
> Steve: How/when do we want to do this?
>

Let's do the merge right after the 3.1.4 release.  I'll be sending the
final pull request for that later today.

Steve



> Cheers,
>
> Richard
>
>

--0000000000006cc43b05b4cef18e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Nov 23, 2020, 12:59 PM Richard Purdie &lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfound=
ation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, =
2020-11-20 at 23:20 +0100, Nicolas Dechesne wrote:<br>
&gt; I think I am &quot;done&quot; with the &#39;backport&#39; of Sphinx do=
cs in both<br>
&gt; yocto-docs and bitbake. The backport process isn&#39;t straightforward=
..<br>
&gt; here is what I did in each case:<br>
&gt; <br>
&gt; 1. take all sphinx commits from master branch and squash them into<br>
&gt; dunfell. that&#39;s a large commit that brings sphinx and removes<br>
&gt; docbook.<br>
&gt; 2. because of #1 there are changes that we &#39;imported&#39; which ne=
eded to<br>
&gt; be undo&#39;d (e.g. a doc change that was applied to master, but is no=
t<br>
&gt; needed in dunfell). To get the list of such changes, I look at each<br=
>
&gt; patch in dunfell vs master.<br>
&gt; 3. in yocto-docs, I had to &#39;revert&#39; some patches first before =
I could<br>
&gt; cherry-pick all the sphinx changes, and I have then &#39;re-applied&#3=
9; the<br>
&gt; changes later in the branch (of course when I say re-apply, i mean i<b=
r>
&gt; did it again in sphinx instead of docbook)<br>
&gt; 4. Then I took as many patches as possible from &#39;master&#39; which=
 apply<br>
&gt; to dunfell.<br>
&gt; <br>
&gt; I understand this is a complex &#39;merge&#39;, and I must admit I hav=
e gone<br>
&gt; back and forth on whether we should do it..=C2=A0 I couldn&#39;t find =
a<br>
&gt; simpler<br>
&gt; way, but if we merge it and use Sphinx for the next LTS release<br>
&gt; (3.1.5), then all active releases docs would now be based on Sphinx.<b=
r>
&gt; <br>
&gt; I have pushed the branches here:<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit=
/?h=3Dsphinx&amp;id=3D488a421fea826a2cff27dd009768430769f25ab0" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.=
cgi/yocto-docs/commit/?h=3Dsphinx&amp;id=3D488a421fea826a2cff27dd0097684307=
69f25ab0</a><br>
&gt; and<br>
&gt; <a href=3D"https://git.openembedded.org/bitbake/commit/?h=3Dsphinx&amp=
;id=3Dfe9dde75fa55da08fddd0cce778d3eb6303b2124" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://git.openembedded.org/bitbake/commit/?h=3Dsphin=
x&amp;id=3Dfe9dde75fa55da08fddd0cce778d3eb6303b2124</a><br>
&gt; <br>
&gt; It&#39;s rather inconvenient to review the series by email (the first<=
br>
&gt; patch is huge), But we can discuss here..<br>
&gt; <br>
&gt; enjoy... or not ;)<br>
<br>
Thanks for working on this. I&#39;m in favour of merging and then handling<=
br>
any issues we find as they arise...<br>
<br>
Steve: How/when do we want to do this?<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div dir=3D"auto" style=3D"font-famil=
y:sans-serif">Let&#39;s do the merge right after the 3.1.4 release.=C2=A0 I=
&#39;ll be sending the final pull request for that later today.</div><div d=
ir=3D"auto" style=3D"font-family:sans-serif"><br></div><div dir=3D"auto" st=
yle=3D"font-family:sans-serif">Steve</div><div dir=3D"auto" style=3D"font-f=
amily:sans-serif"><br></div><div dir=3D"auto" style=3D"font-family:sans-ser=
if"><br></div></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--0000000000006cc43b05b4cef18e--
