Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.4147.1608105162844947192
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 23:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CVT6Cb3z;
 spf=pass (domain: linaro.org, ip: 209.85.218.49, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f49.google.com with SMTP id ce23so31345851ejb.8
        for <docs@lists.yoctoproject.org>; Tue, 15 Dec 2020 23:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+TQWG8txRlfmXIYsWIAjlimkkn/FGD9iwV/qkF6MyrE=;
        b=CVT6Cb3z7AHYkKFynjHc2r+QHpiz3W54ItfUfCzHluJIhrqyvDl+3fXXt5i/mNHwTp
         8V/ep0ePqt3TwlUJLsJeOl2l1RX9s27KotaqSKVg7+R4eiQp5pt6bB2vxYFFYk8Zz5K0
         OIa2wfvPoMK3Az/LqZyWN3PX2+6rOMI8q7V4VShtXMdHucLjkt1CeEvU2a6aht6pXzA3
         Y8L/0VjpH9ndVYsBDpXP+dfw6vf6GGNOEL6WM/dXev5Drr+pnaRRtw7egLejAPxzb24+
         0jz5oqND8HFSF79Q62tbRSi64inriu9lgpkkH59mQHPpQ0ePezEv543XBZgQ6jC7SFYl
         SybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+TQWG8txRlfmXIYsWIAjlimkkn/FGD9iwV/qkF6MyrE=;
        b=nyx5LVHH++SHsj43OD5PNEa8U7KYOyKmWgLfAiHosRA7zGNkpSxb0dxTDPD58C0KAi
         ARpoqPVJD6MNFs5hc0zXG/Q3C9uibC8azaq+Ftmbw88FQqecQiqJ6dp+4ww/Y5p3omsP
         lxyUlZMsT2RpAtOmoWQZ9fQQca2I4vNu2DRbyeF52sqrbtlsjEiBQidRry4210Ar5YvH
         GKPP0OgpU0uVUyxSBD3ZFUexO1L5UOViwsIXxGN9aGOTORIgx1UzYOh5P+kMHnbWvlAu
         vT8Dl02IdkL/iugZo/oOEv/QEu1wRIny3dRMOT2Pdn36M0gv6Fs62/GhXawZpt4o9A89
         W2ng==
X-Gm-Message-State: AOAM5303dh4pc1eUmNCKBHu91adqyZqDpsURlx04H6TmK1lpddaEV2d6
	fnWMbebOPO1GSFo9KGjBofk9pSG6kPAvA/Pea81Yxw==
X-Google-Smtp-Source: ABdhPJzEzsd1FE4vfg83+gbs4ddWTt6GX7vH67BdDzSutRC8a1gqZ5QuGAyi4cWqBKhIwYa7TVBXrCAtTiiqZ7cPvN0=
X-Received: by 2002:a17:906:3a98:: with SMTP id y24mr4581172ejd.436.1608105161300;
 Tue, 15 Dec 2020 23:52:41 -0800 (PST)
MIME-Version: 1.0
References: <CAP71WjwM3+3SwN9XRO4Cthur7iwQB0O2bKBSh3VQXkGZbYUYWA@mail.gmail.com>
 <3f2097a08c323b05c32013bc0d7f84c1142f0838.camel@linuxfoundation.org> <CAOSpxdaLCD+5HLLuwpoCCvX_xBSZasNYg4JsOKx7Ys3xqAuySw@mail.gmail.com>
In-Reply-To: <CAOSpxdaLCD+5HLLuwpoCCvX_xBSZasNYg4JsOKx7Ys3xqAuySw@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 16 Dec 2020 08:52:30 +0100
Message-ID: <CAP71Wjzkq+BZPCOqx7CWvNKy8kg25j4BwWc6Nc0iW_nKTstmww@mail.gmail.com>
Subject: Re: Sphinx 'backport' for Dunfell LTS
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000e6ba3905b690285e"

--000000000000e6ba3905b690285e
Content-Type: text/plain; charset="UTF-8"

hi Steve,

On Tue, Nov 24, 2020 at 12:56 AM Steve Sakoman <steve@sakoman.com> wrote:

>
>
> On Mon, Nov 23, 2020, 12:59 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Fri, 2020-11-20 at 23:20 +0100, Nicolas Dechesne wrote:
>> > I think I am "done" with the 'backport' of Sphinx docs in both
>> > yocto-docs and bitbake. The backport process isn't straightforward..
>> > here is what I did in each case:
>> >
>> > 1. take all sphinx commits from master branch and squash them into
>> > dunfell. that's a large commit that brings sphinx and removes
>> > docbook.
>> > 2. because of #1 there are changes that we 'imported' which needed to
>> > be undo'd (e.g. a doc change that was applied to master, but is not
>> > needed in dunfell). To get the list of such changes, I look at each
>> > patch in dunfell vs master.
>> > 3. in yocto-docs, I had to 'revert' some patches first before I could
>> > cherry-pick all the sphinx changes, and I have then 're-applied' the
>> > changes later in the branch (of course when I say re-apply, i mean i
>> > did it again in sphinx instead of docbook)
>> > 4. Then I took as many patches as possible from 'master' which apply
>> > to dunfell.
>> >
>> > I understand this is a complex 'merge', and I must admit I have gone
>> > back and forth on whether we should do it..  I couldn't find a
>> > simpler
>> > way, but if we merge it and use Sphinx for the next LTS release
>> > (3.1.5), then all active releases docs would now be based on Sphinx.
>> >
>> > I have pushed the branches here:
>> >
>> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?h=sphinx&id=488a421fea826a2cff27dd009768430769f25ab0
>> > and
>> >
>> https://git.openembedded.org/bitbake/commit/?h=sphinx&id=fe9dde75fa55da08fddd0cce778d3eb6303b2124
>> >
>> > It's rather inconvenient to review the series by email (the first
>> > patch is huge), But we can discuss here..
>> >
>> > enjoy... or not ;)
>>
>> Thanks for working on this. I'm in favour of merging and then handling
>> any issues we find as they arise...
>>
>> Steve: How/when do we want to do this?
>>
>
> Let's do the merge right after the 3.1.4 release.  I'll be sending the
> final pull request for that later today.
>

Where do we stand with this? Are you still planning to merge the Sphinx
patches in dunfell branch (before 3.1.5)?


>
> Steve
>
>
>
>> Cheers,
>>
>> Richard
>>
>>

--000000000000e6ba3905b690285e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi Steve,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 12:56 AM Steve Sakom=
an &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"au=
to"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Nov 23, 2020, 12:59 PM Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Fri, 2020-11-20 at 23:20 +0100, Nicolas Dechesne wrote:<br>
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
&#39;ll be sending the final pull request for that later today.</div></div>=
</div></blockquote><div><br></div><div>Where do we stand with this? Are you=
 still planning to merge the Sphinx patches in dunfell branch (before 3.1.5=
)?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"auto"><div dir=3D"auto"><div dir=3D"auto" style=3D"font-family:=
sans-serif"><br></div><div dir=3D"auto" style=3D"font-family:sans-serif">St=
eve</div><div dir=3D"auto" style=3D"font-family:sans-serif"><br></div><div =
dir=3D"auto" style=3D"font-family:sans-serif"><br></div></div><div dir=3D"a=
uto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>
</blockquote></div></div>

--000000000000e6ba3905b690285e--
