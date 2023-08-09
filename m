Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9FEC001B0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 18:55:48 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.96622.1691607344554431428
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Aug 2023 11:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EDZDcue1;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-586bacac98aso2678577b3.2
        for <docs@lists.yoctoproject.org>; Wed, 09 Aug 2023 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691607344; x=1692212144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q8YgCH7csRmGWJygwJHQZvinvXpXaYLsJdMauLEZgyA=;
        b=EDZDcue170YwP3ZSx6x7a8i/5BRD7dASNnLl+XGXQS5cjrOuobB1DXHxLFjJ9T6DIo
         kEbq+1stjx7axBnNtiY76ihM2m9jpjkXpZaMWOtS333CdY6y52texc4YehSZjDzjfGhm
         fbxHAHKLIQHZZM3qiJHYQjGn6m+GwuT47Wyn3dsOEKww6jtItGFxsUHaowDF3DG5nwIB
         kTlZB1Sd0v7v6RQA4bKFYYC8qV4eqBFfYQrEelVNdvigaTIPZPtO1Srgt3CsA2S7cNmn
         XaZG1QQbx3Vs7ZkPaNZCkUma2C6NzLa1p+J3s5cbc0iS5uQS1UuD/NWVnU8q/Yss33gl
         MyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691607344; x=1692212144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8YgCH7csRmGWJygwJHQZvinvXpXaYLsJdMauLEZgyA=;
        b=GzSz1dWUthFEtMpkpo4Q+lw6FpLe6R9d/P2zzDl9qgkz3JOARXwomkd7pniro4JNks
         iXaZKVY+d8lmoszIlwAdwPxNEwvMCx1GPkAR50lNA7ZfLCEVbmKS94FsG+oIc40NS+rK
         egGlyxkLbXGkLNJZCGr2YOVSP7wXA2tx73wmAWFXUF1lkZVnqyiWfG8VxZJwFikK4ose
         DJPr9757JG3Sb8hCswwr0oojIjl8bgiJUjDEIiA6tNF66oJ7c51PHoi8L5lM2pwL3WMv
         k2//gSnp7LUXglyaKUz4nOrYKP3erd6A+Lvx4zw7cJIMaSP+Zugt/s148z0Y4ErhYJCM
         ABLA==
X-Gm-Message-State: AOJu0YzlhXG024PwMwCSTWCq1Q158XRlA+TwqEuEi01dWKVXN6pj61AW
	IgkuDQOmEgeQXFtqM9vULpF/MzmtFtEr+DIRKPc=
X-Google-Smtp-Source: AGHT+IHH3PHYXP8z/pBfd8zU2QmypRz9d5uPRJVXtMYDdTFrz9URuhydUSE+ZmEEslpTgyCbDpn9oW1BPL1fR3+RJsU=
X-Received: by 2002:a81:9481:0:b0:585:f4e0:6532 with SMTP id
 l123-20020a819481000000b00585f4e06532mr208508ywg.30.1691607343552; Wed, 09
 Aug 2023 11:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230809142520.226581-1-michael.opdenacker@bootlin.com>
 <20230809142520.226581-2-michael.opdenacker@bootlin.com> <CA+cAkeqBLnr5YRygjCT_6j2M-Hkht3DxAxiQLrP63nBvG9sFwQ@mail.gmail.com>
 <88d3c02eaadc6ce5356608cf93f84dc81471146d.camel@linuxfoundation.org>
In-Reply-To: <88d3c02eaadc6ce5356608cf93f84dc81471146d.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 9 Aug 2023 20:55:32 +0200
Message-ID: <CA+cAker+U=7XOvL+MEfgtDF0ZUsS+f7Bg8n2xEx7LXnFZaSzoQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/3] contributor-guide: add section about why we
 use mailing lists
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000cfdca906028206f7"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Aug 2023 18:55:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4126

--000000000000cfdca906028206f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 9 ao=C3=BBt 2023, 19:57, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Wed, 2023-08-09 at 17:58 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > On Wed, 9 Aug 2023 at 16:25, Michael Opdenacker via
> > lists.yoctoproject.org
> > <michael.opdenacker=3Dbootlin.com@lists.yoctoproject.org> wrote:
> >
> > > +One significant factor is that we value peer review. When a change
> > > is proposed
> > > +to many of the core pieces of the project, it helps to have many
> > > eyes of review
> > > +go over them. Whilst there is ultimately one maintainer who needs
> > > to make the
> > > +final call on accepting or rejecting a patch, the review is made
> > > by many eyes
> > > +and the exact people reviewing it are likely unknown to the
> > > maintainer. It is
> > > +often the surprise reviewer that catches the most interesting
> > > issues!
> > > +
> > > +This is in contrast to the "GitHub" style workflow where either
> > > just a
> > > +maintainer makes that review, or review is specifically requested
> > > from
> > > +nominated people. We believe there is significant value added to
> > > the codebase
> > > +by this peer review and that moving away from mailing lists would
> > > be to the
> > > +detriment of our code.
> > >
> >
> >
> > For notifications, I don't see why the web flow would not allow to
> > send notifications for changes to a mailing list (I think it can also
> > be made per user profile to receive notifications for a whole
> > project, an issue, a particular project ... etc)
>
> You can make a web interface send notices to an email list, sure, that
> isn't hard. Someone then replies giving feedback on the mailing list to
> the patch. What happens to that feedback from the web point of view?
> This "next step" is where the challenge is.
>

Yes I understand that.


> Patchwork is an attempt to make that match up and it basically shows
> how hard this is to get right and pair the worlds up like that.
> >
> > > +We also need to acknowledge that many of our developers are used
> > > to this
> > > +mailing list workflow and have worked with it for years, with
> > > tools and
> > > +processes built around it. Changing away from this would result in
> > > a loss
> > > +of key people from the project, which would again be to its
> > > detriment.
> >
> > I'd like to know some of these flow that are plugged on mail, can we
> > insert some examples in the documentation ?
>
> You mean document how mailing list patch work flow works?
>

No, I do know (or I think I know) how the patch flow works. I talked about
the text that says "with tools [...] built around it", I wouls like to know
what are these tools.


> > > +The projects are acutely aware that potential new contributors
> > > find the
> > > +mailing list approach off-putting and would prefer a point-and-
> > > click web GUI.
> > >
> >
> >
> > I find the term "point-and-click" a little patronizing,
> > github/gitlab/others web tools
> > are not just point-and-click machine but highly customizable tool
> > aims at smoothen the developer work (in term of tracking, viewing
> > diff, forking) and to provide enhanced user experience.
>
> I agree we should tweak the wording.
>
> >
> > > +Since we don=E2=80=99t believe that can work for us, the project is =
aiming
> > > to ensure
> > > +`patchwork <https://patchwork.yoctoproject.org/>` is available to
> > > help track
> > > +patch status and also looking at how tooling can provide more
> > > feedback to users
> > > +about patch status. We are looking at tools such as ``patchtest``
> > > to
> > > +test user contributions before they hit the mailing lists and also
> > > at better
> > > +documenting how to use such workflows since we recognise that
> > > whilst this was
> > > +common knowledge a decade ago, it might not be as familiar now.
> > >
> >
> >
> > I didn't know patchtest, I'll look at it. I think a big improvement
> > (at least for me) in the review
> > process would be to some kind of colorized webview of a patch towards
> > the target branch.
>
> If you make a pull request from the contrib repos, you can see
> colorized diffs using the web interfaces. You can also see that locally
> with git itself or tools like gitk too. I do use both the cgit
> interface and gitk commands at different times.
>

Yes of course, I can see my own patches the way I want. But what about
contributions from other that I'd like to read more carefully? I can pick
these patches and apply in my local checkout and see them "graphically" but
it is an additional step that may be skipped if we directly have them
somewhere. I agreed that patchwork have a better look interfaces than mail,
but as you said earlier, making the second step (i.e commenting a line,
suggesting changes... Etc) is not made in such interface.

>
> > Sorry, but , unless I miss some cool feature of my gmail client, I
> > find that view (screenshot join) far more readable that raw diff by
> > mail, e.g:
>
> It does depend upon what you're used to. Personally, I can hand edit or
> even hand write diff files :/. I'm not saying that is a good idea or a
> good thing but it is what it is.
>

Yes, I'm aware that it is a matter of taste and habits. I only want to gave
my point of view. Thank you very much for your answers.


> Cheers,
>
> Richard
>
>

--000000000000cfdca906028206f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le mer. 9 ao=C3=BBt 2023, 19:57, Richard Purdie &lt;<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfou=
ndation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Wed, 2023-08-09 at 17:58 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote=
:<br>
&gt; On Wed, 9 Aug 2023 at 16:25, Michael Opdenacker via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer noreferrer=
" target=3D"_blank">lists.yoctoproject.org</a><br>
&gt; &lt;michael.opdenacker=3D<a href=3D"mailto:bootlin.com@lists.yoctoproj=
ect.org" target=3D"_blank" rel=3D"noreferrer">bootlin.com@lists.yoctoprojec=
t.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; +One significant factor is that we value peer review. When a chan=
ge<br>
&gt; &gt; is proposed<br>
&gt; &gt; +to many of the core pieces of the project, it helps to have many=
<br>
&gt; &gt; eyes of review<br>
&gt; &gt; +go over them. Whilst there is ultimately one maintainer who need=
s<br>
&gt; &gt; to make the<br>
&gt; &gt; +final call on accepting or rejecting a patch, the review is made=
<br>
&gt; &gt; by many eyes<br>
&gt; &gt; +and the exact people reviewing it are likely unknown to the<br>
&gt; &gt; maintainer. It is<br>
&gt; &gt; +often the surprise reviewer that catches the most interesting<br=
>
&gt; &gt; issues!<br>
&gt; &gt; +<br>
&gt; &gt; +This is in contrast to the &quot;GitHub&quot; style workflow whe=
re either<br>
&gt; &gt; just a<br>
&gt; &gt; +maintainer makes that review, or review is specifically requeste=
d<br>
&gt; &gt; from<br>
&gt; &gt; +nominated people. We believe there is significant value added to=
<br>
&gt; &gt; the codebase<br>
&gt; &gt; +by this peer review and that moving away from mailing lists woul=
d<br>
&gt; &gt; be to the<br>
&gt; &gt; +detriment of our code.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; For notifications, I don&#39;t see why the web flow would not allow to=
<br>
&gt; send notifications=C2=A0for changes to a mailing list (I think it can =
also<br>
&gt; be made per user profile to receive notifications for a whole<br>
&gt; project, an issue, a particular project ... etc)<br>
<br>
You can make a web interface send notices to an email list, sure, that<br>
isn&#39;t hard. Someone then replies giving feedback on the mailing list to=
<br>
the patch. What happens to that feedback from the web point of view?<br>
This &quot;next step&quot; is where the challenge is.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes I understand that.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<br>
Patchwork is an attempt to make that match up and it basically shows<br>
how hard this is to get right and pair the worlds up like that.<br>
&gt; =C2=A0<br>
&gt; &gt; +We also need to acknowledge that many of our developers are used=
<br>
&gt; &gt; to this<br>
&gt; &gt; +mailing list workflow and have worked with it for years, with<br=
>
&gt; &gt; tools and<br>
&gt; &gt; +processes built around it. Changing away from this would result =
in<br>
&gt; &gt; a loss<br>
&gt; &gt; +of key people from the project, which would again be to its<br>
&gt; &gt; detriment.<br>
&gt; <br>
&gt; I&#39;d like to know some of these flow that are plugged on mail, can =
we<br>
&gt; insert some examples in the documentation ?<br>
<br>
You mean document how mailing list patch work flow works?<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">No, I do know (or =
I think I know) how the patch flow works. I talked about the text that says=
 &quot;with tools [...] built around it&quot;, I wouls like to know what ar=
e these tools.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; &gt; +The projects are acutely aware that potential new contributors<b=
r>
&gt; &gt; find the<br>
&gt; &gt; +mailing list approach off-putting and would prefer a point-and-<=
br>
&gt; &gt; click web GUI.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I find the term &quot;point-and-click&quot; a little patronizing,<br>
&gt; github/gitlab/others web tools<br>
&gt; are not just point-and-click machine but highly customizable tool<br>
&gt; aims at smoothen the developer work (in term of tracking, viewing<br>
&gt; diff, forking) and to provide enhanced user experience.<br>
<br>
I agree we should tweak the wording.<br>
<br>
&gt; =C2=A0<br>
&gt; &gt; +Since we don=E2=80=99t believe that can work for us, the project=
 is aiming<br>
&gt; &gt; to ensure<br>
&gt; &gt; +`patchwork &lt;<a href=3D"https://patchwork.yoctoproject.org/" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://patchwork.yoctoproje=
ct.org/</a>&gt;` is available to<br>
&gt; &gt; help track<br>
&gt; &gt; +patch status and also looking at how tooling can provide more<br=
>
&gt; &gt; feedback to users<br>
&gt; &gt; +about patch status. We are looking at tools such as ``patchtest`=
`<br>
&gt; &gt; to<br>
&gt; &gt; +test user contributions before they hit the mailing lists and al=
so<br>
&gt; &gt; at better<br>
&gt; &gt; +documenting how to use such workflows since we recognise that<br=
>
&gt; &gt; whilst this was<br>
&gt; &gt; +common knowledge a decade ago, it might not be as familiar now.<=
br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I didn&#39;t know patchtest, I&#39;ll look at it. I think a big improv=
ement<br>
&gt; (at least for me) in the review<br>
&gt; process would be to some kind of colorized webview of a patch towards<=
br>
&gt; the target branch.<br>
<br>
If you make a pull request from the contrib repos, you can see<br>
colorized diffs using the web interfaces. You can also see that locally<br>
with git itself or tools like gitk too. I do use both the cgit<br>
interface and gitk commands at different times.<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Yes of course, I can see my =
own patches the way I want. But what about contributions from other that I&=
#39;d like to read more carefully? I can pick these patches and apply in my=
 local checkout and see them &quot;graphically&quot; but it is an additiona=
l step that may be skipped if we directly have them somewhere. I agreed tha=
t patchwork have a better look interfaces than mail, but as you said earlie=
r, making the second step (i.e commenting a line, suggesting changes... Etc=
) is not made in such interface.=C2=A0</div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; Sorry, but , unless I miss some cool feature of my gmail client, I<br>
&gt; find that view (screenshot=C2=A0join) far more readable that raw diff =
by<br>
&gt; mail, e.g:<br>
<br>
It does depend upon what you&#39;re used to. Personally, I can hand edit or=
<br>
even hand write diff files :/. I&#39;m not saying that is a good idea or a<=
br>
good thing but it is what it is.<br></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Yes, I&#39;m aware that it is a matter of t=
aste and habits. I only want to gave my point of view. Thank you very much =
for your answers.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--000000000000cfdca906028206f7--

