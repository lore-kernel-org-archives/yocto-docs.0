Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.6551.1587738251440793129
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2020 07:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cVUitJzT;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id x2so9411192ilp.13
        for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2020 07:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=9a8ZgBkrwLwcpgaAA/tcmDU/x36qHdCDYahCXWSxzvA=;
        b=cVUitJzTBZzSv+5Uqb3zTs+1FcrmZq2G4BTEc0UPQO3p4erJxjISTrJNrQn7VIp7D6
         I5DfYqbIINXRmN95XritWyeNMQcN3O6yD5mEQ0xJhYA8tmED6h0rGN2WntfAADK4cw63
         LLLZHWs2rd6JUGkFU1QVQXyBzMfazOfu+9hKHo2em0Hlh2TILrzqhMp0ItHzLUveoyPv
         MihY0tsG7r1oBOzg6cS/HxVNca8ScMwrh/1fCT5XGewTbG++NN5TrNoVEJ6Vmt+p5Ctm
         9jOZmTuWnlzLYoP8+ZfNNBrFyOc5h4dWd7sZcISYz8D7mCbk7UI271ZufhFRAGI3KBcP
         wypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=9a8ZgBkrwLwcpgaAA/tcmDU/x36qHdCDYahCXWSxzvA=;
        b=Ai3s/JAQx3+S0nFww57olMr1OU5OOMNPjYo1UxTREU51hvg4TA/mCgbuD1Tv0EOeW6
         gtFHb+AH/zGlxADml9oW9AHtNPA4/20aQzVh/FXWWHYdpb4qwXRJaP7gb1cBdIOs1m1U
         rF3pPEi126vScvu9FcsN5/xEhViLsRI5aexXcawltG1n07C+f+FEC6XXTjXIOH5b0t/6
         /qyGo/0KbDEYoYMNTr1KlbWotVynAQ0fI+vNRE/oDcWKHVlbD+bp+98JRVx0wWFm9yZn
         aBgNOiW1WLdczEsTNJPQAlCb0uh+NIPkiICj85KeSKH2gIpWJZqt/bcsmdMRoeLEAL7j
         VE2A==
X-Gm-Message-State: AGi0PuaCFFPj2WPbcMVSOAmnpOG0MTHCpnB23X6nouzQOQzS7L0nzQ8a
	Ex721gApJattsqRw8lu0NsBO+Q+63eTMqSd6nmfdKdFi
X-Google-Smtp-Source: APiQypJCCnoqYuFEvls+6HRhF730OCsmr7yOBdZdXhrFIcF5nh+wCGRk8VwiuwscQPIVR6bfy9XQFcGa46venS0PA7I=
X-Received: by 2002:a92:7c01:: with SMTP id x1mr8416125ilc.122.1587738250475;
 Fri, 24 Apr 2020 07:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2004240909050.17949@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2004240909050.17949@localhost.localdomain>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 24 Apr 2020 07:23:58 -0700
Message-ID: <CANx9H-AH16tym2-9Aq++szBg55KEfswAkctFOrvQFgR0MCbjVw@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: correct "script" dirname to "scripts"
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006a81b205a40a1e8a"

--0000000000006a81b205a40a1e8a
Content-Type: text/plain; charset="UTF-8"

Thank you for the catch.

On Fri, Apr 24, 2020 at 6:09 AM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/ref-system-requirements.xml
> b/documentation/ref-manual/ref-system-requirements.xml
> index 2c019960f..7d3c71998 100644
> --- a/documentation/ref-manual/ref-system-requirements.xml
> +++ b/documentation/ref-manual/ref-system-requirements.xml
> @@ -364,7 +364,7 @@
>                      Here is an example:
>                      <literallayout class='monospaced'>
>       $ cd poky
> -     $ script/install-buildtools --without-extended-buildtools \
> +     $ scripts/install-buildtools --without-extended-buildtools \
>         --base-url &YOCTO_DL_URL;/releases/yocto \
>         --release yocto-&DISTRO; \
>         --installer-version &DISTRO;
> @@ -391,7 +391,7 @@
>                          default parameters:
>                          <literallayout class='monospaced'>
>       $ cd poky
> -     $ script/install-buildtools
> +     $ scripts/install-buildtools
>                          </literallayout>
>                      </para>
>                  </para></listitem>
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> 
>

--0000000000006a81b205a40a1e8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Thank you for the catch.</div></div><div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 24, 2=
020 at 6:09 AM Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca=
">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><br>
Signed-off-by: Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.c=
a" target=3D"_blank">rpjday@crashcourse.ca</a>&gt;<br>
<br>
---<br>
<br>
diff --git a/documentation/ref-manual/ref-system-requirements.xml b/docume=
ntation/ref-manual/ref-system-requirements.xml<br>
index 2c019960f..7d3c71998 100644<br>
--- a/documentation/ref-manual/ref-system-requirements.xml<br>
+++ b/documentation/ref-manual/ref-system-requirements.xml<br>
@@ -364,7 +364,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Here is an example:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&lt;literallayout class=3D&#39;monospaced&#39;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 $ cd poky<br>
-=C2=A0 =C2=A0 =C2=A0$ script/install-buildtools --without-extended-buildt=
ools \<br>
+=C2=A0 =C2=A0 =C2=A0$ scripts/install-buildtools --without-extended-build=
tools \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --base-url &amp;YOCTO_DL_URL;/releases/yocto \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --release yocto-&amp;DISTRO; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --installer-version &amp;DISTRO;<br>
@@ -391,7 +391,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0default parameters:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;literallayout class=3D&#39;monospaced&#39;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 $ cd poky<br>
-=C2=A0 =C2=A0 =C2=A0$ script/install-buildtools<br>
+=C2=A0 =C2=A0 =C2=A0$ scripts/install-buildtools<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;/literallayout&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&lt;/para&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt=
;&lt;/listitem&gt;<br>
<br>
-- <br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Onta=
rio, CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<a href=3D"http://crashcourse.ca" rel=3D"noreferrer" targ=
et=3D"_blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<=
a href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">h=
ttp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linke=
din.com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.=
com/in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
<br>
</blockquote></div></div>

--0000000000006a81b205a40a1e8a--
