Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.18338.1621254392871849815
 for <docs@lists.yoctoproject.org>;
 Mon, 17 May 2021 05:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JVNrE7jd;
 spf=pass (domain: linaro.org, ip: 209.85.218.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f42.google.com with SMTP id n2so8898901ejy.7
        for <docs@lists.yoctoproject.org>; Mon, 17 May 2021 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PHUzH1d/9+4PVKawJ+v/3xYsqwp+Pl++7W2mnM1rJjs=;
        b=JVNrE7jdJJBpfzcytP24stc7xp4XRyxvU+OB7vlBr4e+w64BHxey+SMULNW/CvwoID
         NHfojoHdy2p7B3BbGUSDKF0sKzNAl2UKRCCKrnkucEQ4z4W9hOUUiZZzr86cpSizCqvP
         l2+xedd5O+moYXjg9TtJ9NIfaNqwj1NnclwJRVvOUv2JGC1dI5sujQG347GH1AWN6KAJ
         jPWB+HojEP4MKLz7fYBLSgDtbvQuMxGPtk/eS8f0iNosc/7YSNGk7oUJH7xNgL+1BIeY
         YnYTlcYbKJ4OB7IkY2ghv0dY50DkhzsB5jp9zZnggLNco7YAgopSNuSJYt9yYInRgeNI
         Al9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PHUzH1d/9+4PVKawJ+v/3xYsqwp+Pl++7W2mnM1rJjs=;
        b=jIk+kNWTyxdFyH/JoePUhxcol/mfJ08eCclqxTl1mxtBTqQ6CeX9i1Q7eDABAEM1nO
         6nxKu8R5LVz6udkOUinlXGwiz/lLAXD+s2oETaCoOUNKh5i7v8DsK5ud8FnqvHACGNK6
         XN00Zv8T5cJnNqtiu6iV3yQL9GUFwPKtCAUXsOIbFR1p4fdiiKn462HYklxg6JQPobQ5
         /x6Ews4mgDtlL6SuixawbW+muBjoiY+ynBBk31HzE4z800iRmQ3BBqzZtzD9hE0x84+4
         qgYo/Z3GhXaOLkG3W4bOUbg0obACKGIABSdIRMOLhhB1nk12TsO1TXLjYX/c0o/UZhAJ
         mYdw==
X-Gm-Message-State: AOAM530UOQWuFacjX4nzHbXFWkbPN1NxXxT2v4xH7ZGSpmjUcLE4HpIG
	jJJqCjY2ekRaWzzOy0tJ6y4N2N2U/jqf17c8vyXL2w==
X-Google-Smtp-Source: ABdhPJxnIOwr3hd3s/W0FNL/mm80Oy190xPExRme0wq2pip03R4xqaZj4jvJbuXdRMjqWle01abSbIgh3pt2dQHsel8=
X-Received: by 2002:a17:906:f283:: with SMTP id gu3mr61711110ejb.91.1621254391247;
 Mon, 17 May 2021 05:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
 <20210515071219.307241-2-michael.opdenacker@bootlin.com> <CAP71Wjy+5HU9ZHWfiWKNu8wArLP8x4FMFmQURvrqubHZsr1JCQ@mail.gmail.com>
 <bfc9a5cd-a8c9-a5fe-a060-0025d9bf6f26@bootlin.com>
In-Reply-To: <bfc9a5cd-a8c9-a5fe-a060-0025d9bf6f26@bootlin.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 17 May 2021 14:26:22 +0200
Message-ID: <CAP71Wjw3x98HhPT=Qkn2qj-GiP+fuuesvYt-dvpepPmP_S+K_g@mail.gmail.com>
Subject: Re: [docs] [RFC 1/3] Makefile: allow epub and latexpdf outputs to use diagrams from SVG sources
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000014ca8a05c285b432"

--00000000000014ca8a05c285b432
Content-Type: text/plain; charset="UTF-8"

On Mon, May 17, 2021 at 10:50 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Nicolas,
>
> On 5/17/21 12:12 AM, Nicolas Dechesne wrote:
> >
> >     +SVG2PNG       = inkscape
> >     +SVG2PDF       = inkscape
> >
> >
> > It is a new host dependency, we need to update the README and have a
> > meaningful error message.
>
> Yes, depending on the solution that is used, I'll update the list of
> package requirements.
>
> I guess we will also have to install those on the autobuilder machine(s)
> too, otherwise it will break. Will this be manual, or is there a file we
> need to fill so that the right packages are automatically installed on
> the autobuilder(s)?
>

Good question, I think Richard should answer it. The AB uses a 'docs'
buildtools, but I don't remember where it's coming from..
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/scripts/run-docs-build#n8



>
> Thanks
>
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000014ca8a05c285b432
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 17, 2021 at 10:50 AM Mich=
ael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michae=
l.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Nicolas,<br>
<br>
On 5/17/21 12:12 AM, Nicolas Dechesne wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SVG2PNG=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D inkscape<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SVG2PDF=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D inkscape<br>
&gt;<br>
&gt;<br>
&gt; It is a new host dependency, we need to update the README and have a<b=
r>
&gt; meaningful error message.<br>
<br>
Yes, depending on the solution that is used, I&#39;ll update the list of<br=
>
package requirements.<br>
<br>
I guess we will also have to install those on the autobuilder machine(s)<br=
>
too, otherwise it will break. Will this be manual, or is there a file we<br=
>
need to fill so that the right packages are automatically installed on<br>
the autobuilder(s)?<br></blockquote><div><br></div><div>Good question, I th=
ink Richard should answer it. The AB uses a &#39;docs&#39; buildtools, but =
I don&#39;t remember where it&#39;s coming from..</div><div><a href=3D"http=
://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/scripts=
/run-docs-build#n8">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobui=
lder-helper/tree/scripts/run-docs-build#n8</a></div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks<br>
<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--00000000000014ca8a05c285b432--
