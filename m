Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.11065.1587056456424739976
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 10:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UPb8e/af;
 spf=pass (domain: linaro.org, ip: 209.85.219.177, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f177.google.com with SMTP id l84so2436361ybb.1
        for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2020 10:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=/IofizZKoJmblZ47qZZGuV1bpAzjWgs/HF0URgOC14A=;
        b=UPb8e/afAv5Z0NxxK35qtE0YTvQGFYxN7iLNPfAYRb23BLg6g0biy1pwmgtD8eDgYe
         J29cr44p67cjM8I+O2SXd3vAB8a7IN22kNtc+HymcHn3iggkmcfjcxqpVbZlW0rGwHcj
         2sdF2G9pTMGeIm44SpHnfHdChtgHAMgdNgOSRdxNzyzVrG/pjRGbuvje3icph78f2gTW
         +KQC7O4caB8yjEqeY1uIm3bYJK/lQ5OrGm9TzaS6ZbyLZOgyAhlq0yvg46Y8Tvr6eo98
         aHc3Xw6UQMl0QiLnAXD7plGftf+ua0SHrB4f5+89pUQDC2Cf4LK50NbALUUsnrLFne3y
         u+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=/IofizZKoJmblZ47qZZGuV1bpAzjWgs/HF0URgOC14A=;
        b=qjA43eAnuIc/OsxkoABtjycstJ7Nbe44MuH7bjGoORURLcUZVVKw6jNmL/llpPqPII
         LcRvP1ZwyqqFRRulwaLHlFI7n3gJvW0ebhdSBbiJYZ6SR8MW3k5OA8GrPkG29ZtTNcW/
         OVcc6RoCxVD1JhHK7pf3kwmYrZ3yNwx9rYUIN418cCAhrvUD1umzATIDWdruzs/2IDh1
         yIFJSv/1Ja7BygLxuyb36oKV45S3S1bdpAL7NCAvFTiHVivrHPuOOWvaxg+GO6FQnPJW
         Oz3KIoZvweSaYZUVhmCbHs+eg/Dw/M+/cWTlAEl2HlgkmJKs5kbjNGhQFCPcRFT/S0SE
         r/wA==
X-Gm-Message-State: AGi0PuZkNHe9ysj8MxhVPtJ0NEJcZxTBw1LX958NjbxIyju5XkYqWJSa
	TuXRNeeUHvDpBvmOXKSkgA2aXWRnyJUdCew2DPQaG2V6CBAYXA==
X-Google-Smtp-Source: APiQypK1OVaLLYTFK/5Uld2FzgPB02BKER5wyM3NpdLTI9/xUnESOsP14VKOdOU1PnCNw9AWHjcDbBrgPZ8UbCPVHvQ=
X-Received: by 2002:a25:e6c5:: with SMTP id d188mr18038177ybh.454.1587056455089;
 Thu, 16 Apr 2020 10:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
 <20200415152105.GA11838@linux-uys3> <alpine.LFD.2.21.2004161247290.35575@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2004161247290.35575@localhost.localdomain>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 16 Apr 2020 19:00:43 +0200
Message-ID: <CAP71WjxP3VE8YQo5sS43rOxWzhqhz40Zd2gkX2AGVYxNEdD8oQ@mail.gmail.com>
Subject: Re: [docs] Possible changes to the project docs
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000003e912c05a36b605f"

--0000000000003e912c05a36b605f
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 16, 2020 at 6:51 PM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Wed, 15 Apr 2020, Trevor Woerner wrote:
>
> > On Wed 2020-04-15 @ 11:19:25 AM, Richard Purdie wrote:
> > > Basically, the thought is whether to move from docbook to sphinx.
> >
> > This sounds like a good idea to me.
> >
> > Prior to yesterday I had never looked into sphinx before. Skimming some
> > information about sphinx, it looks like it's flexible with regards to the
> > exact formatting you use for, for example, section headings. If that's
> true, I
> > believe we'll need a "coding standard" in place before proceeding. We
> wouldn't
> > want the BSP Manual to use:
> >
> >       section 1
> >       ^^^^^^^^^
> >       section 1.1
> >       ===========
> >       section 1.1.1
> >       -------------
> >
> > and the Reference Manual to use:
> >
> >       section 1
> >       =========
> >       section 1.1
> >       ***********
> >       section 1.1.1
> >       ^^^^^^^^^^^^^
>
>   absolutely, and i'll throw out one more "coding standard" that i
> initially loathed, but came to appreciate -- keep sentences on the
> same physical line.
>
>   i first ran into that standard when contributing to the "pro git"
> book, and i hated, hated, hated it as it naturally made long sentences
> go on forever off the right side of the terminal window.
>
>   however, i grew to like it because it makes side-by-side comparison
> trivial and if you ended up with a sentence like that, it made you
> reconsider whether you were doing this correctly.
>
>   anyway, yes to the above.
>

I added this in one of my commits messages, to start with:

==
    sphinx: implement headings

    The YP manuals layout is organized as:

    Book
      Chapter
        Section
          Section
            Section

    During the conversion with pandoc, some of the headings are not
    converted properly. Let's decide for now to use the following headings
    styles:

    Book              => overline ===
      Chapter         => overline ***
        Section       => ====
          Section     => ----
            Section   => ^^^^
              Section => """"

    At least with this change, we now have the same TOC with Sphinx and
    DocBook.
==


> rday
>
> p.s. i've played briefly with sphinx on my fedora 31/32 system -- has
> anyone set up a full processing toolchain that can just be purloined
> to get started? even though it looks pretty simple.
>

As I put in one of my emails before you can use my dev branch:

https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=sphinx

then it's just
pip3 install sphinx
# to use the non default theme
pip3 install sphinx_rtd_theme

cd documentation
make html

and it should generate exactly that on your local folder
https://people.linaro.org/~nicolas.dechesne/yp-docs/

I am happy to take patches in this branch (or create/maintain a contrib
branch if more folks want to play/experiment and send patches).




>

--0000000000003e912c05a36b605f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 16, 2020 at 6:51 PM Rober=
t P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse=
.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Wed, 15 Apr 2020, Trevor Woerner wrote:<br>
<br>
&gt; On Wed 2020-04-15 @ 11:19:25 AM, Richard Purdie wrote:<br>
&gt; &gt; Basically, the thought is whether to move from docbook to sphinx=
.<br>
&gt;<br>
&gt; This sounds like a good idea to me.<br>
&gt;<br>
&gt; Prior to yesterday I had never looked into sphinx before. Skimming so=
me<br>
&gt; information about sphinx, it looks like it&#39;s flexible with regard=
s to the<br>
&gt; exact formatting you use for, for example, section headings. If that&=
#39;s true, I<br>
&gt; believe we&#39;ll need a &quot;coding standard&quot; in place before =
proceeding. We wouldn&#39;t<br>
&gt; want the BSP Manual to use:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0section 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0section 1.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0section 1.1.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-------------<br>
&gt;<br>
&gt; and the Reference Manual to use:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0section 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0section 1.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0***********<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0section 1.1.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^<br>
<br>
=C2=A0 absolutely, and i&#39;ll throw out one more &quot;coding standard&q=
uot; that i<br>
initially loathed, but came to appreciate -- keep sentences on the<br>
same physical line.<br>
<br>
=C2=A0 i first ran into that standard when contributing to the &quot;pro g=
it&quot;<br>
book, and i hated, hated, hated it as it naturally made long sentences<br>
go on forever off the right side of the terminal window.<br>
<br>
=C2=A0 however, i grew to like it because it makes side-by-side comparison=
<br>
trivial and if you ended up with a sentence like that, it made you<br>
reconsider whether you were doing this correctly.<br>
<br>
=C2=A0 anyway, yes to the above.<br></blockquote><div><br></div><div>I add=
ed this in one of my commits messages, to start with:<br></div><div><br></d=
iv><div>=3D=3D</div><div>=C2=A0 =C2=A0 sphinx: implement headings<br>=C2=A0=
 =C2=A0 <br>=C2=A0 =C2=A0 The YP manuals layout is organized as:<br>=C2=A0 =
=
=C2=A0 <br>=C2=A0 =C2=A0 Book<br>=C2=A0 =C2=A0 =C2=A0 Chapter<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Section<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Section=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Section<br>=C2=A0 =C2=A0 <br>=
=
=C2=A0 =C2=A0 During the conversion with pandoc, some of the headings are =
not<br>=C2=A0 =C2=A0 converted properly. Let&#39;s decide for now to use th=
e following headings<br>=C2=A0 =C2=A0 styles:<br>=C2=A0 =C2=A0 <br>=C2=A0 =
=C2=A0 Book =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D&gt; overli=
ne =3D=3D=3D<br>=C2=A0 =C2=A0 =C2=A0 Chapter =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D&gt; overline ***<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Section =C2=A0 =C2=A0 =
=
=C2=A0 =3D&gt; =3D=3D=3D=3D<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Section =
=
=C2=A0 =C2=A0 =3D&gt; ----<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Se=
ction =C2=A0 =3D&gt; ^^^^<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Section =3D&gt; &quot;&quot;&quot;&quot;<br>=C2=A0 =C2=A0 <br>=C2=A0 =
=C2=A0 At least with this change, we now have the same TOC with Sphinx and=
<br>=C2=A0 =C2=A0 DocBook.<br></div><div>=3D=3D</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
rday<br>
<br>
p.s. i&#39;ve played briefly with sphinx on my fedora 31/32 system -- has<=
br>
anyone set up a full processing toolchain that can just be purloined<br>
to get started? even though it looks pretty simple.<br></blockquote><div><=
br></div><div>As I put in one of my emails before you can use my dev branch=
:<br></div><div><br></div><div><a href=3D"https://git.linaro.org/people/nic=
olas.dechesne/poky.git/log/?h=3Dsphinx">https://git.linaro.org/people/nicol=
as.dechesne/poky.git/log/?h=3Dsphinx</a></div><div><br></div><div>then it&#=
39;s just</div><div><span class=3D"gmail-im"><div>pip3 install sphinx<br>
              # to use the non default theme<br>
              pip3 install sphinx_rtd_theme<br>
              <br>
            </div>
            cd documentation
            <div>make html</div><div><br></div><div>and it should generate=
 exactly that on your local folder<br></div><div><a href=3D"https://people.=
linaro.org/~nicolas.dechesne/yp-docs/">https://people.linaro.org/~nicolas.d=
echesne/yp-docs/</a></div><div><br></div><div>I am happy to take patches in=
 this branch (or create/maintain a contrib branch if more folks want to pla=
y/experiment and send patches).</div><div><br></div><div><br></div></span><=
/div><div><br> </div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
</blockquote></div></div>

--0000000000003e912c05a36b605f--
