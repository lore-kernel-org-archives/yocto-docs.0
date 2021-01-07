Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.11437.1610039317148481973
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 09:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IPwRmzUI;
 spf=pass (domain: linaro.org, ip: 209.85.218.48, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f48.google.com with SMTP id lt17so10732639ejb.3
        for <docs@lists.yoctoproject.org>; Thu, 07 Jan 2021 09:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XZvoh4hNBp82NM0XrSXyoEc/PUZotDFobIBtgXFv9NM=;
        b=IPwRmzUIP16ZWoqZriZDRNDj6bZiVSnbl/mcmRJPONIpDV79xqPm5Y5WlX+c9Hj2lP
         rAgzNImjVjkdGHBn9XIpYozdDpBC2X/JjLWgudpHD/F/p2nTfF6PP3Tp/3LhBTmfhY7U
         QfU89V/Cm2+tX9CbeMY2+pfNPWoBwkGnpt4pXYhJY0/dRruly+vkulgG4Ss6AxLEcLQP
         TPz6DqQ9HaqA+b6/y1KCXYCp2djb7mCGOHqz3FIR3LJUGcXxyDD1UCjJUYKRvEJt7k7I
         q/ao/X+GanaRb3GsMvpspPbMrHstmKJHbNqnO415bPoPG9NqHdnIOx09WDmxXqfYH8ug
         7o3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XZvoh4hNBp82NM0XrSXyoEc/PUZotDFobIBtgXFv9NM=;
        b=mhgV29fQeOSD0xyhe9+NPjp3WZvEC6Y3YzhpSzHXIygl4tWiBZEkbKZSMdtyeb+yu0
         42sTcK7lUVQzpfiuB0egoOhAbdJhr9+qBQE/Osq6zbEbLXcRm8jRjs5yuXjnmtGxlTIT
         TEOwQ5iLj1RjI9SRzQsWV/EPjhHFzdTSI7hOpARkpQ2iWwxzQIXRDripdAjAN0nHJF+7
         rqOI78udsnOv5c0q3BughNUaI2guVl803SGH6J+tfDC2G5xOgWD2ZtdufkI7QqeFE3lu
         s5PFu/Q0Au0UefnwYp2tU0NNMlgWFxrz9YSph9DXahnqWdkaYUdPRXa+4wi03D0dgqrV
         xrcg==
X-Gm-Message-State: AOAM530lwjBBV5E6ysk9/xdBhKAukt/79w4Wh1cx97w1sxWVXM3fglzj
	gxJA/ZWP9UoJz8/6Yfv61cbK0X4w5d+myY5GDQuuPw==
X-Google-Smtp-Source: ABdhPJwLqI0WI5QcUqSEIaKkvuV6IeK0ycpYaT33izxvc0xzn9XLBaMbigT+PB5QECEMt2ju4yOyBJSEtFmOyFRwfAw=
X-Received: by 2002:a17:906:52da:: with SMTP id w26mr7152589ejn.347.1610039315596;
 Thu, 07 Jan 2021 09:08:35 -0800 (PST)
MIME-Version: 1.0
References: <CAP71Wjw3T0XKPxVH59J_fGpBmB+qJ6GyKowOPqa8CGOZ2e8OmQ@mail.gmail.com>
 <20210107165951.aqx4maful2uhopzx@qschulz>
In-Reply-To: <20210107165951.aqx4maful2uhopzx@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 7 Jan 2021 18:08:25 +0100
Message-ID: <CAP71WjyK679c8hjEE53PVyi-_8vX5TS6umsXk+y2TGio8c30hQ@mail.gmail.com>
Subject: Re: [docs] broken links
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
	Robert Berger <robert.berger@reliableembeddedsystems.com>
Content-Type: multipart/alternative; boundary="0000000000007b1db105b8527d53"

--0000000000007b1db105b8527d53
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 7, 2021 at 5:59 PM Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> Hi Nicolas,
>
> On Thu, Jan 07, 2021 at 05:52:49PM +0100, Nicolas Dechesne wrote:
> > hey!
> >
> > Robert opened a bug for a broken link in the doc, see
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14168
> >
> > This is a valid bug, a regression in
> > e1bcfe4d8 dev-manual: remove unused labels
> >
> > Unfortunately, it opens a can of worms... since it looks like the built
> in
> > linkcheck did not detect the broken links, and this is not the only
> broken
> > link.
> >
> > I ran an online link checker on
> > https://docs.yoctoproject.org/dev-manual/common-tasks.html, and it
> reported
> > the following errors with anchors.. they look like they are regression
> with
> > the commit above..
> >
>
> [...]
>
> It'd be nice to fix the linkcheck indeed.
>

hmm. could it be that linkcheck only checks for 'external' links?


>
> I have on my todolist to remove all anchor links to use refs instead but
> it's
> not fun work to do and it's time consuming. I can now probably "automate"
> all of this with some python regexp and manually fix the ones returned
> by your online link checker :) (and use the online link checker to
> validate the changes).
>
> I'd then add in the README/CONTRIBUTING that we do not allow such links
> and we have to be careful to enforce this when receiving patches.
>
> All this in the event that we can't find what's wrong with our
> linkcheck.
>
> Cheers,
> Quentin
>

--0000000000007b1db105b8527d53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 7, 2021 at 5:59 PM Quenti=
n Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin.=
schulz@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi Nicolas,<br>
<br>
On Thu, Jan 07, 2021 at 05:52:49PM +0100, Nicolas Dechesne wrote:<br>
&gt; hey!<br>
&gt; <br>
&gt; Robert opened a bug for a broken link in the doc, see<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14168" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D14168</a><br>
&gt; <br>
&gt; This is a valid bug, a regression in<br>
&gt; e1bcfe4d8 dev-manual: remove unused labels<br>
&gt; <br>
&gt; Unfortunately, it opens a can of worms... since it looks like the buil=
t in<br>
&gt; linkcheck did not detect the broken links, and this is not the only br=
oken<br>
&gt; link.<br>
&gt; <br>
&gt; I ran an online link checker on<br>
&gt; <a href=3D"https://docs.yoctoproject.org/dev-manual/common-tasks.html"=
 rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev-man=
ual/common-tasks.html</a>, and it reported<br>
&gt; the following errors with anchors.. they look like they are regression=
 with<br>
&gt; the commit above..<br>
&gt; <br>
<br>
[...]<br>
<br>
It&#39;d be nice to fix the linkcheck indeed.<br></blockquote><div><br></di=
v><div>hmm. could it be that linkcheck only checks for &#39;external&#39; l=
inks?=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
I have on my todolist to remove all anchor links to use refs instead but it=
&#39;s<br>
not fun work to do and it&#39;s time consuming. I can now probably &quot;au=
tomate&quot;<br>
all of this with some python regexp and manually fix the ones returned<br>
by your online link checker :) (and use the online link checker to<br>
validate the changes).<br>
<br>
I&#39;d then add in the README/CONTRIBUTING that we do not allow such links=
<br>
and we have to be careful to enforce this when receiving patches.<br>
<br>
All this in the event that we can&#39;t find what&#39;s wrong with our<br>
linkcheck.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div></div>

--0000000000007b1db105b8527d53--
