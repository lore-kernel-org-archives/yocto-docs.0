Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.1485.1600188517642352318
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Sep 2020 09:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MRPVOJJr;
 spf=pass (domain: linaro.org, ip: 209.85.219.171, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f171.google.com with SMTP id c17so3167857ybe.0
        for <docs@lists.yoctoproject.org>; Tue, 15 Sep 2020 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=noAPcUV5EdhMJGdVRZOy9D35S8XPPdVbttF/pD2hsjg=;
        b=MRPVOJJrTqkSkJvVgYpfSAKO7iCov03JvhBjqb+EOVvAAexYd9bMiMcFjMQ5uBKBN4
         YduptHLvtbaMyajmPQE609uGj/kdb2V4KpUtqldzamH3GmZ5eRxZ+kqxf4Yp3FeFVU3P
         3aFF3FlcL48Qg2BvjymMXV3cVb8BbEfiTVfHMliU1fac1IaB083KaJAoJEm8SE8nfRAW
         /ILCPhMau34TqERLosJitdIt0xgoUJDlgD9hLfDpRfInLC8Px8Oc7QvqzPEzKRBTT7DX
         +czb1nsTwuKVIr+519Sf0TU0AdSuGy9Z2sKCErk9XNKo+pmrFP2zvUe0If4xUQfhTVeI
         1MVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=noAPcUV5EdhMJGdVRZOy9D35S8XPPdVbttF/pD2hsjg=;
        b=QOH1qstNO4yP/L1NUd3iWIb59n2kMPoe2f9M12SDn2U+LFHcqwN8RB0i0t1WAuZ8LX
         oG0aq5cY4liqR+YuaI2ZzAsxXd6ndTOC0BpT9a9yKBnhgpmUSQkArDr3Vt3LyzJHuy8o
         HMUEFA78pY+21KaLQE5Uf/eRH94tu4LzXmU0QcD5lzoyhbOazNk/P/X3R9S3XtaHwazn
         7NuzbydkkhF7C7iyYGLlUlkXtAYpiGXVmCuhRSFgvIbVifgXpN6KHaoBICKTbGqmCZaQ
         uhxUFJ0gCTnkTUFPdVydzElodjThfIuLtwnPztKTzJ6oP7HlJk0WzsOin5PgCgq+dQoZ
         30lw==
X-Gm-Message-State: AOAM530N6M7I/n/mN3AtnTNtxV3BY2LdQAcztLOgRrulvEzmVF/EqpeI
	f+f2fd+SgJTsgnocjf8odlsrEdaP9/+HIueMwyKq6w==
X-Google-Smtp-Source: ABdhPJzI1OViIo414fhjz2gpK3UcUy304J4POcEZpQ+hRfzALDb+2MbOSCkr94ezfB8u1arVYk4Eav+8cNCC7ZXIZHU=
X-Received: by 2002:a25:2355:: with SMTP id j82mr16851695ybj.201.1600188516590;
 Tue, 15 Sep 2020 09:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
 <16346239585A567B.3515@lists.yoctoproject.org> <16349A56620CF0CB.7642@lists.yoctoproject.org>
 <16242b3cafddcea9747bbc02bc54fc8e7426bd31.camel@linuxfoundation.org>
 <CAP71WjzF-Cq9KN1L2p-UPwMtO9yMrxTR5q+7nJSBHeYhxKFY_w@mail.gmail.com> <CANx9H-D1W=S8Jz=b6_d+D3frcqpZQkhmSHW=ZCjZ4tUMGWWpyQ@mail.gmail.com>
In-Reply-To: <CANx9H-D1W=S8Jz=b6_d+D3frcqpZQkhmSHW=ZCjZ4tUMGWWpyQ@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 15 Sep 2020 18:48:24 +0200
Message-ID: <CAP71WjxQNormFOzCsd5h3MopO4hTdn5ENgU_Wmt+UdwPJ0jQog@mail.gmail.com>
Subject: Re: [docs] [sphinx] updates as of Sep 10th.
To: Tim Orling <ticotimo@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000001afba705af5cecbf"

--0000000000001afba705af5cecbf
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 5:44 PM Tim Orling <ticotimo@gmail.com> wrote:

>
>
> On Mon, Sep 14, 2020 at 3:05 PM Nicolas Dechesne <
> nicolas.dechesne@linaro.org> wrote:
>
>>
>>
>> On Mon, Sep 14, 2020 at 5:26 PM Richard Purdie <
>> richard.purdie@linuxfoundation.org> wrote:
>>
>>> On Mon, 2020-09-14 at 09:50 +0100, Richard Purdie via
>>> lists.yoctoproject.org wrote:
>>> > On Sun, 2020-09-13 at 16:42 +0100, Richard Purdie via
>>> > lists.yoctoproject.org wrote:
>>> > > On Fri, 2020-09-11 at 00:03 +0200, Nicolas Dechesne wrote:
>>> > > > If anybody has any cycle now, we need to finish #4. The current
>>> > > > status is that:
>>> > > > * brief-yoctoprojectqs/* is done.
>>> > > > * bitbake user manual is half done, and I am doing it
>>> > > > * bsp-guide/*: i started it, and will finish
>>> > > > * ref-manual/*: RP is on it.
>>> > >
>>> > > This is done, at least as a first pass with hopefully the bulk of
>>> > > issues fixed.
>>> > >
>>> > > > * there are plenty of warnings when we build, i would like to get
>>> > > > rid
>>> > > > of them all!
>>> > > >
>>> > > > Anything else is work that remains to be done. Before starting
>>> > > > anything, please send a quick email here to let everyone know, to
>>> > > > avoid duplication. If you have any improvement, please share your
>>> > > > patches, I will take them into the sphinx/master branch. And I
>>> > > > will
>>> > > > continue to work on the remaining files that no one would pick.
>>> > >
>>> > > I'll take dev-manual/* next.
>>> >
>>> > dev-manual is on the branch, I'll look at sdk-manual next.
>>>
>>> sdk-manual is on the branch, kernel-dev is my next target.
>>>
>>
>> I am now done with bsp-guide and bitbake.  Based on Richard's last
>> comment, the remaining docs to process are:
>> overview-manual
>> profile-manual
>> test-manual
>> toaster-manual
>>
>> They are rather 'small' books. I believe Armin is looking at
>> overview-manual and Mark at test-manual. I will take profile-manual next.
>>
>
> I'll take a crack at toaster-manual today.
>

thanks!

I've finished profile-manual today. And excluded adt-manual from Sphinx
(deprecated doc). At this point, we have:
Richard on kernel-dev
Mark on test-manual
Armin on overview-manual
Tim on toaster-manual

Which means everything is now covered! Please send patches on the list for
review, and if you have any trouble with Sphinx , let me know!



> --Tim
>
>>
>> I've also updated https://docs.yoctoproject.org/ with all the latest
>> changes combined. If you can use the new website and report any issues,
>> please let us know.
>>
>>
>>> Cheers,
>>>
>>> Richard
>>>
>>> 
>>
>

--0000000000001afba705af5cecbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15, 2020 at 5:44 PM Tim O=
rling &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Sep 14, 2020 at 3:05 PM Nicolas Dech=
esne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">n=
icolas.dechesne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep=
 14, 2020 at 5:26 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On M=
on, 2020-09-14 at 09:50 +0100, Richard Purdie via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bl=
ank">lists.yoctoproject.org</a> wrote:<br>
&gt; On Sun, 2020-09-13 at 16:42 +0100, Richard Purdie via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=
=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt; &gt; On Fri, 2020-09-11 at 00:03 +0200, Nicolas Dechesne wrote:<br>
&gt; &gt; &gt; If anybody has any cycle now, we need to finish #4. The cur=
rent<br>
&gt; &gt; &gt; status is that:<br>
&gt; &gt; &gt; * brief-yoctoprojectqs/* is done.<br>
&gt; &gt; &gt; * bitbake user manual is half done, and I am doing it<br>
&gt; &gt; &gt; * bsp-guide/*: i started it, and will finish<br>
&gt; &gt; &gt; * ref-manual/*: RP is on it.<br>
&gt; &gt; <br>
&gt; &gt; This is done, at least as a first pass with hopefully the bulk o=
f<br>
&gt; &gt; issues fixed.<br>
&gt; &gt; <br>
&gt; &gt; &gt; * there are plenty of warnings when we build, i would like =
to get<br>
&gt; &gt; &gt; rid<br>
&gt; &gt; &gt; of them all!<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Anything else is work that remains to be done. Before start=
ing<br>
&gt; &gt; &gt; anything, please send a quick email here to let everyone kn=
ow, to<br>
&gt; &gt; &gt; avoid duplication. If you have any improvement, please shar=
e your<br>
&gt; &gt; &gt; patches, I will take them into the sphinx/master branch. An=
d I<br>
&gt; &gt; &gt; will<br>
&gt; &gt; &gt; continue to work on the remaining files that no one would p=
ick.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ll take dev-manual/* next.<br>
&gt; <br>
&gt; dev-manual is on the branch, I&#39;ll look at sdk-manual next.<br>
<br>
sdk-manual is on the branch, kernel-dev is my next target.<br></blockquote=
><div><br></div><div>I am now done with bsp-guide and bitbake.=C2=A0 Based =
on Richard&#39;s last comment, the remaining docs to process are:</div><div=
>overview-manual</div><div>profile-manual</div><div>test-manual</div><div>t=
oaster-manual</div><div><br></div><div>They are rather &#39;small&#39; book=
s. I believe Armin is looking at overview-manual and Mark at test-manual. I=
 will take profile-manual next.=C2=A0</div></div></div></blockquote><div><b=
r></div><div>I&#39;ll take a crack at toaster-manual today.</div></div></di=
v></blockquote><div><br></div><div>thanks!</div><div><br></div><div>I&#39;v=
e finished profile-manual today. And excluded adt-manual from Sphinx (depre=
cated doc). At this point, we have:</div><div>Richard on kernel-dev</div><d=
iv>Mark on test-manual</div><div>Armin on overview-manual</div><div>Tim on =
toaster-manual</div><div><br></div><div>Which means everything is now cover=
ed! Please send patches on the list for review, and if you have any trouble=
 with Sphinx , let me know!</div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmai=
l_quote"><div>--Tim</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>I&#39;ve al=
so updated=C2=A0<a href=3D"https://docs.yoctoproject.org/" target=3D"_blank=
">https://docs.yoctoproject.org/</a> with all the latest changes combined. =
If you can use the new website and report any issues, please let us know.</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000001afba705af5cecbf--
