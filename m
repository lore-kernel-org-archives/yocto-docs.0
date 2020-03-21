Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.6262.1584792212430024168
 for <docs@lists.yoctoproject.org>;
 Sat, 21 Mar 2020 05:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lh4EEGQ9;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: cengic@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id m7so4330644ilg.5
        for <docs@lists.yoctoproject.org>; Sat, 21 Mar 2020 05:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y5o2TcKeAVMjYxoZvndYrMOHHXWOWt6/gurQRhvn1tk=;
        b=lh4EEGQ9puZIeki7kA37kDySg1DOKnIo0m4fcqVnh1089Gp5jJCFWjzThkHZyzJdQC
         xuauQGo4665BOtZkI2r1ycpEUatjuwRMnVu3nCN8MTTij7jjqrZPLQi5cvVHdfKD5hAJ
         OoPlP7vrU0gE/2a+ggnmi/55a1TsYku+CUcG7osqsPPyEA4wR7/GKkhcOr1OuJwKTc1k
         t3c5UTdT2L0si9UfNW5Th4RWSdXRPxOgdjdyOshcV+iwelQs2Xn6c0Znh6gGalX1qDgh
         4UpFIiHnBBjrZwQRA3elCsYcKE/IIAaLMe+fkr3E1XZMjtEXDG05HsQpjxSr7qVgjAYV
         DI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y5o2TcKeAVMjYxoZvndYrMOHHXWOWt6/gurQRhvn1tk=;
        b=SRvQPfGHJSsrZgghsAjNeXyBC1vdVE0m+ut6+s74V6u2SLo4O1RNcgOZtj8ZtdhACL
         FtVYR43pB9fmwIE+RiA4qT2dVyR/9cWGjIXJPYVvp6dj8km522tDRa0Rtxtuzkb3Ycom
         t39ONZAhKCT7hefvYnaIAHpcgCGztyx8Jp2Gr7xSmFlJVKDkhxWaCZ4hwYE4m/Wax8cS
         Zhdl/BjY/rDQzwKB/WemnkMmA7SebmmyGuzxu1knykJGzTHoogNuSlc7v2H1vTGXwuew
         Y2hd076IaRmlI8jwsy8w4J1MKPtiOHLAmGeSsAo0Eswl7qVEbExzhhLM8wcH0Tns3zTI
         0gZw==
X-Gm-Message-State: ANhLgQ1xG4FOFNA/t2FprLfqdzJD4bavExzQDWVRkBEcccvjOQ6s/STk
	2sdjDYv8AVDQo+mcgIeBL61x/kJuG3sieqH7QnFtq2BT
X-Google-Smtp-Source: ADFU+vs8zGg19hRe6ovpZEA/Va8ERaq8njibeq2eT3Uo2udjJafYAIIl+msHQXKeHeoDgmxl47VdipAxmVL7JG7OEAA=
X-Received: by 2002:a92:cece:: with SMTP id z14mr4142128ilq.38.1584792211702;
 Sat, 21 Mar 2020 05:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200319232314.2038-1-cengic@gmail.com> <ac1eb590-1a23-ddbc-346e-568149ffc490@gmail.com>
In-Reply-To: <ac1eb590-1a23-ddbc-346e-568149ffc490@gmail.com>
From: "Goran Cengic" <cengic@gmail.com>
Date: Sat, 21 Mar 2020 13:03:20 +0100
Message-ID: <CACT7hbmyCshZ1veuV-X-C7kfjh-wB2KYEykqk7OzmkUiH+q9xg@mail.gmail.com>
Subject: Re: [docs] [PATCH] documentation: add rpcgen to FEDORA_HOST_PACKAGES_ESSENTIAL
To: docs@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d248f705a15c303d"

--000000000000d248f705a15c303d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 6:55 PM Khem Raj < raj.khem@gmail.com > wrote:

>=20
>=20
>=20
> On 3/19/20 4:23 PM, Goran Cengic wrote:
> > On Fedora 30 and 31 the following error appears without rpcgen package=
:
> > ERROR: The following required tools (as specified by HOSTTOOLS) appear
> to be unavailable in PATH, please install them in order to proceed:
> >=C2=A0 =C2=A0 rpcgen
> >
> > Signed-off-by: Goran Cengic < cengic@gmail.com >
> > ---
> >=C2=A0 =C2=A0documentation/poky.ent | 2 +-
> >=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/documentation/poky.ent b/documentation/poky.ent
> > index 581c87679..fba2a9123 100755
> > --- a/documentation/poky.ent
> > +++ b/documentation/poky.ent
> > @@ -65,7 +65,7 @@
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 diffutils diffstat git cpp gcc gcc-c++ glib=
c-devel texinfo
> chrpath \
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 ccache perl-Data-Dumper perl-Text-ParseWord=
s perl-Thread-Queue
> perl-bignum socat \
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pexpect findutils which file cpio p=
ython python3-pip xz
> python3-GitPython \
> > -=C2=A0 =C2=A0 =C2=A0python3-jinja2 SDL-devel xterm">
> > +=C2=A0 =C2=A0 =C2=A0python3-jinja2 SDL-devel xterm rpcgen">
>=20
> Thats good. We also want to add rpcsvc-proto for suse based distros for
> same.

I found that rpcsvc-proto does not require rpcgen so I added the rpcgen pa=
ckage for the suse based distros as well (see patch v3). I'm not sure that =
the rpcsvc-proto headers are required on the host since there is a recipe p=
roviding them in case they are needed for a build.

If the headers are also required we can add rpcsvc-proto-devel for fedora =
based distros and rpcsvc-proto for suse based distros as well.

On Fedora the lib package, libtirpc, is already installed by default.

>=20
>=20

>=20
> >=C2=A0 =C2=A0<!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-=
c++ git
> chrpath make wget python-xml \
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 diffstat makeinfo python-curses patch socat=
 python3
> python3-curses tar python3-pip \
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pexpect xz which python3-Jinja2 Mes=
a-libEGL1
> >
> >
> >
> >

--000000000000d248f705a15c303d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<div dir=3D"ltr">&nbsp;</div>
<br />
<div class=3D"gmail_quote">
<div class=3D"gmail_attr" dir=3D"ltr">On Fri, Mar 20, 2020 at 6:55 PM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"nof=
ollow noopener">raj.khem@gmail.com</a>&gt; wrote:</div>
<blockquote class=3D"gmail_quote"><br /><br />On 3/19/20 4:23 PM, Goran Ce=
ngic wrote:<br />&gt; On Fedora 30 and 31 the following error appears witho=
ut rpcgen package:<br />&gt; ERROR: The following required tools (as specif=
ied by HOSTTOOLS) appear to be unavailable in PATH, please install them in =
order to proceed:<br />&gt;&nbsp; &nbsp; rpcgen<br />&gt; <br />&gt; Signed=
-off-by: Goran Cengic &lt;<a href=3D"mailto:cengic@gmail.com" target=3D"_bl=
ank" rel=3D"nofollow noopener">cengic@gmail.com</a>&gt;<br />&gt; ---<br />=
&gt;&nbsp; &nbsp;documentation/poky.ent | 2 +-<br />&gt;&nbsp; &nbsp;1 file=
 changed, 1 insertion(+), 1 deletion(-)<br />&gt; <br />&gt; diff --git a/d=
ocumentation/poky.ent b/documentation/poky.ent<br />&gt; index 581c87679..f=
ba2a9123 100755<br />&gt; --- a/documentation/poky.ent<br />&gt; +++ b/docu=
mentation/poky.ent<br />&gt; @@ -65,7 +65,7 @@<br />&gt;&nbsp; &nbsp; &nbsp=
; &nbsp; diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath=
 \<br />&gt;&nbsp; &nbsp; &nbsp; &nbsp; ccache perl-Data-Dumper perl-Text-P=
arseWords perl-Thread-Queue perl-bignum socat \<br />&gt;&nbsp; &nbsp; &nbs=
p; &nbsp; python3-pexpect findutils which file cpio python python3-pip xz p=
ython3-GitPython \<br />&gt; -&nbsp; &nbsp; &nbsp;python3-jinja2 SDL-devel =
xterm"&gt;<br />&gt; +&nbsp; &nbsp; &nbsp;python3-jinja2 SDL-devel xterm rp=
cgen"&gt;<br /><br />Thats good. We also want to add rpcsvc-proto for suse =
based distros for <br />same.</blockquote>
<div>&nbsp;</div>
<div>I found that rpcsvc-proto does not require rpcgen so I added the rpcg=
en package for the suse based distros as well (see patch v3). I'm not sure =
that the rpcsvc-proto headers are required on the host since there is a rec=
ipe providing them in case they are needed for a build.</div>
<div>&nbsp;</div>
<div>If the headers are also required we can add rpcsvc-proto-devel for fe=
dora based distros and rpcsvc-proto for suse based distros as well.</div>
<div>&nbsp;</div>
<div>On Fedora the lib package, libtirpc, is already installed by default.=
</div>
<div>&nbsp;</div>
<blockquote class=3D"gmail_quote">&nbsp;</blockquote>
<blockquote class=3D"gmail_quote">&gt;&nbsp; &nbsp;&lt;!ENTITY OPENSUSE_HO=
ST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git chrpath make wget python-xml =
\<br />&gt;&nbsp; &nbsp; &nbsp; &nbsp; diffstat makeinfo python-curses patc=
h socat python3 python3-curses tar python3-pip \<br />&gt;&nbsp; &nbsp; &nb=
sp; &nbsp; python3-pexpect xz which python3-Jinja2 Mesa-libEGL1<br />&gt; <=
br />&gt; <br />&gt; <br />&gt; </blockquote>
</div>
</div>

--000000000000d248f705a15c303d--
