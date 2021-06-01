Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.56065.1622544067923644408
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jun 2021 03:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mQj4MpvH;
 spf=pass (domain: linaro.org, ip: 209.85.218.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f42.google.com with SMTP id e18so5215023eje.5
        for <docs@lists.yoctoproject.org>; Tue, 01 Jun 2021 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IBK872ODS8P5e8v4Hy/aaXghwgiCFZupTlSGJX9mqp8=;
        b=mQj4MpvHu5kL6fmgOb9K2NrWUOialuABgNMg3lzrB2j+OC+TqPZK2bT5fvWMZzlkvx
         Kv8NPksukeAXHO/HKHbpsJLp/nj+KOMcEv/F9OQmyF4+jvaV3ihkR82g6qNdBZRwLory
         IJLw2La8/Y5jYYr+OfBgXo1GC6u5QmtQ2sjNXdwBHlDgpW3gza2h5EfPOETIB8tb3VLT
         wEG/jT7HbJqenReupXoDKOL5YYNXmushJPFT5N2zq5EIwJTarB9Eq+voM8LDIx7kFpzN
         eTpMbT+I6YpPS8ArJFhFfM5LERftLRkKPpS3fD6wlV3BAV+36Iutwj1jzQeZPLL61Nuq
         1QPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IBK872ODS8P5e8v4Hy/aaXghwgiCFZupTlSGJX9mqp8=;
        b=hQNH4JplysnClBcihqHsL0W0SXKpm/63yRPuJMWrw4aZ7i1Aq7GZBFO0fGBolea0GL
         L8FPzHLqCbvXlMCH32QA/dYhTqU/r0LJ+NkxrvHFkQCwpEZCx8YzqGG1evNVOrDAD1aC
         bVAJwUu19qQrUarELg/vplzQL/oBaYqfYfiMYfhLQsQf+u7SgN0ITIxXI+4ENtYWQxLs
         oJpw3eKVWHL98CEDvAT7+Fm5ltEbf9imTwPRHX4PJ/XiusUCNtFkIaNCeau2WeZ/2v6Y
         EU9GBpUjyF/TTRPU8bniiHMC18QewyFZupckPtJyjAEMl8UYIU02FSppnTon1GpmVWD8
         u++g==
X-Gm-Message-State: AOAM531WZmq0rsuJJ6nJWjzNZfR7xWENFuT76UFvays7Q5l6brYHoTno
	kfelsP0Dl2UmP0EL9gJ1H36df2824SGjehPPuMBJucD68ox7QQyu
X-Google-Smtp-Source: ABdhPJwTg3D1gu0bBx080wmPDb6ktUpXCMIXcMwkFS7rt19hMRhGJLCgZFOwPJgXEWUHfxkHccMHNAOnAPY7Tzu/3Oc=
X-Received: by 2002:a17:906:b14f:: with SMTP id bt15mr29534977ejb.126.1622544066304;
 Tue, 01 Jun 2021 03:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <2cf4a272-2d45-1ce9-3813-8e1bb69cd3c@crashcourse.ca>
In-Reply-To: <2cf4a272-2d45-1ce9-3813-8e1bb69cd3c@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 1 Jun 2021 12:40:55 +0200
Message-ID: <CAP71WjxjRhHc=pUP7B=DcjAMJ-17HbAbR-aMA7D3AgERO2SYiA@mail.gmail.com>
Subject: Re: [docs] a really robust "how to get started with YP" document?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000b4743d05c3b1fa6e"

--000000000000b4743d05c3b1fa6e
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 1, 2021 at 12:34 PM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   yes, there's a "getting started" page or two, but i was perusing the
> docs recently, and was reminded of the "stuff i wish i'd known" page:
>
>   https://docs.yoctoproject.org/what-i-wish-id-known.html
>
> and remember thinking, "what a cool idea," then thought about it a bit
> longer and realized i was looking at it the wrong way. if we actually
> think we need a page along the lines of "hey, even though you've been
> using YP for a while, here's a bunch of stuff we *could* have told you
> long ago to make your life easier but we didn't and now you have to go
> back and change stuff to take advantage of it," well, maybe we didn't
> prepare people properly in the first place.
>
>   i'm thinking of a really robust, complete, industrial-grade
> introduction to YP that lays out *everything* a new user should know
> if they're about to immerse themselves. i don't mean, "hey, i want to
> build a project to play around," i mean, "hey, i'm about to spend the
> next two years on a YP contract and i really need to make sure i'm
> doing stuff the right way to be as productive as possible."
>
>   one oversight that i always talk about is how to set up your entire
> build directory infrastructure. yes, there are lots of ways to do it,
> but newcomers just want to be told what seems to work for most
> accomplished YP developers so they can set it up and get to work,
> confident they won't need to go back and do it all over again.
>
>   here's a really trivial example -- i've had people who've used YP
> for at least a couple years say, "wait ... there's a 'site.conf' file
> that i could have been putting all this common stuff in all this
> time!?!?"
>
>   other things the truly serious developer should know -- how to use
> bitbake-layers and oe-pkgdata-util. and "bitbake -e".
>
>   anyway, you get the idea ... the idea that we think there's value in
> a "stuff you wish you had known" page sort of implicitly admits that
> we somehow failed to tell them about it in the first place.
>

Have you checked:
https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html

Should we not try to improve this existing document instead?

>
>   thoughts?
>
> rday
>
> 
>
>

--000000000000b4743d05c3b1fa6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 1, 2021 at 12:34 PM Rober=
t P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse=
.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
=C2=A0 yes, there&#39;s a &quot;getting started&quot; page or two, but i w=
as perusing the<br>
docs recently, and was reminded of the &quot;stuff i wish i&#39;d known&qu=
ot; page:<br>
<br>
=C2=A0 <a href=3D"https://docs.yoctoproject.org/what-i-wish-id-known.html"=
 rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/what-i-=
wish-id-known.html</a><br>
<br>
and remember thinking, &quot;what a cool idea,&quot; then thought about it=
 a bit<br>
longer and realized i was looking at it the wrong way. if we actually<br>
think we need a page along the lines of &quot;hey, even though you&#39;ve =
been<br>
using YP for a while, here&#39;s a bunch of stuff we *could* have told you=
<br>
long ago to make your life easier but we didn&#39;t and now you have to go=
<br>
back and change stuff to take advantage of it,&quot; well, maybe we didn&#=
39;t<br>
prepare people properly in the first place.<br>
<br>
=C2=A0 i&#39;m thinking of a really robust, complete, industrial-grade<br>
introduction to YP that lays out *everything* a new user should know<br>
if they&#39;re about to immerse themselves. i don&#39;t mean, &quot;hey, i=
 want to<br>
build a project to play around,&quot; i mean, &quot;hey, i&#39;m about to =
spend the<br>
next two years on a YP contract and i really need to make sure i&#39;m<br>
doing stuff the right way to be as productive as possible.&quot;<br>
<br>
=C2=A0 one oversight that i always talk about is how to set up your entire=
<br>
build directory infrastructure. yes, there are lots of ways to do it,<br>
but newcomers just want to be told what seems to work for most<br>
accomplished YP developers so they can set it up and get to work,<br>
confident they won&#39;t need to go back and do it all over again.<br>
<br>
=C2=A0 here&#39;s a really trivial example -- i&#39;ve had people who&#39;=
ve used YP<br>
for at least a couple years say, &quot;wait ... there&#39;s a &#39;site.co=
nf&#39; file<br>
that i could have been putting all this common stuff in all this<br>
time!?!?&quot;<br>
<br>
=C2=A0 other things the truly serious developer should know -- how to use<=
br>
bitbake-layers and oe-pkgdata-util. and &quot;bitbake -e&quot;.<br>
<br>
=C2=A0 anyway, you get the idea ... the idea that we think there&#39;s val=
ue in<br>
a &quot;stuff you wish you had known&quot; page sort of implicitly admits =
that<br>
we somehow failed to tell them about it in the first place.<br></blockquot=
e><div><br></div><div>Have you checked:</div><div><a href=3D"https://docs.y=
octoproject.org/brief-yoctoprojectqs/index.html">https://docs.yoctoproject.=
org/brief-yoctoprojectqs/index.html</a></div><div><br></div><div>Should we =
not try to improve this existing document instead?=C2=A0=C2=A0<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 thoughts?<br>
<br>
rday<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000b4743d05c3b1fa6e--
