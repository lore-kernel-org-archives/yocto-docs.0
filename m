Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.923.1588107415827095216
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Apr 2020 13:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dS5hUXsi;
 spf=pass (domain: linaro.org, ip: 209.85.219.179, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f179.google.com with SMTP id p7so65480ybo.12
        for <docs@lists.yoctoproject.org>; Tue, 28 Apr 2020 13:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=sfdQjlmXEHTkYya7Cs0Z52A/6iH0d3+sLN5ZdfeNJFU=;
        b=dS5hUXsiTLfKM2TLTl9GLw17feGNJeHDmWXikylOGg9Dzo0qGBpoUTQRi3AT8eeHRI
         P7oEDcNExRSH+vsKEM7Q/Offb5O4glRUEuHaUdLgY0jcX/2e/ICmqri/nn0kFC2qsi24
         Yq6ZS98bblV/oVMB86tLzAKfRk8zhAU5wJiLydg2IoxycH3Q2fch4efc+w/Xc7XOgAX/
         +eejyiWuCdI9K+djPpRnZJYyEqCjNlB0ee32rsi/t4PUVQOcwQ7aqzVcjedo7lMjEwVh
         +zKRs78BG+IUlEdIsVeSebm+GOJdc6kGZBggvwF8/ZS5BnAyRzUwCyQqCzGEqqG5DqPg
         labA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=sfdQjlmXEHTkYya7Cs0Z52A/6iH0d3+sLN5ZdfeNJFU=;
        b=ohdOHMsvPx9dor9AM9G6sCaOjGVMxLKCQ3n3A8cql6VQO4HfzcrF8e39RYwH02X4xv
         a0htzZo2eQXsnkuUcldSgivXfM2qaOoeK5uCNsoIlh+oMVlBaeQloGe5BQUsPq/K9Zb2
         lPnsy7+KPiokmLhlNWLYm1wSU8uOTLmUp0iOAzg03nyFkgS64cGN0/xosavNqVUHgOdn
         CpQ1WStU5BN+OnkqUdvOjqquHKX/cnwU9zicISrm1L6wKHf9F5mrC2M1DJrNq/pEw9HQ
         t5Gj8iRq+/IeDShTPkEpwwCCHWJ7gox+/6qWcmt6V1xIIBGhH7ethqK4eRs1Uwy9B+W9
         Ipew==
X-Gm-Message-State: AGi0PuY+AVHou/keqWfKcTJmGPuFvhvVWsojx8PD+7K0pbo7mWESeNG2
	G8uKizea5mNmopt7qN4RX+/uS2v7Mauws9clb8Doe52szqo=
X-Google-Smtp-Source: APiQypKiYmjvkoH5XH3WJWIV+qTbboJp7aiIwrsoPEAYNW25G55cm6q4Ngi/euByqQ5cR4cJqlKCcPxe0z/HjIkS8HY=
X-Received: by 2002:a5b:48c:: with SMTP id n12mr49687758ybp.133.1588107414735;
 Tue, 28 Apr 2020 13:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjwQiXmHKxjpRtJofo6ekyLOob9oABsYptj2=i9mmiqKoQ@mail.gmail.com>
 <1b306deae4fd33a2284c0a2df9a054bfed9f5ac3.camel@linuxfoundation.org>
In-Reply-To: <1b306deae4fd33a2284c0a2df9a054bfed9f5ac3.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 28 Apr 2020 22:56:42 +0200
Message-ID: <CAP71WjyKGfMYhai2n_rHEGfvUUgEfUU3h5Z72RdcQkJP7NjxxA@mail.gmail.com>
Subject: Re: [docs] inconsistencies between poky and yocto-docs trees
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000524f8005a46012bb"

--000000000000524f8005a46012bb
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 28, 2020 at 10:55 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2020-04-28 at 22:47 +0200, Nicolas Dechesne wrote:
> > hi,
> >
> > i just noticed that some documentation commits have made it to poky
> > tree, but they are not in yocto-docs tree.
> >
> > The last 5 commits in yocto-docs:
> > $ git log --oneline -5
> > 77e8a9e03 dev-manual: remove postinst false statement
> > dda137617 ref-manual: add migration section for 3.1
> > bc0923354 dev-manual: basic updates for npm fetcher changes
> > af9bf61a5 ref-manual: update PACKAGECONFIG glossary entry
> > d40485a7e overview-manual: fix obvious typo "ORHNAME"
> >
> > The last 5 'doc' commits in yocto:
> > $ git log -5 --oneline  -- documentation/
> > f9e1127643 Updated patch for publishing
> > cd25abf777 Added usrmerge to distro-features for Bug 13494
> > fe25ef9871 ref-manual: correct "script" dirname to "scripts"
> > a44b8d2856 dev-manual: remove postinst false statement
> > c31ddaba1f ref-manual: add migration section for 3.1
> >
> > The top 3 patches are missing in yocto-docs..
>
> I think I'd missed a "push", my workflow is special cased around the
> way Scott handled things. I've just manually done it and will beat my
> scripts up a bit more...
>

thanks, I can see them now!


> Cheers,
>
> Richard
>
> 
>

--000000000000524f8005a46012bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 28, 2020 at 10:55 PM Rich=
ard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richar=
d.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Tue, 2020-04-28 at 22:47 +0200, Nicolas Dech=
esne wrote:<br>
&gt; hi,<br>
&gt; <br>
&gt; i just noticed that some documentation commits have made it to poky<b=
r>
&gt; tree, but they are not in yocto-docs tree. <br>
&gt; <br>
&gt; The last 5 commits in yocto-docs:<br>
&gt; $ git log --oneline -5<br>
&gt; 77e8a9e03 dev-manual: remove postinst false statement<br>
&gt; dda137617 ref-manual: add migration section for 3.1<br>
&gt; bc0923354 dev-manual: basic updates for npm fetcher changes<br>
&gt; af9bf61a5 ref-manual: update PACKAGECONFIG glossary entry<br>
&gt; d40485a7e overview-manual: fix obvious typo &quot;ORHNAME&quot;<br>
&gt; <br>
&gt; The last 5 &#39;doc&#39; commits in yocto:<br>
&gt; $ git log -5 --oneline=C2=A0 -- documentation/<br>
&gt; f9e1127643 Updated patch for publishing<br>
&gt; cd25abf777 Added usrmerge to distro-features for Bug 13494<br>
&gt; fe25ef9871 ref-manual: correct &quot;script&quot; dirname to &quot;sc=
ripts&quot;<br>
&gt; a44b8d2856 dev-manual: remove postinst false statement<br>
&gt; c31ddaba1f ref-manual: add migration section for 3.1<br>
&gt; <br>
&gt; The top 3 patches are missing in yocto-docs.. <br>
<br>
I think I&#39;d missed a &quot;push&quot;, my workflow is special cased ar=
ound the<br>
way Scott handled things. I&#39;ve just manually done it and will beat my<=
br>
scripts up a bit more...<br></blockquote><div><br></div><div>thanks, I can=
 see them now!</div><div> <br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div>

--000000000000524f8005a46012bb--
